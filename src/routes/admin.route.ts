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
  updatePublishedItemStatus,
  updateAllTrade,
  getAllTradeStatus,
  getAdminHome,
  updatePublishedListItem,
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
  updatePublishedItemStatusReq,
  updatePublishedListItemReq,
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
router.post(
  "/registration-list/map-client",
  validateRequest(mapClientReq),
  mapClient
);

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
  "/published-list/status",
  validateRequest(updatePublishedItemStatusReq),
  updatePublishedItemStatus
);
router.patch(
  "/published-list/item",
  validateRequest(updatePublishedListItemReq),
  updatePublishedListItem
);
router.patch(
  "/published-list/status/all",
  validateRequest(updateAllTradeReq),
  updateAllTrade
);
router.patch(
  "/published-list/sale_rate",
  validateRequest(updateSingleSaleRateReq),
  updateSingleSaleRate
);
router.patch(
  "/published-list/sale_rate/all",
  validateRequest(updateAllSaleRateReq),
  updateAllSaleRate
);
router.patch(
  "/published-list/update",
  validateRequest(modifySingleTradeReq),
  modifySingleTrade
);
router.get("/published-list/status/all", getAllTradeStatus);

export default router;
