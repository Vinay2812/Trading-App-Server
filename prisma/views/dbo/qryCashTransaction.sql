SELECT
  tran_type,
  doc_no,
  doc_date,
  debit_ac,
  narration,
  amount,
  drcr,
  company_code,
  trandetailid
FROM
  dbo.qrytransactionheaddetail
WHERE
  (amount <> 0);