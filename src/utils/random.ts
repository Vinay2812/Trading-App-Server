import crypto from "crypto";
import { OTP_LENGTH, UNIQUE_ID_LENGTH } from "./config";

export function getRandomId() {
  const uniqueId = crypto
    .randomBytes(UNIQUE_ID_LENGTH)
    .toString("hex");
  return uniqueId;
}

export function getRandomOtp() {
  let otp = "";
  for (let i = 0; i < OTP_LENGTH; i++) {
    otp += String((Math.floor(Math.random() * 10)));
  }
  return otp;
}
