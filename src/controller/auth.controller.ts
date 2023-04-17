import { getRandomId, getRandomOtp } from "../utils/random";
import sendEmail from "../utils/email";
import bcrypt from "bcrypt";
import logger from "../utils/logger";
import {
  getOnlineUsersByQuery,
  insertIntoOnlineUser,
  insertIntoUserBankDetails,
  insertIntoUserContactDetails,
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

export async function register(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const { userData, bankData, contactData } = req.body;
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
    const insertUserData = {
      ...userData,
      userId: new_user_id,
    };
    const userDetails = await insertIntoOnlineUser(insertUserData);
    next({
      data: {
        userData: userDetails,
      },
      message: "User registered successfully",
    });
    const { userId, email } = userDetails;

    Promise.all([
      // insert all bank details
      ...bankData.map((data: any) => {
        const insertBankData = { ...data, userId };
        return insertIntoUserBankDetails(insertBankData);
      }),
      // insert all contact details
      ...contactData.map((data: any) => {
        const insertContactData = { ...data, userId };
        return insertIntoUserContactDetails(insertContactData);
      }),
    ]);

    const otp = getRandomOtp();
    const cacheKey = getOtpCacheKey(userId);
    setCache(cacheKey, otp, 5 * 60);
    await sendEmail(email, otp);
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

    let userData = await getOnlineUsersByQuery(getUserDataQuery);
    if (!userData?.length) {
      throw createHttpError.NotFound("Invalid mobile or company name");
    }
    userData = userData[0];
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
  const { userId, otp } = req.body;
  try {
    const cacheKey = getOtpCacheKey(userId);
    const cachedOtp = await getCache(cacheKey);
    if (otp !== cachedOtp) {
      throw createHttpError.NotFound("Invalid otp");
    }
    next({ message: "Otp validation was successfull" });
    deleteCache(cacheKey);
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function sendOTP(req: Request, res: Response, next: NextFunction) {
  const { userId } = req.body;
  try {
    const getEmailQuery = {
      attributes: ["email"],
      where: { userId },
    };
    const { email } = (await getOnlineUsersByQuery(getEmailQuery))[0];
    const email_before = email.split("@")[0];
    let email_hidden =
      email_before.substring(0, email_before.length / 2) +
      "*******@" +
      email.split("@")[1];
    const otp = getRandomOtp();
    await sendEmail(email, otp);
    const cacheKey = getOtpCacheKey(userId);
    setCache(cacheKey, otp, 5 * 60);
    next({
      message: `Otp sent successfully to ${email_hidden}.\nOtp will be valid for 5 minutes`,
    });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getOTP(req: Request, res: Response, next: NextFunction) {
  const { userId } = req.params;
  try {
    const cacheKey = getOtpCacheKey(userId);
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
