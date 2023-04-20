import mssql from "../../connections/mssql.connection";
import { DataTypes, Model } from "sequelize";

const ONLINE_USER_DETAILS = "onlineUserDetails";
const USER_BANK_DETAILS = "userBankDetails";
const USER_CONTACT_DETAILS = "userContactDetails";

export interface UserOnlineDetailsInterface {
  userId: string;
  company_name: string;
  email: string;
  password: string;
  address: string;
  state: string;
  district: string;
  pincode: number;
  mobile: string;
  whatsapp?: string;
  gst?: string;
  pan: string;
  fssai?: string;
  tan?: string;
  constitution_of_firm: string;
  authorized?: string;
  accoid?: number;
}

export interface UserBankDetailsInterface {
  _id?: string;
  userId: string;
  bank_name: string;
  account_name: string;
  account_number: number;
  ifsc: string;
  branch: string;
  account_type: string;
}

export interface UserContactDetailsInterface {
  _id?: string;
  userId: string;
  full_name: string;
  designation: string;
  mobile: string;
  whatsapp?: string;
  email: string;
}

export const UserOnlineDetails = mssql.define<
  Model<UserOnlineDetailsInterface>
>(ONLINE_USER_DETAILS, {
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
    allowNull: false,
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
  },
  gst: {
    type: DataTypes.STRING(15),
  },
  pan: {
    type: DataTypes.STRING(10),
    allowNull: false,
  },
  fssai: {
    type: DataTypes.STRING(15),
  },
  tan: {
    type: DataTypes.STRING(10),
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

export const UserBankDetails = mssql.define<
  Model<UserBankDetailsInterface>
>(USER_BANK_DETAILS, {
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

export const UserContactDetails = mssql.define<
  Model<UserContactDetailsInterface>
>(USER_CONTACT_DETAILS, {
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
