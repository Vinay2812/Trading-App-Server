import express from "express";
import cors from "cors";
import bodyParser from "body-parser";
import helmet from "helmet";
import morgan from "morgan";

// connections


// routes
import AuthRoute from "./routes/auth.route";
import AdminRoute from "./routes/admin.route";
import UserRoute from "./routes/user.route";
import ErrorRoute from "./routes/error.route";
import InvalidRoute from "./routes/invalid.route";

// utils
import { SERVER_PORT, SERVER_URL } from "./utils/config";
import logger from "./utils/logger";
import syncMssql from "./utils/sync";

// middlewares
import { ApiResponse } from "./middlewares/response.middleware";

const app = express();
const port = SERVER_PORT;

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
app.post(
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
app.use("/error", ErrorRoute);

// handle invalid routes
app.use(InvalidRoute);

// response middleware
app.use(ApiResponse);

function startServer() {
  logger.info(`🚀 [server]: running on ${SERVER_URL}:${port}`);
  require("./connections/index");
  syncMssql();
}
app.listen(port, () => {
  startServer();
});
