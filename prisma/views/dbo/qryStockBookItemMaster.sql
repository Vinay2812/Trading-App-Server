SELECT
  'OP' AS Tran_Type,
  ' 2021 - 03 - 31' AS doc_date,
  1 AS Ac_Code,
  System_Code AS item_code,
  Opening_Bal AS Quantal,
  'C' AS drcr,
  Company_Code,
  Year_Code,
  Opening_Value AS itemvalue,
  0 AS Brand_Code,
  System_Code AS doc_no,
  0 AS dono,
  0 AS mill_code
FROM
  dbo.nt_1_systemmaster
WHERE
  (System_Type = 'I')
  AND (Opening_Bal <> 0);