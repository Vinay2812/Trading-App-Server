SELECT
  qrycommissionbill.Gst_No AS billtogstno,
  qrycommissionbill.doc_no AS doc_no,
  qrycommissionbill.doc_date AS doc_date,
  qrycommissionbill.bill_amount AS bill_amount,
  qrycommissionbill.GSTStateCode AS billtogststatecode,
  qrycommissionbill.billtostatename AS billtostatename,
  qrycommissionbill.Rate AS gstrate,
  qrycommissionbill.texable_amount AS TaxableAmount,
  'CB' AS tran_type,
  qrycommissionbill.Company_Code AS Company_Code
FROM
  qrycommissionbill;