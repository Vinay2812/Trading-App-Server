SELECT
  dbo.Retail_Head.Doc_No,
  dbo.Retail_Head.Doc_Date,
  SUM(dbo.Retail_Detail.Netkg) AS Qty,
  dbo.Retail_Head.Taxable_Amount,
  dbo.Retail_Head.CGST_Amount,
  dbo.Retail_Head.SGST_Amount,
  dbo.Retail_Head.IGST_Amount,
  dbo.Retail_Head.NetValue,
  Billto.Ac_Name_E AS BillToName,
  Billto.Gst_No AS BillToGst,
  Billto.GSTStateCode AS BillToStateCode,
  ShipTo.Ac_Name_E AS ShipTo_AcName,
  ShipTo.Address_E AS Shipto_Address,
  ShipTo.Pincode AS ShipTo_Pincode,
  ShipTo.Gst_No AS ShipTo_GSTNo,
  ShipTo.GSTStateCode AS ShipTo_GSTStateCode,
  dbo.nt_1_citymaster.city_name_e AS ShipTo_City,
  Billto.Pincode AS BillTo_Pincode,
  dbo.gststatemaster.State_Name AS BillTo_StateName,
  dbo.Retail_Head.Vahical_No,
  SUM(dbo.Retail_Detail.CGST_Rate) AS CGST_Rate,
  SUM(dbo.Retail_Detail.SGST_Rate) AS SGST_Rate,
  SUM(dbo.Retail_Detail.IGST_Rate) AS IGST_Rate,
  dbo.nt_1_systemmaster.System_Name_E,
  dbo.nt_1_systemmaster.HSN,
  dbo.Retail_Head.Company_Code,
  dbo.Retail_Head.Year_Code,
  dbo.nt_1_accountmaster.Gst_No AS TransportId
FROM
  dbo.gststatemaster
  RIGHT JOIN dbo.nt_1_accountmaster AS Billto ON dbo.gststatemaster.State_Code = Billto.GSTStateCode
  RIGHT JOIN dbo.nt_1_citymaster
  RIGHT JOIN dbo.nt_1_accountmaster AS ShipTo ON dbo.nt_1_citymaster.cityid = ShipTo.cityid
  RIGHT JOIN dbo.nt_1_accountmaster
  RIGHT JOIN dbo.Retail_Head ON dbo.nt_1_accountmaster.accoid = dbo.Retail_Head.tc;