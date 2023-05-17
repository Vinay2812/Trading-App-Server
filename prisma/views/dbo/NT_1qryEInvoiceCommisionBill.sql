SELECT
  dbo.commission_bill.doc_no,
  dbo.commission_bill.doc_date,
  Party.Gst_No AS BuyerGst_No,
  Party.Ac_Name_E AS Buyer_Name,
  Party.Address_E AS Buyer_Address,
  Party.cityname AS Buyer_City,
  Party.Pincode AS Buyer_Pincode,
  Party.State_Name AS Buyer_State_name,
  Party.GSTStateCode AS Buyer_State_Code,
  Party.Email_Id AS Buyer_Email_Id,
  dbo.commission_bill.qntl AS NETQNTL,
  dbo.commission_bill.sale_rate,
  dbo.commission_bill.cgst_amount AS CGSTAmount,
  dbo.commission_bill.sgst_amount AS SGSTAmount,
  dbo.commission_bill.igst_amount AS IGSTAmount,
  dbo.commission_bill.texable_amount AS TaxableAmount,
  dbo.commission_bill.cgst_rate AS CGSTRate,
  dbo.commission_bill.sgst_rate AS SGSTRate,
  dbo.commission_bill.igst_rate AS IGSTRate,
  dbo.commission_bill.HSN,
  dbo.nt_1_gstratemaster.Rate AS GSTRate,
  dbo.commission_bill.Company_Code,
  dbo.commission_bill.Year_Code,
  Party.OffPhone AS Buyer_Phno,
  dbo.commission_bill.TCS_Net_Payable,
  dbo.commission_bill.purc_rate,
  dbo.commission_bill.mill_rate,
  dbo.commission_bill.resale_rate,
  dbo.nt_1_systemmaster.System_Name_E,
  dbo.nt_1_systemmaster.IsService
FROM
  dbo.commission_bill
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.commission_bill.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.commission_bill.gst_code = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.nt_1_systemmaster ON dbo.commission_bill.ic = dbo.nt_1_systemmaster.systemid
  LEFT JOIN dbo.qrymstaccountmaster AS Party ON dbo.commission_bill.ac = Party.accoid;