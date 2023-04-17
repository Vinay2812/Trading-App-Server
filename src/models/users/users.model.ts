import mssql from "../../connections/mssql.connection";
import { DataTypes } from "sequelize";

const ONLINE_USER_DETAILS = "onlineUserDetails";
const USER_BANK_DETAILS = "userBankDetails";
const USER_CONTACT_DETAILS = "userContactDetails";

export const UserOnlineDetails = mssql.define(ONLINE_USER_DETAILS, {
  userId: {
    type: DataTypes.STRING(100),
    allowNull: false,
    primaryKey: true,
  },
  company_name: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING(100),
    allowNull: true,
  },
  address: {
    type: DataTypes.STRING(250),
    allowNull: false,
  },
  state: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  district: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  pincode: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  mobile: {
    type: DataTypes.STRING(10),
    allowNull: false,
  },
  whatsapp: {
    type: DataTypes.STRING(10),
    allowNull: true,
  },
  gst: {
    type: DataTypes.STRING(15),
    allowNull: true,
  },
  pan: {
    type: DataTypes.STRING(10),
    allowNull: false,
  },
  fssai: {
    type: DataTypes.STRING(15),
    allowNull: true,
  },
  tan: {
    type: DataTypes.STRING(10),
    allowNull: true,
  },
  constitution_of_firm: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  authorized: {
    type: DataTypes.STRING(1),
  },
  accoid: {
    type: DataTypes.INTEGER,
  },
});

export const UserBankDetails = mssql.define(USER_BANK_DETAILS, {
  _id: {
    type: DataTypes.UUID,
    primaryKey: true,
    defaultValue: DataTypes.UUIDV4,
  },
  userId: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  bank_name: DataTypes.STRING(100),
  account_name: DataTypes.STRING(100),
  account_number: DataTypes.INTEGER,
  ifsc: DataTypes.STRING(20),
  branch: DataTypes.STRING(100),
  account_type: DataTypes.STRING(50),
});

export const UserContactDetails = mssql.define(USER_CONTACT_DETAILS, {
  _id: {
    type: DataTypes.UUID,
    primaryKey: true,
    defaultValue: DataTypes.UUIDV4,
  },
  userId: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  full_name: DataTypes.STRING(50),
  designation: DataTypes.STRING(50),
  mobile: DataTypes.STRING(15),
  whatsapp: DataTypes.STRING(15),
  email: DataTypes.STRING(100),
});
