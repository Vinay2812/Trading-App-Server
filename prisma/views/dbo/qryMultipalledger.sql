SELECT
  TOP (100) PERCENT TRAN_TYPE,
  DOC_NO,
  DOC_DATE,
  AC_CODE,
  NARRATION,
  CASE
    WHEN DRCR = 'D' THEN AMOUNT
    ELSE 0
  END AS debit,
  CASE
    WHEN drcr = 'C' THEN amount
    ELSE 0
  END AS cr,
  CASE
    WHEN DRCR = 'D' THEN AMOUNT
    ELSE - amount
  END AS balance,
  COMPANY_CODE,
  YEAR_CODE
FROM
  dbo.nt_1_gledger
ORDER BY
  AC_CODE,
  DOC_DATE,
  DRCR DESC,
  COMPANY_CODE,
  YEAR_CODE;