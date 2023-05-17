SELECT
  dbo.nt_1_tender.Tender_Date,
  nt_1_accountmaster_1.Ac_Name_E AS buyername,
  dbo.nt_1_tender.Lifting_Date AS payment_Date,
  CONVERT(varchar(10), dbo.nt_1_tender.Lifting_Date, 103) AS payment_dateConverted,
  dbo.nt_1_accountmaster.Short_Name,
  dbo.qrysaudabalancesumnnaryraw.Tender_No,
  dbo.qrysaudabalancesumnnaryraw.Buyer,
  dbo.qrysaudabalancesumnnaryraw.Company_Code,
  dbo.qrysaudabalancesumnnaryraw.Buyer_Quantal,
  dbo.qrysaudabalancesumnnaryraw.Sale_Rate,
  dbo.qrysaudabalancesumnnaryraw.Commission_Rate,
  dbo.qrysaudabalancesumnnaryraw.tenderid,
  dbo.qrysaudabalancesumnnaryraw.year_code,
  dbo.qrysaudabalancesumnnaryraw.tenderdetailid,
  dbo.qrysaudabalancesumnnaryraw.AMT,
  dbo.qrysaudabalancesumnnaryraw.received,
  dbo.qrysaudabalancesumnnaryraw.adjusted,
  dbo.qrysaudabalancesumnnaryraw.BALANCE,
  dbo.qrysaudabalancesumnnaryraw.buyerid,
  dbo.qrysaudabalancesumnnaryraw.tcs_amt,
  dbo.qrysaudabalancesumnnaryraw.Sauda_Date
FROM
  dbo.qrysaudabalancesumnnaryraw
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.qrysaudabalancesumnnaryraw.buyerid = nt_1_accountmaster_1.accoid
  LEFT JOIN dbo.nt_1_tender ON dbo.qrysaudabalancesumnnaryraw.tenderid = dbo.nt_1_tender.tenderid
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.nt_1_tender.mc = dbo.nt_1_accountmaster.accoid;