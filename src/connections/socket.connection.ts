import { SOCKET_PORT, SERVER_URL } from "../utils/config";
import logger from "../utils/logger";
import { createServer } from "http";
import { Server } from "socket.io";

const httpServer = createServer();
const io = new Server(httpServer, {
  cors: "*" as any,
});

httpServer.listen(SOCKET_PORT, () =>
  logger.info(`🚀 [socket]: running on ${SERVER_URL}:${SOCKET_PORT}`)
);

export default io;
