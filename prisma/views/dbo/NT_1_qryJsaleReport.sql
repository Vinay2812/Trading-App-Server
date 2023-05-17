SELECT
  dbo.NT_1_AccountMaster.Ac_Name_E,
  dbo.NT_1_JSaleHead.Tran_Type,
  dbo.NT_1_JSaleHead.Cash_Credit,
  dbo.NT_1_JSaleHead.doc_no,
  dbo.NT_1_JSaleHead.doc_date,
  dbo.NT_1_JSaleHead.Cust_Code,
  dbo.NT_1_JSaleHead.Shub_Amount,
  dbo.NT_1_JSaleHead.P_Pol_Amount,
  dbo.NT_1_JSaleHead.Company_Code,
  dbo.NT_1_JSaleHead.Year_Code,
  dbo.NT_1_JSaleHead.Created_By,
  dbo.NT_1_JSaleHead.Modified_By,
  dbo.NT_1_JSaleHead.Branch_Code,
  dbo.NT_1_JSaleHead.Total,
  dbo.NT_1_JSaleHead.BillAmt,
  dbo.NT_1_JSaleHead.Khajarat,
  dbo.NT_1_JSaleHead.roundoff,
  dbo.NT_1_JSaleHead.PostPhone,
  SUM(dbo.NT_1_AwakDetail.Qty) AS Qtys
FROM
  dbo.NT_1_JSaleHead
  JOIN dbo.NT_1_AccountMaster ON dbo.NT_1_JSaleHead.Cust_Code = dbo.NT_1_AccountMaster.Ac_Code
  AND dbo.NT_1_JSaleHead.Company_Code = dbo.NT_1_AccountMaster.Company_Code
  LEFT JOIN dbo.NT_1_AwakDetail ON dbo.NT_1_JSaleHead.doc_no = dbo.NT_1_AwakDetail.Bill_No
  AND dbo.NT_1_JSaleHead.Company_Code = dbo.NT_1_AwakDetail.Company_Code
  AND dbo.NT_1_JSaleHead.Year_Code = dbo.NT_1_AwakDetail.Year_Code
GROUP BY
  dbo.NT_1_AccountMaster.Ac_Name_E,
  dbo.NT_1_JSaleHead.Tran_Type,
  dbo.NT_1_JSaleHead.Cash_Credit,
  dbo.NT_1_JSaleHead.doc_no,
  dbo.NT_1_JSaleHead.doc_date,
  dbo.NT_1_JSaleHead.Cust_Code,
  dbo.NT_1_JSaleHead.Shub_Amount,
  dbo.NT_1_JSaleHead.P_Pol_Amount,
  dbo.NT_1_JSaleHead.Company_Code,
  dbo.NT_1_JSaleHead.Year_Code,
  dbo.NT_1_JSaleHead.Created_By,
  dbo.NT_1_JSaleHead.Modified_By,
  dbo.NT_1_JSaleHead.Branch_Code,
  dbo.NT_1_JSaleHead.Total,
  dbo.NT_1_JSaleHead.BillAmt,
  dbo.NT_1_JSaleHead.Khajarat,
  dbo.NT_1_JSaleHead.roundoff,
  dbo.NT_1_JSaleHead.PostPhone;