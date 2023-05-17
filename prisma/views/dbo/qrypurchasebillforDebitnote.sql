SELECT
  dbo.nt_1_sugarpurchase.doc_no,
  CONVERT(
    varchar(10),
    dbo.nt_1_sugarpurchase.doc_date,
    103
  ) AS docdate,
  dbo.nt_1_sugarpurchase.Ac_Code,
  dbo.nt_1_sugarpurchase.Bill_No,
  dbo.nt_1_sugarpurchase.purchaseid,
  dbo.nt_1_sugarpurchase.TCS_Net_Payable,
  dbo.nt_1_sugarpurchase.Company_Code,
  dbo.nt_1_sugarpurchase.Year_Code,
  nt_1_accountmaster_1.Ac_Name_E,
  dbo.nt_1_sugarpurchase.Tran_Type,
  0 AS ShipTo,
  '' AS ShipToName,
  0 AS uc,
  dbo.nt_1_sugarpurchase.mill_code,
  millcode.Ac_Name_E AS MillName,
  dbo.nt_1_sugarpurchase.mc,
  dbo.nt_1_sugarpurchase.NETQNTL AS Qty
FROM
  dbo.nt_1_sugarpurchase
  LEFT JOIN dbo.nt_1_accountmaster AS millcode ON dbo.nt_1_sugarpurchase.mc = millcode.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.nt_1_sugarpurchase.ac = nt_1_accountmaster_1.accoid
UNION
SELECT
  dbo.Retail_HeadPurchase.Doc_No,
  CONVERT(
    varchar(10),
    dbo.Retail_HeadPurchase.Doc_Date,
    103
  ) AS docdate,
  dbo.Retail_HeadPurchase.Party_Code,
  dbo.Retail_HeadPurchase.Challan_No,
  dbo.Retail_HeadPurchase.Retailid,
  dbo.Retail_HeadPurchase.NetPayble,
  dbo.Retail_HeadPurchase.Company_Code,
  dbo.Retail_HeadPurchase.Year_Code,
  dbo.nt_1_accountmaster.Ac_Name_E,
  dbo.Retail_HeadPurchase.Tran_Type,
  0 AS ShipTo,
  '' AS ShipToName,
  0 AS uc,
  0 AS mill_code,
  '' AS MillName,
  0 AS mc,
  0 AS Qty
FROM
  dbo.Retail_HeadPurchase
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.Retail_HeadPurchase.pc = dbo.nt_1_accountmaster.accoid;