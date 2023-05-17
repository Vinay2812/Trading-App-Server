CREATE VIEW [dbo].[qryDebitcreditnote_GST] AS
SELECT
  CAST(tran_type AS varchar(MAX)) + '' + CAST(doc_no AS varchar(MAX)) AS Inovice_No,
  Shit_To AS [Bill To ACC NO],
  ShopTo_Name AS BilltoName,
  ShipToGSTNo AS [BILL TO GSTIN],
  ShipToStateCode AS BillToStateCode,
  CONVERT(varchar(10), doc_date, 103) AS Invoice_Date,
  texable_amount AS TaxableAmt,
  cgst_amount AS CGST,
  sgst_amount AS SGST,
  igst_amount AS IGST,
  TCS_Amt AS TCS,
  TCS_Net_Payable AS Payable_Amount,
  CAST(bill_type AS varchar(MAX)) + '' + CAST(bill_id AS varchar(MAX)) AS OldInvNo,
  CONVERT(varchar(10), bill_date, 103) AS OldInvDate,
  doc_date,
  Company_Code,
  Year_Code,
  tran_type,
  ackno,
  Rate,
  bill_amount,
  UnregisterGST,
  shiptostatename,
  ShipToCity,
  IsDeleted
FROM
  dbo.qrydebitnotehead