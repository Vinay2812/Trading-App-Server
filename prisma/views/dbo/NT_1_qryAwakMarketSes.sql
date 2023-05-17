SELECT
  AW.doc_no,
  AW.billno,
  AW.DOC_DATE,
  Ac.Ac_Name_E,
  AW.netqty,
  AW.purchasevalue,
  AW.MARKETSES,
  AW.supercost,
  '' AS CessApplicable,
  AW.Company_Code,
  AW.Year_Code,
  cp.cessrate,
  cp.superrate
FROM
  dbo.NT_1_Awakhead AS AW
  LEFT JOIN dbo.NT_1_JaggryCompanyParameters AS cp ON AW.Company_Code = cp.Company_Code
  AND AW.Year_Code = cp.Year_Code
  LEFT JOIN dbo.NT_1_AccountMaster AS Ac ON AW.AC_CODE = Ac.Ac_Code
  AND AW.Company_Code = Ac.Company_Code;