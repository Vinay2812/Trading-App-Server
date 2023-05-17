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
  TDS_Amt,
  Quantal * (Party_Bill_Rate + Excise_Rate) + ISNULL(TCS_Amt, 0) - ISNULL(TDS_Amt, 0) AS millamount,
  SUM(ISNULL(detailamount, 0)) AS paidamount,
  SUM(ISNULL(Adjusted_Amt, 0)) + SUM(ISNULL(adj_amt, 0)) AS adjusted,
  (
    (
      Quantal * (Party_Bill_Rate + Excise_Rate) + ISNULL(TCS_Amt, 0) - ISNULL(TDS_Amt, 0)
    ) - (
      SUM(ISNULL(detailamount, 0)) + SUM(ISNULL(Adjusted_Amt, 0)) - SUM(ABS(ISNULL(adj_amt, 0)))
    )
  ) - PartyDispQty * (
    (
      Quantal * (Party_Bill_Rate + Excise_Rate) + ISNULL(TCS_Amt, 0) - ISNULL(TDS_Amt, 0)
    ) / Quantal
  ) AS payableamount,
  Tender_DateConverted,
  Lifting_DateConverted,
  millshortname,
  Mill_Rate + Excise_Rate + ISNULL(TCS_Amt, 0) - ISNULL(TDS_Amt, 0) AS qtyperrate,
  PartyDispQty,
  PartyDispQty * (
    (
      Quantal * (Mill_Rate + Excise_Rate) + ISNULL(TCS_Amt, 0) - ISNULL(TDS_Amt, 0)
    ) / Quantal
  ) AS milladjamt,
  (
    Quantal * (Party_Bill_Rate + Excise_Rate) + ISNULL(TCS_Amt, 0) - ISNULL(TDS_Amt, 0)
  ) - PartyDispQty * (
    (
      Quantal * (Party_Bill_Rate + Excise_Rate) + ISNULL(TCS_Amt, 0) - ISNULL(TDS_Amt, 0)
    ) / Quantal
  ) AS millamt1,
  Party_Bill_Rate
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
  millshortname,
  TDS_Amt,
  PartyDispQty,
  Party_Bill_Rate;