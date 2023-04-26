import { DataTypes, Model } from "sequelize";
import mssql from "../../connections/mssql.connection";

const QRY_TENDER_DO_BALANCE_VIEW = "qrytenderdobalanceview";

export interface TenderBalanceViewInterface {
  despatch?: number;
  tender_detail_id?: number;
  tender_no?: number;
  tender_date?: Date;
  mill_short_name?: string;
  item_name?: string;
  payment_to_name?: string;
  tender_do_name?: string;
  season?: string;
  grade?: string;
  quantal?: number;
  lifting_date?: Date;
  lifting_date_converted?: string;
  purchase_rate?: number;
  mill_rate?: number;
  mc?: number;
  pt?: number;
  item_code?: number;
  ic?: number;
  tender_id: number;
  td?: number;
  mill_code?: number;
  tender_do?: number;
  payment_to?: number;
  balance?: number;
  buyer?: number;
  buyer_party?: number;
  buyer_quantal?: number;
  buyer_id?: number;
  buyer_party_id?: number;
  buyer_name?: string;
  buyer_party_name?: string;
  tender_date_converted?: string;
  sale_rate?: number;
  company_code?: number;
  year_code?: number;
  id?: number;
  city_name?: string;
  commision_rate?: number;
  delivery_type?: string;
  ship_to_name?: string;
  party_bill_rate?: number;
}

export const TenderBalanceView = mssql.define<
  Model<TenderBalanceViewInterface>
>(QRY_TENDER_DO_BALANCE_VIEW, {
  despatch: DataTypes.DECIMAL(38, 2),
  tender_detail_id: {
    type: DataTypes.INTEGER,
    field: "tenderdetailid",
  },
  tender_no: {
    type: DataTypes.INTEGER,
    field: "Tender_No",
  },
  tender_date: {
    type: DataTypes.DATEONLY,
    field: "Tender_Date",
  },
  mill_short_name: {
    type: DataTypes.STRING(50),
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
  season: {
    type: DataTypes.STRING(20),
    field: "season",
  },
  grade: {
    type: DataTypes.STRING(50),
    field: "Grade",
  },
  quantal: {
    type: DataTypes.DECIMAL(38, 2),
    field: "Quantal",
  },
  lifting_date: {
    type: DataTypes.DATEONLY,
    field: "Lifting_Date",
  },
  lifting_date_converted: {
    type: DataTypes.STRING(10),
    field: "Lifting_DateConverted",
  },
  purchase_rate: {
    type: DataTypes.DECIMAL(18, 2),
    field: "Purc_Rate",
  },
  mill_rate: {
    type: DataTypes.DECIMAL(18, 2),
    field: "Mill_Rate",
  },
  mc: {
    type: DataTypes.INTEGER,
    field: "mc",
  },
  pt: {
    type: DataTypes.INTEGER,
    field: "pt",
  },
  item_code: {
    type: DataTypes.INTEGER,
    field: "itemcode",
  },
  ic: {
    type: DataTypes.INTEGER,
    field: "ic",
  },
  tender_id: {
    type: DataTypes.INTEGER,
    field: "tenderid",
  },
  td: {
    type: DataTypes.INTEGER,
    field: "td",
  },
  mill_code: {
    type: DataTypes.INTEGER,
    field: "Mill_Code",
  },
  tender_do: {
    type: DataTypes.INTEGER,
    field: "Tender_DO",
  },
  payment_to: {
    type: DataTypes.INTEGER,
    field: "Payment_To",
  },
  balance: {
    type: DataTypes.DECIMAL(38, 2),
    field: "BALANCE",
  },
  buyer: {
    type: DataTypes.INTEGER,
    field: "Buyer",
  },
  buyer_party: {
    type: DataTypes.INTEGER,
    field: "Buyer_Party",
  },
  buyer_quantal: {
    type: DataTypes.DECIMAL(38, 2),
    field: "Buyer_Quantal",
  },
  buyer_id: {
    type: DataTypes.INTEGER,
    field: "buyerid",
  },
  buyer_party_id: {
    type: DataTypes.INTEGER,
    field: "buyerpartyid",
  },
  buyer_name: {
    type: DataTypes.STRING(255),
    field: "buyername",
  },
  buyer_party_name: {
    type: DataTypes.STRING(255),
    field: "buyerpartyname",
  },
  tender_date_converted: {
    type: DataTypes.STRING(10),
    field: "Tender_DateConverted",
  },
  sale_rate: {
    type: DataTypes.DECIMAL(38, 2),
    field: "Sale_Rate",
  },
  company_code: {
    type: DataTypes.INTEGER,
    field: "Company_Code",
  },
  year_code: {
    type: DataTypes.INTEGER,
    field: "Year_Code",
  },
  id: {
    type: DataTypes.INTEGER,
    field: "ID",
    primaryKey: true,
  },
  city_name: {
    type: DataTypes.STRING(50),
    field: "cityname",
  },
  commision_rate: {
    type: DataTypes.DECIMAL(18, 2),
    field: "Commission_Rate",
  },
  delivery_type: {
    type: DataTypes.STRING(10),
    field: "Delivery_Type",
  },
  ship_to_name: {
    type: DataTypes.STRING(255),
    field: "shiptoname",
  },
  party_bill_rate: {
    type: DataTypes.DECIMAL(18, 2),
    field: "Party_Bill_Rate",
  },
});
