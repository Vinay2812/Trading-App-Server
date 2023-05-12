import logger from "./logger";
import {
  AccountMaster,
  AppErrors,
  DailyPublish,
  UserBankDetails,
  UserContactDetails,
  UserOnlineDetails,
  AdminProfile,
  DashboardUser,
} from "../models/index";
import { SubTodos, Todos } from "../models/todo/todo.model";

export default function syncMssql() {
  const options = {
    logging: false,
    alter: false,
  };
  UserOnlineDetails.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync online user details " + err)
  );
  UserBankDetails.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync user bank details " + err)
  );
  UserContactDetails.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync user contact details " + err)
  );
  AccountMaster.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync nt_1_accountmaster " + err)
  );
  AppErrors.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync trading_app_errors " + err)
  );
  DailyPublish.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync tr daily publish " + err)
  );
  AdminProfile.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync admin profile " + err)
  );
  DashboardUser.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync dashboard user " + err)
  );
  Todos.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync todos " + err)
  );
  SubTodos.sync(options).catch((err: Error | any) =>
    logger.error("failed to sync sub todos " + err)
  );
}
