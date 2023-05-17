SELECT
  tenderid,
  Tender_No,
  Tender_Date,
  Company_Code,
  Year_Code,
  Lifting_Date,
  Mill_Code,
  millname,
  Grade,
  Quantal,
  Payment_To,
  paymenttoname,
  Mill_Rate,
  Excise_Rate,
  Mill_Rate + Excise_Rate AS millrategst,
  Quantal * (Mill_Rate + Excise_Rate) + ISNULL(TCS_Amt, 0) AS millamount,
  utrdetailid,
  SUM(ISNULL(detailamount, 0)) AS paidamount,
  SUM(ISNULL(Adjusted_Amt, 0)) AS adjusted,
  (
    Quantal * (Mill_Rate + Excise_Rate) + ISNULL(TCS_Amt, 0)
  ) - (
    SUM(ISNULL(detailamount, 0)) + SUM(ISNULL(Adjusted_Amt, 0))
  ) AS payableamount,
  Tender_DateConverted,
  Lifting_DateConverted,
  TCS_Amt
FROM
  dbo.qrymillpaymentdetail
GROUP BY
  tenderid,
  Tender_No,
  Tender_Date,
  Company_Code,
  Year_Code,
  Lifting_Date,
  Mill_Code,
  millname,
  Grade,
  Quantal,
  Payment_To,
  paymenttoname,
  Mill_Rate,
  Excise_Rate,
  Tender_DateConverted,
  Lifting_DateConverted,
  TCS_Amt,
  utrdetailid;