import { Redis } from "ioredis";
import { REDIS_URL } from "../utils/config";
import logger from "../utils/logger";

const RedisClient = new Redis(REDIS_URL);

RedisClient.on("connect", () => {
  logger.info(`🚀 [redis]: running on ${REDIS_URL}`);
});

RedisClient.on("error", (err) => {
  logger.error(`❌ [redis]: unable to connect ${REDIS_URL}`);
  console.log(err);
});

export default RedisClient;
