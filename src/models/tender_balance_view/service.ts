import { processQueryOutput } from "../../utils/query";
import {
  TenderBalanceView,
  TenderBalanceViewInterface,
} from "./tender_balance_view.model";

export async function getTenderBalanceByQuery(query: any = { where: {} }) {
  let output = await TenderBalanceView.findAll(query);
  return processQueryOutput.forFindAll<TenderBalanceViewInterface>(output);
}

export async function getTenderBalanceCountByQuery(
  query: any = { where: {} }
) {
  let output = await TenderBalanceView.count(query);
  return output;
}
