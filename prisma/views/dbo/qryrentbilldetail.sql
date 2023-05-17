SELECT
  dbo.nt_1_rentbilldetails.Doc_No,
  dbo.nt_1_rentbilldetails.Detail_Id,
  dbo.nt_1_rentbilldetails.Item_Code,
  dbo.nt_1_rentbilldetails.Description,
  dbo.nt_1_rentbilldetails.Amount,
  dbo.nt_1_rentbilldetails.Company_Code,
  dbo.nt_1_rentbilldetails.Year_Code,
  dbo.nt_1_rentbilldetails.ic,
  dbo.nt_1_rentbilldetails.rbid,
  dbo.nt_1_rentbilldetails.rbdid,
  dbo.qrymstitem.System_Name_E AS itemname,
  dbo.qrymstitem.Sale_AC AS saleac,
  dbo.qrymstitem.SaleAcid AS ac,
  dbo.qrymstitem.HSN
FROM
  dbo.nt_1_rentbilldetails
  LEFT JOIN dbo.qrymstitem ON dbo.nt_1_rentbilldetails.ic = dbo.qrymstitem.systemid;