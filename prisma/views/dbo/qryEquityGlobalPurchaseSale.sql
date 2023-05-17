SELECT
  dbo.qryEquityGlobalPurchaseSummary.FNO_Script_No,
  dbo.qryEquityGlobalPurchaseSummary.Script_Name,
  dbo.qryEquityGlobalPurchaseSummary.opqty,
  dbo.qryEquityGlobalPurchaseSummary.opbonus,
  dbo.qryEquityGlobalPurchaseSummary.opvalue,
  dbo.qryEquityGlobalPurchaseSummary.purqty,
  dbo.qryEquityGlobalPurchaseSummary.purbonus,
  dbo.qryEquityGlobalPurchaseSummary.purvalue,
  dbo.qryEquityGlobalPurchaseSummary.Company_Code,
  dbo.qryEquityGlobalPurchaseSummary.Year_Code,
  SUM(dbo.qryEquitysale.Qty) AS saleqty,
  SUM(dbo.qryEquitysale.Bonus) AS salebonus,
  SUM(dbo.qryEquitysale.Value) AS salevalue
FROM
  dbo.qryEquityGlobalPurchaseSummary
  LEFT JOIN dbo.qryEquitysale ON dbo.qryEquityGlobalPurchaseSummary.FNO_Script_No = dbo.qryEquitysale.Script_Code
  AND dbo.qryEquityGlobalPurchaseSummary.Company_Code = dbo.qryEquitysale.Company_Code
  AND dbo.qryEquityGlobalPurchaseSummary.Year_Code = dbo.qryEquitysale.Year_Code
GROUP BY
  dbo.qryEquityGlobalPurchaseSummary.FNO_Script_No,
  dbo.qryEquityGlobalPurchaseSummary.Script_Name,
  dbo.qryEquityGlobalPurchaseSummary.opqty,
  dbo.qryEquityGlobalPurchaseSummary.opbonus,
  dbo.qryEquityGlobalPurchaseSummary.opvalue,
  dbo.qryEquityGlobalPurchaseSummary.purqty,
  dbo.qryEquityGlobalPurchaseSummary.purbonus,
  dbo.qryEquityGlobalPurchaseSummary.purvalue,
  dbo.qryEquityGlobalPurchaseSummary.Company_Code,
  dbo.qryEquityGlobalPurchaseSummary.Year_Code;