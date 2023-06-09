SELECT
  dbo.nt_1_accountmaster.Ac_Name_E,
  dbo.NT_1_JSaleHead.Tran_Type,
  dbo.NT_1_JSaleHead.Cash_Credit,
  dbo.NT_1_JSaleHead.doc_no,
  CONVERT(varchar(10), dbo.NT_1_JSaleHead.doc_date, 103) AS doc_date,
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
  dbo.NT_1_JSaleHead.TDS_Amt,
  dbo.NT_1_JSaleHead.IGST_Rate,
  dbo.NT_1_JSaleHead.IGST_Amount,
  dbo.NT_1_JSaleHead.CGST_Rate,
  dbo.NT_1_JSaleHead.CGST_Amount,
  dbo.NT_1_JSaleHead.SGST_Rate,
  dbo.NT_1_JSaleHead.SGST_Amount,
  dbo.NT_1_JSaleHead.TDS_Rate,
  dbo.NT_1_JSaleHead.TCS_Net_Payable,
  dbo.NT_1_JSaleHead.TCS_Amt,
  dbo.NT_1_JSaleHead.TCS_Rate,
  dbo.NT_1_JSaleHead.GST_RateCode,
  dbo.NT_1_JSaleHead.TaxableAmount,
  dbo.NT_1_JSaleHead.VEHICLE_NO,
  dbo.NT_1_JSaleHead.Eway_Bill_No,
  dbo.NT_1_JSaleHead.einvoiceno,
  dbo.NT_1_JSaleHead.ackno
FROM
  dbo.NT_1_JSaleHead
  JOIN dbo.nt_1_accountmaster ON dbo.NT_1_JSaleHead.Cust_Code = dbo.nt_1_accountmaster.Ac_Code
  AND dbo.NT_1_JSaleHead.Company_Code = dbo.nt_1_accountmaster.company_code;