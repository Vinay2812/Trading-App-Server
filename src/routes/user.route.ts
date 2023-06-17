import { Router } from "express";
import {
  getAllAccountMasterCompanyName,
  getOnlineUserCompanies,
  getUserById,
  getUserFromAccountMaster,
  getAllUsersData,
  getUserProfile,
  placeOrder,
  getUserByQuery,
} from "../controller/user.controller";
import { validate } from "../middlewares/validator.middleware";
import {
  getOnlineUserCompaniesReq,
  getUserByIdReq,
  getUserFromAccountMasterReq,
  getUserProfileReq,
  getUserByQueryReq,
  placeOrderReq,
} from "../validators/user.validator";
const router = Router();

// user
router.get("/:userId", validate(getUserByIdReq), getUserById);

// get using query
router.get("/", validate(getUserByQueryReq), getUserByQuery);
router.get("/registered-users/details", getAllUsersData);
router.get(
  "/companies/:mobile",
  validate(getOnlineUserCompaniesReq),
  getOnlineUserCompanies
);

// account_master
router.get("/account_master/company-names", getAllAccountMasterCompanyName);
router.get(
  "/account_master/:accoid",
  validate(getUserFromAccountMasterReq),
  getUserFromAccountMaster
);

router.get("/profile/:userId", validate(getUserProfileReq), getUserProfile);

// buy order
router.post("/place-order", validate(placeOrderReq), placeOrder);

export default router;
