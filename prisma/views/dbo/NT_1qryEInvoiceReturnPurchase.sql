SELECT
  dbo.nt_1_sugarpurchasereturn.doc_no,
  dbo.nt_1_sugarpurchasereturn.PURCNO,
  dbo.nt_1_sugarpurchasereturn.doc_date,
  dbo.nt_1_sugarpurchasereturn.Ac_Code,
  dbo.nt_1_sugarpurchasereturn.Unit_Code,
  dbo.nt_1_sugarpurchasereturn.mill_code,
  dbo.nt_1_sugarpurchasereturn.subTotal,
  dbo.nt_1_sugarpurchasereturn.OTHER_AMT,
  dbo.nt_1_sugarpurchasereturn.Bill_Amount,
  dbo.nt_1_sugarpurchasereturn.Company_Code,
  dbo.nt_1_sugarpurchasereturn.Year_Code,
  dbo.nt_1_sugarpurchasereturn.GstRateCode,
  dbo.nt_1_sugarpurchasereturn.CGSTAmount,
  dbo.nt_1_sugarpurchasereturn.SGSTAmount,
  dbo.nt_1_sugarpurchasereturn.IGSTAmount,
  dbo.nt_1_sugarpurchasereturn.TCS_Amt,
  dbo.nt_1_sugarpurchasereturn.TCS_Net_Payable,
  dbo.nt_1_sugarpurchasedetailsreturn.Quantal,
  dbo.nt_1_sugarpurchasedetailsreturn.rate,
  Buyer.Ac_Name_E AS Buyer_Name,
  Buyer.Gst_No AS BuyerGst_No,
  Buyer.Address_E AS Buyer_Address,
  Buyer.cityname AS Buyer_City,
  Buyer.Pincode AS Buyer_Pincode,
  Buyer.GSTStateCode AS Buyer_State_Code,
  Buyer.State_Name AS Buyer_State_name,
  Buyer.Email_Id AS Buyer_Email_Id,
  Buyer.OffPhone AS Buyer_Phno,
  Dispatch.Ac_Name_E AS Dispatch_Name,
  Dispatch.Gst_No AS DispatchGst_No,
  Dispatch.Address_E AS Dispatch_Address,
  Dispatch.cityname AS DispatchCity_City,
  Dispatch.Pincode AS Dispatch_Pincode,
  Dispatch.GSTStateCode AS Dispatch_GSTStateCode,
  ShipTo.Ac_Name_E AS ShipTo_Name,
  ShipTo.Address_E AS ShipTo_Address,
  ShipTo.cityname AS ShipTo_City,
  ShipTo.GSTStateCode AS ShipTo_GSTStateCode,
  ShipTo.Pincode AS ShipTo_Pincode,
  dbo.nt_1_sugarpurchasereturn.NETQNTL,
  dbo.nt_1_sugarpurchasereturn.CGSTRate,
  dbo.nt_1_sugarpurchasereturn.SGSTRate,
  dbo.nt_1_sugarpurchasereturn.IGSTRate,
  dbo.nt_1_sugarpurchasereturn.TO_STATION,
  dbo.nt_1_sugarpurchasedetailsreturn.ic,
  dbo.nt_1_systemmaster.System_Name_E,
  dbo.nt_1_systemmaster.HSN,
  dbo.nt_1_gstratemaster.Rate AS GSTRate,
  ShipTo.Gst_No AS ShipToGst_No,
  dbo.nt_1_sugarpurchasereturn.LORRYNO
FROM
  dbo.qrymstaccountmaster AS Dispatch
  RIGHT JOIN dbo.nt_1_sugarpurchasereturn
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_sugarpurchasereturn.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.nt_1_sugarpurchasereturn.GstRateCode = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.qrymstaccountmaster AS Buyer ON dbo.nt_1_sugarpurchasereturn.bt = Buyer.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS ShipTo ON dbo.nt_1_sugarpurchasereturn.uc = ShipTo.accoid;