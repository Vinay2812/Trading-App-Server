SELECT
  dbo.OtherInvoice.doc_no,
  dbo.OtherInvoice.doc_date,
  dbo.OtherInvoice.ac_code,
  dbo.OtherInvoice.sale_code,
  dbo.OtherInvoice.narration,
  dbo.OtherInvoice.amount,
  dbo.OtherInvoice.other_narration,
  dbo.OtherInvoice.Company_Code,
  dbo.OtherInvoice.Year_Code,
  dbo.OtherInvoice.Created_By,
  dbo.OtherInvoice.Modified_By,
  dbo.OtherInvoice.bill_id,
  dbo.OtherInvoice.ac,
  dbo.OtherInvoice.sa,
  ac.Ac_Name_E AS Ac_Name,
  sa.Ac_Name_E AS Sale_Name,
  CONVERT(varchar(10), dbo.OtherInvoice.doc_date, 103) AS doc_dateConverted,
  ac.Address_E,
  ac.cityname,
  ac.CompanyPan,
  ac.Pincode
FROM
  dbo.OtherInvoice
  LEFT JOIN dbo.qrymstaccountmaster AS sa ON dbo.OtherInvoice.sa = sa.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS ac ON dbo.OtherInvoice.ac = ac.accoid;