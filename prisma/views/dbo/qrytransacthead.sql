SELECT
  dbo.nt_1_transacthead.tran_type,
  dbo.nt_1_transacthead.doc_no,
  dbo.nt_1_transacthead.doc_date,
  CONVERT(varchar(10), dbo.nt_1_transacthead.doc_date, 103) AS doc_dateConverted,
  dbo.nt_1_transacthead.cashbank,
  dbo.nt_1_transacthead.total,
  dbo.nt_1_transacthead.company_code,
  dbo.nt_1_transacthead.year_code,
  dbo.nt_1_transacthead.cb,
  dbo.nt_1_transacthead.tranid,
  dbo.qrymstaccountmaster.Ac_Name_E,
  dbo.qrymstaccountmaster.Short_Name AS BankName,
  dbo.nt_1_transacthead.Created_By,
  dbo.nt_1_transacthead.Modified_By
FROM
  dbo.nt_1_transacthead
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.nt_1_transacthead.cb = dbo.qrymstaccountmaster.accoid;