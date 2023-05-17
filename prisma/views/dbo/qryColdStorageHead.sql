SELECT
  dbo.NT_1_ColdStorageBillHead.Doc_No,
  dbo.NT_1_ColdStorageBillHead.Date,
  CONVERT(
    varchar(10),
    dbo.NT_1_ColdStorageBillHead.Date,
    103
  ) AS ConvertDate,
  dbo.NT_1_ColdStorageBillHead.Cash_Credit,
  dbo.NT_1_ColdStorageBillHead.Customer_Code,
  dbo.NT_1_ColdStorageBillHead.GstRateCode,
  dbo.NT_1_ColdStorageBillHead.Subtotal,
  dbo.NT_1_ColdStorageBillHead.CGSTRate,
  dbo.NT_1_ColdStorageBillHead.CGSTAmount,
  dbo.NT_1_ColdStorageBillHead.SGSTRate,
  dbo.NT_1_ColdStorageBillHead.SGSTAmount,
  dbo.NT_1_ColdStorageBillHead.IGSTRate,
  dbo.NT_1_ColdStorageBillHead.IGSTAmount,
  dbo.NT_1_ColdStorageBillHead.Total,
  dbo.NT_1_ColdStorageBillHead.Round_Off,
  dbo.NT_1_ColdStorageBillHead.Final_Amount,
  dbo.NT_1_ColdStorageBillHead.Company_Code,
  dbo.NT_1_ColdStorageBillHead.Year_Code,
  dbo.NT_1_ColdStorageBillHead.Branch_Code,
  dbo.NT_1_ColdStorageBillHead.Created_By,
  dbo.NT_1_ColdStorageBillHead.Modified_By,
  dbo.NT_1_ColdStorageBillHead.billno,
  dbo.NT_1_ColdStorageBillHead.ccid,
  dbo.NT_1_ColdStorageBillHead.csid,
  dbo.qrymstaccountmaster.Ac_Name_E,
  dbo.qrymstaccountmaster.GSTStateCode AS CustomerStateCode,
  dbo.qrymstaccountmaster.State_Name AS CustomerStateName,
  dbo.nt_1_gstratemaster.GST_Name,
  dbo.NT_1_ColdStorageBillHead.TCS_Rate,
  dbo.NT_1_ColdStorageBillHead.TCS_Amt,
  dbo.NT_1_ColdStorageBillHead.TCS_Net_Payable,
  dbo.qrymstaccountmaster.Address_E,
  dbo.qrymstaccountmaster.CompanyPan,
  dbo.qrymstaccountmaster.UnregisterGST,
  dbo.qrymstaccountmaster.Gst_No,
  dbo.nt_1_gstratemaster.Rate,
  dbo.qrymstaccountmaster.FSSAI,
  dbo.qrymstaccountmaster.Tan_no,
  dbo.qrymstaccountmaster.Email_Id
FROM
  dbo.NT_1_ColdStorageBillHead
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.NT_1_ColdStorageBillHead.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.NT_1_ColdStorageBillHead.GstRateCode = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.NT_1_ColdStorageBillHead.ccid = dbo.qrymstaccountmaster.accoid;