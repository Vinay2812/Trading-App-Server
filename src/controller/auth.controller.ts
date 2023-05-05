import { getRandomId, getRandomOtp } from "../utils/random";
import sendEmail from "../utils/email";
import bcrypt from "bcrypt";
import logger from "../utils/logger";
import {
  getOnlineUsersByQuery,
  createOnlineUserByQuery,
  createUserBankDetailsByQuery,
  createUserContactDetailsByQuery,
  updateOnlineUserByQuery,
} from "../models/index";
import createHttpError from "http-errors";
import {
  deleteCache,
  getCache,
  getOtpCacheKey,
  setCache,
} from "../utils/cache";
import { Op } from "sequelize";
import { Request, Response, NextFunction } from "express";
import { RegisterRequest } from "../types/auth.request";
import { UserOnlineDetailsInterface } from "../models/users/users.model";

const sendOtpByEmail = async (email: string) => {
  const otp = getRandomOtp();
  const cacheKey = getOtpCacheKey(email);
  setCache(cacheKey, otp, 5 * 60);
  await sendEmail(email, otp);
};

export async function register(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const { userData, bankData, contactData }: RegisterRequest = req.body;
  try {
    let check_user_query = {
      attributes: ["userId"],
      where: {
        company_name: userData.company_name,
        mobile: userData.mobile,
      },
    };
    const userExist = await getOnlineUsersByQuery(check_user_query);
    if (userExist?.length) {
      throw createHttpError.Conflict(
        "User already exist with this company and mobile"
      );
    }
    const new_user_id = getRandomId();
    const hashedPassword = await bcrypt.hash(userData.password, 10);

    const insertUserData: UserOnlineDetailsInterface = {
      ...userData,
      authorized: "0",
      userId: new_user_id,
      password: hashedPassword,
    };

    const userDetails = await createOnlineUserByQuery(insertUserData);
    next({
      data: {
        userData: userDetails,
      },
      message: "User registered successfully",
    });
    const { userId } = userDetails;

    Promise.all([
      // insert all bank details
      ...bankData.map((data: any) => {
        const insertBankData = { ...data, userId };
        return createUserBankDetailsByQuery(insertBankData);
      }),
      // insert all contact details
      ...contactData.map((data: any) => {
        const insertContactData = { ...data, userId };
        return createUserContactDetailsByQuery(insertContactData);
      }),
    ]);
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function login(req: Request, res: Response, next: NextFunction) {
  const { mobile, company_name, password } = req.body;
  try {
    const getUserDataQuery = {
      where: {
        [Op.and]: [{ mobile }, { company_name }],
      },
    };

    const userDataArr = await getOnlineUsersByQuery(getUserDataQuery);
    if (!userDataArr?.length) {
      throw createHttpError.NotFound("Invalid mobile or company name");
    }
    let userData = userDataArr[0];
    if (userData.password) {
      const passwordMatched = await bcrypt.compare(password, userData.password);
      if (!passwordMatched) {
        res.status(400).json("Invalid password!");
        return;
      }
    }
    next({ data: { userData }, message: "Login successful" });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function validateOTP(
  req: Request,
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
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function sendOTP(req: Request, res: Response, next: NextFunction) {
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
  } catch (err) {
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
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}
