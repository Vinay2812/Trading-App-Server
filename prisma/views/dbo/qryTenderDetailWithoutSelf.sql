SELECT
  Tender_No,
  tenderid,
  SUM(Buyer_Quantal) AS Qntl,
  Company_Code
FROM
  dbo.nt_1_tenderdetails
WHERE
  (ID <> 1)
GROUP BY
  Tender_No,
  tenderid,
  Company_Code;