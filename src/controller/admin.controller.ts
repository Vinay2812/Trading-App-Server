import { ADMIN_USERNAME, ADMIN_PASSWORD } from "../utils/config";
import logger from "../utils/logger";
import createError from "http-errors";
import {
  getAccountMasterByQuery,
  getTenderBalanceByQuery,
  getOnlineUsersByQuery,
  getUserBankDetailsByQuery,
  getDailyPublishByQuery,
  createAccountMasterByQuery,
  updateAccountMasterByQuery,
  updateOnlineUserByQuery,
  createDailyPublishByQuery,
  getDailyBalanceByQuery,
  updateDailyPublishByQuery,
} from "../models/index";
import { Op, Sequelize } from "sequelize";
import {
  updatePublishedList,
  updateTradingOption,
  updateUserAuthorization,
} from "../socket/controller/emit";
import { NextFunction, Request, Response } from "express";
import { UpdatePublishedListItemReqType } from "../validators/admin.validator";

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
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    /* The above code is checking if the `username` and `password` received in the request body match
   the predefined `ADMIN_USERNAME` and `ADMIN_PASSWORD`. If they do not match, it throws a
   `BadRequest` error with an appropriate message. */
    const { username, password } = req.body;
    if (username !== ADMIN_USERNAME) {
      throw createError.BadRequest("Invalid username");
    }
    if (password !== ADMIN_PASSWORD) {
      throw createError.BadRequest("Invalid password");
    }
    next({ data: { username, admin: 1 }, message: "Login successful" });
  } catch (err) {
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
    /* The below code is using TypeScript to retrieve online users by querying their attributes such as
    userId, company_name, email, mobile, authorized, and accoid. The function
    `getOnlineUsersByQuery` is being called with an object containing the attributes to be
    retrieved. The `await` keyword is used to wait for the function to return the result before
    continuing execution. */
    const users = await getOnlineUsersByQuery({
      attributes: [
        "userId",
        "company_name",
        "email",
        "mobile",
        "authorized",
        "accoid",
        "gst",
        "state",
        "address",
        "district",
      ],
    });
    next({
      message: "Successfully fetched registration list users",
      data: users,
    });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function updates the authorization status of a user and returns a success message.
 */
export async function updateAuthorization(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    /* The below code is updating the online user by query based on the `authorized` and `userId` values
   received in the request body. It is using the `updateOnlineUserByQuery` function to update the
   user's `authorized` status in the database. The `where` clause specifies the condition for the
   update, and the `returning` option is used to return the updated user data. */
    const { authorized, userId } = req.body;
    await updateOnlineUserByQuery(
      { authorized },
      { where: { userId }, returning: true }
    );
    next({ message: `Authorization updated successfully for ${userId}` });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function adds a new user to the system by retrieving their information from the database and
 * creating a new account for them.
 */
export async function addUser(req: Request, res: Response, next: NextFunction) {
  try {
    const { userId } = req.body;
    /* The below code is written in TypeScript and it is creating a query to retrieve the maximum value
    of the "Ac_code" column from a table named "AccountMaster" where the "company_code" is equal to
    1. It then retrieves the result of this query and assigns the value of the maximum "Ac_code" to
    the variable "max_ac_code". Finally, it calculates the next "Ac_code" by adding 1 to the maximum
    "Ac_code" value. */
    const max_ac_code_query = {
      attributes: [
        [Sequelize.fn("max", Sequelize.col("Ac_code")), "max_ac_code"],
      ],
      where: {
        company_code: 1,
      },
    };
    const { max_ac_code }: any = (
      await getAccountMasterByQuery(max_ac_code_query)
    )[0];

    /* The below code is creating a new account for a user by fetching their details from the database and
      inserting them into the account master table. It first gets the user's details such as company name,
      address, bank details, etc. from the database using the user's ID. It then creates a new account
      with the next available account code and inserts the user's details into the account master table.
      Finally, it updates the user's account ID in the online users table. */
    const next_ac_code = max_ac_code + 1;
    const get_user_by_id_query = {
      attributes: [
        "company_name",
        "address",
        "pincode",
        "gst",
        "email",
        "pan",
        "mobile",
        "fssai",
        "state",
        "whatsapp",
        "tan",
      ],
      where: { userId },
    };
    const userData = (await getOnlineUsersByQuery(get_user_by_id_query))[0];
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

    const bankDataQuery = {
      attributes: ["bank_name", "account_number", "ifsc", "account_name"],
      where: { userId },
    };
    const bankData = await getUserBankDetailsByQuery(bankDataQuery);
    if (!bankData.length) {
      throw createError.BadRequest("Bank details not found for this user");
    }
    const { bank_name, account_number, ifsc, account_name } = bankData[0];

    const insertData = {
      ac_code: next_ac_code,
      ac_name_e: company_name,
      ac_name_r: company_name,
      ac_type: "P",
      address_e: address,
      address_r: address,
      pincode,
      gst_no: gst,
      email_id: email,
      other_narration: "Online",
      bank_name,
      bank_ac_no: account_number,
      bank_op_drcr: "D",
      drcr: "D",
      short_name: account_name.substring(
        0,
        Math.min(15, account_name.length - 1)
      ),
      corporate_party: "N",
      company_pan: pan,
      mobile_no: mobile,
      is_login: "Y",
      ifsc,
      fssai,
      branch1drcr: "D",
      branch2drcr: "D",
      locked: "0",
      gststatecode: isNaN(parseInt(state.substring(0, 2)))
        ? null
        : state.substring(0, 2),
      unregistergst: gst == null ? 0 : 1,
      whatsapp_no: whatsapp,
      limit_by: "N",
      tan_no: tan,
      tdsapplicable: "Y",
      msoms: "M",
      ac_rate: "0",
      city_code: "0",
      bank_opening: "0",
      opening_balance: "0",
      group_code: "0",
      commission: "0",
      offphone: "0",
      branch1ob: "0",
      branch2ob: "0",
      distance: "0",
      bal_limit: "0",
      bsid: "0",
      cityid: "0",
      company_code: "1",
    };
    const { accoid } = await createAccountMasterByQuery(insertData, {
      returning: true,
      plain: true,
    });
    let setQuery = { accoid };
    let updateQuery = { where: { userId }, returning: false };
    await updateOnlineUserByQuery(setQuery, updateQuery);
    next({ message: "User added successfully" });
    const socket_res = await updateUserAuthorization(userId, accoid);
    socket_res && logger.debug("Sent request to update authorization");
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function updates the online user and account master records based on the provided user ID and
 * account ID, and sends a request to update authorization via socket.
 */
export async function mapClient(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    /* The below code is updating the online user and account master records based on the provided
   userId and accoid values in the request body. It then sends a message indicating that the mapping
   was successful. Finally, it calls the updateUserAuthorization function with the same userId and
   accoid values and logs a message if the function call is successful. */
    const { userId, accoid } = req.body;
    let onlineUser_setQuery = { accoid };
    let onlineUser_query = {
      where: { userId },
    };
    let account_master_setQuery = { userId };
    let account_master_query = {
      where: { accoid },
    };
    await Promise.all([
      updateOnlineUserByQuery(onlineUser_setQuery, onlineUser_query),
      updateAccountMasterByQuery(account_master_setQuery, account_master_query),
    ]);
    next({ message: "Mapping was successful" });
    const socket_res = await updateUserAuthorization(userId, accoid);
    socket_res && logger.debug("Sent request to update authorization");
  } catch (err) {
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
    /* The below code is defining a query object `getTenderDetailsQuery` that will be used to retrieve data
    from a view called `getTenderBalanceByQuery`. The query specifies that the data should be
    filtered to only include records where the `balance` field is greater than 0 and the `buyer` field
    is equal to 2. The `await` keyword indicates that the data retrieval is asynchronous and the result
    will be assigned to the `tenderBalances` variable. */
    const publishedTenderIds = (
      await getDailyBalanceByQuery({
        attributes: ["tender_id"],
      })
    ).map((tender) => tender.tender_id);
    const getTenderDetailsQuery = {
      where: {
        [Op.and]: [
          { balance: { [Op.gt]: 0 } },
          { buyer: 2 },
          { tender_id: { [Op.notIn]: publishedTenderIds } },
        ],
      },
    };

    const tenderBalances = await getTenderBalanceByQuery(getTenderDetailsQuery);

    /* The below code is written in TypeScript and it is creating a new array `uniqueList` that
    contains unique elements from the `tenderBalances` array based on the `tender_id` property. It
    first initializes an empty array `uniqueKeys` to keep track of the unique `tender_id` values.
    Then, it iterates over each element of the `tenderBalances` array using a `for...of` loop. For
    each element, it checks if the `tender_id` value is already present in the `uniqueKeys` array
    using the `includes()` method */
    let uniqueKeys: number[] = [];
    let uniqueList = [];
    for (let ele of tenderBalances || []) {
      if (!uniqueKeys.includes(ele.tender_id)) {
        uniqueKeys.push(ele.tender_id);
        uniqueList.push(ele);
      }
    }
    uniqueList.sort((a, b) => a.tender_no - b.tender_no);
    next({ message: "Successfully fetched tender balances", data: uniqueList });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function posts daily publish data to a database and checks if the tender already exists in the
 * published list.
 */
export async function postPublishList(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const {
      tender_no,
      tender_date,
      season,
      grade,
      quantal,
      lifting_date,
      purchase_rate,
      mill_rate,
      mc,
      pt,
      item_code,
      ic,
      tender_id,
      td,
      unit,
      sale_rate,
      publish_quantal,
      multiple_of,
      auto_confirm,
      tender_do,
      type,
      mill_code,
      payment_to,
    } = req.body;

    /* The below code is checking if a tender with a specific tender_id already exists in a published
   list. It does this by querying the database using the tender_id and checking if any results are
   returned. If there are results, it throws a Conflict error indicating that the tender already
   exists in the published list. */
    const tenderExistQuery = {
      attributes: ["tender_id"],
      where: { tender_id },
    };
    const tenderIdExist = await getDailyPublishByQuery(tenderExistQuery);
    if (tenderIdExist?.length) {
      throw createError.Conflict(
        `tender no ${tender_no} already exist in published list`
      );
    }
    /* The below code is creating an object `insertData` with various properties and values, and then
    inserting that data into a database table using the `createDailyPublishByQuery` function. It also sends
    a message to the client indicating that the insertion was successful and updates a published
    list. */
    const publish_date = new Date().toISOString();
    const insertData = {
      tender_no,
      tender_id,
      tender_date,
      publish_date,
      lifting_date,
      mill_code,
      mc,
      item_code,
      it: ic,
      payment_to,
      pt,
      doac: tender_do,
      doid: td,
      season,
      grade: grade,
      unit,
      qty: quantal,
      mill_rate,
      purc_rate: purchase_rate,
      sale_rate,
      published_qty: publish_quantal,
      selling_type: type,
      multiple_of,
      auto_confirm,
      status: "Y",
    };
    // insert into daily publish
    await createDailyPublishByQuery(insertData);
    next({ message: "Successfully inserted into published list" });
    // tell client to fetch daily publish
    let sent_request = await updatePublishedList();
    sent_request && logger.debug("Sent request to update published list");
  } catch (err) {
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
    /* The below code is defining a query object `getPublishedListQuery` that specifies a condition to
   retrieve data from a database table. Specifically, it is querying for data from a table called
   `dailybalances` where the `balance` column is greater than 0. The `await` keyword suggests that
   this query is being executed asynchronously and the results are being returned to a variable
   called `dailybalances`. */
    const getPublishedListQuery = {
      where: { balance: { [Op.gt]: 0 } },
    };
    const dailybalances = await getDailyBalanceByQuery(getPublishedListQuery);
    /* The below code is creating a new list `uniqueList` that contains unique elements from the input list
    `dailybalances`. It does this by iterating over each element in `dailybalances`, checking if its
    `tender_id` property is already in the `uniqueKeys` array. If it is not, the element is added to
    both `uniqueKeys` and `uniqueList`. Finally, the `uniqueList` is sorted in ascending order based on
    the `tender_no` property of each element. */
    let uniqueKeys: number[] = [];
    let uniqueList: any[] = [];
    for (let ele of dailybalances || []) {
      if (!uniqueKeys.includes(ele.tender_id)) {
        uniqueKeys.push(ele.tender_id);
        uniqueList.push(ele);
      }
    }
    uniqueList.sort((a, b) => a.tender_no - b.tender_no);
    next({ data: uniqueList, message: "Successfully fetched daily balances" });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function updates the status of a single trade and sends a request to update trading options.
 */
export async function updatePublishedItemStatus(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    /* The below code is updating a daily publish record in a database table based on the `tender_id`
    provided in the request body. It sets the `status` value in the `setQuery` object and uses it along
    with the `query` object to update the record using the `updateDailyPublishByQuery` function. The
    function returns the updated record as `result`. */
    const { tender_id, status } = req.body;
    const setQuery = { status };
    const query = { where: { tender_id }, returning: true };

    const result: any =
      (await updateDailyPublishByQuery(setQuery, query)) || [];
    next({
      message: `${status === "Y" ? "Started" : "Stopped"} trade for tender no ${
        result?.data[0]?.tender_no
      }`,
    });
    const sent_request = await updateTradingOption();
    sent_request && logger.debug("Sent request to update trading option");
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export async function updatePublishedListItem(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { tender_id, status, sale_rate, published_qty } = req.body;

    const setQuery = {
      status,
      sale_rate,
      published_qty,
    };
    const query = { where: { tender_id }, returning: true };

    await updateDailyPublishByQuery(setQuery, query);
    next({
      message: "Updated published list item",
    });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function updates the status of all trades and sends a request to update trading options.
 */
export async function updateAllTrade(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    /* The above code is updating the status of daily publishing and sending a request to update
    trading options. */
    const { status } = req.body;
    const setQuery = { status };
    await updateDailyPublishByQuery(setQuery);
    next({
      message: `Successfully ${
        status === "Y" ? "Started" : "Stopped"
      } all trades`,
    });
    const sent_request = await updateTradingOption();
    sent_request && logger.debug("Sent request to update trading option");
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function updates the sale rate for a single tender and sends a request to update the published
 * list.
 */
export async function updateSingleSaleRate(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    /* The above code is updating the sale rate for a tender in a database using Sequelize ORM. It first
    extracts the tender_id and sale_rate from the request body, creates a setQuery object with the
    sale_rate value to be updated, and a query object with the tender_id to identify the record to be
    updated. It then calls the updateDailyPublishByQuery function with the setQuery and query objects to
    update the sale rate in the database. After that, it sends a response message indicating the
    successful update. Finally, it calls the updatePublishedList function to send a request to update
    the published list and */
    const { tender_id, sale_rate } = req.body;
    const setQuery = {
      sale_rate: Sequelize.literal(`sale_rate + ${sale_rate}`),
    };
    const query = { where: { tender_id } };
    await updateDailyPublishByQuery(setQuery, query);
    next({ message: "Updated sale rate for tender id " + tender_id });
    const request_sent = await updatePublishedList();
    request_sent && logger.debug(`Sent request to update published list`);
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function updates the sale rate of all daily published items and sends a request to update the
 * published list.
 */
export async function updateAllSaleRate(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    /* The above code is updating the `sale_rate` of a daily publish record in a database by adding the
    value of `sale_rate` received in the request body. It then calls a function
    `updateDailyPublishByQuery` to update the record in the database. After that, it calls another
    function `updatePublishedList` to update the published list and logs a message if the request to
    update the published list is sent successfully. Finally, it sends a response with a message
    "Updated all sale rate". */
    const { sale_rate } = req.body;
    const setQuery = {
      sale_rate: Sequelize.literal(`sale_rate + ${sale_rate}`),
    };
    await updateDailyPublishByQuery(setQuery);
    next({ message: "Updated all sale rate" });
    const request_sent = await updatePublishedList();
    request_sent && logger.debug(`Sent request to update published list`);
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

/**
 * This function modifies a single trade by updating the sale rate and published quantity for a given
 * tender ID, and then sends a request to update the published list.
 */
export async function modifySingleTrade(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    /* The above code is updating the sale rate and published quantity for a tender specified by its
    ID. It then calls a function to update the published list and logs a message if the request to
    update the list was sent successfully. Finally, it sends a response message indicating that the
    trade for the specified tender ID has been modified. */
    const { tender_id, sale_rate, published_qty } = req.body;
    const setQuery = { sale_rate, published_qty };
    const query = { where: { tender_id } };
    await updateDailyPublishByQuery(setQuery, query);
    next({ message: "Modified trade for tender id " + tender_id });
    const request_sent = await updatePublishedList();
    request_sent && logger.debug(`Sent request to update published list`);
  } catch (err) {
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
    /* The above code is querying data from a source using the function `getDailyPublishByQuery()` with a
    query object that specifies the attributes to retrieve and a blank `where` condition. It then checks
    the `status` attribute of each object in the returned array of objects and sets the
    `stop_trading_option` variable to `true` if any of the `status` values is equal to `"Y"`. The `for`
    loop breaks as soon as it finds a `status` value of `"Y"`. */
    const query = {
      attributes: ["status"],
      where: {},
    };
    const statusArr = await getDailyPublishByQuery(query);
    let stop_trading_option = false;
    for (let { status } of statusArr) {
      if (status === "Y") {
        stop_trading_option = true;
        break;
      }
    }
    next({ data: { stop_trading_option } });
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}

export function getAdminHome(req: Request, res: Response, next: NextFunction) {
  try {
  } catch (err) {
    if (!err.status) err.status = 500;
    next(err);
  }
}
