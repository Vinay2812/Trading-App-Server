import Joi, { Schema } from "joi";
import createError from "http-errors";
import { NextFunction, Response, Request } from "express";

export const validateRequest =
  (validator: Schema) => (req: Request, res: Response, next: NextFunction) => {
    try {
      const data: object = {
        query: req.query,
        body: req.body,
        params: req.params,
        headers: req.headers,
      };
      const { error, value }: Joi.ValidationResult = validator.validate(data, {
        allowUnknown: true,
        abortEarly: false,
      });

      if (error) {
        throw createError.UnprocessableEntity(error.details as any);
      }

      req.body = {
        ...value.query,
        ...value.body,
        ...value.params,
        ...value.headers,
      };
      next();
    } catch (err) {
      next(err);
    }
  };
