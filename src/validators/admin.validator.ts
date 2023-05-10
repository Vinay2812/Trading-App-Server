import Joi from "joi";

export const adminLoginReq = Joi.object({
  body: Joi.object({
    username: Joi.string().required(),
    password: Joi.string().required(),
  }).required(),
}).required();

export const updateAuthorizationReq = Joi.object({
  body: Joi.object({
    authorized: Joi.required().valid(0, 1),
  }).required(),
  params: Joi.object({
    userId: Joi.required(),
  }).required(),
}).required();

export const addUserReq = Joi.object({
  body: Joi.object({
    userId: Joi.required(),
  }).required(),
}).required();

export const mapClientReq = Joi.object({
  body: Joi.object({
    userId: Joi.required(),
    accoid: Joi.required(),
  }).required(),
}).required();

export const postPublishListReq = Joi.object({
  body: Joi.object({
    tender_no: Joi.number().required(),
    tender_date: Joi.date().required(),
    season: Joi.string().required(),
    grade: Joi.string().required(),
    quantal: Joi.number().required(),
    lifting_date: Joi.date().required(),
    purchase_rate: Joi.number().required(),
    mill_rate: Joi.number().required(),
    mc: Joi.number().required(),
    pt: Joi.number().required(),
    item_code: Joi.number().required(),
    ic: Joi.number().required(),
    tender_id: Joi.number().required(),
    td: Joi.number().required(),
    unit: Joi.string()
      .valid(...["Q", "M", "L"])
      .required(),
    sale_rate: Joi.number().required(),
    publish_quantal: Joi.number().required(),
    multiple_of: Joi.number().required(),
    auto_confirm: Joi.string().valid(...["Y", "N"]).required(),
    tender_do: Joi.number().required(),
    type: Joi.string().valid(...["F", "P"]).required(),
    mill_code: Joi.number().required(),
    payment_to: Joi.number().required(),
  }).required(),
}).required();

export const updateSingleTradeReq = Joi.object({
  body: Joi.object({
    tender_id: Joi.required(),
    status: Joi.string().required().valid("Y", "N"),
  }).required(),
}).required();

export const updateAllTradeReq = Joi.object({
  body: Joi.object({
    status: Joi.string().required().valid("Y", "N"),
  }).required(),
}).required();

export const updateSingleSaleRateReq = Joi.object({
  body: Joi.object({
    tender_id: Joi.required(),
    sale_rate: Joi.number().required(),
  }).required(),
}).required();

export const updateAllSaleRateReq = Joi.object({
  body: Joi.object({
    sale_rate: Joi.number().required(),
  }).required(),
}).required();

export const modifySingleTradeReq = Joi.object({
  body: Joi.object({
    tender_id: Joi.required(),
    published_qty: Joi.number().required(),
    sale_rate: Joi.number().required(),
  }).required(),
}).required();
