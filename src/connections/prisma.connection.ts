import { PrismaClient } from "@prisma/client";
import logger from "../utils/logger";
import { DATABASE_URL } from "../utils/constants";

const prisma = new PrismaClient();

prisma.$queryRaw`SELECT 1`.then(() => {
  logger.info(`🚀[prisma]: prisma connected to ${DATABASE_URL}`);
});

prisma.$on("beforeExit", () => {
  logger.info("[prisma]: Disconnecting from prisma");
});

export default prisma;
