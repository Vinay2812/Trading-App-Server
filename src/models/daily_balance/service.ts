import { processQueryOutput } from "../../utils/query";
import { DailyBalance } from "./daily_balance.model";

export async function getDataFromDailyBalance(query: any = { where: {} }) {
  let output = await DailyBalance.findAll(query);
  return processQueryOutput.forFindAll(output);
}
