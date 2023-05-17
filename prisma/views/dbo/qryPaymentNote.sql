SELECT
  dbo.PaymentNote.doc_no,
  dbo.PaymentNote.doc_date,
  CONVERT(varchar(10), dbo.PaymentNote.doc_date, 103) AS doc_dateConverted,
  dbo.PaymentNote.bank_ac,
  dbo.PaymentNote.payment_to,
  dbo.PaymentNote.amount,
  dbo.PaymentNote.narration,
  dbo.PaymentNote.Company_Code,
  dbo.PaymentNote.Year_Code,
  dbo.PaymentNote.Created_By,
  dbo.PaymentNote.Modified_By,
  dbo.PaymentNote.pid,
  dbo.PaymentNote.ba,
  dbo.PaymentNote.pt,
  nt_1_accountmaster_1.Ac_Name_E AS Bank_Name,
  dbo.qrymstaccountmaster.Ac_Name_E AS PaymentToName,
  dbo.qrymstaccountmaster.Address_E,
  dbo.qrymstaccountmaster.cityname,
  dbo.qrymstaccountmaster.citypincode,
  dbo.qrymstaccountmaster.citystate
FROM
  dbo.PaymentNote
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.PaymentNote.pt = dbo.qrymstaccountmaster.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.PaymentNote.ba = nt_1_accountmaster_1.accoid;