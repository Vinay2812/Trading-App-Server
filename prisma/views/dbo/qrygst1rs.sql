SELECT
  qryretailsellhead.Gst_No AS billtogstno,
  qryretailsellhead.doc_no AS doc_no,
  qryretailsellhead.doc_date AS doc_date,
  qryretailsellhead.Grand_Total AS Bill_Amount,
  qryretailsellhead.citygststatecode AS billtogststatecode,
  qryretailsellhead.State_Name AS billtostatenam,
  qryretailsellhead.gstrate AS gstrate,
  qryretailsellhead.TaxableAmount AS TaxableAmount,
  'RS' AS tran_type,
  qryretailsellhead.Company_Code AS Company_Code
FROM
  qryretailsellhead;