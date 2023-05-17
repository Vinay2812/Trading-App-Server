SELECT
  dbo.nt_1_rentbillhead.Doc_No,
  dbo.nt_1_rentbillhead.Date AS doc_date,
  dbo.qrymstaccountmaster.Gst_No AS BuyerGst_No,
  dbo.qrymstaccountmaster.Ac_Name_E AS Buyer_Name,
  dbo.qrymstaccountmaster.Address_E AS Buyer_Address,
  dbo.qrymstaccountmaster.cityname AS Buyer_City,
  dbo.qrymstaccountmaster.Pincode AS Buyer_Pincode,
  dbo.qrymstaccountmaster.State_Name AS Buyer_State_name,
  dbo.qrymstaccountmaster.GSTStateCode AS Buyer_State_Code,
  dbo.qrymstaccountmaster.Email_Id AS Buyer_Email_Id,
  dbo.qrymstaccountmaster.OffPhone AS Buyer_Phno,
  dbo.nt_1_gstratemaster.Rate AS GSTRate,
  dbo.nt_1_rentbillhead.Subtotal AS TaxableAmount,
  dbo.nt_1_rentbillhead.CGSTAmount,
  dbo.nt_1_rentbillhead.SGSTAmount,
  dbo.nt_1_rentbillhead.IGSTAmount,
  dbo.nt_1_rentbillhead.CGSTRate,
  dbo.nt_1_rentbillhead.SGSTRate,
  dbo.nt_1_rentbillhead.IGSTRate,
  dbo.nt_1_rentbillhead.Company_Code,
  dbo.nt_1_rentbillhead.Year_Code,
  dbo.nt_1_systemmaster.System_Name_E,
  dbo.nt_1_systemmaster.HSN,
  dbo.nt_1_systemmaster.IsService,
  dbo.nt_1_rentbillhead.IsDeleted
FROM
  dbo.nt_1_systemmaster
  RIGHT JOIN dbo.nt_1_rentbilldetails ON dbo.nt_1_systemmaster.systemid = dbo.nt_1_rentbilldetails.ic
  RIGHT JOIN dbo.nt_1_rentbillhead
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_rentbillhead.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.nt_1_rentbillhead.GstRateCode = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.nt_1_rentbillhead.cc = dbo.qrymstaccountmaster.accoid;