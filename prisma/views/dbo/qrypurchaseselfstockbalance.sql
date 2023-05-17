SELECT
  qrypurchaseselfstock.purchaseid AS purchaseid,
  qrymstaccountmaster.Short_Name AS millshortname,
  qrypurchaseselfstock.doc_date AS doc_date,
  qrypurchaseselfstock.NETQNTL AS NETQNTL,
  qrypurchaseselfstock.mill_code AS mill_code,
  qrypurchaseselfstock.doc_no AS doc_no,
  qrypurchaseselfstock.subTotal AS subTotal,
  qrymstaccountmaster.Ac_Name_E AS millname,
  CONVERT(varchar(10), qrypurchaseselfstock.doc_date, 103) AS doc_dateConverted,
  SUM(ISNULL(nt_1_retailselldetails.Quantity, 0)) AS desp,
  (
    qrypurchaseselfstock.NETQNTL - SUM(ISNULL(nt_1_retailselldetails.Quantity, 0))
  ) AS balance,
  qrypurchaseselfstock.Company_Code AS Company_Code,
  qrypurchaseselfstock.Year_Code AS Year_Code
FROM
  (
    (
      qrypurchaseselfstock
      LEFT JOIN nt_1_retailselldetails ON (
        (
          qrypurchaseselfstock.purchaseid = nt_1_retailselldetails.retaildetailid
        )
      )
    )
    LEFT JOIN qrymstaccountmaster ON (
      (
        qrypurchaseselfstock.mc = qrymstaccountmaster.accoid
      )
    )
  )
GROUP BY
  qrypurchaseselfstock.purchaseid,
  qrymstaccountmaster.Short_Name,
  qrypurchaseselfstock.doc_date,
  qrypurchaseselfstock.NETQNTL,
  qrypurchaseselfstock.mill_code,
  qrypurchaseselfstock.doc_no,
  qrypurchaseselfstock.subTotal,
  qrymstaccountmaster.Ac_Name_E,
  qrypurchaseselfstock.Company_Code,
  qrypurchaseselfstock.Year_Code;