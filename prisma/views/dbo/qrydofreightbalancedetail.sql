SELECT
  dbo.qrydofreight.tran_type,
  dbo.qrydofreight.doc_no,
  dbo.qrydofreight.doc_date,
  dbo.qrydofreight.doc_dateConverted,
  dbo.qrydofreight.mill_code,
  dbo.qrydofreight.quantal,
  dbo.qrydofreight.truck_no,
  dbo.qrydofreight.Memo_Advance,
  dbo.qrydofreight.vasuli_amount,
  dbo.qrydofreight.transport,
  dbo.qrydofreight.transportname,
  dbo.qrydofreight.doid,
  dbo.qrydofreight.Year_Code,
  dbo.qrydofreight.company_code,
  dbo.qrydofreight.millshortname,
  dbo.qrydofreight.salebillname,
  dbo.qrydofreightpaid.DOC_NO AS paidno,
  dbo.qrydofreightpaid.Doc_Date AS paiddate,
  dbo.qrydofreightpaid.Value AS paid,
  dbo.qrydofreightpaid.Adj_Value AS paidadjusted,
  dbo.qrydofreightpaid.Narration,
  dbo.qrydofreightpaid.Bankname,
  dbo.qrydofreight.purc_no,
  dbo.qrydofreight.billtoshortname
FROM
  dbo.qrydofreight
  LEFT JOIN dbo.qrydofreightpaid ON dbo.qrydofreight.doid = dbo.qrydofreightpaid.Bill_Auto_Id;