SELECT
  tran_type,
  doc_date,
  mill_code AS Ac_Code,
  itemcode AS item_code,
  quantal,
  'C' AS drcr,
  company_code,
  Year_Code,
  PurchaseRate * quantal AS itemvalue,
  brandcode AS Brand_Code,
  doc_no,
  doc_no AS DoNO,
  mill_code
FROM
  dbo.nt_1_deliveryorder
WHERE
  (voucher_no = 0)
  AND (SB_No > 0)
  AND (purc_no > 0);