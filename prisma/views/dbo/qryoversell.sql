CREATE VIEW [dbo].[qryoversell] AS
SELECT
  dbo.nt_1_tender.Tender_No,
  dbo.nt_1_tender.Company_Code,
  dbo.nt_1_tender.Tender_Date,
  dbo.nt_1_tender.Quantal,
  SUM(
    { fn IFNULL(dbo.nt_1_tenderdetails.Buyer_Quantal, 0) }
  ) AS desp,
  dbo.nt_1_tender.Quantal - SUM(
    { fn IFNULL(dbo.nt_1_tenderdetails.Buyer_Quantal, 0) }
  ) AS balance
FROM
  dbo.nt_1_tender
  LEFT OUTER JOIN dbo.nt_1_tenderdetails ON dbo.nt_1_tender.tenderid = dbo.nt_1_tenderdetails.tenderid
GROUP BY
  dbo.nt_1_tender.Tender_No,
  dbo.nt_1_tender.Company_Code,
  dbo.nt_1_tender.Tender_Date,
  dbo.nt_1_tender.Quantal
HAVING
  (
    dbo.nt_1_tender.Quantal - SUM(
      { fn IFNULL(dbo.nt_1_tenderdetails.Buyer_Quantal, 0) }
    ) < 0
  )