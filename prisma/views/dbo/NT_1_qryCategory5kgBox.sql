SELECT
  category AS fivekgbox,
  System_Code,
  Company_Code
FROM
  dbo.NT_1_SystemMaster
WHERE
  (System_Type = 'I')
  AND (category = '6');