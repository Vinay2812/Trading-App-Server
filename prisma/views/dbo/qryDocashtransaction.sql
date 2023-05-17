SELECT
  'DO' AS Tran_type,
  dbo.nt_1_deliveryorder.doc_no,
  dbo.nt_1_deliveryorder.doc_date,
  dbo.nt_1_deliveryorder.CashDiffAc AS Ac_Code,
  'Mill: ' + millcode.Short_Name + ', ' + CASE
    WHEN dbo.nt_1_deliveryorder.SaleBillTo = dbo.nt_1_deliveryorder.voucher_by THEN dbo.qrymstaccountmaster.Short_Name
    ELSE qrymstaccountmaster_1.Short_Name
  END + ' Qty:' + CAST(dbo.nt_1_deliveryorder.quantal AS VARCHAR) + ' SR:' + CAST(dbo.nt_1_deliveryorder.sale_rate AS VARCHAR) + ' BPAmt:' + CAST(dbo.nt_1_deliveryorder.Cash_diff AS VARCHAR) + ' ' + dbo.nt_1_deliveryorder.narration2 + 'L:' + dbo.nt_1_deliveryorder.truck_no AS Narration,
  dbo.nt_1_deliveryorder.quantal * ABS(dbo.nt_1_deliveryorder.Cash_diff) AS Amount,
  CASE
    WHEN quantal * Cash_diff > 0 THEN 'D'
    ELSE 'C'
  END AS DRCR,
  dbo.nt_1_deliveryorder.company_code,
  dbo.nt_1_deliveryorder.doid
FROM
  dbo.nt_1_deliveryorder
  LEFT JOIN dbo.qrymstaccountmaster AS qrymstaccountmaster_1 ON dbo.nt_1_deliveryorder.st = qrymstaccountmaster_1.accoid
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.nt_1_deliveryorder.sb = dbo.qrymstaccountmaster.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS millcode ON dbo.nt_1_deliveryorder.mc = millcode.accoid
WHERE
  (
    dbo.nt_1_deliveryorder.quantal * dbo.nt_1_deliveryorder.Cash_diff <> 0
  )
  AND (dbo.nt_1_deliveryorder.purc_no <> 0);