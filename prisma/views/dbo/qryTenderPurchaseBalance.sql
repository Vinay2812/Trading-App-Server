SELECT
  dbo.nt_1_tender.Tender_No,
  dbo.nt_1_tender.Tender_Date AS Date,
  tenderdo.Short_Name AS SaudaParty,
  mill.Short_Name AS Mill,
  dbo.nt_1_tender.Grade,
  ISNULL(dbo.nt_1_tender.Quantal, 0) - ISNULL(dbo.qrytenderpurchasedo.desp, 0) AS Pend,
  dbo.nt_1_tender.Mill_Rate AS Rate,
  dbo.nt_1_tender.Purc_Rate AS DO,
  broker.Short_Name AS Broker,
  dbo.nt_1_tender.Lifting_Date,
  ISNULL(dbo.qryTenderDetailWithoutSelf.Qntl, 0) AS Sold,
  dbo.nt_1_tender.Quantal AS TenderQntl,
  ISNULL(dbo.nt_1_tender.Quantal, 0) - ISNULL(dbo.qryTenderDetailWithoutSelf.Qntl, 0) AS selfbalance,
  ISNULL(dbo.qrytenderpurchasedo.desp, 0) AS doqntl,
  dbo.nt_1_tender.Narration
FROM
  dbo.qrytenderpurchasedo
  RIGHT JOIN dbo.nt_1_tender
  LEFT JOIN dbo.nt_1_accountmaster AS tenderdo ON dbo.nt_1_tender.td = tenderdo.accoid;