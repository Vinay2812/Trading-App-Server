import { DataTypes, Model } from "sequelize";
import mssql from "../../connections/mssql.connection";

const TR_DAILY_PUBLISH = "trDailyPublish";
export interface DailyPublishInterface {
  tender_no?: number;
  tender_id?: number;
  tender_date?: Date;
  publish_date?: Date;
  lifting_date?: Date;
  mill_code?: number;
  mc?: number;
  item_code?: number;
  it?: number;
  payment_to?: number;
  pt?: number;
  doac?: number;
  doid?: number;
  season?: string;
  grade?: string;
  unit?: string;
  qty?: number;
  mill_rate?: number;
  purc_rate?: number;
  sale_rate?: number;
  published_qty?: number;
  selling_type?: string;
  multiple_of?: number;
  auto_confirm?: string;
  status?: string;
  autoid: number;
}
export const DailyPublish = mssql.define<Model<DailyPublishInterface>>(TR_DAILY_PUBLISH, {
  tender_no: DataTypes.INTEGER,
  tender_id: { type: DataTypes.INTEGER, field: "tenderid" },
  tender_date: DataTypes.DATEONLY,
  publish_date: DataTypes.DATEONLY,
  lifting_date: DataTypes.DATEONLY,
  mill_code: DataTypes.INTEGER,
  mc: DataTypes.INTEGER,
  item_code: DataTypes.INTEGER,
  it: DataTypes.INTEGER,
  payment_to: DataTypes.INTEGER,
  pt: DataTypes.INTEGER,
  doac: DataTypes.INTEGER,
  doid: DataTypes.INTEGER,
  season: DataTypes.STRING(50),
  grade: DataTypes.STRING(50),
  unit: DataTypes.CHAR(1),
  qty: DataTypes.DECIMAL(18, 2),
  mill_rate: DataTypes.DECIMAL(18, 2),
  purc_rate: DataTypes.DECIMAL(18, 2),
  sale_rate: DataTypes.DECIMAL(18, 2),
  published_qty: DataTypes.DECIMAL(18, 2),
  selling_type: DataTypes.CHAR(1),
  multiple_of: {
    type: DataTypes.INTEGER,
    field: "multipal_of",
  },
  auto_confirm: DataTypes.CHAR(1),
  status: DataTypes.CHAR(1),
  autoid: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
});
