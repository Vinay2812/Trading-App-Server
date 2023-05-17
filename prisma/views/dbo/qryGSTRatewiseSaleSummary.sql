SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      (
        SELECT
          1
      )
  ) AS SR_No,
  'SB' + CONVERT(varchar(50), doc_no) AS InvoiceNo,
  doc_date AS date,
  billtoname AS [Name_Of_Party],
  Bill_Amount AS BillAmt,
  HSN AS HSN_NO,
  TaxableAmount AS TaxableAmt,
  gstrate AS Rate,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  TCS_Amt AS TCS,
  NETQNTL AS Qntl,
  Company_Code,
  Year_Code
FROM
  qrysaleheaddetail
WHERE
  doc_no <> 0
  AND IsDeleted <> 0
UNION
SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      (
        SELECT
          1
      )
  ) AS SR_No,
  'RR' + CONVERT(varchar(50), doc_no) AS InvoiceNo,
  doc_date AS date,
  partyname AS [Name_Of_Party],
  Net_Value AS BillAmt,
  HSN AS HSN_NO,
  Taxable_Amount1 AS TaxableAmt,
  Rate AS Rate,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  TCS_Amount AS TCS,
  Qty AS Qntl,
  Company_Code,
  Year_Code
FROM
  qryRetailSale
WHERE
  IsDelete <> 0
UNION
SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      (
        SELECT
          1
      )
  ) AS SR_No,
  'LV' + CONVERT(varchar(50), doc_no) AS InvoiceNo,
  doc_date AS date,
  Ac_Name_E AS [Name_Of_Party],
  bill_amount AS BillAmt,
  HSN AS HSN_NO,
  texable_amount AS TaxableAmt,
  Rate AS Rate,
  cgst_amount AS CGST,
  sgst_amount AS SGST,
  igst_amount AS IGST,
  TCS_Amt AS TCS,
  qntl AS Qntl,
  Company_Code,
  Year_Code
FROM
  qrycommissionbill
UNION
SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      (
        SELECT
          1
      )
  ) AS SR_No,
  'CB' + CONVERT(varchar(50), doc_no) AS InvoiceNo,
  Date AS date,
  Ac_Name_E AS [Name_Of_Party],
  Final_Amount AS BillAmt,
  HSN AS HSN_NO,
  Subtotal AS TaxableAmt,
  Rate AS Rate,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  TCS_Amt AS TCS,
  0 AS Qntl,
  Company_Code,
  Year_Code
FROM
  qryColdStorageHeadDetailBill
UNION
SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      (
        SELECT
          1
      )
  ) AS SR_No,
  'RB' + CONVERT(varchar(50), doc_no) AS InvoiceNo,
  Date AS date,
  Ac_Name_E AS [Name_Of_Party],
  Final_Amount AS BillAmt,
  HSN AS HSN_NO,
  Subtotal AS TaxableAmt,
  gstrate AS Rate,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  TCS_Amt AS TCS,
  0 AS Qntl,
  Company_Code,
  Year_Code
FROM
  qryrentbillheaddetail;