import { processQueryOutput } from "../../utils/query";
import { TenderBalanceView, TenderBalanceViewInterface } from "./tender_balance_view.model";

export async function getDataFromTenderBalanceView(query: any = { where: {} }) {
  let output = await TenderBalanceView.findAll(query);
  return processQueryOutput.forFindAll<TenderBalanceViewInterface>(output);
}
