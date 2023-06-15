import { getRandomId, getRandomOtp } from "../utils/random";
import sendEmail from "../utils/email";
import bcrypt from "bcrypt";
import createHttpError from "http-errors";
import {
  deleteCache,
  getCache,
  getOtpCacheKey,
  setCache,
} from "../utils/cache";
import { Request, Response, NextFunction } from "express";
import {
  LoginRequest,
  RegisterRequest,
  SendOTPRequest,
  UpdatePasswordRequest,
  ValidateOTPRequest,
} from "../validators/auth.validator";
import {
  UserBankDetails,
  UserContactDetails,
  UserProfile,
} from "../utils/models";

const sendOtpByEmail = async (email: string) => {
  const otp = getRandomOtp();
  const cacheKey = getOtpCacheKey(email);
  setCache(cacheKey, otp, 5 * 60);
  await sendEmail(email, otp);
};

export async function register(
  req: RegisterRequest,
  res: Response,
  next: NextFunction
) {
  try {
    let { userData, bankData, contactData } = req.body;
    const userExist = await UserProfile.findFirst({
      where: {
        company_name: userData.company_name,
      },
      select: {
        userId: true,
      },
    });
    if (userExist) {
      throw createHttpError.Conflict(
        "User already exist with this company and mobile"
      );
    }
    const new_user_id = getRandomId();
    const hashedPassword = await bcrypt.hash(userData.password, 10);

    const userDetails = await UserProfile.create({
      data: {
        ...userData,
        pincode: parseInt(userData.pincode),
        authorized: "0",
        userId: new_user_id,
        password: hashedPassword,
      },
    });
    next({
      data: {
        userData: userDetails,
      },
      message: "User registered successfully",
    });
    const { userId } = userDetails;

    await Promise.all([
      // insert all bank details
      ...bankData.map((bData) => {
        return UserBankDetails.create({
          data: {
            account_number: parseInt(bData.account_number),
            account_name: bData.account_name,
            id: getRandomId(),
            ifsc: bData.ifsc,
            userId,
            account_type: bData.account_type,
            bank_name: bData.bank_name,
            branch: bData.branch,
          },
        });
      }),
      // insert all contact details
      ...contactData.map((data) => {
        const insertContactData = { ...data, userId, id: getRandomId() };
        return UserContactDetails.create({
          data: insertContactData,
        });
      }),
    ]);
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function login(
  req: LoginRequest,
  res: Response,
  next: NextFunction
) {
  const { mobile, company_name, password } = req.body;
  try {
    const userData = await UserProfile.findFirst({
      where: {
        mobile,
        company_name,
      },
    });
    if (!userData) {
      throw createHttpError.NotFound("Invalid mobile or company name");
    }

    if (userData.password) {
      const passwordMatched = await bcrypt.compare(password, userData.password);
      if (!passwordMatched) {
        res.status(400).json("Invalid password!");
        return;
      }
    }
    next({ data: { userData }, message: "Login successful" });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function validateOTP(
  req: ValidateOTPRequest,
  res: Response,
  next: NextFunction
) {
  const { email, otp } = req.body;
  try {
    const cacheKey = getOtpCacheKey(email);
    const cachedOtp = await getCache(cacheKey);
    if (otp !== cachedOtp) {
      throw createHttpError.NotFound("Invalid otp");
    }
    next({
      data: { validEmail: true },
      message: "Otp validation was successfull",
    });
    deleteCache(cacheKey);
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function sendOTP(
  req: SendOTPRequest,
  res: Response,
  next: NextFunction
) {
  const { email } = req.body;
  try {
    const email_before = email.split("@")[0];
    let email_hidden =
      email_before.substring(0, email_before.length / 2) +
      "*******@" +
      email.split("@")[1];
    await sendOtpByEmail(email);
    next({
      data: { otp_sent: true },
      message: `Otp sent successfully to ${email_hidden}.\nOtp will be valid for 5 minutes`,
    });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getOTP(req: Request, res: Response, next: NextFunction) {
  const { email } = req.params;
  try {
    const cacheKey = getOtpCacheKey(email);
    const otp = await getCache(cacheKey);
    if (!otp) {
      throw createHttpError.NotFound("Otp not found");
    }
    next({ message: "valid user" });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function updatePassword(
  req: UpdatePasswordRequest,
  res: Response,
  next: NextFunction
) {
  const { userId, password } = req.body;
  try {
    const userExists = await UserProfile.count({
      where: {
        userId,
      },
    });
    if (!userExists) {
      throw createHttpError.NotFound("User not found");
    }
    const hasshedPassword = await bcrypt.hash(password, 10);
    await UserProfile.update({
      data: {
        password: hasshedPassword,
      },
      where: {
        userId,
      },
    });
    next({
      data: null,
      message: "Password updated successfully",
    });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}
