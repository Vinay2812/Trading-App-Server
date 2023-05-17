SELECT
  dbo.qryMultipalledger.TRAN_TYPE,
  dbo.qryMultipalledger.DOC_NO,
  dbo.qryMultipalledger.DOC_DATE,
  dbo.qryMultipalledger.AC_CODE,
  dbo.qryMultipalledger.NARRATION,
  dbo.qryMultipalledger.debit,
  dbo.qryMultipalledger.cr,
  dbo.qryMultipalledger.balance,
  dbo.qryMultipalledger.COMPANY_CODE,
  dbo.qryMultipalledger.YEAR_CODE,
  dbo.qrymstaccountmaster.Ac_Name_E,
  dbo.qrymstaccountmaster.Group_Code,
  dbo.qrymstaccountmaster.group_Name_E,
  dbo.qrymstaccountmaster.group_Type,
  dbo.qrymstaccountmaster.Ac_type
FROM
  dbo.qryMultipalledger
  JOIN dbo.qrymstaccountmaster ON dbo.qryMultipalledger.AC_CODE = dbo.qrymstaccountmaster.Ac_Code
  AND dbo.qryMultipalledger.COMPANY_CODE = dbo.qrymstaccountmaster.Company_Code;