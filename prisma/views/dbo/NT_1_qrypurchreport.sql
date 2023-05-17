SELECT
  dbo.NT_1_AccountMaster.Ac_Name_E AS Supplier,
  dbo.NT_1_Awakhead.AC_CODE,
  dbo.NT_1_Awakhead.DOC_DATE,
  dbo.NT_1_Awakhead.purchasevalue,
  dbo.NT_1_Awakhead.Company_Code,
  dbo.NT_1_Awakhead.adat,
  dbo.NT_1_Awakhead.tdsamount,
  dbo.NT_1_Awakhead.Year_Code,
  dbo.NT_1_Awakhead.TRAN_TYPE,
  dbo.NT_1_Awakhead.tdsperc
FROM
  dbo.NT_1_Awakhead
  LEFT JOIN dbo.NT_1_AccountMaster ON dbo.NT_1_Awakhead.AC_CODE = dbo.NT_1_AccountMaster.Ac_Code
  AND dbo.NT_1_Awakhead.Company_Code = dbo.NT_1_AccountMaster.Company_Code
WHERE
  (dbo.NT_1_Awakhead.TRAN_TYPE = 'AW');