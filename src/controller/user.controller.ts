import createHttpError from "http-errors";
import bcrypt from "bcrypt";
import { Op } from "sequelize";
import {
  getAccountMasterByQuery,
  getOnlineUsersByQuery,
  getUserBankContactByQuery,
  getUserBankDetailsByQuery,
  updateOnlineUserByQuery,
} from "../models/index";
import { Request, Response, NextFunction } from "express";
import {
  UserBankDetailsInterface,
  UserContactDetailsInterface,
  UserOnlineDetailsInterface,
} from "../models/users/users.model";

export async function updatePassword(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const { userId, password } = req.body;
  try {
    const checkUserExistQuery = {
      attributes: ["userId"],
      where: { userId },
    };
    const userExist = await getOnlineUsersByQuery(checkUserExistQuery);
    if (!userExist?.length) {
      throw createHttpError.NotFound("User not found");
    }

    const genSalt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, genSalt);

    const updatePasswordSetQuery = { password: hashedPassword };
    const updatePasswordQuery = {
      where: { userId },
      returning: true,
    };

    const queryOutput = await updateOnlineUserByQuery(
      updatePasswordSetQuery,
      updatePasswordQuery
    );
    let user = queryOutput.data[0];
    next({
      message: "Password updated successfully",
      data: { userData: user },
    });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getUser(req: Request, res: Response, next: NextFunction) {
  const { company_name, mobile } = req.body;
  try {
    const getUserQuery = {
      where: {
        [Op.and]: [{ company_name }, { mobile }],
      },
    };
    const queryOutput = await getOnlineUsersByQuery(getUserQuery);
    if (!queryOutput?.length) {
      throw createHttpError.NotFound(
        `User not found for ${company_name} & ${mobile}`
      );
    }
    const userData = queryOutput[0];
    next({ data: { userData }, message: "Fetched user successfully" });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getOnlineUserCompanies(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const { mobile } = req.body;
  try {
    const getCompaniesQuery = {
      attributes: ["company_name"],
      where: { mobile },
    };
    let queryResponse = await getOnlineUsersByQuery(getCompaniesQuery);
    let companies = queryResponse.map(({ company_name }) => company_name);
    next({ data: { companies }, message: "Companies fetched successfully" });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getUserById(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const { userId } = req.body;
  try {
    const getQuery = {
      where: { userId },
    };

    let userData = await getOnlineUsersByQuery(getQuery);
    if (!userData?.length) {
      throw createHttpError.NotFound("User not found");
    }
    const response = {
      data: { userData: userData[0] },
      message: "User fetched successfully",
    };
    next(response);
  } catch (err) {
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
    const getCompanyNamesQuery: any = {
      attributes: ["ac_name_e", "accoid"],
      where: {
        [Op.and]: [{ company_code: 1 }, { userId: { [Op.is]: null } }],
      },
      order: [["ac_name_e", "asc"]],
    };
    const companies = await getAccountMasterByQuery(getCompanyNamesQuery);
    next({
      data: { companies },
      message: "Companies name fetched from account",
    });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function getUserFromAccountMaster(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const { accoid } = req.body;
  try {
    const getUserQuery = {
      attributes: ["accoid", "ac_code", "ac_name_e", "address_e", "gst_no"],
      where: { accoid },
    };
    const userData = await getAccountMasterByQuery(getUserQuery);
    if (!userData?.length) {
      throw createHttpError.NotFound("User not found");
    }
    const response = {
      message: "User fetched successfully",
      data: {
        userData: userData[0],
      },
    };
    next(response);
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

interface UserDetailsResponseInterface extends UserOnlineDetailsInterface {
  isMapped: boolean;
  isAdded: boolean;
}
export async function getAllUsersData(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const users = await getOnlineUsersByQuery();
    let userIds: string[] = [];

    for (let user of users) {
      userIds.push(user.userId);
    }

    const query = {
      where: {
        userId: {
          [Op.in]: userIds,
        },
      },
    };

    type UserData = {
      userDetails: UserDetailsResponseInterface;
      bankDetails: UserBankDetailsInterface[];
      contactDetails: UserContactDetailsInterface[];
    };

    const [bankDetails, contactDetails] = await Promise.all([
      getUserBankDetailsByQuery(query),
      getUserBankContactByQuery(query),
    ]);

    const isMappedQuery = {
      attributes: ["userId"],
      where: { userId: { [Op.in]: userIds } },
    };

    const mappedUserIds = (await getAccountMasterByQuery(isMappedQuery)).map(
      ({ userId }) => userId
    );
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
          ...userDataMap.get(bankDetail.userId),
          bankDetails: [
            ...userDataMap.get(bankDetail.userId).bankDetails,
            bankDetail,
          ],
        });
      }
    }

    for (let contactDetail of contactDetails) {
      if (userDataMap.has(contactDetail.userId)) {
        userDataMap.set(contactDetail.userId, {
          ...userDataMap.get(contactDetail.userId),
          contactDetails: [
            ...userDataMap.get(contactDetail.userId).contactDetails,
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
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}
