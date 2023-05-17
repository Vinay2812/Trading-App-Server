SELECT
  dbo.Future_Head.Doc_No,
  CONVERT(varchar(10), dbo.Future_Head.Doc_Date, 103) AS docdate,
  dbo.Future_Head.Ac_Code,
  dbo.Future_Head.Bill_No,
  dbo.Future_Head.Sattlement_No,
  dbo.Future_Head.Remark,
  dbo.Future_Head.NetBrokrage,
  dbo.Future_Head.Net_cgst,
  dbo.Future_Head.Net_sgst,
  dbo.Future_Head.Net_igst,
  dbo.Future_Head.Net_stt,
  dbo.Future_Head.Net_StampDuty,
  dbo.Future_Head.Net_pnl,
  dbo.Future_Head.Company_Code,
  dbo.Future_Head.Year_code,
  dbo.Future_Head.Modified_By,
  dbo.Future_Head.Created_By,
  dbo.Future_Head.Modified_Date,
  dbo.Future_Head.Created_Date,
  dbo.Future_Detail.detail_Id,
  dbo.Future_Detail.Script_Code,
  CONVERT(varchar(10), dbo.Future_Detail.Expiry_Date, 103) AS expriydate,
  dbo.Future_Detail.Lot_Size,
  dbo.Future_Detail.Future_Type,
  dbo.Future_Detail.Buy_Sale,
  dbo.Future_Detail.Lot_Qty,
  dbo.Future_Detail.Rate,
  dbo.Future_Detail.Value,
  dbo.Future_Detail.Strike_Price,
  dbo.Future_Detail.AutoCarry,
  dbo.nt_1_accountmaster.Ac_Name_E AS brokername,
  dbo.Script_Master.Script_Name AS scriptname,
  dbo.Future_Head.Net_Exchange_Charges,
  dbo.Future_Head.Net_STF,
  dbo.Future_Head.Net_CM_Charge,
  dbo.Future_Head.Net_Postage,
  dbo.Future_Head.Net_Expenses,
  dbo.Future_Head.Net_ProfitLoss,
  dbo.Future_Head.Doc_Date,
  dbo.Future_Detail.Expiry_Date
FROM
  dbo.Script_Master
  RIGHT JOIN dbo.Future_Detail ON dbo.Script_Master.Year_Code = dbo.Future_Detail.Year_Code
  AND dbo.Script_Master.Company_Code = dbo.Future_Detail.Company_Code
  AND dbo.Script_Master.FNO_Script_No = dbo.Future_Detail.Script_Code
  RIGHT JOIN dbo.Future_Head
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.Future_Head.Ac_Code = dbo.nt_1_accountmaster.Ac_Code
  AND dbo.Future_Head.Company_Code = dbo.nt_1_accountmaster.company_code;