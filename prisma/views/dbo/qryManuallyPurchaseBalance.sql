SELECT
  dbo.qrymanualyPurchase.doc_no,
  dbo.qrymanualyPurchase.doc_date,
  dbo.qrymanualyPurchase.Ac_Code,
  dbo.qrymanualyPurchase.suppliername,
  dbo.qrymanualyPurchase.Bill_Amount,
  dbo.qrymanualyPurchase.purchaseid,
  SUM(ISNULL(dbo.qrypurchasepayment.amount, 0)) AS paid,
  SUM(
    ISNULL(dbo.qrypurchasepayment.Adjusted_Amount, 0)
  ) AS adjamt,
  SUM(ISNULL(dbo.qrypurchasepayment.AcadjAmt, 0)) AS adjacamt,
  dbo.qrymanualyPurchase.Tran_Type,
  SUM(ISNULL(dbo.qrypurchasepayment.amount, 0)) + SUM(
    ISNULL(dbo.qrypurchasepayment.Adjusted_Amount, 0)
  ) + SUM(ISNULL(dbo.qrypurchasepayment.AcadjAmt, 0)) AS netpaid,
  dbo.qrymanualyPurchase.Bill_Amount - (
    SUM(ISNULL(dbo.qrypurchasepayment.amount, 0)) + SUM(
      ISNULL(dbo.qrypurchasepayment.Adjusted_Amount, 0)
    ) + SUM(ISNULL(dbo.qrypurchasepayment.AcadjAmt, 0))
  ) AS billbalance,
  dbo.qrymanualyPurchase.millshortname,
  dbo.qrymanualyPurchase.NETQNTL,
  dbo.qrymanualyPurchase.Company_Code,
  dbo.qrymanualyPurchase.Year_Code
FROM
  dbo.qrymanualyPurchase
  LEFT JOIN dbo.qrypurchasepayment ON dbo.qrymanualyPurchase.purchaseid = dbo.qrypurchasepayment.TenderDetail_ID
GROUP BY
  dbo.qrymanualyPurchase.doc_no,
  dbo.qrymanualyPurchase.doc_date,
  dbo.qrymanualyPurchase.Ac_Code,
  dbo.qrymanualyPurchase.suppliername,
  dbo.qrymanualyPurchase.Bill_Amount,
  dbo.qrymanualyPurchase.purchaseid,
  dbo.qrymanualyPurchase.Tran_Type,
  dbo.qrymanualyPurchase.millshortname,
  dbo.qrymanualyPurchase.NETQNTL,
  dbo.qrymanualyPurchase.Company_Code,
  dbo.qrymanualyPurchase.Year_Code;