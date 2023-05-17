SELECT
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
  dbo.NT_1_JSaleHead.PostPhone,
  dbo.NT_1_JSaleHead.roundoff,
  dbo.NT_1_JSaleHead.inword,
  dbo.NT_1_JSaleHead.TenKg,
  dbo.NT_1_JSaleHead.Fivekg,
  dbo.NT_1_JSaleHead.ThirtyKg,
  dbo.NT_1_JSaleHead.Box,
  dbo.NT_1_AccountMaster.Ac_Name_E,
  ISNULL(dbo.Nt_1_qrynetqtyfor5kgboxreport.NetQty, 0) AS Fivekgbox
FROM
  dbo.NT_1_JSaleHead
  LEFT JOIN dbo.Nt_1_qrynetqtyfor5kgboxreport ON dbo.NT_1_JSaleHead.Tran_Type = dbo.Nt_1_qrynetqtyfor5kgboxreport.TRAN_TYPE
  AND dbo.NT_1_JSaleHead.doc_no = dbo.Nt_1_qrynetqtyfor5kgboxreport.DOC_NO
  AND dbo.NT_1_JSaleHead.Company_Code = dbo.Nt_1_qrynetqtyfor5kgboxreport.COMPANY_CODE
  AND dbo.NT_1_JSaleHead.Year_Code = dbo.Nt_1_qrynetqtyfor5kgboxreport.YEAR_CODE
  LEFT JOIN dbo.NT_1_AccountMaster ON dbo.NT_1_JSaleHead.Cust_Code = dbo.NT_1_AccountMaster.Ac_Code
  AND dbo.NT_1_JSaleHead.Company_Code = dbo.NT_1_AccountMaster.Company_Code;