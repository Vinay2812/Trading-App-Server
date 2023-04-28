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
import { validateRequest } from "../middlewares/validator.middleware";
import {
  getOnlineUserCompaniesReq,
  getUserByIdReq,
  getUserFromAccountMasterReq,
  getUserReq,
  updatePasswordReq,
} from "../validators/user.validator";
const router = Router();

// user
router.get("/:userId", validateRequest(getUserByIdReq), getUserById);
router.get("/", validateRequest(getUserReq), getUser);
router.get("/registered-users/details", getAllUsersData);
router.get(
  "/companies/:mobile",
  validateRequest(getOnlineUserCompaniesReq),
  getOnlineUserCompanies
);
router.patch("/password", validateRequest(updatePasswordReq), updatePassword);

// account_master
router.get("/account_master/company-names", getAllAccountMasterCompanyName);
router.get(
  "/account_master/:accoid",
  validateRequest(getUserFromAccountMasterReq),
  getUserFromAccountMaster
);

export default router;
