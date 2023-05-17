SELECT
  dbo.nt_1_sugarpurchasedetails.doc_no,
  dbo.nt_1_sugarpurchasedetails.detail_id,
  dbo.nt_1_sugarpurchasedetails.Tran_Type,
  dbo.nt_1_sugarpurchasedetails.item_code,
  dbo.nt_1_sugarpurchasedetails.narration,
  dbo.nt_1_sugarpurchasedetails.Quantal,
  dbo.nt_1_sugarpurchasedetails.packing,
  dbo.nt_1_sugarpurchasedetails.bags,
  dbo.nt_1_sugarpurchasedetails.rate,
  dbo.nt_1_sugarpurchasedetails.item_Amount,
  dbo.nt_1_sugarpurchasedetails.Company_Code,
  dbo.nt_1_sugarpurchasedetails.Year_Code,
  dbo.nt_1_sugarpurchasedetails.Branch_Code,
  dbo.nt_1_sugarpurchasedetails.Created_By,
  dbo.nt_1_sugarpurchasedetails.Modified_By,
  dbo.nt_1_sugarpurchasedetails.purchasedetailid,
  dbo.nt_1_sugarpurchasedetails.purchaseid,
  dbo.nt_1_sugarpurchasedetails.ic,
  dbo.qrymstitem.System_Name_E AS itemname,
  dbo.nt_1_sugarpurchasedetails.Brand_Code,
  dbo.Brand_Master.Marka AS Brand_Name,
  dbo.qrymstitem.HSN
FROM
  dbo.nt_1_sugarpurchasedetails
  LEFT JOIN dbo.Brand_Master ON dbo.nt_1_sugarpurchasedetails.Brand_Code = dbo.Brand_Master.Code
  AND dbo.nt_1_sugarpurchasedetails.Company_Code = dbo.Brand_Master.Company_Code
  LEFT JOIN dbo.qrymstitem ON dbo.nt_1_sugarpurchasedetails.ic = dbo.qrymstitem.systemid;