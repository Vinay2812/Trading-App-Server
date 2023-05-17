SELECT
  dbo.debitnotehead.tran_type,
  dbo.debitnotehead.doc_no,
  dbo.debitnotehead.doc_date,
  Buyer.Gst_No AS BuyerGst_No,
  Buyer.Ac_Name_E AS Buyer_Name,
  Buyer.Address_E AS Buyer_Address,
  Buyer.cityname AS Buyer_City,
  Buyer.Pincode AS Buyer_Pincode,
  Buyer.State_Name AS Buyer_State_name,
  Buyer.GSTStateCode AS Buyer_State_Code,
  Buyer.OffPhone AS Buyer_Phno,
  Buyer.Email_Id AS Buyer_Email_Id,
  Dispatch.Gst_No AS DispatchGst_No,
  Dispatch.Ac_Name_E AS Dispatch_Name,
  Dispatch.Address_E AS Dispatch_Address,
  Dispatch.cityname AS DispatchCity_City,
  Dispatch.GSTStateCode AS Dispatch_GSTStateCode,
  Dispatch.Pincode AS Dispatch_Pincode,
  dbo.qrymstaccountmaster.Gst_No AS ShipToGst_No,
  dbo.qrymstaccountmaster.Ac_Name_E AS ShipTo_Name,
  dbo.qrymstaccountmaster.Address_E AS ShipTo_Address,
  dbo.qrymstaccountmaster.cityname AS ShipTo_City,
  dbo.qrymstaccountmaster.GSTStateCode AS ShipTo_GSTStateCode,
  dbo.qrymstaccountmaster.Pincode AS ShipTo_Pincode,
  dbo.debitnotehead.Company_Code,
  dbo.debitnotehead.Year_Code,
  dbo.debitnotehead.cgst_amount,
  dbo.debitnotehead.sgst_amount,
  dbo.debitnotehead.igst_amount,
  dbo.nt_1_gstratemaster.Rate,
  dbo.debitnotehead.texable_amount,
  dbo.debitnotehead.cgst_rate,
  dbo.debitnotehead.sgst_rate,
  dbo.debitnotehead.igst_rate,
  dbo.qrymstaccountmaster.Email_Id AS ShipToEmailID,
  dbo.qrymstaccountmaster.OffPhone AS ShipToOffPhone,
  dbo.qrymstaccountmaster.State_Name AS ShipToState_Name
FROM
  dbo.debitnotehead
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.debitnotehead.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.debitnotehead.gst_code = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.debitnotehead.st = dbo.qrymstaccountmaster.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS Dispatch ON dbo.debitnotehead.mc = Dispatch.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS Buyer ON dbo.debitnotehead.ac = Buyer.accoid
  LEFT JOIN dbo.debitnotedetail ON dbo.debitnotehead.dcid = dbo.debitnotedetail.dcid;