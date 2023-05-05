import RedisClient from "../connections/redis.connection";
import logger from "./logger";

export async function setCache(key: any, value: any, time_in_seconds: number) {
  try {
    const keyString: string = JSON.stringify(key);
    RedisClient.setEx(keyString, time_in_seconds, JSON.stringify(value));
  } catch (err) {
    logger.error(err);
  }
}

export async function getCache(key: any) {
  try {
    const keyString: string = JSON.stringify(key);
    let cache = await RedisClient.get(keyString);
    if (!cache) return null;
    cache = JSON.parse(cache);
    return cache;
  } catch (err) {
    logger.error(err);
    return null;
  }
}

export async function deleteCache(key: any) {
  try {
    const keyString: string = JSON.stringify(key);
    RedisClient.del(keyString);
  } catch (err) {
    logger.error(err);
  }
}

export function getOtpCacheKey(email: string) {
  return `otp/${email}`;
}
