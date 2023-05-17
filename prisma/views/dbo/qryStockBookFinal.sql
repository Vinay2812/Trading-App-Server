SELECT
  TOP (100) PERCENT dbo.qryStockBookUnion.doc_date,
  dbo.qryStockBookUnion.item_code,
  dbo.qryStockBookUnion.Company_Code,
  dbo.qryStockBookUnion.Year_Code,
  SUM(
    CASE
      WHEN drcr = 'D' THEN quantal
      ELSE 0
    END
  ) AS inward,
  SUM(
    CASE
      WHEN drcr = 'C' THEN quantal
      ELSE 0
    END
  ) AS outward,
  SUM(
    CASE
      WHEN drcr = 'D' THEN itemvalue
      ELSE 0
    END
  ) AS inwardvalue,
  SUM(
    CASE
      WHEN drcr = 'C' THEN itemvalue
      ELSE 0
    END
  ) AS outwardvalue,
  dbo.qrymstitem.System_Name_E AS Item_Name
FROM
  dbo.qryStockBookUnion
  LEFT JOIN dbo.qrymstitem ON dbo.qryStockBookUnion.Company_Code = dbo.qrymstitem.Company_Code
  AND dbo.qryStockBookUnion.item_code = dbo.qrymstitem.System_Code
GROUP BY
  dbo.qryStockBookUnion.doc_date,
  dbo.qryStockBookUnion.item_code,
  dbo.qryStockBookUnion.Company_Code,
  dbo.qryStockBookUnion.Year_Code,
  dbo.qrymstitem.System_Name_E;