import createHttpError from "http-errors";
import bcrypt from "bcrypt";
import { Request, Response, NextFunction, RequestHandler } from "express";
import {
  BuyOrderRequest,
  GetOnlineUserCompaniesRequest,
  GetUserByIdRequest,
  GetUserProfile,
  GetUserRequest,
  UpdatePasswordRequest,
} from "../validators/user.validator";
import {
  AccountMaster,
  OrderBook,
  UserBankDetails,
  UserContactDetails,
  UserProfile,
} from "../utils/models";

export async function updatePassword(
  req: UpdatePasswordRequest,
  res: Response,
  next: NextFunction
) {
  const { userId, password } = req.body;
  try {
    const userExist = await UserProfile.count({
      where: {
        userId,
      },
    });
    if (!userExist) {
      throw createHttpError.NotFound("User not found");
    }

    const genSalt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, genSalt);

    const user = await UserProfile.update({
      data: {
        password: hashedPassword,
      },
      where: {
        userId,
      },
    });
    next({
      message: "Password updated successfully",
      data: { userData: user },
    });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getUser(
  req: GetUserRequest,
  res: Response,
  next: NextFunction
) {
  const { company_name, mobile } = req.query;
  try {
    const userData = await UserProfile.findFirst({
      where: {
        company_name,
        mobile,
      },
    });
    if (!userData) {
      throw createHttpError.NotFound(
        `User not found for ${company_name} & ${mobile}`
      );
    }
    next({ data: { userData }, message: "Fetched user successfully" });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getOnlineUserCompanies(
  req: GetOnlineUserCompaniesRequest,
  res: Response,
  next: NextFunction
) {
  const { mobile } = req.params;
  try {
    const companies = (
      await UserProfile.findMany({
        select: {
          company_name: true,
        },
        where: {
          mobile,
        },
        orderBy: {
          company_name: "asc",
        },
      })
    ).map(({ company_name }) => company_name);
    next({ data: { companies }, message: "Companies fetched successfully" });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getUserById(
  req: GetUserByIdRequest,
  res: Response,
  next: NextFunction
) {
  const { userId } = req.params;
  try {
    let userData = await UserProfile.findFirst({
      where: {
        userId,
      },
    });
    if (!userData) {
      throw createHttpError.NotFound("User not found");
    }
    const response = {
      data: { userData },
      message: "User fetched successfully",
    };
    next(response);
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getAllAccountMasterCompanyName(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const companies = await AccountMaster.findMany({
      select: {
        ac_name_e: true,
        accoid: true,
      },
      where: {
        company_code: 1,
        OR: [
          {
            userId: null,
          },
          {
            userId: undefined,
          },
        ],
      },
      orderBy: {
        ac_name_e: "asc",
      },
    });
    next({
      data: { companies },
      message: "Companies name fetched from account",
    });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getUserFromAccountMaster(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const { accoid } = req.params;
  try {
    const userData = await AccountMaster.findFirst({
      where: {
        accoid: parseInt(accoid),
      },
      select: {
        accoid: true,
        ac_code: true,
        ac_name_e: true,
        address_e: true,
        gst_no: true,
      },
    });
    if (!userData) {
      throw createHttpError.NotFound("User not found");
    }
    const response = {
      message: "User fetched successfully",
      data: {
        userData,
      },
    };
    next(response);
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getAllUsersData(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const users = await UserProfile.findMany();
    let userIds: string[] = [];

    for (let user of users) {
      userIds.push(user.userId);
    }

    const [bankDetails, contactDetails] = await Promise.all([
      UserBankDetails.findMany({
        where: {
          userId: {
            in: userIds,
          },
        },
      }),
      UserContactDetails.findMany({
        where: {
          userId: {
            in: userIds,
          },
        },
      }),
    ]);

    type UserDetailsResponse = (typeof users)[0] & {
      isMapped: boolean;
      isAdded: boolean;
    };

    type UserData = {
      userDetails: UserDetailsResponse;
      bankDetails: typeof bankDetails;
      contactDetails: typeof contactDetails;
    };

    const mappedUserIds = (
      await AccountMaster.findMany({
        where: {
          userId: {
            in: userIds,
          },
        },
        select: {
          userId: true,
        },
      })
    ).map(({ userId }) => userId);
    let userDataMap = new Map<string, UserData>();

    for (let user of users) {
      const isAdded = !!user.accoid;
      const isMapped = mappedUserIds.includes(user.userId);
      userDataMap.set(user.userId, {
        userDetails: { ...user, isAdded, isMapped },
        bankDetails: [],
        contactDetails: [],
      });
    }

    for (let bankDetail of bankDetails) {
      if (userDataMap.has(bankDetail.userId)) {
        userDataMap.set(bankDetail.userId, {
          ...userDataMap.get(bankDetail.userId)!,
          bankDetails: [
            ...userDataMap.get(bankDetail.userId)!.bankDetails,
            bankDetail,
          ],
        });
      }
    }

    for (let contactDetail of contactDetails) {
      if (userDataMap.has(contactDetail.userId)) {
        userDataMap.set(contactDetail.userId, {
          ...userDataMap.get(contactDetail.userId)!,
          contactDetails: [
            ...userDataMap.get(contactDetail.userId)!.contactDetails,
            contactDetail,
          ],
        });
      }
    }

    const userData = Array.from(userDataMap.values());
    next({
      data: { userData },
      message: "Successfully fetched all users data",
    });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getUserProfile(
  req: GetUserProfile,
  res: Response,
  next: NextFunction
) {
  try {
    const { userId } = req.params;
    const query = {
      where: {
        userId,
      },
    };
    const userInfo = await UserProfile.findFirst(query);
    console.log(userId);
    if (!userInfo) {
      throw createHttpError.NotFound("User not found");
    }

    const bankInfo = await UserBankDetails.findMany(query);
    const contactInfo = await UserContactDetails.findMany(query);

    next({
      message: "User profile fetched",
      data: {
        userInfo,
        bankInfo,
        contactInfo,
      },
    });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export const buyOrder: RequestHandler = async (req: BuyOrderRequest, res, next) => {
  try {
    await OrderBook.create({
      data: {
        ...req.body,
        order_date: new Date().toLocaleString(),
      },
    });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
};
