SELECT
  doc_no,
  doc_date,
  Ac_Code,
  billtoname AS PartyName,
  saleid,
  NETQNTL,
  Tran_Type,
  mill_code,
  millname AS MillName,
  Company_Code,
  Year_Code,
  Bill_Amount,
  Unit_Code,
  shiptoname AS UnitName,
  FROM_STATION,
  TO_STATION,
  LORRYNO,
  BROKER,
  brokername AS BrokerName,
  wearhouse,
  TaxableAmount,
  GstRateCode,
  TCS_Rate,
  freight,
  LESS_FRT_RATE,
  SUBTOTAL,
  TDS_Rate
FROM
  qrysalehead
WHERE
  IsDeleted <> 0
UNION
SELECT
  doc_no,
  doc_date,
  Ac_Code,
  Ac_Name_E AS PartyName,
  srid AS saleid,
  NETQNTL,
  Tran_Type,
  mill_code,
  millname AS MillName,
  Company_Code,
  Year_Code,
  Bill_Amount,
  Unit_Code,
  unitname AS UnitName,
  FROM_STATION,
  TO_STATION,
  LORRYNO,
  BROKER,
  brokername AS BrokerName,
  wearhouse,
  subTotal AS TaxableAmount,
  GstRateCode,
  TCS_Rate,
  freight,
  LESS_FRT_RATE,
  SUBTOTAL,
  0 AS TDS_Rate
FROM
  qrysugarsalereturnhead
UNION
SELECT
  doc_no,
  doc_date,
  Party_Code AS Ac_Code,
  partyname AS PartyName,
  Retailid AS saleid,
  Netkg / 100 AS NETQNTL,
  Tran_Type,
  MillCode AS mill_code,
  millname AS MillName,
  Company_Code,
  Year_Code,
  NetValue AS Bill_Amount,
  Party_Code AS Unit_Code,
  partyname AS UnitName,
  '' AS FROM_STATION,
  '' AS TO_STATION,
  Vahical_No AS LORRYNO,
  Broker_Code AS BROKER,
  brokername AS BrokerName,
  '' AS wearhouse,
  Taxable_Amount AS TaxableAmount,
  GST_Code AS GstRateCode,
  TCS_Rate,
  0 AS freight,
  0 AS LESS_FRT_RATE,
  Taxable_Amount AS SUBTOTAL,
  TDS_Rate
FROM
  qryRetailSale
WHERE
  Party_Code <> 1
  AND IsDelete <> 0;