import { processQueryOutput } from "../../utils/query";
import { DailyBalance, DailyBalanceInterface } from "./daily_balance.model";

export async function getDataFromDailyBalance(query: any = { where: {} }) {
  let output = await DailyBalance.findAll(query);
  return processQueryOutput.forFindAll<DailyBalanceInterface>(output);
}
