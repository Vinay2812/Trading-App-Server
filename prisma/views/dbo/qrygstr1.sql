SELECT
  qrygstr1sb.billtogstno AS billtogstno,
  qrygstr1sb.doc_no AS doc_no,
  qrygstr1sb.doc_date AS doc_date,
  qrygstr1sb.Bill_Amount AS Bill_Amount,
  qrygstr1sb.billtogststatecode AS billtogststatecode,
  qrygstr1sb.billtostatename AS billtostatename,
  qrygstr1sb.gstrate AS gstrate,
  qrygstr1sb.TaxableAmount AS TaxableAmount,
  qrygstr1sb.tran_type AS tran_type,
  qrygstr1sb.Company_Code AS Company_Code
FROM
  qrygstr1sb
UNION
SELECT
  qrygst1rs.billtogstno AS billtogstno,
  qrygst1rs.doc_no AS doc_no,
  qrygst1rs.doc_date AS doc_date,
  qrygst1rs.Bill_Amount AS Bill_Amount,
  qrygst1rs.billtogststatecode AS billtogststatecode,
  qrygst1rs.billtostatenam AS billtostatenam,
  qrygst1rs.gstrate AS gstrate,
  qrygst1rs.TaxableAmount AS TaxableAmount,
  qrygst1rs.tran_type AS tran_type,
  qrygst1rs.Company_Code AS Company_Code
FROM
  qrygst1rs
UNION
SELECT
  qrygstr1cb.billtogstno AS billtogstno,
  qrygstr1cb.doc_no AS doc_no,
  qrygstr1cb.doc_date AS doc_date,
  qrygstr1cb.bill_amount AS bill_amount,
  qrygstr1cb.billtogststatecode AS billtogststatecode,
  qrygstr1cb.billtostatename AS billtostatename,
  qrygstr1cb.gstrate AS gstrate,
  qrygstr1cb.TaxableAmount AS TaxableAmount,
  qrygstr1cb.tran_type AS tran_type,
  qrygstr1cb.Company_Code AS Company_Code
FROM
  qrygstr1cb
UNION
SELECT
  qrygstr1rb.billtogstno AS billtogstno,
  qrygstr1rb.Doc_No AS Doc_No,
  qrygstr1rb.doc_date AS doc_date,
  qrygstr1rb.Bill_Amount AS Bill_Amount,
  qrygstr1rb.billtogststatecode AS billtogststatecode,
  qrygstr1rb.billtostatename AS billtostatename,
  qrygstr1rb.gstrate AS gstrate,
  qrygstr1rb.TaxableAmount AS TaxableAmount,
  qrygstr1rb.tran_type AS tran_type,
  qrygstr1rb.Company_Code AS Company_Code
FROM
  qrygstr1rb
UNION
SELECT
  qrygstr1ssr.billtogstno AS billtogstno,
  qrygstr1ssr.doc_no AS doc_no,
  qrygstr1ssr.doc_date AS doc_date,
  qrygstr1ssr.Bill_Amount AS Bill_Amount,
  qrygstr1ssr.billtogststatecode AS billtogststatecode,
  qrygstr1ssr.billtostatename AS billtostatename,
  qrygstr1ssr.gstrate AS gstrate,
  qrygstr1ssr.TaxableAmount AS TaxableAmount,
  qrygstr1ssr.tran_type AS tran_type,
  qrygstr1ssr.Company_Code AS Company_Code
FROM
  qrygstr1ssr;