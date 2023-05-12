import express from "express";
import { SERVER_PORT, SERVER_URL } from "../utils/config";
import logger from "../utils/logger";

export const app = express();
const port = SERVER_PORT;

export const server = app.listen(port, () => {
  logger.info(`🚀 [server]: running on ${SERVER_URL}:${port}`);
});
