import { Router } from "express";
import {
  getOTP,
  login,
  register,
  sendOTP,
  validateOTP,
} from "../controller/auth.controller";
import {
  loginReq,
  registerReq,
  sendOTPReq,
  validateOTPReq,
} from "../validators/auth.validator";
const router = Router();
import { validateRequest } from "../middlewares/validator.middleware";

// authentication
router.post("/register", validateRequest(registerReq), register);
router.post("/login", validateRequest(loginReq), login);

// otp
router.post("/otp/send", validateRequest(sendOTPReq), sendOTP);
router.get("/otp/:userId", getOTP);
router.post("/otp/validate", validateRequest(validateOTPReq), validateOTP);

export default router;
