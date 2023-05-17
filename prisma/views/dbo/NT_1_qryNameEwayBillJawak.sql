SELECT
  dbo.NT_1_JSaleHead.doc_no,
  dbo.NT_1_JSaleHead.doc_date,
  dbo.NT_1_JSaleHead.Cust_Code,
  dbo.NT_1_JSaleHead.Company_Code,
  dbo.NT_1_JSaleHead.Year_Code,
  dbo.NT_1_JSaleHead.IGST_Amount,
  dbo.NT_1_JSaleHead.CGST_Amount,
  dbo.NT_1_JSaleHead.SGST_Amount,
  dbo.NT_1_JSaleHead.CGST_Rate,
  dbo.NT_1_JSaleHead.SGST_Rate,
  dbo.NT_1_JSaleHead.GST_RateCode,
  dbo.NT_1_JSaleHead.TaxableAmount,
  dbo.NT_1_JSaleHead.BillAmt,
  SUM(dbo.qryjaggaryewaybillunion.Net_Wt) AS Net_Wt,
  dbo.NT_1_AccountMaster.Ac_Name_E,
  dbo.NT_1_AccountMaster.Gst_No,
  dbo.NT_1_AccountMaster.Address_E,
  dbo.NT_1_CityMaster.city_name_e,
  dbo.NT_1_AccountMaster.Pincode,
  dbo.NT_1_AccountMaster.GSTStateCode,
  dbo.GSTStateMaster.State_Name,
  dbo.NT_1_JSaleHead.IGST_Rate,
  dbo.NT_1_AccountMaster.Distance,
  dbo.NT_1_JSaleHead.VEHICLE_NO,
  dbo.NT_1_AccountMaster.Mobile_No,
  dbo.NT_1_AccountMaster.Email_Id,
  dbo.NT_1_GSTRateMaster.Rate
FROM
  dbo.NT_1_JSaleHead
  LEFT JOIN dbo.NT_1_GSTRateMaster ON dbo.NT_1_JSaleHead.Company_Code = dbo.NT_1_GSTRateMaster.Company_Code
  AND dbo.NT_1_JSaleHead.GST_RateCode = dbo.NT_1_GSTRateMaster.Doc_no
  LEFT JOIN dbo.NT_1_AccountMaster
  LEFT JOIN dbo.GSTStateMaster ON dbo.NT_1_AccountMaster.GSTStateCode = dbo.GSTStateMaster.State_Code
  LEFT JOIN dbo.NT_1_CityMaster ON dbo.NT_1_AccountMaster.Company_Code = dbo.NT_1_CityMaster.company_code
  AND dbo.NT_1_AccountMaster.City_Code = dbo.NT_1_CityMaster.city_code;