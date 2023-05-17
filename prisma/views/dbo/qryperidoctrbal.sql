SELECT
  Ac_Code,
  Ac_Name_E,
  Group_Code,
  group_Name_E,
  CASE
    WHEN DRCR = 'D' THEN AMOUNT
    ELSE 0
  END AS debit,
  CASE
    WHEN DRCR = 'C' THEN AMOUNT
    ELSE 0
  END AS credit,
  DOC_DATE
FROM
  dbo.qrygledger
WHERE
  (DOC_DATE >= '2020/04/01')
  AND (DOC_DATE <= '2021/03/31');