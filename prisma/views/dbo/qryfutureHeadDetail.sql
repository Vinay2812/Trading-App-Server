SELECT
  dbo.Future_Head.Doc_No,
  dbo.Future_Head.Doc_Date,
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
  dbo.Future_Detail.detail_Id,
  dbo.Future_Detail.Script_Code,
  dbo.Script_Master.Script_Name,
  dbo.Future_Detail.Expiry_Date,
  dbo.Future_Detail.Lot_Size,
  dbo.Future_Detail.Future_Type,
  dbo.Future_Detail.Buy_Sale,
  dbo.Future_Detail.Lot_Qty,
  dbo.Future_Detail.Rate,
  dbo.Future_Detail.Value,
  dbo.Future_Detail.Strike_Price,
  dbo.nt_1_accountmaster.Ac_Name_E,
  dbo.Future_Detail.AutoCarry
FROM
  dbo.Future_Head
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.Future_Head.Ac_Code = dbo.nt_1_accountmaster.Ac_Code
  AND dbo.Future_Head.Company_Code = dbo.nt_1_accountmaster.company_code
  LEFT JOIN dbo.Future_Detail ON dbo.Future_Head.Doc_No = dbo.Future_Detail.Doc_No
  AND dbo.Future_Head.Company_Code = dbo.Future_Detail.Company_Code
  AND dbo.Future_Head.Year_code = dbo.Future_Detail.Year_Code
  LEFT JOIN dbo.Script_Master ON dbo.Future_Detail.Script_Code = dbo.Script_Master.FNO_Script_No
  AND dbo.Future_Detail.Company_Code = dbo.Script_Master.Company_Code;