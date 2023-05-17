SELECT
  dbo.EquityPurchaseSale.Doc_No,
  dbo.EquityPurchaseSale.Tran_Type,
  dbo.EquityPurchaseSale.Date,
  dbo.EquityPurchaseSale.LedgerEntry,
  dbo.EquityPurchaseSale.Script_Code,
  dbo.EquityPurchaseSale.Purc_No,
  dbo.EquityPurchaseSale.Purc_Year_Code,
  dbo.EquityPurchaseSale.Purc_Company_code,
  dbo.EquityPurchaseSale.Qty,
  dbo.EquityPurchaseSale.Bonus,
  dbo.EquityPurchaseSale.Rate,
  dbo.EquityPurchaseSale.Value,
  dbo.EquityPurchaseSale.Profit_Loss,
  dbo.EquityPurchaseSale.Sale_To,
  dbo.EquityPurchaseSale.Brokage,
  dbo.EquityPurchaseSale.Cess_Tax,
  dbo.EquityPurchaseSale.STT,
  dbo.EquityPurchaseSale.Service_Tax,
  dbo.EquityPurchaseSale.Stamp_Charge,
  dbo.EquityPurchaseSale.TurnOver_Tax,
  dbo.EquityPurchaseSale.Net_Value,
  dbo.EquityPurchaseSale.Net_Rate,
  dbo.EquityPurchaseSale.Narration,
  dbo.EquityPurchaseSale.Company_Code,
  dbo.EquityPurchaseSale.Year_Code,
  dbo.EquityPurchaseSale.Created_By,
  dbo.EquityPurchaseSale.Modified_By,
  dbo.EquityPurchaseSale.Created_Date,
  dbo.EquityPurchaseSale.Modified_Date,
  dbo.Script_Master.Script_Name,
  dbo.Script_Master.FNO_Type,
  dbo.nt_1_accountmaster.Ac_Name_E
FROM
  dbo.Script_Master
  RIGHT JOIN dbo.EquityPurchaseSale ON dbo.Script_Master.FNO_Script_No = dbo.EquityPurchaseSale.Script_Code
  AND dbo.Script_Master.Company_Code = dbo.EquityPurchaseSale.Company_Code
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.EquityPurchaseSale.Sale_To = dbo.nt_1_accountmaster.Ac_Code
  AND dbo.EquityPurchaseSale.Company_Code = dbo.nt_1_accountmaster.company_code;