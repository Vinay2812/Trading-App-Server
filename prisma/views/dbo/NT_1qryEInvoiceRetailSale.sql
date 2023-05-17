SELECT
  Buyer.Ac_Name_E AS Buyer_Name,
  Buyer.Address_E AS Buyer_Address,
  Buyer_City.city_name_e AS Buyer_City,
  Buyer.Pincode AS Buyer_Pincode,
  Buyer.GSTStateCode AS Buyer_State_Code,
  dbo.gststatemaster.State_Name AS Buyer_State_name,
  Buyer.Gst_No AS BuyerGst_No,
  Buyer.OffPhone AS Buyer_Phno,
  Buyer.Email_Id AS Buyer_Email_Id,
  ShipTo.Gst_No AS ShipToGst_No,
  ShipTo.Ac_Name_E AS ShipTo_Name,
  ShipTo.Address_E AS ShipTo_Address,
  ShipTo_City.city_name_e AS ShipTo_City,
  ShipTo.GSTStateCode AS ShipTo_GSTStateCode,
  ShipTo.Pincode AS ShipTo_Pincode,
  dbo.Retail_Head.Doc_No,
  dbo.Retail_Head.Doc_Date,
  dbo.Retail_Head.CGST_Rate,
  dbo.Retail_Head.CGST_Amount,
  dbo.Retail_Head.SGST_Rate,
  dbo.Retail_Head.SGST_Amount,
  dbo.Retail_Head.IGST_Rate,
  dbo.Retail_Head.IGST_Amount,
  dbo.Retail_Head.Taxable_Amount,
  dbo.Retail_Head.Company_Code,
  dbo.Retail_Head.Year_Code,
  dbo.Retail_Head.Vahical_No,
  SUM(dbo.Retail_Detail.Netkg) AS NETQNTL,
  SUM(dbo.Retail_Detail.Rate) AS Rate,
  dbo.nt_1_systemmaster.System_Name_E,
  dbo.nt_1_systemmaster.HSN,
  dbo.Retail_Detail.CGST_Rate AS DetailCGST_Rate,
  dbo.Retail_Detail.SGST_Rate AS DetailSGST_Rate,
  dbo.Retail_Detail.IGST_Rate AS DetailIGST_Rate,
  dbo.nt_1_systemmaster.KgPerKatta
FROM
  dbo.nt_1_accountmaster AS ShipTo
  RIGHT JOIN dbo.Retail_Head ON ShipTo.accoid = dbo.Retail_Head.st
  LEFT JOIN dbo.gststatemaster
  RIGHT JOIN dbo.nt_1_accountmaster AS Buyer ON dbo.gststatemaster.State_Code = Buyer.GSTStateCode
  RIGHT JOIN dbo.nt_1_citymaster AS Buyer_City ON Buyer.cityid = Buyer_City.cityid;