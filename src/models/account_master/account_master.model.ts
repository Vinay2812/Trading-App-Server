import { DataTypes, Model } from "sequelize";
import mssql from "../../connections/mssql.connection";

const NT_1_ACCOUNTMASTER = "nt_1_accountmaster";

export interface AccountMasterInterface {
  ac_code?: number;
  ac_name_e?: string;
  ac_name_r?: string;
  ac_type?: string;
  ac_rate?: number;
  address_e?: string;
  address_r?: string;
  city_code?: number;
  pincode?: string;
  local_lic_no?: string;
  tin_no?: string;
  cst_no?: string;
  gst_no?: string;
  email_id?: string;
  email_id_cc?: string;
  other_narration?: string;
  ecc_no?: string;
  bank_name?: string;
  bank_ac_no?: string;
  bank_opening?: number;
  bank_op_drcr?: string;
  opening_balance?: number;
  drcr?: string;
  group_code?: number;
  created_by?: string;
  modified_by?: string;
  short_name?: string;
  commission?: number;
  corporate_party?: string;
  refer_by?: string;
  offphone?: string;
  fax?: string;
  company_pan?: string;
  ac_pan?: string;
  mobile_no?: string;
  is_login?: string;
  ifsc?: string;
  fssai?: string;
  branch1ob?: number;
  branch2ob?: number;
  branch1drcr?: string;
  branch2drcr?: string;
  locked?: boolean;
  gststatecode?: number;
  unregistergst?: boolean;
  distance?: number;
  bal_limit?: number;
  accoid: number;
  bsid?: number;
  cityid?: number;
  whatsapp_no?: string;
  company_code?: number;
  adhar_no?: string;
  limit_by?: string;
  tan_no?: string;
  tdsapplicable?: string;
  panlink?: string;
  insurance?: number;
  msoms?: string;
  userId?: string;
}

export const AccountMaster = mssql.define<Model<AccountMasterInterface>>(
  NT_1_ACCOUNTMASTER,
  {
    ac_code: { type: DataTypes.INTEGER, field: "Ac_Code" },
    ac_name_e: { type: DataTypes.STRING(255), field: "Ac_Name_E" },
    ac_name_r: { type: DataTypes.STRING(255), field: "Ac_Name_R" },
    ac_type: { type: DataTypes.STRING(5), field: "Ac_type" },
    ac_rate: { type: DataTypes.DECIMAL(18, 2), field: "Ac_rate" },
    address_e: { type: DataTypes.STRING(255), field: "Address_E" },
    address_r: { type: DataTypes.STRING(255), field: "Address_R" },
    city_code: { type: DataTypes.INTEGER, field: "City_Code" },
    pincode: { type: DataTypes.STRING(10), field: "Pincode" },
    local_lic_no: { type: DataTypes.STRING(255), field: "Local_Lic_No" },
    tin_no: { type: DataTypes.STRING(255), field: "Tin_No" },
    cst_no: { type: DataTypes.STRING(255), field: "Cst_no" },
    gst_no: { type: DataTypes.STRING(255), field: "Gst_No" },
    email_id: { type: DataTypes.STRING(255), field: "Email_Id" },
    email_id_cc: { type: DataTypes.STRING(255), field: "Email_Id_cc" },
    other_narration: { type: DataTypes.STRING(1000), field: "Other_Narration" },
    ecc_no: { type: DataTypes.STRING(255), field: "ECC_No" },
    bank_name: { type: DataTypes.STRING(255), field: "Bank_Name" },
    bank_ac_no: { type: DataTypes.STRING(255), field: "Bank_Ac_No" },
    bank_opening: { type: DataTypes.DECIMAL(18, 2), field: "Bank_Opening" },
    bank_op_drcr: { type: DataTypes.CHAR(1), field: "bank_Op_Drcr" },
    opening_balance: {
      type: DataTypes.DECIMAL(18, 2),
      field: "Opening_Balance",
    },
    drcr: { type: DataTypes.CHAR(1), field: "Drcr" },
    group_code: { type: DataTypes.INTEGER, field: "Group_Code" },
    created_by: { type: DataTypes.STRING(255), field: "Created_By" },
    modified_by: { type: DataTypes.STRING(255), field: "Modified_By" },
    short_name: { type: DataTypes.STRING(50), field: "Short_Name" },
    commission: { type: DataTypes.DECIMAL(18, 2), field: "Commission" },
    corporate_party: { type: DataTypes.STRING(1), field: "carporate_party" },
    refer_by: { type: DataTypes.STRING(100), field: "referBy" },
    offphone: { type: DataTypes.STRING(500), field: "OffPhone" },
    fax: { type: DataTypes.STRING(500), field: "Fax" },
    company_pan: { type: DataTypes.STRING(500), field: "CompanyPan" },
    ac_pan: { type: DataTypes.STRING, field: "AC_Pan" },
    mobile_no: { type: DataTypes.STRING(50), field: "Mobile_No" },
    is_login: { type: DataTypes.STRING(1), field: "Is_Login" },
    ifsc: { type: DataTypes.STRING(50), field: "IFSC" },
    fssai: { type: DataTypes.STRING(50), field: "FSSAI" },
    branch1ob: { type: DataTypes.DECIMAL(18, 2), field: "Branch1OB" },
    branch2ob: { type: DataTypes.DECIMAL(18, 2), field: "Branch2OB" },
    branch1drcr: { type: DataTypes.CHAR(1), field: "Branch1Drcr" },
    branch2drcr: { type: DataTypes.CHAR(1), field: "Branch2Drcr" },
    locked: { type: DataTypes.BOOLEAN, field: "Locked" },
    gststatecode: { type: DataTypes.INTEGER, field: "GSTStateCode" },
    unregistergst: { type: DataTypes.BOOLEAN, field: "UnregisterGST" },
    distance: { type: DataTypes.DECIMAL(18, 2), field: "Distance" },
    bal_limit: { type: DataTypes.DECIMAL(18, 2), field: "Bal_Limit" },
    accoid: {
      type: DataTypes.INTEGER,
      field: "accoid",
      primaryKey: true,
      autoIncrement: true,
    },
    bsid: { type: DataTypes.INTEGER, field: "bsid" },
    cityid: { type: DataTypes.INTEGER, field: "cityid" },
    whatsapp_no: { type: DataTypes.STRING(45), field: "whatsup_no" },
    company_code: { type: DataTypes.INTEGER, field: "company_code" },
    adhar_no: { type: DataTypes.STRING(20), field: "adhar_No" },
    limit_by: { type: DataTypes.STRING(2), field: "Limit_By" },
    tan_no: { type: DataTypes.STRING(100), field: "Tan_no" },
    tdsapplicable: { type: DataTypes.CHAR(1), field: "TDSApplicable" },
    panlink: { type: DataTypes.TEXT, field: "PanLink" },
    insurance: { type: DataTypes.DECIMAL(18, 2), field: "Insurance" },
    msoms: { type: DataTypes.CHAR(1), field: "MsOms" },
    userId: { type: DataTypes.STRING(100), field: "userId" },
  }
);
