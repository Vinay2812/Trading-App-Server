SELECT
  'PB' AS Tran_Type,
  dbo.nt_1_sugarpurchase.doc_date,
  dbo.nt_1_sugarpurchase.Ac_Code,
  dbo.nt_1_sugarpurchasedetails.item_code,
  dbo.nt_1_sugarpurchasedetails.Quantal,
  'D' AS drcr,
  dbo.nt_1_sugarpurchase.Company_Code,
  dbo.nt_1_sugarpurchase.Year_Code,
  dbo.nt_1_sugarpurchase.subTotal AS itemvalue,
  dbo.nt_1_sugarpurchasedetails.Brand_Code,
  dbo.nt_1_sugarpurchase.doc_no,
  dbo.nt_1_sugarpurchase.PURCNO AS DoNO,
  dbo.nt_1_sugarpurchase.mill_code
FROM
  dbo.nt_1_companyparameters
  RIGHT JOIN dbo.nt_1_deliveryorder ON dbo.nt_1_companyparameters.Company_Code = dbo.nt_1_deliveryorder.company_code
  AND dbo.nt_1_companyparameters.Year_Code = dbo.nt_1_deliveryorder.Year_Code
  RIGHT JOIN dbo.nt_1_sugarpurchase ON dbo.nt_1_deliveryorder.doc_no = dbo.nt_1_sugarpurchase.PURCNO
  AND dbo.nt_1_deliveryorder.company_code = dbo.nt_1_sugarpurchase.Company_Code
  AND dbo.nt_1_deliveryorder.Year_Code = dbo.nt_1_sugarpurchase.Year_Code
  LEFT JOIN dbo.nt_1_sugarpurchasedetails ON dbo.nt_1_sugarpurchase.purchaseid = dbo.nt_1_sugarpurchasedetails.purchaseid
WHERE
  (dbo.nt_1_sugarpurchase.PURCNO <> 0)
  AND (
    dbo.nt_1_deliveryorder.voucher_by = dbo.nt_1_companyparameters.SELF_AC
  );