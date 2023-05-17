SELECT
  qrysalehead.billtogstno AS billtogstno,
  qrysalehead.doc_no AS doc_no,
  qrysalehead.doc_date AS doc_date,
  qrysalehead.Bill_Amount AS Bill_Amount,
  qrysalehead.billtogststatecode AS billtogststatecode,
  qrysalehead.billtostatename AS billtostatename,
  qrysalehead.gstrate AS gstrate,
  qrysalehead.TaxableAmount AS TaxableAmount,
  'SB' AS tran_type,
  qrysalehead.Company_Code AS Company_Code
FROM
  qrysalehead;