import { config } from "dotenv";
config();

// general
const NODE_ENV: string = process.env.NODE_ENV || "development";
const SERVER_PORT: number = parseInt(process.env.SERVER_PORT || "5000");
const SERVER_URL: string = process.env.SERVER_URL || "http://localhost";

// redis
const REDIS_URL: string = process.env.REDIS_URL || "redis://localhost:6379";

// mssql/sequelize
const DB_SERVER: string = process.env.DB_SERVER!;
const DB_USER: string = process.env.DB_USER!;
const DB_PASSWORD: string = process.env.DB_PASSWORD!;
const DB_NAME: string = process.env.DB_NAME!;

// admin login
const ADMIN_USERNAME: string = process.env.ADMIN_USERNAME!;
const ADMIN_PASSWORD: string = process.env.ADMIN_PASSWORD!;

// mail
const MAIL_EMAIL: string = process.env.MAIL_EMAIL;
const MAIL_PASSWORD: string = process.env.MAIL_PASSWORD!;

// otp
const OTP_LENGTH: number = parseInt(process.env.OTP_LENGTH) || 6;
const OTP_VALID_INTERVAL: number = 5 * 60 * 1000;

// id
const UNIQUE_ID_LENGTH: number = parseInt(process.env.UNIQUE_ID_LENGTH) || 15;

export {
  DB_NAME,
  DB_SERVER,
  DB_USER,
  DB_PASSWORD,
  SERVER_PORT,
  ADMIN_USERNAME,
  ADMIN_PASSWORD,
  MAIL_EMAIL,
  MAIL_PASSWORD,
  OTP_LENGTH,
  UNIQUE_ID_LENGTH,
  NODE_ENV,
  OTP_VALID_INTERVAL,
  SERVER_URL,
  REDIS_URL
};
