SELECT
  purc_no,
  purc_order,
  ISNULL(SUM(quantal), 0) + ISNULL(SUM(quantal1), 0) AS desp,
  company_code
FROM
  dbo.nt_1_deliveryorder
GROUP BY
  purc_no,
  purc_order,
  company_code;