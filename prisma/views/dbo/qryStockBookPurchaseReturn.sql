SELECT
  'PR' AS Tran_Type,
  dbo.nt_1_sugarpurchasereturn.doc_date,
  dbo.nt_1_sugarpurchasereturn.Bill_To,
  dbo.nt_1_sugarpurchasedetailsreturn.item_code,
  dbo.nt_1_sugarpurchasedetailsreturn.Quantal,
  'D' AS drcr,
  dbo.nt_1_sugarpurchasereturn.Company_Code,
  dbo.nt_1_sugarpurchasereturn.Year_Code,
  dbo.nt_1_sugarpurchasereturn.subTotal AS itemvalue,
  '0' AS Brand_Code,
  dbo.nt_1_sugarpurchasereturn.doc_no,
  dbo.nt_1_sugarpurchasereturn.PURCNO AS DoNo,
  dbo.nt_1_sugarpurchasereturn.mill_code
FROM
  dbo.nt_1_sugarpurchasereturn
  JOIN dbo.nt_1_sugarpurchasedetailsreturn ON dbo.nt_1_sugarpurchasereturn.prid = dbo.nt_1_sugarpurchasedetailsreturn.prid;