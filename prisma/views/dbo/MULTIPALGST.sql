SELECT
  COUNT(*) AS COUNTS,
  Gst_No
FROM
  dbo.nt_1_accountmaster
GROUP BY
  Gst_No
HAVING
  (COUNT(*) > 1);