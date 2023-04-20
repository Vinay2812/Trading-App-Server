import { processQueryOutput } from "../../utils/query";
import { AccountMaster } from "./account_master.model";

export async function getDataFromAccountMaster(query: any = { where: {} }) {
  let output = await AccountMaster.findAll(query);
  return processQueryOutput.forFindAll(output);
}

export async function updateAccountMasterByQuery(
  set: any,
  query: any = { where: {} }
) {
  let [rows, data] = await AccountMaster.update(set, query);
  let processedOutput = processQueryOutput.forUpdate(data);
  return { rows_affected: rows, data: processedOutput };
}

export async function createAccountMaster(
  query: any,
  options: any = { returning: true }
) {
  const data = await AccountMaster.create(query, options);
  return processQueryOutput.forInsert(data);
}
