SELECT
  dbo.nt_1_sugarpurchase.Company_Code,
  dbo.nt_1_sugarpurchase.Year_Code,
  YEAR(dbo.nt_1_sugarpurchase.doc_date) AS yr,
  MONTH(dbo.nt_1_sugarpurchase.doc_date) AS mn,
  ISNULL(SUM(dbo.nt_1_sugarpurchasedetails.Quantal), 0) AS qntl,
  ISNULL(
    SUM(dbo.nt_1_sugarpurchasedetails.item_Amount),
    0
  ) AS itemamt
FROM
  dbo.nt_1_sugarpurchase
  JOIN dbo.nt_1_sugarpurchasedetails ON dbo.nt_1_sugarpurchase.purchaseid = dbo.nt_1_sugarpurchasedetails.purchaseid
GROUP BY
  dbo.nt_1_sugarpurchase.Company_Code,
  dbo.nt_1_sugarpurchase.Year_Code,
  YEAR(dbo.nt_1_sugarpurchase.doc_date),
  MONTH(dbo.nt_1_sugarpurchase.doc_date);