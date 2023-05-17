SELECT
  dbo.qrymanualyPurchase.doc_no,
  dbo.qrymanualyPurchase.doc_date,
  dbo.qrymanualyPurchase.Ac_Code,
  dbo.qrymanualyPurchase.suppliername,
  dbo.qrymanualyPurchase.Bill_Amount,
  dbo.qrymanualyPurchase.purchaseid,
  dbo.qrypurchasepayment.amount AS paid,
  dbo.qrypurchasepayment.Adjusted_Amount AS adjamt,
  dbo.qrypurchasepayment.AcadjAmt AS adjacamt,
  dbo.qrymanualyPurchase.Tran_Type,
  dbo.qrypurchasepayment.amount + dbo.qrypurchasepayment.Adjusted_Amount + dbo.qrypurchasepayment.AcadjAmt AS netpaid,
  dbo.qrymanualyPurchase.Bill_Amount - dbo.qrypurchasepayment.amount + dbo.qrypurchasepayment.Adjusted_Amount + dbo.qrypurchasepayment.AcadjAmt AS billbalance,
  dbo.qrymanualyPurchase.millshortname,
  dbo.qrymanualyPurchase.NETQNTL,
  dbo.qrymanualyPurchase.Company_Code,
  dbo.qrymanualyPurchase.Year_Code,
  dbo.qrypurchasepayment.Tran_Type AS paidtype,
  dbo.qrypurchasepayment.doc_no AS paidno,
  dbo.qrypurchasepayment.doc_date AS paiddate
FROM
  dbo.qrymanualyPurchase
  LEFT JOIN dbo.qrypurchasepayment ON dbo.qrymanualyPurchase.purchaseid = dbo.qrypurchasepayment.TenderDetail_ID;