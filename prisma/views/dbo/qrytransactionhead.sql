SELECT
  dbo.transacthead.tran_type,
  dbo.transacthead.doc_no,
  dbo.transacthead.doc_date,
  CONVERT(varchar(10), dbo.transacthead.doc_date, 103) AS doc_dateConverted,
  dbo.transacthead.cashbank,
  dbo.transacthead.total,
  dbo.transacthead.company_code,
  dbo.transacthead.year_code,
  dbo.transacthead.cb,
  dbo.transacthead.tranid,
  dbo.qrymstaccountmaster.Ac_Name_E,
  dbo.qrymstaccountmaster.Short_Name AS BankName,
  dbo.transacthead.Created_By,
  dbo.transacthead.Modified_By
FROM
  dbo.transacthead
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.transacthead.cb = dbo.qrymstaccountmaster.accoid;