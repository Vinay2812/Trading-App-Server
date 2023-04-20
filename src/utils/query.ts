import { Model } from "sequelize";

function forFindAll<T>(data: Model<any, any>[]) {
  return data.map(({ dataValues }: any) => dataValues);
}

function forUpdate<T = any>(data: Model<T, T>[]): T[] {
  return data.map(({ dataValues }) => dataValues);
}

function forInsert<T = any>(data: Model<T, T> | void): T {
  return data ? data?.dataValues : null;
}
export const processQueryOutput = {
  forFindAll: forFindAll,
  forUpdate: forUpdate,
  forInsert: forInsert,
};
