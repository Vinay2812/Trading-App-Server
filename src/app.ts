// connections (sequence imp)
import "./connections/socket.connection";
import { app } from "./connections/server.connection";
import "./connections/prisma.connection";
import "./connections/redis.connection";

import express from "express";
import cors from "cors";
import bodyParser from "body-parser";
import helmet from "helmet";
import morgan from "morgan";

// routes
import AuthRoute from "./routes/auth.route";
import AdminRoute from "./routes/admin.route";
import UserRoute from "./routes/user.route";
import ErrorRoute from "./routes/error.route";
import InvalidRoute from "./routes/invalid.route";
import TodoRoute from "./routes/todo.route";

// utils

// middlewares
import { ApiResponse } from "./middlewares/response.middleware";

// middlewares
app.use(
  cors({
    origin: "*",
  })
);
app.use(bodyParser.json());
app.use(helmet());
app.use(morgan(":status :method :url :response-time ms"));

// routes
// check connection
app.get(
  "/",
  async (
    req: express.Request,
    res: express.Response,
    next: express.NextFunction
  ) => {
    next({ message: "Connection established" });
  }
);
// handle valid routes
app.use("/admin", AdminRoute);
app.use("/auth", AuthRoute);
app.use("/user", UserRoute);
app.use("/todos", TodoRoute);
app.use("/error", ErrorRoute);

// handle invalid routes
app.use(InvalidRoute);

// response middleware
app.use(ApiResponse);
