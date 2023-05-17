SELECT
  dbo.qrydohead.tran_type,
  dbo.qrydohead.doc_no,
  dbo.qrydohead.doc_date,
  dbo.qrydohead.transportname,
  dbo.qrydohead.billtoshortname,
  dbo.qrydohead.Memo_Advance,
  dbo.qrydohead.truck_no,
  dbo.qrydohead.TransportGSTStateCode,
  dbo.nt_1_gstratemaster.Rate,
  dbo.qrydohead.RCMCGSTAmt,
  dbo.qrydohead.RCMSGSTAmt,
  dbo.qrydohead.RCMIGSTAmt,
  dbo.qrydohead.company_code,
  dbo.qrydohead.Year_Code
FROM
  dbo.qrydohead
  JOIN dbo.nt_1_gstratemaster ON dbo.qrydohead.MemoGSTRate = dbo.nt_1_gstratemaster.Doc_no
  AND dbo.qrydohead.company_code = dbo.nt_1_gstratemaster.Company_Code;