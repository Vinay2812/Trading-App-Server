SELECT
  dbo.qrytenderheaddetail.Tender_No,
  dbo.qrytenderheaddetail.Tender_Date,
  dbo.qrytenderheaddetail.payment_date,
  dbo.qrytenderheaddetail.payment_dateConverted,
  dbo.qrytenderheaddetail.Buyer,
  dbo.qrytenderheaddetail.Buyer_Quantal,
  dbo.qrytenderheaddetail.Sale_Rate,
  dbo.qrytenderheaddetail.Commission_Rate,
  dbo.qrytenderheaddetail.buyername,
  dbo.qrytenderheaddetail.Company_Code,
  dbo.qrytenderheaddetail.Year_Code,
  dbo.qrytenderheaddetail.tenderid,
  dbo.qrytenderheaddetail.Buyer_Quantal * (
    dbo.qrytenderheaddetail.Sale_Rate + dbo.qrytenderheaddetail.Commission_Rate
  ) + dbo.qrytenderheaddetail.Buyer_Quantal * (
    dbo.qrytenderheaddetail.Sale_Rate + dbo.qrytenderheaddetail.Commission_Rate
  ) * dbo.qrytenderheaddetail.gstrate / 100 AS AMT,
  SUM(ISNULL(dbo.nt_1_transactdetail.amount, 0)) AS received,
  SUM(
    ISNULL(dbo.nt_1_transactdetail.Adjusted_Amount, 0)
  ) AS adjusted,
  (
    dbo.qrytenderheaddetail.Buyer_Quantal * (
      dbo.qrytenderheaddetail.Sale_Rate + dbo.qrytenderheaddetail.Commission_Rate
    ) + dbo.qrytenderheaddetail.Buyer_Quantal * (
      dbo.qrytenderheaddetail.Sale_Rate + dbo.qrytenderheaddetail.Commission_Rate
    ) * dbo.qrytenderheaddetail.gstrate / 100
  ) - (
    SUM(ISNULL(dbo.nt_1_transactdetail.amount, 0)) + SUM(
      ISNULL(dbo.nt_1_transactdetail.Adjusted_Amount, 0)
    )
  ) AS BALANCE,
  dbo.qrytenderheaddetail.tenderdetailid,
  dbo.qrytenderheaddetail.gstrate,
  dbo.qrytenderheaddetail.Sauda_Date
FROM
  dbo.qrytenderheaddetail
  LEFT JOIN dbo.nt_1_transactdetail ON dbo.qrytenderheaddetail.tenderdetailid = dbo.nt_1_transactdetail.tenderdetailid
GROUP BY
  dbo.qrytenderheaddetail.Tender_No,
  dbo.qrytenderheaddetail.Tender_Date,
  dbo.qrytenderheaddetail.payment_date,
  dbo.qrytenderheaddetail.payment_dateConverted,
  dbo.qrytenderheaddetail.Buyer,
  dbo.qrytenderheaddetail.Buyer_Quantal,
  dbo.qrytenderheaddetail.Sale_Rate,
  dbo.qrytenderheaddetail.Commission_Rate,
  dbo.qrytenderheaddetail.buyername,
  dbo.qrytenderheaddetail.Company_Code,
  dbo.qrytenderheaddetail.Year_Code,
  dbo.qrytenderheaddetail.tenderid,
  dbo.qrytenderheaddetail.tenderdetailid,
  dbo.qrytenderheaddetail.gstrate,
  dbo.qrytenderheaddetail.Sauda_Date;