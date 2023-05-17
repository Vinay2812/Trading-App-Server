SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      (
        SELECT
          1
      )
  ) AS SR_No,
  'SB' + CONVERT(varchar(50), doc_no) AS InvoiceNo,
  doc_date AS Inv_date,
  Bill_To AS Party_Code,
  CarporateBillTo_Name AS [Name Of Party],
  Carporate_Pan AS Pan,
  Carporate_Address AS Address,
  CarporateState_Code AS Party_StateCode,
  TaxableAmount AS Taxable_Amt,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  Bill_Amount AS Bill_Amount,
  TCS_Amt AS TCS,
  RoundOff,
  Company_Code,
  Year_Code,
  TDS_Rate,
  TDS_Amt,
  IsDeleted,
  Tran_Type,
  doc_no,
  do_no
FROM
  qrysalehead
WHERE
  doc_no <> 0
  AND IsDeleted = 1
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
  doc_date AS Inv_date,
  Party_Code,
  partyname AS [Name Of Party],
  CompanyPan AS Pan,
  billtoaddress AS Address,
  GSTStateCode AS Party_StateCode,
  Subtotal AS Taxable_Amt,
  sum(CGSTAmount) AS CGST,
  sum(SGSTAmount) AS SGST,
  sum(IGSTAmount) AS IGST,
  NetPayble AS Bill_Amount,
  TCS_Amount AS TCS,
  Roundoff,
  Company_Code,
  Year_Code,
  TDS_Rate,
  TDS_Amt,
  IsDelete AS IsDeleted,
  Tran_Type,
  doc_no,
  0 AS do_no
FROM
  qryRetailSale
WHERE
  IsDelete = 1
GROUP BY
  doc_no,
  doc_date,
  Party_Code,
  partyname,
  CompanyPan,
  billtoaddress,
  GSTStateCode,
  Subtotal,
  NetPayble,
  TCS_Amount,
  Roundoff,
  Company_Code,
  Year_Code,
  TDS_Rate,
  TDS_Amt,
  IsDelete,
  Tran_Type
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
  Date AS Inv_date,
  Customer_Code AS Party_Code,
  Ac_Name_E AS [Name Of Party],
  CompanyPan AS Pan,
  Address_E AS Address,
  CustomerStateCode AS Party_StateCode,
  Subtotal AS Taxable_Amt,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  Final_Amount AS Bill_Amount,
  TCS_Amt AS TCS,
  0 AS Roundoff,
  Company_Code,
  Year_Code,
  0 AS TDS_Rate,
  0 AS TDS_Amt,
  1 AS IsDeleted,
  'CB' AS Tran_Type,
  doc_no,
  0 AS do_no
FROM
  qryColdStorageHead
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
  Date AS Inv_date,
  Customer_Code AS Party_Code,
  Ac_Name_E AS [Name Of Party],
  CompanyPan AS Pan,
  Address_E AS Address,
  GSTStateCode AS Party_StateCode,
  Subtotal AS Taxable_Amt,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  Final_Amount AS Bill_Amount,
  TCS_Amt AS TCS,
  0 AS Roundoff,
  Company_Code,
  Year_Code,
  0 AS TDS_Rate,
  0 AS TDS_Amt,
  1 AS IsDeleted,
  'RB' AS Tran_Type,
  doc_no,
  0 AS do_no
FROM
  qryrentbillhead
UNION
SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      (
        SELECT
          1
      )
  ) AS SR_No,
  'RS' + CONVERT(varchar(50), doc_no) AS InvoiceNo,
  doc_date AS Inv_date,
  FromAc AS Party_Code,
  FromAcName AS [Name Of Party],
  CompanyPan AS Pan,
  billtoaddress AS Address,
  BillToGSTStateCode AS Party_StateCode,
  subTotal AS Taxable_Amt,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  Bill_Amount AS Bill_Amount,
  TCS_Amt AS TCS,
  0 AS Roundoff,
  Company_Code,
  Year_Code,
  0 AS TDS_Rate,
  0 AS TDS_Amt,
  1 AS IsDeleted,
  Tran_Type,
  doc_no,
  0 AS do_no
FROM
  qrysugarsalereturnhead
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
  doc_date AS Inv_date,
  ac_code AS Party_Code,
  Ac_Name_E AS [Name Of Party],
  CompanyPan AS Pan,
  Address_E AS Address,
  GSTStateCode AS Party_StateCode,
  bill_amount AS Taxable_Amt,
  cgst_amount AS CGST,
  sgst_amount AS SGST,
  igst_amount AS IGST,
  bill_amount AS Bill_Amount,
  TCS_Amt AS TCS,
  0 AS Roundoff,
  Company_Code,
  Year_Code,
  TDS_Per AS TDS_Rate,
  TDSAmount AS TDS_Amt,
  1 AS IsDeleted,
  Tran_Type,
  doc_no,
  0 AS do_no
FROM
  qrycommissionbill;