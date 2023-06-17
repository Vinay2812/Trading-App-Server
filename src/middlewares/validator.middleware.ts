import { NextFunction, Response, Request } from "express";
import logger from "../utils/logger";
import { AnyZodObject } from "zod";

export const validate =
  (schema: AnyZodObject) =>
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data: object = {
        query: req.query,
        body: req.body,
        params: req.params,
        headers: req.headers,
      };
      logger.debug(data);
      const res = await schema.parseAsync(data);
      req.query = res.query;
      req.body = res.body;
      req.params = res.params;
      req.headers = res.headers;
      return next();
    } catch (err: Error | any) {
      err.status = 422;
      next(err);
    }
  };
