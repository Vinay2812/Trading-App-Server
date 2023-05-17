SELECT
  dbo.nt_1_tenderdetails.Tender_No,
  dbo.nt_1_tenderdetails.Sauda_Date AS Date,
  dbo.qrymstaccountmaster.Short_Name AS SaudaParty,
  dbo.qrymstaccountmaster.cityname AS City,
  Mill.Short_Name AS Mill,
  dbo.nt_1_tender.Grade,
  dbo.nt_1_tenderdetails.Sale_Rate AS Rate,
  dbo.nt_1_tender.Mill_Rate AS DORate,
  broker.Short_Name AS Broker,
  dbo.nt_1_tenderdetails.Lifting_Date,
  dbo.nt_1_tenderdetails.Narration,
  ISNULL(dbo.nt_1_tenderdetails.Buyer_Quantal, 0) - ISNULL(dbo.qryPendingDOqty.desp, 0) AS SelfBalance,
  Mill.Ac_Name_E AS millname
FROM
  dbo.nt_1_accountmaster AS Mill
  RIGHT JOIN dbo.nt_1_tender
  JOIN dbo.nt_1_tenderdetails ON dbo.nt_1_tender.Tender_No = dbo.nt_1_tenderdetails.Tender_No
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.nt_1_tenderdetails.buyerid = dbo.qrymstaccountmaster.accoid
  LEFT JOIN dbo.qryPendingDOqty ON dbo.nt_1_tenderdetails.ID = dbo.qryPendingDOqty.purc_order
  AND dbo.nt_1_tenderdetails.Tender_No = dbo.qryPendingDOqty.purc_no
  LEFT JOIN dbo.nt_1_accountmaster AS broker ON dbo.nt_1_tender.bk = broker.accoid;