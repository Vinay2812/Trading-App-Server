SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      (
        SELECT
          1
      )
  ) AS SR_No,
  'PS' + CONVERT(varchar(50), doc_no) AS PSNo,
  doc_date AS date,
  Ac_Code AS Party_Code,
  suppliername AS [Name Of Party],
  CompanyPan AS Pan,
  supplieraddress AS Address,
  subTotal AS Taxable_Amt,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  Bill_Amount,
  TCS_Amt AS TCS,
  0 AS RoundOff,
  Company_Code,
  Year_Code,
  TDS_Amt,
  Tran_Type,
  Doc_No,
  Bill_No,
  purcno AS dono,
  Tan_no AS Tan,
  suppliergstno AS PartyGst_No,
  Email_Id AS Party_Email
FROM
  qrypurchasehead
UNION
SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      (
        SELECT
          1
      )
  ) AS SR_No,
  'RP' + CONVERT(varchar(50), doc_no) AS PSNo,
  doc_date AS date,
  Party_Code,
  partyname AS [Name Of Party],
  CompanyPan AS Pan,
  billtoaddress AS Address,
  Taxable_Amount AS Taxable_Amt,
  CGSTAmount AS CGST,
  SGSTAmount AS SGST,
  IGSTAmount AS IGST,
  NetPayble AS Bill_Amount,
  TCS_Amount AS TCS,
  Roundoff AS RoundOff,
  Company_Code,
  Year_Code,
  0 AS TDS_Amt,
  Tran_Type,
  Doc_No,
  '' AS Bill_No,
  0 AS dono,
  Tan_no AS Tan,
  PartyGst_No AS PartyGst_No,
  Email_Id AS Party_Email
FROM
  qryRetailPurchase;