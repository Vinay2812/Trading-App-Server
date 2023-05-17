SELECT
  dbo.Retail_Head.Doc_No,
  dbo.Retail_Head.Tran_Type,
  CONVERT(varchar(10), dbo.Retail_Head.Doc_Date, 103) AS Doc_Date,
  dbo.Retail_Head.TCS_Net_Payble AS Amount,
  SUM(ISNULL(dbo.nt_1_transactdetail.amount, 0)) AS received,
  ISNULL(dbo.Retail_Head.TCS_Net_Payble, 0) - SUM(ISNULL(dbo.nt_1_transactdetail.amount, 0)) + SUM(
    ISNULL(dbo.nt_1_transactdetail.Adjusted_Amount, 0)
  ) AS Balance,
  dbo.Retail_Head.Party_Code,
  dbo.qrymstaccountmaster.cityname,
  dbo.qrymstaccountmaster.Ac_Name_E AS partyname,
  dbo.Retail_Head.NetWeight,
  dbo.Retail_Head.Retailid,
  dbo.Retail_Head.Company_Code,
  dbo.Retail_Head.Year_Code,
  dbo.nt_1_transactdetail.Adjusted_Amount AS adj,
  dbo.Retail_Head.Doc_Date AS rptdate
FROM
  dbo.Retail_Head
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.Retail_Head.pc = dbo.qrymstaccountmaster.accoid
  LEFT JOIN dbo.nt_1_transactdetail ON dbo.Retail_Head.Retailid = dbo.nt_1_transactdetail.TenderDetail_ID
  AND dbo.Retail_Head.Tran_Type = dbo.nt_1_transactdetail.Voucher_Type
WHERE
  (dbo.Retail_Head.IsDelete = 1)
GROUP BY
  dbo.Retail_Head.Doc_No,
  dbo.Retail_Head.Tran_Type,
  dbo.Retail_Head.Doc_Date,
  dbo.Retail_Head.TCS_Net_Payble,
  dbo.Retail_Head.IsDelete,
  dbo.Retail_Head.Party_Code,
  dbo.qrymstaccountmaster.cityname,
  dbo.qrymstaccountmaster.Ac_Name_E,
  dbo.Retail_Head.NetWeight,
  dbo.Retail_Head.Retailid,
  dbo.Retail_Head.Company_Code,
  dbo.Retail_Head.Year_Code,
  dbo.nt_1_transactdetail.Adjusted_Amount;