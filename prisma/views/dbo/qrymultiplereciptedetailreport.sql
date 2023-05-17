SELECT
  dbo.qrysalehead.Tran_Type AS bill_tran_type,
  dbo.qrysalehead.doc_no AS billno,
  dbo.qrysalehead.doc_date,
  dbo.qrysalehead.doc_dateConverted,
  dbo.qrysalehead.Ac_Code,
  dbo.qrysalehead.billtoname,
  dbo.qrysalehead.Unit_Code,
  dbo.qrysalehead.mill_code,
  dbo.qrysalehead.shiptoname,
  dbo.qrysalehead.millname,
  dbo.qrysalehead.NETQNTL,
  dbo.qrysalehead.Bill_Amount,
  dbo.multiple_receipt_detail.Value AS received,
  dbo.multiple_receipt_detail.AcadjAmt,
  dbo.qrysalehead.Year_Code,
  dbo.qrysalehead.Company_Code,
  dbo.qrysalehead.saleid,
  dbo.qrysalehead.millshortname,
  dbo.qrysalehead.ac,
  dbo.qrysalehead.uc,
  dbo.qrysalehead.mc,
  dbo.multiple_receipt_detail.OnAc,
  dbo.multiple_receipt_detail.Tran_Type AS rectype,
  dbo.multiple_receipt_detail.DOC_NO AS recno
FROM
  dbo.multiple_receipt_detail
  RIGHT JOIN dbo.qrysalehead ON dbo.multiple_receipt_detail.Bill_Auto_Id = dbo.qrysalehead.saleid
  AND dbo.multiple_receipt_detail.Bill_Tran_Type = dbo.qrysalehead.Tran_Type;