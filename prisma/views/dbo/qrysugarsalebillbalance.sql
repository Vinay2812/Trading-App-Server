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
  dbo.qrysalehead.TCS_Net_Payable - SUM(ISNULL(dbo.qrysalehead.TDS_Amt, 0)) AS Bill_Amount,
  SUM(ISNULL(dbo.multiple_receipt_detail.Value, 0)) AS received,
  dbo.qrysalehead.TCS_Net_Payable - (
    SUM(ISNULL(dbo.multiple_receipt_detail.Value, 0)) + SUM(ISNULL(dbo.multiple_receipt_detail.AcadjAmt, 0))
  ) AS balance,
  dbo.qrysalehead.Year_Code,
  dbo.qrysalehead.Company_Code,
  dbo.qrysalehead.saleid,
  dbo.qrysalehead.millshortname,
  dbo.qrysalehead.ac,
  dbo.qrysalehead.uc,
  dbo.qrysalehead.mc,
  SUM(ISNULL(dbo.multiple_receipt_detail.OnAc, 0)) AS OnAc,
  SUM(ISNULL(dbo.multiple_receipt_detail.AcadjAmt, 0)) AS adjAmt,
  dbo.qrysalehead.Delivery_type,
  dbo.qrysalehead.brokername,
  dbo.qrysalehead.BROKER,
  dbo.qrysalehead.LORRYNO,
  dbo.nt_1_sugarsaledetails.rate,
  dbo.qrysalehead.billtoShortname
FROM
  dbo.qrysalehead
  LEFT JOIN dbo.nt_1_sugarsaledetails ON dbo.qrysalehead.saleid = dbo.nt_1_sugarsaledetails.saleid
  LEFT JOIN dbo.multiple_receipt_detail ON dbo.qrysalehead.saleid = dbo.multiple_receipt_detail.Bill_Auto_Id
  AND dbo.qrysalehead.Tran_Type = dbo.multiple_receipt_detail.Bill_Tran_Type
WHERE
  (dbo.qrysalehead.IsDeleted = 1)
GROUP BY
  dbo.qrysalehead.Tran_Type,
  dbo.qrysalehead.doc_no,
  dbo.qrysalehead.doc_date,
  dbo.qrysalehead.doc_dateConverted,
  dbo.qrysalehead.Ac_Code,
  dbo.qrysalehead.billtoname,
  dbo.qrysalehead.Unit_Code,
  dbo.qrysalehead.mill_code,
  dbo.qrysalehead.shiptoname,
  dbo.qrysalehead.millname,
  dbo.qrysalehead.NETQNTL,
  dbo.qrysalehead.TCS_Net_Payable,
  dbo.qrysalehead.Year_Code,
  dbo.qrysalehead.Company_Code,
  dbo.qrysalehead.saleid,
  dbo.qrysalehead.millshortname,
  dbo.qrysalehead.ac,
  dbo.qrysalehead.uc,
  dbo.qrysalehead.mc,
  dbo.multiple_receipt_detail.OnAc,
  dbo.qrysalehead.Delivery_type,
  dbo.qrysalehead.brokername,
  dbo.qrysalehead.BROKER,
  dbo.qrysalehead.LORRYNO,
  dbo.nt_1_sugarsaledetails.rate,
  dbo.qrysalehead.billtoShortname;