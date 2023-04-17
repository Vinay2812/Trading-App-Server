import { processQueryOutput } from "../../utils/query";
import { DailyPublish } from "./daily_publish.model";

export async function getDataFromDailyPublish(query: any = { where: {} }) {
  let output = await DailyPublish.findAll(query);
  return processQueryOutput.forFindAll(output);
}

export async function updateDailyPublishByQuery(set: any, query: any = { where: {} }) {
  let [rows, data] = await DailyPublish.update(set, query);
  data = processQueryOutput.forUpdate(data);
  return { rows_affected: rows, data };
}

export async function insertIntoDailyPublish(
  values: any,
  options: any = { returning: true }
) {
  const data = await DailyPublish.create(values, options);
  return processQueryOutput.forInsert(data);
}
