SELECT
  dbo.qrydebitnotehead.tran_type AS bill_tran_type,
  dbo.qrydebitnotehead.doc_no AS billno,
  dbo.qrydebitnotehead.doc_date,
  dbo.qrydebitnotehead.doc_dateConverted,
  dbo.qrydebitnotehead.ac_code,
  dbo.qrydebitnotehead.Ac_Name_E,
  dbo.qrydebitnotehead.Unit_Code,
  dbo.qrydebitnotehead.Mill_Code,
  dbo.qrydebitnotehead.ShopTo_Name,
  dbo.qrydebitnotehead.Mill_Name,
  '0' AS NETQNTL,
  dbo.qrydebitnotehead.TCS_Net_Payable AS Bill_Amount,
  SUM(ISNULL(dbo.multiple_receipt_detail.Value, 0)) AS received,
  dbo.qrydebitnotehead.TCS_Net_Payable - (
    SUM(ISNULL(dbo.multiple_receipt_detail.Value, 0)) + SUM(ISNULL(dbo.multiple_receipt_detail.AcadjAmt, 0))
  ) AS balance,
  dbo.qrydebitnotehead.Year_Code,
  dbo.qrydebitnotehead.Company_Code,
  dbo.qrydebitnotehead.dcid,
  dbo.qrydebitnotehead.millshortname,
  dbo.qrydebitnotehead.ac,
  dbo.qrydebitnotehead.uc,
  dbo.qrydebitnotehead.mc,
  SUM(ISNULL(dbo.multiple_receipt_detail.OnAc, 0)) AS OnAc,
  SUM(ISNULL(dbo.multiple_receipt_detail.AcadjAmt, 0)) AS adjAmt,
  '' AS Delivery_type,
  '' AS brokername,
  '0' AS BROKER,
  '' AS LORRYNO,
  '0' AS rate,
  dbo.qrydebitnotehead.Short_Name
FROM
  dbo.qrydebitnotehead
  LEFT JOIN dbo.multiple_receipt_detail ON dbo.qrydebitnotehead.dcid = dbo.multiple_receipt_detail.Bill_Auto_Id
  AND dbo.qrydebitnotehead.tran_type = dbo.multiple_receipt_detail.Bill_Tran_Type
WHERE
  (dbo.qrydebitnotehead.tran_type = 'DN')
  AND (dbo.qrydebitnotehead.IsDeleted = 1)
GROUP BY
  dbo.qrydebitnotehead.tran_type,
  dbo.qrydebitnotehead.doc_no,
  dbo.qrydebitnotehead.doc_date,
  dbo.qrydebitnotehead.doc_dateConverted,
  dbo.qrydebitnotehead.ac_code,
  dbo.qrydebitnotehead.Ac_Name_E,
  dbo.qrydebitnotehead.Unit_Code,
  dbo.qrydebitnotehead.Mill_Code,
  dbo.qrydebitnotehead.ShopTo_Name,
  dbo.qrydebitnotehead.Mill_Name,
  dbo.qrydebitnotehead.TCS_Net_Payable,
  dbo.qrydebitnotehead.Year_Code,
  dbo.qrydebitnotehead.Company_Code,
  dbo.qrydebitnotehead.dcid,
  dbo.qrydebitnotehead.millshortname,
  dbo.qrydebitnotehead.ac,
  dbo.qrydebitnotehead.uc,
  dbo.qrydebitnotehead.mc,
  dbo.multiple_receipt_detail.OnAc,
  dbo.qrydebitnotehead.Short_Name;