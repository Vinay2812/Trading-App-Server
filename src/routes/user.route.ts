import { Router } from "express";
import {
  getAllAccountMasterCompanyName,
  getOnlineUserCompanies,
  getUser,
  getUserById,
  getUserFromAccountMaster,
  updatePassword,
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
router.patch("/password", validateRequest(updatePasswordReq), updatePassword);
router.get("/", validateRequest(getUserReq), getUser);
router.get(
  "/companies/:mobile",
  validateRequest(getOnlineUserCompaniesReq),
  getOnlineUserCompanies
);

// account_master
router.get("/account_master/company-names", getAllAccountMasterCompanyName);
router.get(
  "/account_master/:accoid",
  validateRequest(getUserFromAccountMasterReq),
  getUserFromAccountMaster
);

export default router;
