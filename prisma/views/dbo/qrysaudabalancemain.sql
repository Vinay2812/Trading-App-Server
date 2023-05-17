SELECT
  dbo.qrysaudabalanceraw.Tender_No,
  dbo.qrysaudabalanceraw.Buyer,
  dbo.qrysaudabalanceraw.Company_Code,
  dbo.qrysaudabalanceraw.Buyer_Quantal,
  dbo.qrysaudabalanceraw.Sale_Rate,
  dbo.qrysaudabalanceraw.Commission_Rate,
  dbo.qrysaudabalanceraw.tenderid,
  dbo.qrysaudabalanceraw.year_code,
  dbo.qrysaudabalanceraw.tenderdetailid,
  dbo.qrysaudabalanceraw.AMT,
  dbo.qrysaudabalanceraw.received,
  dbo.qrysaudabalanceraw.adjusted,
  dbo.qrysaudabalanceraw.BALANCE,
  dbo.qrysaudabalanceraw.buyerid,
  dbo.nt_1_tender.Tender_Date,
  nt_1_accountmaster_1.Ac_Name_E AS buyername,
  dbo.nt_1_tender.Lifting_Date AS payment_Date,
  CONVERT(varchar(10), dbo.nt_1_tender.Lifting_Date, 103) AS payment_dateConverted,
  dbo.nt_1_accountmaster.Short_Name,
  dbo.qrysaudabalanceraw.Delivery_Type
FROM
  dbo.nt_1_accountmaster
  RIGHT JOIN dbo.nt_1_tender ON dbo.nt_1_accountmaster.accoid = dbo.nt_1_tender.mc
  RIGHT JOIN dbo.qrysaudabalanceraw ON dbo.nt_1_tender.tenderid = dbo.qrysaudabalanceraw.tenderid
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.qrysaudabalanceraw.buyerid = nt_1_accountmaster_1.accoid;