import { ADMIN_USERNAME, ADMIN_PASSWORD } from "../utils/constants";
import logger from "../utils/logger";
import createError from "http-errors";
import {
  AccountMaster,
  UserBankDetails,
  UserProfile,
  TenderBalanceView,
  DailyBalance,
  DailyPublish,
} from "../utils/models";
import { updateTradingOption } from "../socket/controller/emit";
import { NextFunction, Request, Response } from "express";
import io from "../connections/socket.connection";
import { UPDATE_PUBLISHED_LIST } from "../utils/socket-emits";
import {
  AddUserRequest,
  AdminLoginRequest,
  MapClientRequest,
  ModifySingleTradeRequest,
  PostPublishListRequest,
  UpdateAllSaleRateRequest,
  UpdateAllTradeRequest,
  UpdateAuthorizationRequest,
  UpdatePublishedItemStatusRequest,
  UpdatePublishedListItemRequest,
  UpdateSingleSaleRateRequest,
} from "../validators/admin.validator";

/**
 * This is an async function that handles admin login by checking the username and password provided in
 * the request body and returning an error if they are invalid.
 * @param {Request} req - The `req` parameter is an object that represents the HTTP request made by the
 * client. It contains information such as the request method, headers, URL, and body.
 * @param {Response} res - `res` stands for response and it is an object that represents the HTTP
 * response that an Express app sends when it receives an HTTP request. It contains methods and
 * properties that allow the app to send a response back to the client, such as `res.send()`,
 * `res.json()`, `res
 * @param {NextFunction} next - `next` is a function that is called to pass control to the next
 * middleware function in the stack. It is typically used to handle errors or to move on to the next
 * middleware function after completing a task. In this case, `next` is called with an object
 * containing data and a message to
 */
