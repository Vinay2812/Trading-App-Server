SELECT
  dbo.NT_1_Awakhead.TRAN_TYPE,
  dbo.NT_1_Awakhead.doc_no,
  dbo.NT_1_Awakhead.DOC_DATE,
  dbo.NT_1_Awakhead.AC_CODE,
  dbo.NT_1_Awakhead.AMOUNT,
  dbo.NT_1_Awakhead.Company_Code,
  dbo.NT_1_Awakhead.Year_Code,
  dbo.NT_1_Awakhead.TCS_Rate,
  dbo.NT_1_Awakhead.TCS_Amt,
  dbo.NT_1_Awakhead.TCS_Net_Payable,
  dbo.NT_1_AccountMaster.Ac_Name_E,
  dbo.NT_1_AccountMaster.CompanyPan
FROM
  dbo.NT_1_Awakhead
  LEFT JOIN dbo.NT_1_AccountMaster ON dbo.NT_1_Awakhead.Company_Code = dbo.NT_1_AccountMaster.Company_Code
  AND dbo.NT_1_Awakhead.AC_CODE = dbo.NT_1_AccountMaster.Ac_Code;