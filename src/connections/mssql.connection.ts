import { Sequelize } from "sequelize";
import { DB_NAME, DB_PASSWORD, DB_SERVER, DB_USER } from "../utils/constants";
import logger from "../utils/logger";

const mssql = new Sequelize(DB_NAME, DB_USER, DB_PASSWORD, {
  host: DB_SERVER,
  benchmark: true,
  logging: (msg, timing) =>
    logger.warn(`Executed query - ${msg} in ${timing} ms`),
  dialect: "mssql",
  define: {
    timestamps: false,
    freezeTableName: true,
  },
});

mssql
  .authenticate({ logging: false })
  .then(() => {
    logger.info(`🚀 [mssql]: connected to ${DB_SERVER}/${DB_NAME}`);
  })
  .catch((err: Error | any) => {
    logger.error(`❌ [mssql]: unable to connect to ${DB_SERVER}/${DB_NAME}`);
    logger.error(err);
  });

export default mssql;
