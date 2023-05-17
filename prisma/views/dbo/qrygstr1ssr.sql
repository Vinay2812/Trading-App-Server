SELECT
  qrysugarsalereturnhead.billtogstno AS billtogstno,
  qrysugarsalereturnhead.doc_no AS doc_no,
  qrysugarsalereturnhead.doc_date AS doc_date,
  qrysugarsalereturnhead.Bill_Amount AS Bill_Amount,
  qrysugarsalereturnhead.billtostatecode AS billtogststatecode,
  qrysugarsalereturnhead.billtostatename AS billtostatename,
  qrysugarsalereturnhead.gstrate AS gstrate,
  qrysugarsalereturnhead.subTotal AS TaxableAmount,
  'SSR' AS tran_type,
  qrysugarsalereturnhead.Company_Code AS Company_Code
FROM
  qrysugarsalereturnhead;