SELECT
  dbo.qrycommissionbill.Tran_Type AS bill_tran_type,
  dbo.qrycommissionbill.doc_no AS billno,
  dbo.qrycommissionbill.doc_date,
  dbo.qrycommissionbill.doc_dateConverted,
  dbo.qrycommissionbill.ac_code,
  dbo.qrycommissionbill.Ac_Name_E,
  dbo.qrycommissionbill.unit_code,
  dbo.qrycommissionbill.mill_code,
  dbo.qrycommissionbill.unitname,
  dbo.qrycommissionbill.millname,
  dbo.qrycommissionbill.qntl,
  dbo.qrycommissionbill.TCS_Net_Payable AS Bill_Amount,
  SUM(ISNULL(dbo.multiple_receipt_detail.Value, 0)) AS received,
  dbo.qrycommissionbill.TCS_Net_Payable - (
    SUM(ISNULL(dbo.multiple_receipt_detail.Value, 0)) + SUM(ISNULL(dbo.multiple_receipt_detail.AcadjAmt, 0))
  ) AS balance,
  dbo.qrycommissionbill.Year_Code,
  dbo.qrycommissionbill.Company_Code,
  dbo.qrycommissionbill.commissionid,
  dbo.qrycommissionbill.millshortname,
  dbo.qrycommissionbill.ac,
  dbo.qrycommissionbill.uc,
  dbo.qrycommissionbill.mc,
  SUM(ISNULL(dbo.multiple_receipt_detail.OnAc, 0)) AS OnAc,
  SUM(ISNULL(dbo.multiple_receipt_detail.AcadjAmt, 0)) AS adjAmt,
  'DO' AS Delivery_type,
  dbo.qrycommissionbill.brokername,
  dbo.qrycommissionbill.broker_code,
  '' AS LORRYNO,
  dbo.qrycommissionbill.mill_rate AS rate,
  dbo.qrycommissionbill.billtoshortname
FROM
  dbo.qrycommissionbill
  LEFT JOIN dbo.multiple_receipt_detail ON dbo.qrycommissionbill.commissionid = dbo.multiple_receipt_detail.Bill_Auto_Id
  AND dbo.qrycommissionbill.Tran_Type = dbo.multiple_receipt_detail.Bill_Tran_Type
WHERE
  (dbo.qrycommissionbill.Tran_Type = 'LV')
GROUP BY
  dbo.qrycommissionbill.Tran_Type,
  dbo.qrycommissionbill.doc_no,
  dbo.qrycommissionbill.doc_date,
  dbo.qrycommissionbill.doc_dateConverted,
  dbo.qrycommissionbill.ac_code,
  dbo.qrycommissionbill.Ac_Name_E,
  dbo.qrycommissionbill.unit_code,
  dbo.qrycommissionbill.mill_code,
  dbo.qrycommissionbill.unitname,
  dbo.qrycommissionbill.millname,
  dbo.qrycommissionbill.qntl,
  dbo.qrycommissionbill.TCS_Net_Payable,
  dbo.qrycommissionbill.Year_Code,
  dbo.qrycommissionbill.Company_Code,
  dbo.qrycommissionbill.commissionid,
  dbo.qrycommissionbill.millshortname,
  dbo.qrycommissionbill.ac,
  dbo.qrycommissionbill.uc,
  dbo.qrycommissionbill.mc,
  dbo.multiple_receipt_detail.OnAc,
  dbo.qrycommissionbill.brokername,
  dbo.qrycommissionbill.broker_code,
  dbo.qrycommissionbill.billtoshortname,
  dbo.qrycommissionbill.mill_rate;