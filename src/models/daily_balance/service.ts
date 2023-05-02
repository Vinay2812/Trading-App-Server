import { processQueryOutput } from "../../utils/query";
import { DailyBalance, DailyBalanceInterface } from "./daily_balance.model";

export async function getDailyBalanceByQuery(query: any = { where: {} }) {
  let output = await DailyBalance.findAll(query);
  return processQueryOutput.forFindAll<DailyBalanceInterface>(output);
}

export async function updateDailyBalanceByQuery(
  set: any,
  query: any = { where: {} }
) {
  const [rows, data] = await DailyBalance.update(set, query);
  const processedOutput = processQueryOutput.forUpdate(data);
  return { rows_affected: rows, data: processedOutput };
}

export async function createDailyBalanceByQuery(
  query: any,
  options: any = { returning: true }
) {
  const data = await DailyBalance.create(query, options);
  return processQueryOutput.forInsert(data);
}

export async function deleteDailyBalanceByQuery(query: any = { where: {} }) {
  const data = await DailyBalance.destroy(query);
  return data;
}

export async function getDailyBalanceCountByQuery(query: any = { where: {} }){
  let output = await DailyBalance.count(query);
  return output;
}
