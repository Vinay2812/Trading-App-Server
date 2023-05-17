SELECT
  dbo.Future_Sattlement_Detail.Doc_No,
  dbo.Future_Sattlement_Detail.detail_Id,
  dbo.Future_Sattlement_Detail.Script_Code,
  dbo.Future_Sattlement_Detail.Expiry_Date,
  dbo.Future_Sattlement_Detail.Lot_Size,
  dbo.Future_Sattlement_Detail.Future_Type,
  dbo.Future_Sattlement_Detail.Buy_Qty,
  dbo.Future_Sattlement_Detail.Buy_Rate,
  dbo.Future_Sattlement_Detail.Buy_Value,
  dbo.Future_Sattlement_Detail.Sale_Qty,
  dbo.Future_Sattlement_Detail.Sale_Rate,
  dbo.Future_Sattlement_Detail.Sale_Value,
  dbo.Future_Sattlement_Detail.Strike_Price,
  dbo.Future_Sattlement_Detail.Closing_Rate,
  dbo.Future_Sattlement_Detail.Closing_Value,
  dbo.Future_Sattlement_Detail.Profit_Loss,
  dbo.Future_Sattlement_Detail.Brokrage,
  dbo.Future_Sattlement_Detail.CGST,
  dbo.Future_Sattlement_Detail.SGST,
  dbo.Future_Sattlement_Detail.IGST,
  dbo.Future_Sattlement_Detail.STT,
  dbo.Future_Sattlement_Detail.Stamp_Duty,
  dbo.Future_Sattlement_Detail.Gross_Pnl,
  dbo.Future_Sattlement_Detail.Company_Code,
  dbo.Future_Sattlement_Detail.Year_Code,
  dbo.Future_Sattlement_Detail.Closing_Qty,
  dbo.Script_Master.Script_Name,
  dbo.Future_Head.Ac_Code,
  dbo.Future_Head.Doc_Date
FROM
  dbo.Future_Sattlement_Detail
  LEFT JOIN dbo.Future_Head ON dbo.Future_Sattlement_Detail.Doc_No = dbo.Future_Head.Doc_No
  AND dbo.Future_Sattlement_Detail.Company_Code = dbo.Future_Head.Company_Code
  AND dbo.Future_Sattlement_Detail.Year_Code = dbo.Future_Head.Year_code
  LEFT JOIN dbo.Script_Master ON dbo.Future_Sattlement_Detail.Company_Code = dbo.Script_Master.Company_Code
  AND dbo.Future_Sattlement_Detail.Script_Code = dbo.Script_Master.FNO_Script_No;