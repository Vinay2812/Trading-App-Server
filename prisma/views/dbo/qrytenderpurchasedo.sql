SELECT
  purc_no,
  company_code,
  ISNULL(SUM(quantal), 0) + ISNULL(SUM(quantal1), 0) AS desp
FROM
  dbo.nt_1_deliveryorder
GROUP BY
  purc_no,
  company_code;