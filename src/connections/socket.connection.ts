import { Server } from "socket.io";
import { server } from "./server.connection";
import logger from "../utils/logger";
// import RedisClient from "./redis.connection";

const io = new Server(server, {
  cors: {
    origin: "*",
  },
});

// const userToSocket = new Map<string, string[]>();

io.on("connection", async (socket) => {
  const userId = socket.handshake.headers.user_id as string | undefined;
  if (!userId) return;
  logger.info(`[socket]: ${userId} joined to socket`);

  // if (userToSocket.has(userId)) {
  //   await Promise.all(
  //     userToSocket.get(userId)!.map(async (sId) => {
  //       return RedisClient.del(sId);
  //     })
  //   );
  // }
  // userToSocket.set(userId, [socket.id, ...(userToSocket.get(userId) ?? [])]);

  // RedisClient.set(userId, socket.id);
  // RedisClient.set(socket.id, userId);

  await socket.join(userId);
  socket.on("disconnect", () => {
    console.log("user disconnected", socket.id);
  });
});

export default io;
