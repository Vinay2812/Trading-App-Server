SELECT
  dbo.qryEquityGlobalPurchaseSale.FNO_Script_No,
  dbo.qryEquityGlobalPurchaseSale.Script_Name,
  dbo.qryEquityGlobalPurchaseSale.opqty,
  dbo.qryEquityGlobalPurchaseSale.opbonus,
  dbo.qryEquityGlobalPurchaseSale.opvalue,
  dbo.qryEquityGlobalPurchaseSale.purqty,
  dbo.qryEquityGlobalPurchaseSale.purbonus,
  dbo.qryEquityGlobalPurchaseSale.purvalue,
  dbo.qryEquityGlobalPurchaseSale.Company_Code,
  dbo.qryEquityGlobalPurchaseSale.Year_Code,
  dbo.qryEquityGlobalPurchaseSale.saleqty,
  dbo.qryEquityGlobalPurchaseSale.salebonus,
  dbo.qryEquityGlobalPurchaseSale.salevalue,
  dbo.qryEquityGlobalClosingBalance.ClosingValue,
  dbo.qryEquityGlobalClosingBalance.balbonus,
  dbo.qryEquityGlobalClosingBalance.bal,
  CASE
    WHEN (opvalue + purvalue) - (
      dbo.qryEquityGlobalClosingBalance.ClosingValue + salevalue
    ) > 0 THEN (opvalue + purvalue) - (
      dbo.qryEquityGlobalClosingBalance.ClosingValue + salevalue
    )
    ELSE 0
  END AS Loss,
  CASE
    WHEN (opvalue + purvalue) - (
      dbo.qryEquityGlobalClosingBalance.ClosingValue + salevalue
    ) < 0 THEN (
      dbo.qryEquityGlobalClosingBalance.ClosingValue + salevalue
    ) - (opvalue + purvalue)
    ELSE 0
  END AS Profit,
  CASE
    WHEN bal > 0 THEN ClosingValue / bal
    ELSE 0
  END AS ClosingRate
FROM
  dbo.qryEquityGlobalPurchaseSale
  LEFT JOIN dbo.qryEquityGlobalClosingBalance ON dbo.qryEquityGlobalPurchaseSale.Company_Code = dbo.qryEquityGlobalClosingBalance.Company_Code
  AND dbo.qryEquityGlobalPurchaseSale.Year_Code = dbo.qryEquityGlobalClosingBalance.Year_Code
  AND dbo.qryEquityGlobalPurchaseSale.FNO_Script_No = dbo.qryEquityGlobalClosingBalance.Script_Code;