import { Prisma } from "@prisma/client";
import { AccountMaster } from "./account_master.model";

export async function getManyAccountMasterByQuery(
  query: Prisma.AccountMasterFindManyArgs
) {
  return AccountMaster.findMany(query);
}

export async function getOneAccountMasterByQuery(
  query: Prisma.AccountMasterFindFirstArgs
) {
  return AccountMaster.findFirst(query);
}

export async function updateOneAccountMasterByQuery(
  query: Prisma.AccountMasterUpdateArgs
) {
  return AccountMaster.update(query);
}

export async function updateManyAccountMasterByQuery(
  query: Prisma.AccountMasterUpdateManyArgs
) {
  return AccountMaster.updateMany(query);
}

// export async function createAccountMasterByQuery(
//   query: any,
//   options: any = { returning: true }
// ) {
//   const data = await AccountMaster.create(query, options);
//   return processQueryOutput.forInsert(data);
// }

// export async function deleteAccountMasterByQuery(query: any = { where: {} }) {
//   const data = await AccountMaster.destroy(query);
//   return data;
// }
