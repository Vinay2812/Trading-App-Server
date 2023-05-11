import * as Joi from "@hapi/joi";
import "joi-extract-type";

export const updatePasswordReq = Joi.object({
  body: Joi.object({
    userId: Joi.string().required(),
    password: Joi.string().required().min(5),
  }).required(),
}).required();

export const getUserReq = Joi.object({
  query: Joi.object({
    mobile: Joi.string().required().min(10).max(10),
    company_name: Joi.string().required(),
  }).required(),
}).required();

export const getOnlineUserCompaniesReq = Joi.object({
  params: Joi.object({
    mobile: Joi.string().required().min(10).max(10),
  }),
}).required();

export const getUserByIdReq = Joi.object({
  params: Joi.object({
    userId: Joi.string().required(),
  }),
}).required();

export const getUserFromAccountMasterReq = Joi.object({
  params: Joi.object({
    accoid: Joi.string().required(),
  }),
}).required();
