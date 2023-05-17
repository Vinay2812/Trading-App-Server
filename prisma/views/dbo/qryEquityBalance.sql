SELECT
  dbo.qryEquityPurchase.Doc_No,
  dbo.qryEquityPurchase.Tran_Type,
  dbo.qryEquityPurchase.Date,
  dbo.qryEquityPurchase.LedgerEntry,
  dbo.qryEquityPurchase.Script_Code,
  dbo.qryEquityPurchase.Purc_No,
  dbo.qryEquityPurchase.Purc_Year_Code,
  dbo.qryEquityPurchase.Purc_Company_code,
  dbo.qryEquityPurchase.Qty,
  dbo.qryEquityPurchase.Bonus,
  dbo.qryEquityPurchase.Rate,
  dbo.qryEquityPurchase.Value,
  dbo.qryEquityPurchase.Profit_Loss,
  dbo.qryEquityPurchase.Sale_To,
  dbo.qryEquityPurchase.Brokage,
  dbo.qryEquityPurchase.Cess_Tax,
  dbo.qryEquityPurchase.STT,
  dbo.qryEquityPurchase.Service_Tax,
  dbo.qryEquityPurchase.Stamp_Charge,
  dbo.qryEquityPurchase.TurnOver_Tax,
  dbo.qryEquityPurchase.Net_Value,
  dbo.qryEquityPurchase.Net_Rate,
  dbo.qryEquityPurchase.Narration,
  dbo.qryEquityPurchase.Company_Code,
  dbo.qryEquityPurchase.Year_Code,
  dbo.qryEquityPurchase.Script_Name,
  dbo.qryEquityPurchase.FNO_Type,
  dbo.qryEquityPurchase.Ac_Name_E,
  CASE
    WHEN SUM(dbo.qryEquitysale.Qty) <> 0 THEN SUM(dbo.qryEquitysale.Qty)
    ELSE 0
  END AS Sale,
  dbo.qryEquityPurchase.Qty - (
    CASE
      WHEN SUM(dbo.qryEquitysale.Qty) <> 0 THEN SUM(dbo.qryEquitysale.Qty)
      ELSE 0
    END
  ) AS Balance,
  CASE
    WHEN SUM(dbo.qryEquitysale.Bonus) <> 0 THEN SUM(dbo.qryEquitysale.Bonus)
    ELSE 0
  END AS SaleBonus,
  dbo.qryEquityPurchase.Bonus - (
    CASE
      WHEN SUM(dbo.qryEquitysale.Bonus) <> 0 THEN SUM(dbo.qryEquitysale.Bonus)
      ELSE 0
    END
  ) AS BalanceBonus
FROM
  dbo.qryEquityPurchase
  LEFT JOIN dbo.qryEquitysale ON dbo.qryEquityPurchase.Doc_No = dbo.qryEquitysale.Purc_No
  AND dbo.qryEquityPurchase.Company_Code = dbo.qryEquitysale.Purc_Company_code
  AND dbo.qryEquityPurchase.Year_Code = dbo.qryEquitysale.Purc_Year_Code
GROUP BY
  dbo.qryEquityPurchase.Doc_No,
  dbo.qryEquityPurchase.Tran_Type,
  dbo.qryEquityPurchase.Date,
  dbo.qryEquityPurchase.LedgerEntry,
  dbo.qryEquityPurchase.Script_Code,
  dbo.qryEquityPurchase.Purc_No,
  dbo.qryEquityPurchase.Purc_Year_Code,
  dbo.qryEquityPurchase.Purc_Company_code,
  dbo.qryEquityPurchase.Qty,
  dbo.qryEquityPurchase.Bonus,
  dbo.qryEquityPurchase.Rate,
  dbo.qryEquityPurchase.Value,
  dbo.qryEquityPurchase.Profit_Loss,
  dbo.qryEquityPurchase.Sale_To,
  dbo.qryEquityPurchase.Brokage,
  dbo.qryEquityPurchase.Cess_Tax,
  dbo.qryEquityPurchase.STT,
  dbo.qryEquityPurchase.Service_Tax,
  dbo.qryEquityPurchase.Stamp_Charge,
  dbo.qryEquityPurchase.TurnOver_Tax,
  dbo.qryEquityPurchase.Net_Value,
  dbo.qryEquityPurchase.Net_Rate,
  dbo.qryEquityPurchase.Narration,
  dbo.qryEquityPurchase.Company_Code,
  dbo.qryEquityPurchase.Year_Code,
  dbo.qryEquityPurchase.Script_Name,
  dbo.qryEquityPurchase.FNO_Type,
  dbo.qryEquityPurchase.Ac_Name_E;