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

export default function syncMssql() {
  const options = {
    logging: false,
    alter: false,
  };
  UserOnlineDetails.sync(options).catch((err) =>
    logger.error("failed to sync online user details " + err)
  );
  UserBankDetails.sync(options).catch((err) =>
    logger.error("failed to sync user bank details " + err)
  );
  UserContactDetails.sync(options).catch((err) =>
    logger.error("failed to sync user contact details " + err)
  );
  AccountMaster.sync(options).catch((err) =>
    logger.error("failed to sync nt_1_accountmaster " + err)
  );
  AppErrors.sync(options).catch((err) =>
    logger.error("failed to sync trading_app_errors " + err)
  );
  DailyPublish.sync(options).catch((err) =>
    logger.error("failed to sync tr daily publish " + err)
  );
  AdminProfile.sync(options).catch((err) =>
    logger.error("failed to sync admin profile " + err)
  );
  DashboardUser.sync(options).catch((err) =>
    logger.error("failed to sync dashboard user " + err)
  );
}
