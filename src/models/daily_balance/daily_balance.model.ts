import { DataTypes, Model } from "sequelize";
import mssql from "../../connections/mssql.connection";

const QRY_TR_DAILY_BALANCE = "qrytrdailybalance";

export interface DailyBalanceInterface {
  tender_no: number;
  tender_id: number;
  tender_date: Date;
  mill_short_name: string;
  item_name: string;
  payment_to_name: string;
  tender_do_name: string;
  season: string;
  grade: string;
  unit: string;
  quantity: number;
  lifting_date: Date;
  purchase_rate: number;
  mill_rate: number;
  sale_rate: number;
  published_qty: number;
  sold: number;
  balance: number;
  auto_id: number;
  publish_date?: Date;
  mill_code?: number;
  mc?: number;
  payment_to?: number;
  item_code?: number;
  it?: number;
  pt?: number;
  do_ac?: number;
  do_id?: number;
  selling_type?: string;
  multiple_of?: number;
  auto_confirm?: string;
  status?: string;
}

export const DailyBalance = mssql.define<Model<DailyBalanceInterface>>(
  QRY_TR_DAILY_BALANCE,
  {
    tender_no: {
      type: DataTypes.INTEGER,
      field: "tender_no",
    },
    tender_id: {
      type: DataTypes.INTEGER,
      field: "tenderid",
    },
    tender_date: {
      type: DataTypes.DATEONLY,
      field: "tender_date",
    },
    published_qty: {
      type: DataTypes.NUMBER,
      field: "published_qty",
    },
    publish_date: {
      type: DataTypes.DATEONLY,
      field: "publish_date",
    },
    lifting_date: {
      type: DataTypes.DATEONLY,
      field: "lifting_date",
    },
    mill_code: {
      type: DataTypes.NUMBER,
      field: "mill_code",
    },
    mc: {
      type: DataTypes.NUMBER,
      field: "mc",
    },
    payment_to: {
      type: DataTypes.NUMBER,
      field: "payment_to",
    },
    item_code: {
      type: DataTypes.NUMBER,
      field: "item_code",
    },
    it: {
      type: DataTypes.NUMBER,
      field: "it",
    },
    pt: {
      type: DataTypes.NUMBER,
      field: "pt",
    },
    do_ac: {
      type: DataTypes.NUMBER,
      field: "doac",
    },
    do_id: {
      type: DataTypes.NUMBER,
      field: "doid",
    },
    season: {
      type: DataTypes.STRING(50),
      field: "season",
    },
    grade: {
      type: DataTypes.STRING(50),
      field: "grade",
    },
    unit: {
      type: DataTypes.CHAR(1),
      field: "unit",
    },
    quantity: {
      type: DataTypes.DECIMAL(18, 2),
      field: "qty",
    },
    mill_rate: {
      type: DataTypes.DECIMAL(18, 2),
      field: "mill_rate",
    },
    sale_rate: {
      type: DataTypes.DECIMAL(18, 2),
      field: "sale_rate",
    },
    purchase_rate: {
      type: DataTypes.DECIMAL(18, 2),
      field: "purc_rate",
    },
    selling_type: {
      type: DataTypes.CHAR(1),
      field: "selling_type",
    },
    multiple_of: {
      type: DataTypes.INTEGER,
      field: "multipal_of",
    },
    auto_confirm: {
      type: DataTypes.CHAR(1),
      field: "auto_confirm",
    },
    status: {
      type: DataTypes.CHAR(1),
      field: "status",
    },
    auto_id: {
      type: DataTypes.INTEGER,
      field: "autoid",
      primaryKey: true,
    },
    mill_short_name: {
      type: DataTypes.STRING(255),
      field: "millshortname",
    },
    item_name: {
      type: DataTypes.STRING(50),
      field: "itemname",
    },
    payment_to_name: {
      type: DataTypes.STRING(50),
      field: "paymenttoshortname",
    },
    tender_do_name: {
      type: DataTypes.STRING(50),
      field: "tenderdoshortname",
    },
    sold: {
      type: DataTypes.DECIMAL(38, 2),
      field: "sold",
    },
    balance: {
      type: DataTypes.DECIMAL(38, 2),
      field: "balance",
    },
  }
);
