import { processQueryOutput } from "../../utils/query";
import { DailyPublish } from "./daily_publish.model";

export async function getDataFromDailyPublish(query: any = { where: {} }) {
  let output = await DailyPublish.findAll(query);
  return processQueryOutput.forFindAll(output);
}

export async function updateDailyPublishByQuery(
  set: any,
  query: any = { where: {} }
) {
  const [rows, data] = await DailyPublish.update(set, query);
  const processedOutput = processQueryOutput.forUpdate(data);
  return { rows_affected: rows, data: processedOutput };
}

export async function createDailyPublish(
  values: any,
  options: any = { returning: true }
) {
  const data = await DailyPublish.create(values, options);
  return processQueryOutput.forInsert(data);
}