export async function adminLogin(
  req: AdminLoginRequest,
  res: Response,
  next: NextFunction
) {
  try {
    const { username, password } = req.body;
    if (username !== ADMIN_USERNAME) {
      throw createError.BadRequest("Invalid username");
    }
    if (password !== ADMIN_PASSWORD) {
      throw createError.BadRequest("Invalid password");
    }
    next({ data: { username, admin: 1 }, message: "Login successful" });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function retrieves a list of online users with specific attributes and sends it as a response.
 */
export async function getRegistrationListUsers(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const users = await UserProfile.findMany({
      select: {
        userId: true,
        company_name: true,
        email: true,
        mobile: true,
        authorized: true,
        accoid: true,
        gst: true,
        state: true,
        address: true,
        district: true,
      },
    });
    next({
      message: "Successfully fetched registration list users",
      data: users,
    });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function updates the authorization status of a user and returns a success message.
 */
export async function updateAuthorization(
  req: UpdateAuthorizationRequest,
  res: Response,
  next: NextFunction
) {
  try {
    const { authorized, userId } = req.body;

    await UserProfile.update({
      where: {
        userId,
      },
      data: {
        authorized: String(authorized),
      },
    });
    next({ message: `Authorization updated successfully for ${userId}` });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function adds a new user to the system by retrieving their information from the database and
 * creating a new account for them.
 */
export async function addUser(
  req: AddUserRequest,
  res: Response,
  next: NextFunction
) {
  try {
    const { userId } = req.body;

    const {
      _max: { ac_code: max_ac_code },
    } = await AccountMaster.aggregate({
      where: {
        company_code: 1,
      },
      _max: {
        ac_code: true,
      },
    });

    const next_ac_code = (max_ac_code || 0) + 1;

    const userData = await UserProfile.findFirst({
      where: {
        userId,
      },
      select: {
        company_name: true,
        address: true,
        pincode: true,
        gst: true,
        email: true,
        pan: true,
        mobile: true,
        fssai: true,
        state: true,
        whatsapp: true,
        tan: true,
      },
    });

    if (!userData) {
      throw createError.BadRequest("User not found");
    }

    const {
      company_name,
      address,
      pincode,
      gst,
      email,
      pan,
      mobile,
      fssai,
      state,
      whatsapp,
      tan,
    } = userData;

    const bankData = await UserBankDetails.findFirst({
      where: {
        userId,
      },
      select: {
        bank_name: true,
        account_number: true,
        ifsc: true,
        account_name: true,
      },
    });
    if (!bankData) {
      throw createError.BadRequest("Bank details not found for this user");
    }
    const { bank_name, account_number, ifsc, account_name } = bankData;

    const insertData = {
      ac_code: next_ac_code,
      ac_name_e: company_name,
      ac_name_r: company_name,
      ac_type: "P",
      address_e: address,
      address_r: address,
      pincode: pincode.toString(),
      gst_no: gst,
      email_id: email,
      other_narration: "Online",
      bank_name,
      bank_ac_no: account_number?.toString(),
      bank_op_drcr: "D",
      drcr: "D",
      short_name: account_name!.substring(
        0,
        Math.min(15, account_name!.length - 1)
      ),
      corporate_party: "N",
      company_pan: pan,
      mobile_no: mobile,
      is_login: "Y",
      ifsc,
      fssai,
      branch1drcr: "D",
      branch2drcr: "D",
      locked: false,
      gststatecode: isNaN(parseInt(state.substring(0, 2)))
        ? null
        : parseInt(state.substring(0, 2)),
      unregistergst: !!gst,
      whatsapp_no: whatsapp,
      limit_by: "N",
      tan_no: tan,
      tdsapplicable: "Y",
      msoms: "M",
      ac_rate: "0",
      city_code: 0,
      bank_opening: "0",
      opening_balance: "0",
      group_code: 0,
      commission: "0",
      offphone: "0",
      branch1ob: "0",
      branch2ob: "0",
      distance: "0",
      bal_limit: "0",
      bsid: 0,
      cityid: 0,
      company_code: 1,
    };

    const { accoid } = await AccountMaster.create({
      data: insertData,
      select: {
        accoid: true,
      },
    });

    await UserProfile.update({
      where: {
        userId,
      },
      data: {
        accoid,
      },
    });

    next({ message: "User added successfully" });

    // TODO: add socket call
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function updates the online user and account master records based on the provided user ID and
 * account ID, and sends a request to update authorization via socket.
 */
export async function mapClient(
  req: MapClientRequest,
  res: Response,
  next: NextFunction
) {
  try {
    const { userId, accoid } = req.body;

    const promise1 = UserProfile.update({
      where: {
        userId,
      },
      data: {
        accoid,
      },
    });

    const promise2 = AccountMaster.update({
      where: {
        accoid,
      },
      data: {
        userId,
      },
    });
    await Promise.all([promise1, promise2]);
    next({ message: "Mapping was successful" });

    // TODO: add socket call
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * The code exports two functions, one to fetch a list of tender balances and another to insert a new
 * tender into the daily publish list.
 */
export async function getPublishList(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const publishedTenderIds = (
      await DailyBalance.findMany({
        select: {
          tender_id: true,
        },
      })
    ).map((tender) => tender.tender_id!);

    const tenderBalances = await TenderBalanceView.findMany({
      where: {
        AND: [
          {
            balance: {
              gt: 0,
            },
          },
          {
            buyer: {
              equals: 2,
            },
          },
          {
            tender_id: {
              notIn: publishedTenderIds,
            },
          },
        ],
      },
      orderBy: [
        {
          tender_no: "asc",
        },
      ],
    });

    let uniqueKeys: number[] = [];
    let uniqueList = [];
    for (let ele of tenderBalances || []) {
      if (!uniqueKeys.includes(ele.tender_id)) {
        uniqueKeys.push(ele.tender_id);
        uniqueList.push(ele);
      }
    }
    next({ message: "Successfully fetched tender balances", data: uniqueList });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function posts daily publish data to a database and checks if the tender already exists in the
 * published list.
 */
export async function postPublishList(
  req: PostPublishListRequest,
  res: Response,
  next: NextFunction
) {
  try {
    const { tender_id, tender_no } = req.body;
    const tenderIdExist = await DailyPublish.findFirst({
      where: {
        tender_id,
      },
    });
    if (tenderIdExist) {
      throw createError.Conflict(
        `tender no ${tender_no} already exist in published list`
      );
    }

    // insert into daily publish
    await DailyPublish.create({
      data: {
        tender_no: req.body.tender_no,
        tender_id: req.body.tender_id,
        tender_date: req.body.tender_date,
        publish_date: new Date().toISOString(),
        lifting_date: req.body.lifting_date,
        mill_code: req.body.mill_code,
        mc: req.body.mc,
        item_code: req.body.item_code,
        it: req.body.ic,
        payment_to: req.body.payment_to,
        pt: req.body.pt,
        doac: req.body.tender_do,
        doid: req.body.td,
        season: req.body.season,
        grade: req.body.grade,
        unit: req.body.unit,
        qty: parseFloat(req.body.quantal),
        mill_rate: parseFloat(req.body.mill_rate),
        purc_rate: parseFloat(req.body.purchase_rate),
        sale_rate: parseFloat(req.body.sale_rate.toString()),
        published_qty: parseFloat(req.body.publish_quantal.toString()),
        selling_type: req.body.type,
        multiple_of: parseInt(req.body.multiple_of.toString()),
        auto_confirm: req.body.auto_confirm,
        status: "Y",
      },
    });

    next({ message: "Successfully inserted into published list" });

    // tell client to fetch published list
    io.emit(UPDATE_PUBLISHED_LIST) &&
      logger.debug("Sent request to update published list");
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function retrieves a list of published daily balances with a positive balance and removes
 * duplicates based on tender_id.
 */
export async function getPublishedList(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const dailybalances = await DailyBalance.findMany({
      where: {
        balance: {
          gt: 0,
        },
      },
      orderBy: [
        {
          tender_no: "asc",
        },
      ],
    });
    let uniqueKeys: number[] = [];
    let uniqueList = [];
    for (let ele of dailybalances || []) {
      if (ele.tender_id && !uniqueKeys.includes(ele.tender_id)) {
        uniqueKeys.push(ele.tender_id);
        uniqueList.push(ele);
      }
    }
    next({ data: uniqueList, message: "Successfully fetched daily balances" });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function updates the status of a single trade and sends a request to update trading options.
 */
export async function updatePublishedItemStatus(
  req: UpdatePublishedItemStatusRequest,
  res: Response,
  next: NextFunction
) {
  try {
    const { tender_id, status } = req.body;

    const res = await DailyPublish.findFirst({
      where: {
        tender_id,
      },
      select: {
        autoid: true,
      },
    });
    const result = await DailyPublish.update({
      data: {
        status,
      },
      where: {
        autoid: res?.autoid,
      },
      select: {
        tender_no: true,
      },
    });
    next({
      message: `${status === "Y" ? "Started" : "Stopped"} trade for tender no ${
        result.tender_no
      }`,
    });
    const sent_request = await updateTradingOption();
    sent_request && logger.debug("Sent request to update trading option");
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function updatePublishedListItem(
  req: UpdatePublishedListItemRequest,
  res: Response,
  next: NextFunction
) {
  try {
    const { tender_id, status, sale_rate, published_qty } = req.body;

    const res = await DailyPublish.findFirst({
      where: {
        tender_id,
      },
      select: {
        autoid: true,
      },
    });

    await DailyPublish.update({
      data: {
        status,
        sale_rate,
        published_qty,
      },
      where: {
        autoid: res?.autoid,
      },
    });
    io.emit(UPDATE_PUBLISHED_LIST);
    next({
      message: "Updated published list item",
    });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function retrieves trade status data and checks if trading should be stopped based on the
 * status.
 */
export async function getAllTradeStatus(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const statusArr = await DailyPublish.findMany({
      select: {
        status: true,
      },
    });
    let stop_trading_option = false;
    for (let { status } of statusArr) {
      if (status === "Y") {
        stop_trading_option = true;
        break;
      }
    }
    next({ data: { stop_trading_option } });
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export function getAdminHome(req: Request, res: Response, next: NextFunction) {
  try {
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * !deprecated
 */
export async function updateAllTrade(
  req: UpdateAllTradeRequest,
  res: Response,
  next: NextFunction
) {
  try {
    /* The above code is updating the status of daily publishing and sending a request to update
    trading options. */
    // const { status } = req.body;
    // const setQuery = { status };
    // await updateDailyPublishByQuery(setQuery);
    // next({
    //   message: `Successfully ${
    //     status === "Y" ? "Started" : "Stopped"
    //   } all trades`,
    // });
    // const sent_request = await updateTradingOption();
    // sent_request && logger.debug("Sent request to update trading option");
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * !deprecated
 */
export async function updateSingleSaleRate(
  req: UpdateSingleSaleRateRequest,
  res: Response,
  next: NextFunction
) {
  try {
    // const { tender_id, sale_rate } = req.body;
    // const setQuery = {
    //   sale_rate: Sequelize.literal(`sale_rate + ${sale_rate}`),
    // };
    // const query = { where: { tender_id } };
    // await updateDailyPublishByQuery(setQuery, query);
    // next({ message: "Updated sale rate for tender id " + tender_id });
    // const request_sent = await updatePublishedList();
    // request_sent && logger.debug(`Sent request to update published list`);
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * !deprecated
 */
export async function updateAllSaleRate(
  req: UpdateAllSaleRateRequest,
  res: Response,
  next: NextFunction
) {
  try {
    // const { sale_rate } = req.body;
    // const setQuery = {
    //   sale_rate: Sequelize.literal(`sale_rate + ${sale_rate}`),
    // };
    // await updateDailyPublishByQuery(setQuery);
    // next({ message: "Updated all sale rate" });
    // const request_sent = await updatePublishedList();
    // request_sent && logger.debug(`Sent request to update published list`);
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * !deprecated
 */
export async function modifySingleTrade(
  req: ModifySingleTradeRequest,
  res: Response,
  next: NextFunction
) {
  try {
    // const { tender_id, sale_rate, published_qty } = req.body;
    // const setQuery = { sale_rate, published_qty };
    // const query = { where: { tender_id } };
    // await updateDailyPublishByQuery(setQuery, query);
    // next({ message: "Modified trade for tender id " + tender_id });
    // const request_sent = await updatePublishedList();
    // request_sent && logger.debug(`Sent request to update published list`);
  } catch (err: Error | any) {
    if (!err.status) err.status = 500;
    next(err);
  }
}
