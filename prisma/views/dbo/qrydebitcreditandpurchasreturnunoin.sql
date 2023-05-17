CREATE VIEW [dbo].[qrydebitcreditandpurchasreturnunoin] AS
SELECT
  CAST(tran_type AS varchar(MAX)) + '' + CAST(doc_no AS varchar(MAX)) AS Inovice_No,
  Shit_To AS BillToACNO,
  ShopTo_Name AS BilltoName,
  ShipToGSTNo AS BILLTOGSTIN,
  ShipToStateCode AS BillToStateCode,
  CONVERT(varchar(10), doc_date, 103) AS Invoice_Date,
  bill_amount,
  texable_amount AS TaxableAmt,
  Rate,
  cgst_amount AS CGST,
  sgst_amount AS SGST,
  igst_amount AS IGST,
  doc_date,
  Company_Code,
  Year_Code,
  shiptostatename AS BillToStatename,
CASE
    WHEN tran_type = 'DN'
    OR tran_type = 'DS' THEN 'debit'
    ELSE 'credit'
  END AS note_type
FROM
  dbo.qrydebitnotehead
  /*where IsDeleted!=0*/
UNION
SELECT
  CAST(Tran_Type AS varchar(MAX)) + '' + CAST(doc_no AS varchar(MAX)) AS Inovice_No,
  Bill_To AS BillToACNO,
  billtoname,
  billtogstno AS BILLTOGSTIN,
  billtostatecode AS BillToStateCode,
  CONVERT(varchar(10), doc_date, 103) AS Invoice_Date,
  Bill_Amount,
  subTotal AS TaxableAmt,
  gstrate AS rate,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  doc_date,
  Company_Code,
  Year_Code,
  billtostatename,
  'credit' AS note_type
FROM
  qrysugarpurchasereturnhead