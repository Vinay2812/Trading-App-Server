import mssql from "../../connections/mssql.connection";
import { DataTypes, Model } from "sequelize";

type AdminProfileStatus = "accepted" | "rejected" | "pending";

export interface AdminProfileInterface {
  admin_id: string;
  username: string;
  password: string;
  email: string;
  phone: string;
  address: string;
  status: AdminProfileStatus;
}

export const AdminProfile = mssql.define<Model<AdminProfileInterface>>(
  "admin_profiles",
  {
    admin_id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
      allowNull: false,
    },
    username: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    address: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    timestamps: false,
    freezeTableName: true,
    tableName: "admin_profiles",
  }
);
