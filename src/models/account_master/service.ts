import { processQueryOutput } from "../../utils/query";
import { AccountMaster, AccountMasterInterface } from "./account_master.model";

export async function getAccountMasterByQuery(query: any = { where: {} }) {
  let output = await AccountMaster.findAll(query);
  return processQueryOutput.forFindAll<AccountMasterInterface>(output);
}

export async function updateAccountMasterByQuery(
  set: any,
  query: any = { where: {} }
) {
  const [rows, data] = await AccountMaster.update(set, query);
  const processedOutput = processQueryOutput.forUpdate(data);
  return { rows_affected: rows, data: processedOutput };
}

export async function createAccountMasterByQuery(
  query: any,
  options: any = { returning: true }
) {
  const data = await AccountMaster.create(query, options);
  return processQueryOutput.forInsert(data);
}

export async function deleteAccountMasterByQuery(query: any = { where: {} }) {
  const data = await AccountMaster.destroy(query);
  return data;
}
