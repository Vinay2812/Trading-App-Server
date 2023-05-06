import Joi from "joi";
import { OTP_LENGTH } from "../utils/config";

export const registerReq = Joi.object({
  body: Joi.object({
    userData: Joi.object({
      company_name: Joi.string().required(),
      email: Joi.string().required().email(),
      address: Joi.string().required(),
      state: Joi.string().required(),
      district: Joi.string().required(),
      pincode: Joi.string().required().min(6).max(6),
      mobile: Joi.string().required().min(10).max(10),
      whatsapp: Joi.string().min(10).max(10).allow("", null).default(""),
      gst: Joi.string().min(15).max(15).allow("", null).default(""),
      pan: Joi.string().required().min(10).max(10),
      fssai: Joi.string().default(null),
      tan: Joi.string().default(null),
      constitution_of_firm: Joi.string().required(),
      password: Joi.string().required(),
    }).required(),
    bankData: Joi.array()
      .items(
        Joi.object({
          account_name: Joi.string().required(),
          account_number: Joi.number().required(),
          account_type: Joi.string().required(),
          bank_name: Joi.string().required(),
          branch: Joi.string().required(),
          ifsc: Joi.string().required(),
        })
      )
      .min(1)
      .required(),
    contactData: Joi.array()
      .items(
        Joi.object({
          full_name: Joi.string().required(),
          designation: Joi.string().required(),
          mobile: Joi.string().min(10).max(10),
          whatsapp: Joi.string().min(10).max(10).allow(null, "").default(""),
          email: Joi.string().required().email(),
        })
      )
      .min(1)
      .required(),
  }).required(),
}).required();

export const validateOTPReq = Joi.object({
  body: Joi.object({
    email: Joi.string().required(),
    otp: Joi.string().required().min(OTP_LENGTH).max(OTP_LENGTH),
  }).required(),
}).required();

export const sendOTPReq = Joi.object({
  body: Joi.object({
    email: Joi.string().required().email(),
  }).required(),
}).required();

export const loginReq = Joi.object({
  body: Joi.object({
    mobile: Joi.string().required().min(10).max(10),
    company_name: Joi.string().required(),
    password: Joi.string().required(),
  }).required(),
}).required();
