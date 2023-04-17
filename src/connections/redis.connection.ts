import { createClient } from "redis";
import { REDIS_URL } from "../utils/config";
import logger from "../utils/logger";

const RedisClient = createClient({
  url: REDIS_URL,
});

async function connectRedis() {
  return RedisClient.connect()
    .then(() => {
      logger.info(`🚀 [redis]: running on ${REDIS_URL}`);
      return true;
    })
    .catch((err) => {
      logger.error(`❌ [redis]: unable to connect ${REDIS_URL}`);
      const timer = setTimeout(() => {
        if (connectRedis()) {
          clearTimeout(timer);
          return true;
        }
        return false;
      }, 5000);
    });
}

(async () => connectRedis())();

export default RedisClient;
