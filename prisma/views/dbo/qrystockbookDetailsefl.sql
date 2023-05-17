SELECT
  dbo.qryStockBookUnionself.Tran_Type,
  dbo.qryStockBookUnionself.doc_date,
  dbo.qryStockBookUnionself.Ac_Code,
  dbo.qryStockBookUnionself.item_code,
  dbo.qryStockBookUnionself.Quantal,
  dbo.qryStockBookUnionself.drcr,
  dbo.qryStockBookUnionself.Company_Code,
  dbo.qryStockBookUnionself.Year_Code,
  dbo.qryStockBookUnionself.itemvalue,
  nt_1_accountmaster_1.Ac_Name_E,
  dbo.qryItemMaster.System_Name_E,
  dbo.qryStockBookUnionself.Brand_Code,
  dbo.Brand_Master.Marka,
  dbo.qryStockBookUnionself.doc_no,
  dbo.qryStockBookUnionself.DoNO,
  nt_1_accountmaster_1.Short_Name AS partyShortname,
  dbo.nt_1_accountmaster.Short_Name AS MillShortName
FROM
  dbo.qryStockBookUnionself
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.qryStockBookUnionself.Company_Code = dbo.nt_1_accountmaster.company_code
  AND dbo.qryStockBookUnionself.mill_code = dbo.nt_1_accountmaster.Ac_Code
  LEFT JOIN dbo.Brand_Master ON dbo.qryStockBookUnionself.Brand_Code = dbo.Brand_Master.Code
  LEFT JOIN dbo.qryItemMaster ON dbo.qryStockBookUnionself.item_code = dbo.qryItemMaster.System_Code
  AND dbo.qryStockBookUnionself.Company_Code = dbo.qryItemMaster.Company_Code
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.qryStockBookUnionself.Ac_Code = nt_1_accountmaster_1.Ac_Code
  AND dbo.qryStockBookUnionself.Company_Code = nt_1_accountmaster_1.company_code;