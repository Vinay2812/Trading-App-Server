import * as Joi from "@hapi/joi";
import createError from "http-errors";
import { NextFunction, Response, Request } from "express";
import logger from "../utils/logger";

export const validateRequest =
  (validator: Joi.AnySchema) =>
  (req: Request, res: Response, next: NextFunction) => {
    try {
      const data: object = {
        query: req.query,
        body: req.body,
        params: req.params,
        headers: req.headers,
      };
      type SchemaType = Joi.extractType<typeof validator>;
      logger.debug(data);
      const { error, value }: Joi.ValidationResult<SchemaType> =
        validator.validate(data, {
          allowUnknown: true,
          abortEarly: false,
        });

      if (error) {
        throw createError.UnprocessableEntity(error.details as any);
      }
      req.body = value.body;
      req.params = value.params;
      req.params = value.params;
      req.header = value.header;
      next();
    } catch (err) {
      next(err);
    }
  };
