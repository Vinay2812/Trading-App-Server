import { Redis } from "ioredis";
import { REDIS_URL } from "../utils/constants";
import logger from "../utils/logger";

const RedisClient = new Redis(REDIS_URL);

RedisClient.on("connect", () => {
  logger.info(`🚀 [redis]: running on ${REDIS_URL}`);
});

RedisClient.on("error", (err: Error | any) => {
  logger.error(`❌ [redis]: unable to connect ${REDIS_URL}`);
  console.log(err);
});

export default RedisClient;
