import { Sequelize } from "sequelize";
import {
  DATABASE,
  DB_PASSWORD,
  DB_SERVER,
  DB_USER,
} from "../utils/config";
import logger from "../utils/logger";

const mssql = new Sequelize(DATABASE, DB_USER, DB_PASSWORD, {
  host: DB_SERVER,
  benchmark: true,
  logging: (msg, timing) => logger.warn(`Executed query - ${msg} in ${timing} ms`),
  dialect: "mssql",
  define: {
    timestamps: false,
    freezeTableName: true,
  },
});

mssql
    .authenticate({ logging: false})
    .then(() => {
      logger.info(`🚀 [mssql]: connected to ${DB_SERVER}/${DATABASE}`);
    })
    .catch((err) => {
      logger.error(`❌ [mssql]: unable to connect to ${DB_SERVER}/${DATABASE}`)
      logger.error(err);
    });


export default mssql;
