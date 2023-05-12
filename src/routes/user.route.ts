import { Router } from "express";
import {
  getAllAccountMasterCompanyName,
  getOnlineUserCompanies,
  getUser,
  getUserById,
  getUserFromAccountMaster,
  updatePassword,
  getAllUsersData
} from "../controller/user.controller";
import { validate } from "../middlewares/validator.middleware";
import {
  getOnlineUserCompaniesReq,
  getUserByIdReq,
  getUserFromAccountMasterReq,
  getUserReq,
  updatePasswordReq,
} from "../validators/user.validator";
const router = Router();

// user
router.get("/:userId", validate(getUserByIdReq), getUserById);
router.get("/", validate(getUserReq), getUser);
router.get("/registered-users/details", getAllUsersData);
router.get(
  "/companies/:mobile",
  validate(getOnlineUserCompaniesReq),
  getOnlineUserCompanies
);
router.patch("/password", validate(updatePasswordReq), updatePassword);

// account_master
router.get("/account_master/company-names", getAllAccountMasterCompanyName);
router.get(
  "/account_master/:accoid",
  validate(getUserFromAccountMasterReq),
  getUserFromAccountMaster
);

export default router;
