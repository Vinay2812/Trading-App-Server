SELECT
  tenderid,
  ISNULL(SUM(Buyer_Quantal), 0) AS Quantal,
  Tender_No
FROM
  dbo.nt_1_tenderdetails
WHERE
  (Delivery_Type = 'D')
GROUP BY
  tenderid,
  Tender_No;