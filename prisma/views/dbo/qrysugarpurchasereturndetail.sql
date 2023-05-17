SELECT
  dbo.nt_1_sugarpurchasedetailsreturn.doc_no,
  dbo.nt_1_sugarpurchasedetailsreturn.detail_id,
  dbo.nt_1_sugarpurchasedetailsreturn.Tran_Type,
  dbo.nt_1_sugarpurchasedetailsreturn.item_code,
  dbo.nt_1_sugarpurchasedetailsreturn.narration,
  dbo.nt_1_sugarpurchasedetailsreturn.Quantal,
  dbo.nt_1_sugarpurchasedetailsreturn.packing,
  dbo.nt_1_sugarpurchasedetailsreturn.bags,
  dbo.nt_1_sugarpurchasedetailsreturn.rate,
  dbo.nt_1_sugarpurchasedetailsreturn.item_Amount,
  dbo.nt_1_sugarpurchasedetailsreturn.Company_Code,
  dbo.nt_1_sugarpurchasedetailsreturn.Year_Code,
  dbo.nt_1_sugarpurchasedetailsreturn.Branch_Code,
  dbo.nt_1_sugarpurchasedetailsreturn.Created_By,
  dbo.nt_1_sugarpurchasedetailsreturn.Modified_By,
  dbo.nt_1_sugarpurchasedetailsreturn.ic,
  dbo.nt_1_sugarpurchasedetailsreturn.prdid,
  dbo.nt_1_sugarpurchasedetailsreturn.prid,
  dbo.qrymstitem.System_Name_E AS itemname,
  dbo.qrymstitem.HSN
FROM
  dbo.nt_1_sugarpurchasedetailsreturn
  LEFT JOIN dbo.qrymstitem ON dbo.nt_1_sugarpurchasedetailsreturn.ic = dbo.qrymstitem.systemid;