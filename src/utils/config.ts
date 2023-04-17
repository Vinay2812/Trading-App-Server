import { config } from "dotenv";
config();

// general
const NODE_ENV: string = process.env.NODE_ENV || "development";
const SERVER_PORT: number = parseInt(process.env.SERVER_PORT || "8800");
const SERVER_URL: string = process.env.SERVER_URL || "http://localhost";

// redis
const REDIS_URL: string = process.env.REDIS_URL || "redis://localhost:6379";
const REDIS_PASSWORD: string = process.env.REDIS_PASSWORD || "";
const REDIS_PORT: number = parseInt(process.env.REDIS_PORT) || 6379;

// mssql/sequelize
const DB_SERVER: string = process.env.DB_SERVER || "localhost";
const DB_USER: string = process.env.DB_USER || "sa";
const DB_PASSWORD: string = process.env.DB_PASSWORD || "";
const DATABASE: string = process.env.DATABASE || "test";

// admin login
const ADMIN_USERNAME: string = process.env.ADMIN_USERNAME || "admin";
const ADMIN_PASSWORD: string = process.env.ADMIN_PASSWORD || "1234";

// mail
const MAIL_EMAIL: string = process.env.MAIL_EMAIL || "";
const MAIL_PASSWORD: string = process.env.MAIL_PASSWORD || "";

// otp
const OTP_LENGTH: number = parseInt(process.env.OTP_LENGTH) || 6;
const OTP_VALID_INTERVAL: number = 5 * 60 * 1000;

// id
const UNIQUE_ID_LENGTH: number = parseInt(process.env.UNIQUE_ID_LENGTH) || 15;

// socket
const SOCKET_PORT: number = parseInt(process.env.SOCKET_PORT) || 5001;

export {
  DATABASE,
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
  SOCKET_PORT,
  NODE_ENV,
  OTP_VALID_INTERVAL,
  SERVER_URL,
  REDIS_URL,
  REDIS_PASSWORD,
  REDIS_PORT,
};
