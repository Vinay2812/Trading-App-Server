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
  CarporateBillTo_Name AS [Name Of Party],
  Carporate_Pan AS Pan,
  Carporate_Address AS Address,
  Bill_Amount AS Net,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  TCS_Amt AS TCS,
  Company_Code,
  Year_Code,
  IsDeleted,
  TDS_Amt,
  TaxableAmount AS Taxable_Amt,
  Carporate_Tanno AS Tan,
  CarporateBillToEmailID AS Party_Email,
  CarporateBillToGst_No AS PartyGst_No
FROM
  qrysalehead
WHERE
  doc_no <> 0
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
  partyname AS [Name Of Party],
  CompanyPan AS Pan,
  billtoaddress AS Address,
  NetPayble AS Net,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  TCS_Amount AS TCS,
  Company_Code,
  Year_Code,
  IsDelete AS IsDeleted,
  TDS_Amt,
  Taxable_Amount AS Taxable_Amt,
  BillToTan AS Tan,
  partyEmail_Id AS Party_Email,
  PartyGst_No
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
  Ac_Name_E AS [Name Of Party],
  CompanyPan AS Pan,
  Address_E AS Address,
  TCS_Net_Payable AS Net,
  cgst_amount AS CGST,
  sgst_amount AS SGST,
  igst_amount AS IGST,
  TCS_Amt AS TCS,
  Company_Code,
  Year_Code,
  1 AS IsDeleted,
  TDS AS TDS_Amt,
  bill_amount AS Taxable_Amt,
  Tan_no AS Tan,
  Email_Id AS Party_Email,
  Gst_No AS PartyGst_No
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
  Ac_Name_E AS [Name Of Party],
  CompanyPan AS Pan,
  Address_E AS Address,
  TCS_Net_Payable AS Net,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  TCS_Amt AS TCS,
  Company_Code,
  Year_Code,
  1 AS IsDeleted,
  0 AS TDS_Amt,
  Subtotal AS Taxable_Amt,
  Tan_no AS Tan,
  Email_Id AS Party_Email,
  Gst_No AS PartyGst_No
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
  Date AS date,
  Ac_Name_E AS [Name Of Party],
  CompanyPan AS Pan,
  Address_E AS Address,
  Final_Amount AS Net,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  TCS_Amt AS TCS,
  Company_Code,
  Year_Code,
  1 AS IsDeleted,
  TDSAmount AS TDS_Amt,
  Subtotal AS Taxable_Amt,
  Tan_no AS Tan,
  Email_Id AS Party_Email,
  Gst_No AS PartyGst_No
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
  doc_date AS date,
  FromAcName AS [Name Of Party],
  CompanyPan AS Pan,
  billtoaddress AS Address,
  TCS_Net_Payable AS Net,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  TCS_Amt AS TCS,
  Company_Code,
  Year_Code,
  1 AS IsDeleted,
  0 AS TDS_Amt,
  SUBTOTAL AS Taxable_Amt,
  Tan_no AS Tan,
  Email_Id AS Party_Email,
  BillToGst_No AS PartyGst_No
FROM
  qrysugarsalereturnhead;