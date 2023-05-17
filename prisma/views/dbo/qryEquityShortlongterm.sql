SELECT
  dbo.qryEquityPurchase.Doc_No,
  dbo.qryEquityPurchase.Date,
  dbo.qryEquityPurchase.Script_Code,
  dbo.Script_Master.Script_Name,
  dbo.qryEquityPurchase.Qty,
  dbo.qryEquityPurchase.Bonus,
  dbo.qryEquityPurchase.Rate,
  dbo.qryEquityPurchase.Value,
  dbo.qryEquitysale.Date AS saledate,
  dbo.qryEquitysale.Qty AS saleqty,
  dbo.qryEquitysale.Bonus AS salebonus,
  dbo.qryEquitysale.Rate AS salerate,
  dbo.qryEquitysale.Value AS salevalue,
  dbo.qryEquitysale.Value - dbo.qryEquitysale.Qty * dbo.qryEquityPurchase.Rate AS profit,
  DATEDIFF(
    DAY,
    dbo.qryEquityPurchase.Date,
    dbo.qryEquitysale.Date
  ) AS Days,
  dbo.qryEquityPurchase.Company_Code,
  dbo.qryEquityPurchase.Year_Code,
  CASE
    WHEN DATEDIFF(
      DAY,
      dbo.qryEquityPurchase.Date,
      dbo.qryEquitysale.Date
    ) = 0 THEN 'IntraDay'
    WHEN DATEDIFF(
      DAY,
      dbo.qryEquityPurchase.Date,
      dbo.qryEquitysale.Date
    ) < 367 THEN 'ShortTerm'
    ELSE 'LongTerm'
  END AS TradingType,
  dbo.qryEquitysale.Doc_No AS saleNo
FROM
  dbo.qryEquityPurchase
  JOIN dbo.Script_Master ON dbo.qryEquityPurchase.Script_Code = dbo.Script_Master.FNO_Script_No
  JOIN dbo.qryEquitysale ON dbo.qryEquityPurchase.Doc_No = dbo.qryEquitysale.Purc_No
  AND dbo.qryEquityPurchase.Company_Code = dbo.qryEquitysale.Purc_Company_code
  AND dbo.qryEquityPurchase.Year_Code = dbo.qryEquitysale.Purc_Year_Code;