SELECT
  i.FNO_Script_No,
  i.Script_Name,
  CASE
    WHEN p.Date < y.Start_Date THEN p.Qty
    ELSE 0
  END AS OpeningQty,
  CASE
    WHEN p.Date < y.Start_Date THEN p.Bonus
    ELSE 0
  END AS OpeningBonus,
  CASE
    WHEN p.Date < y.Start_Date THEN p.Value
    ELSE 0
  END AS OpeningValue,
  CASE
    WHEN p.Date >= y.Start_Date THEN p.Qty
    ELSE 0
  END AS PurchaseQty,
  CASE
    WHEN p.Date >= y.Start_Date THEN p.Bonus
    ELSE 0
  END AS PurchaseBonus,
  CASE
    WHEN p.Date >= y.Start_Date THEN p.Value
    ELSE 0
  END AS PurchaseValue,
  p.Doc_No,
  p.Company_Code,
  p.Year_Code
FROM
  dbo.qryEquityPurchase AS p
  RIGHT JOIN dbo.accountingyear AS y ON p.Company_Code = y.Company_Code
  LEFT JOIN dbo.Script_Master AS i ON p.Script_Code = i.FNO_Script_No;