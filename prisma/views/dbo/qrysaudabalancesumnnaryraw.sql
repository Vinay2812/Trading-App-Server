SELECT
  td.Tender_No,
  td.Buyer,
  td.Company_Code,
  td.Buyer_Quantal,
  td.Sale_Rate,
  td.Commission_Rate,
  td.tenderid,
  td.year_code,
  td.tenderdetailid,
  td.Buyer_Quantal * (td.Sale_Rate + td.Commission_Rate) + td.tcs_amt + td.gst_amt AS AMT,
  ISNULL(rd.amount, 0) AS received,
  ISNULL(rd.Adjusted_Amount, 0) AS adjusted,
  td.Buyer_Quantal * (td.Sale_Rate + td.Commission_Rate) + td.tcs_amt + td.gst_amt - ISNULL(rd.amount + rd.Adjusted_Amount, 0) AS BALANCE,
  td.buyerid,
  td.tcs_amt,
  td.gst_amt,
  td.Sauda_Date
FROM
  dbo.nt_1_tenderdetails AS td
  LEFT JOIN dbo.qrytransactiondetailforsaudabalance AS rd ON td.tenderdetailid = rd.tenderdetailid;