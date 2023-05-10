import { Model } from "sequelize";

function forFindOne<T = any>(data: Model<any, any>) {
  return data?.dataValues as T;
}

function forFindAll<T = any>(data: Model<any, any>[]) {
  return data?.map(({ dataValues }: any) => dataValues) as T[];
}

function forUpdate<T = any>(data: Model<T, T>[]): T[] {
  return data?.map(({ dataValues }) => dataValues);
}

function forInsert<T = any>(data: Model<T, T> | void): T {
  return data ? data?.dataValues : null;
}
export const processQueryOutput = {
  forFindOne,
  forFindAll,
  forUpdate,
  forInsert,
};
