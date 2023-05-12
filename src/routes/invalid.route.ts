import { Router, Request, Response, NextFunction } from "express";
import createError from "http-errors";

const router = Router();
router.all("*", (req: Request, res: Response, next: NextFunction) => {
  try {
    const message = `Invalid route '${
      req.originalUrl
    }' with '${req.method.toUpperCase()}' method`;
    throw createError.NotFound(message);
  } catch (err: Error | any) {
    next(err);
  }
});
export default router;
