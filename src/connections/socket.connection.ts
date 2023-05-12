import { Server } from "socket.io";
import { server } from "./server.connection";
import logger from "../utils/logger";

const io = new Server(server, {
  cors: {
    origin: "*",
  },
});

io.on("connection", (socket) => {
  logger.info(`[socket]: ${socket.id} user connected`);

  socket.on("disconnect", () => {
    console.log("user disconnected", socket.id);
  });
});

export default io;