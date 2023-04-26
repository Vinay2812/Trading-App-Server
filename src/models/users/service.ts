import { processQueryOutput } from "../../utils/query";
import {
  UserBankDetails,
  UserBankDetailsInterface,
  UserContactDetails,
  UserContactDetailsInterface,
  UserOnlineDetails,
  UserOnlineDetailsInterface,
} from "./users.model";

export async function getOnlineUsersByQuery(query: any = { where: {} }) {
  let users = await UserOnlineDetails.findAll({ ...query });
  return processQueryOutput.forFindAll<UserOnlineDetailsInterface>(users);
}

export async function getUserBankDetailsByQuery(query: any = { where: {} }) {
  let data = await UserBankDetails.findAll(query);
  return processQueryOutput.forFindAll<UserBankDetailsInterface>(data);
}

export async function getUserBankContactByQuery(query: any = { where: {} }) {
  let data = await UserContactDetails.findAll(query);
  return processQueryOutput.forFindAll<UserContactDetailsInterface>(data);
}

export async function updateOnlineUserByQuery(
  set: any,
  query: any = { where: {} }
) {
  let [rows, data] = await UserOnlineDetails.update(set, query);
  const simplifiedData: UserOnlineDetailsInterface[] =
    processQueryOutput.forUpdate<UserOnlineDetailsInterface>(data);
  return { rows_affected: rows, data: simplifiedData };
}

export async function createOnlineUserByQuery(
  values: any,
  options: object = { returning: true }
) {
  let data = await UserOnlineDetails.create(values, options);
  return processQueryOutput.forInsert(data);
}

export async function createUserBankDetailsByQuery(
  values: any,
  options: object = { returning: true }
) {
  let data = await UserBankDetails.create(values, options);
  return processQueryOutput.forInsert(data);
}

export async function createUserContactDetailsByQuery(
  values: any,
  options: object = { returning: true }
) {
  let data = await UserContactDetails.create(values, options);
  return processQueryOutput.forInsert(data);
}
