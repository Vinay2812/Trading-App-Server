SELECT
  dbo.qrycashTrancastionmain.Tran_type,
  dbo.qrycashTrancastionmain.Doc_no,
  dbo.qrycashTrancastionmain.Doc_Date,
  dbo.qrycashTrancastionmain.Ac_Code,
  dbo.qrycashTrancastionmain.Narration,
  dbo.qrycashTrancastionmain.Amount,
  dbo.qrycashTrancastionmain.DRCR,
  dbo.qrycashTrancastionmain.Company_Code,
  dbo.qrymstaccountmaster.group_Type,
  dbo.qrymstaccountmaster.group_Name_E,
  dbo.qrymstaccountmaster.Group_Code,
  dbo.qrymstaccountmaster.accoid AS ac,
  dbo.qrymstaccountmaster.Ac_Name_E,
  dbo.qrymstaccountmaster.cityname
FROM
  dbo.qrycashTrancastionmain
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.qrycashTrancastionmain.Ac_Code = dbo.qrymstaccountmaster.Ac_Code
  AND dbo.qrycashTrancastionmain.Company_Code = dbo.qrymstaccountmaster.Company_Code;