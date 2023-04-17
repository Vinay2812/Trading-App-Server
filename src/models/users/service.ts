import { processQueryOutput } from "../../utils/query";
import {
  UserBankDetails,
  UserContactDetails,
  UserOnlineDetails,
} from "./users.model";

export async function getOnlineUsersByQuery(query: any = { where: {} }) {
  let users = await UserOnlineDetails.findAll(query);
  return processQueryOutput.forFindAll(users);
}

export async function getUserBankDetailsByQuery(query: any = { where: {} }) {
  let data = await UserBankDetails.findAll(query);
  return processQueryOutput.forFindAll(data);
}

export async function updateOnlineUserByQuery(set: any, query: any = { where: {} }) {
  let [rows, data] = await UserOnlineDetails.update(set, query);
  data = processQueryOutput.forUpdate(data);
  return { rows_affected: rows, data };
}

export async function insertIntoOnlineUser(
  values: any,
  options: object = { returning: true }
) {
  let data = await UserOnlineDetails.create(values, options);
  return processQueryOutput.forInsert(data);
}

export async function insertIntoUserBankDetails(
  values: any,
  options: object = { returning: true }
) {
  let data = await UserBankDetails.create(values, options);
  return processQueryOutput.forInsert(data);
}

export async function insertIntoUserContactDetails(
  values: any,
  options: object = { returning: true }
) {
  let data = await UserContactDetails.create(values, options);
  return processQueryOutput.forInsert(data);
}
