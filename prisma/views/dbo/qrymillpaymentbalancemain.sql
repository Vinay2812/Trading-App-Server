SELECT
  dbo.nt_1_tender.tenderid,
  dbo.nt_1_tender.Tender_No,
  dbo.nt_1_tender.Company_Code,
  dbo.nt_1_tender.Tender_Date,
  dbo.nt_1_tender.Year_Code,
  dbo.nt_1_tender.Lifting_Date,
  dbo.nt_1_tender.Mill_Code,
  dbo.nt_1_tender.Grade,
  dbo.nt_1_tender.Quantal,
  dbo.nt_1_tender.Payment_To,
  dbo.nt_1_tender.Mill_Rate,
  dbo.nt_1_tender.Excise_Rate,
  dbo.nt_1_tender.Mill_Rate + dbo.nt_1_tender.Excise_Rate AS millrategst,
  dbo.nt_1_tender.Quantal * (
    dbo.nt_1_tender.Mill_Rate + dbo.nt_1_tender.Excise_Rate
  ) + ISNULL(dbo.nt_1_tender.TCS_Amt, 0) AS millamount,
  dbo.nt_1_utrdetail.utrdetailid,
  dbo.nt_1_utrdetail.amount AS detailamount,
  SUM(ISNULL(dbo.nt_1_utrdetail.amount, 0)) AS paidamount,
  ISNULL(dbo.nt_1_utrdetail.Adjusted_Amt, 0) AS adjusted,
  (
    dbo.nt_1_tender.Quantal * (
      dbo.nt_1_tender.Mill_Rate + dbo.nt_1_tender.Excise_Rate
    ) + ISNULL(dbo.nt_1_tender.TCS_Amt, 0)
  ) - (
    SUM(ISNULL(dbo.nt_1_utrdetail.amount, 0)) + SUM(ISNULL(dbo.nt_1_utrdetail.Adjusted_Amt, 0))
  ) AS payableamount,
  CONVERT(varchar(10), dbo.nt_1_tender.Tender_Date, 103) AS Tender_DateConverted,
  CONVERT(varchar(10), dbo.nt_1_tender.Lifting_Date, 103) AS Lifting_DateConverted,
  dbo.nt_1_tender.pt,
  dbo.nt_1_tender.mc,
  dbo.nt_1_tender.TCS_Amt
FROM
  dbo.nt_1_tender
  LEFT JOIN dbo.nt_1_utrdetail ON dbo.nt_1_tender.tenderid = dbo.nt_1_utrdetail.ln
GROUP BY
  dbo.nt_1_utrdetail.Adjusted_Amt,
  dbo.nt_1_tender.pt,
  dbo.nt_1_tender.mc,
  dbo.nt_1_tender.tenderid,
  dbo.nt_1_tender.Tender_No,
  dbo.nt_1_tender.Company_Code,
  dbo.nt_1_tender.Tender_Date,
  dbo.nt_1_tender.Year_Code,
  dbo.nt_1_tender.Lifting_Date,
  dbo.nt_1_tender.Mill_Code,
  dbo.nt_1_tender.Grade,
  dbo.nt_1_tender.Quantal,
  dbo.nt_1_tender.Payment_To,
  dbo.nt_1_tender.Mill_Rate,
  dbo.nt_1_tender.Excise_Rate,
  dbo.nt_1_tender.TCS_Amt,
  dbo.nt_1_utrdetail.utrdetailid,
  dbo.nt_1_utrdetail.amount;