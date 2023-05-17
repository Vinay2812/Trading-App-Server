SELECT
  FNO_Script_No,
  Script_Name,
  SUM(OpeningQty) AS opqty,
  SUM(OpeningBonus) AS opbonus,
  SUM(OpeningValue) AS opvalue,
  SUM(PurchaseQty) AS purqty,
  SUM(PurchaseBonus) AS purbonus,
  SUM(PurchaseValue) AS purvalue,
  Company_Code,
  Year_Code
FROM
  dbo.qryEquityGlobalPurchase
GROUP BY
  FNO_Script_No,
  Script_Name,
  Company_Code,
  Year_Code;