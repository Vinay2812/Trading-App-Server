import { Router } from "express";
import {
  addUser,
  adminLogin,
  getPublishList,
  getPublishedList,
  getRegistrationListUsers,
  postPublishList,
  mapClient,
  updateAuthorization,
  updateAllSaleRate,
  updateSingleSaleRate,
  modifySingleTrade,
  updateSingleTrade,
  updateAllTrade,
  getAllTradeStatus,
  getAdminHome,
} from "../controller/admin.controller";
import {
  addUserReq,
  adminLoginReq,
  mapClientReq,
  modifySingleTradeReq,
  postPublishListReq,
  updateAllSaleRateReq,
  updateAllTradeReq,
  updateAuthorizationReq,
  updateSingleSaleRateReq,
  updateSingleTradeReq,
} from "../validators/admin.validator";
import { validateRequest } from "../middlewares/validator.middleware";

const router = Router();

// admin login
router.post("/login", validateRequest(adminLoginReq), adminLogin);

// admin home
router.get("/home", getAdminHome);
// registration list
router.get("/registration-list/users", getRegistrationListUsers);
router.patch(
  "/registration-list/:userId/authorization",
  validateRequest(updateAuthorizationReq),
  updateAuthorization
);
router.post(
  "/registration-list/add-user",
  validateRequest(addUserReq),
  addUser
);
router.put("/registration-list/map", validateRequest(mapClientReq), mapClient);

//publish list
router.get("/publish-list", getPublishList);
router.post(
  "/publish-list",
  validateRequest(postPublishListReq),
  postPublishList
);

// published-list
router.get("/published-list", getPublishedList);
router.patch(
  "/published-list/trade/status",
  validateRequest(updateSingleTradeReq),
  updateSingleTrade
);
router.patch(
  "/published-list/trade/status/all",
  validateRequest(updateAllTradeReq),
  updateAllTrade
);
router.patch(
  "/published-list/trade/sale_rate",
  validateRequest(updateSingleSaleRateReq),
  updateSingleSaleRate
);
router.patch(
  "/published-list/trade/sale_rate/all",
  validateRequest(updateAllSaleRateReq),
  updateAllSaleRate
);
router.patch(
  "/published-list/trade/update",
  validateRequest(modifySingleTradeReq),
  modifySingleTrade
);
router.get("/published-list/trade/status/all", getAllTradeStatus);

export default router;
