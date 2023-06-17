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
  getOrderList,
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
import { validate } from "../middlewares/validator.middleware";

const router = Router();

// admin login
router.post("/login", validate(adminLoginReq), adminLogin);

// admin home
router.get("/home", getAdminHome);
// registration list
router.get("/registration-list/users", getRegistrationListUsers);
router.patch(
  "/registration-list/:userId/authorization",
  validate(updateAuthorizationReq),
  updateAuthorization
);
router.post("/registration-list/add-user", validate(addUserReq), addUser);
router.post("/registration-list/map-client", validate(mapClientReq), mapClient);

//publish list
router.get("/publish-list", getPublishList);
router.post("/publish-list", validate(postPublishListReq), postPublishList);

// published-list
router.get("/published-list", getPublishedList);
router.patch(
  "/published-list/status",
  validate(updatePublishedItemStatusReq),
  updatePublishedItemStatus
);
router.patch(
  "/published-list/item",
  validate(updatePublishedListItemReq),
  updatePublishedListItem
);
router.patch(
  "/published-list/status/all",
  validate(updateAllTradeReq),
  updateAllTrade
);
router.patch(
  "/published-list/sale_rate",
  validate(updateSingleSaleRateReq),
  updateSingleSaleRate
);
router.patch(
  "/published-list/sale_rate/all",
  validate(updateAllSaleRateReq),
  updateAllSaleRate
);
router.patch(
  "/published-list/update",
  validate(modifySingleTradeReq),
  modifySingleTrade
);
router.get("/published-list/status/all", getAllTradeStatus);

router.get("/order-list", getOrderList);

export default router;
