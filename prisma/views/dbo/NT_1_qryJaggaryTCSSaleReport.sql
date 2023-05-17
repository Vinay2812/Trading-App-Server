SELECT
  dbo.NT_1_JSaleHead.doc_no,
  dbo.NT_1_JSaleHead.doc_date,
  dbo.NT_1_JSaleHead.Cust_Code,
  dbo.NT_1_JSaleHead.Company_Code,
  dbo.NT_1_JSaleHead.Year_Code,
  dbo.NT_1_JSaleHead.BillAmt,
  dbo.NT_1_JSaleHead.TCS_Amt,
  dbo.NT_1_JSaleHead.TCS_Rate,
  dbo.NT_1_JSaleHead.TCS_Net_Payable,
  dbo.NT_1_AccountMaster.Ac_Name_E,
  dbo.NT_1_AccountMaster.CompanyPan
FROM
  dbo.NT_1_JSaleHead
  LEFT JOIN dbo.NT_1_AccountMaster ON dbo.NT_1_JSaleHead.Cust_Code = dbo.NT_1_AccountMaster.Ac_Code
  AND dbo.NT_1_JSaleHead.Company_Code = dbo.NT_1_AccountMaster.Company_Code;