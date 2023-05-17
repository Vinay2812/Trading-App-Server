SELECT
  dbo.qrysalehead.Ac_Code,
  dbo.qrysalehead.billtoname AS PartyName,
  LTRIM(RTRIM(dbo.qrysalehead.billtogstno)) AS [GSTIN/UIN of Recipient],
  ISNULL(NULLIF(dbo.qrysalehead.GSTStateCode, ''), 0) AS PartyStateCode,
  'SB' + CONVERT(NVARCHAR, dbo.qrysalehead.doc_no) AS [Invoice Number],
  REPLACE(
    CONVERT(CHAR(11), dbo.qrysalehead.doc_date, 106),
    ' ',
    '-'
  ) AS [Invoice date],
  dbo.qrysalehead.Bill_Amount AS [Invoice Value],
  RIGHT(
    '0' + CONVERT(NVARCHAR, dbo.qrysalehead.GSTStateCode),
    2
  ) + '-' + LTRIM(RTRIM(dbo.qrysalehead.billtostatename)) AS [Place Of Supply],
  'N' AS [Reverse Charge],
  'Regular' AS [Invoice Type],
  '' AS [E-Commerce GSTIN],
  dbo.qrysalehead.gstrate AS Rate,
  dbo.qrysalehead.TaxableAmount AS [Taxable Value],
  '' AS [Cess Amount],
  dbo.nt_1_deliveryorder.carporate_ac,
  dbo.nt_1_deliveryorder.Carporate_Sale_No,
  dbo.qrymstaccountmaster.Ac_Name_E,
  dbo.qrymstaccountmaster.GSTStateCode AS CA_GSTStateCode,
  dbo.qrymstaccountmaster.State_Name,
  dbo.qrysalehead.DO_No,
  dbo.qrymstaccountmaster.Gst_No,
  dbo.qrysalehead.doc_date,
  dbo.qrysalehead.Company_Code,
  dbo.qrysalehead.Year_Code,
  dbo.qrysalehead.UnregisterGST,
  dbo.qrysalehead.doc_no,
  dbo.qrysalehead.TCS_Amt,
  dbo.qrysalehead.billtopanno,
  dbo.qrysalehead.billtoaddress,
  dbo.qrysalehead.CGSTAmount,
  dbo.qrysalehead.SGSTAmount,
  dbo.qrysalehead.IGSTAmount,
  dbo.qrymstaccountmaster.Address_E,
  dbo.qrymstaccountmaster.CompanyPan AS AC_Pan,
  dbo.qrysalehead.IsDeleted,
  dbo.qrysalehead.TDS_Amt
FROM
  dbo.qrysalehead
  LEFT JOIN dbo.nt_1_deliveryorder ON dbo.qrysalehead.DO_No = dbo.nt_1_deliveryorder.doc_no
  AND dbo.qrysalehead.Company_Code = dbo.nt_1_deliveryorder.company_code
  AND dbo.qrysalehead.Year_Code = dbo.nt_1_deliveryorder.Year_Code
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.nt_1_deliveryorder.ca = dbo.qrymstaccountmaster.accoid;