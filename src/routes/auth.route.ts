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
import { validate } from "../middlewares/validator.middleware";

// authentication
router.post("/register", validate(registerReq), register);
router.post("/login", validate(loginReq), login);

// otp
router.post("/send-otp", validate(sendOTPReq), sendOTP);
router.get("/otp/:userId", getOTP);
router.post("/validate-otp", validate(validateOTPReq), validateOTP);

export default router;
