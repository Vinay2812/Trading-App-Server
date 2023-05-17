SELECT
  dbo.qryStockBookUnion.Tran_Type,
  dbo.qryStockBookUnion.doc_date,
  dbo.qryStockBookUnion.Ac_Code,
  dbo.qryStockBookUnion.item_code,
  dbo.qryStockBookUnion.Quantal,
  dbo.qryStockBookUnion.drcr,
  dbo.qryStockBookUnion.Company_Code,
  dbo.qryStockBookUnion.Year_Code,
  dbo.qryStockBookUnion.itemvalue,
  nt_1_accountmaster_1.Ac_Name_E,
  dbo.qryItemMaster.System_Name_E,
  dbo.qryStockBookUnion.Brand_Code,
  dbo.Brand_Master.Marka,
  dbo.qryStockBookUnion.doc_no,
  dbo.qryStockBookUnion.DoNO,
  nt_1_accountmaster_1.Short_Name AS partyShortname,
  dbo.nt_1_accountmaster.Short_Name AS MillShortName
FROM
  dbo.qryStockBookUnion
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.qryStockBookUnion.Company_Code = dbo.nt_1_accountmaster.company_code
  AND dbo.qryStockBookUnion.mill_code = dbo.nt_1_accountmaster.Ac_Code
  LEFT JOIN dbo.Brand_Master ON dbo.qryStockBookUnion.Brand_Code = dbo.Brand_Master.Code
  LEFT JOIN dbo.qryItemMaster ON dbo.qryStockBookUnion.item_code = dbo.qryItemMaster.System_Code
  AND dbo.qryStockBookUnion.Company_Code = dbo.qryItemMaster.Company_Code
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.qryStockBookUnion.Ac_Code = nt_1_accountmaster_1.Ac_Code
  AND dbo.qryStockBookUnion.Company_Code = nt_1_accountmaster_1.company_code;