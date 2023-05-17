SELECT
  qryrentbillhead.Gst_No AS billtogstno,
  qryrentbillhead.Doc_No AS Doc_No,
  qryrentbillhead.Date AS doc_date,
  qryrentbillhead.Final_Amount AS Bill_Amount,
  qryrentbillhead.GSTStateCode AS billtogststatecode,
  qryrentbillhead.billtostatename AS billtostatename,
  qryrentbillhead.gstrate AS gstrate,
  qryrentbillhead.Subtotal AS TaxableAmount,
  'RB' AS tran_type,
  qryrentbillhead.Company_Code AS Company_Code
FROM
  qryrentbillhead;