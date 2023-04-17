import logger from "../utils/logger";
import io from "../connections/socket.connection";

let socket_to_user_map = new Map();
let user_to_socket_map = new Map();

io.on("connect", (socket) => {
  let count = socket_to_user_map.size;
  logger.info(`${count} user(s) connected to socket`);
  console.log(socket_to_user_map, user_to_socket_map);
  socket.on("add_user", (userId) => {
    if (user_to_socket_map.has(userId)) {
      socket_to_user_map.delete(user_to_socket_map.get(userId));
    }
    socket_to_user_map.set(socket.id, userId);
    user_to_socket_map.set(userId, socket.id);
  });
});

export { socket_to_user_map, user_to_socket_map };
