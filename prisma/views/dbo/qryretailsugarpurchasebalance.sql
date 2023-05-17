SELECT
  qryretailsugarpurchase.purchaseid AS purchaseid,
  qrymstaccountmaster.Ac_Name_E AS millname,
  qryretailsugarpurchase.doc_date AS doc_date,
  CONVERT(
    varchar(10),
    qryretailsugarpurchase.doc_date,
    103
  ) AS DateConverted,
  qryretailsugarpurchase.NETQNTL AS NETQNTL,
  qryretailsugarpurchase.Company_Code AS Company_Code,
  qryretailsugarpurchase.mill_code AS mill_code,
  qryretailsugarpurchase.doc_no AS doc_no,
  qryretailsugarpurchase.subTotal AS subTotal,
  qrymstaccountmaster.Short_Name AS millshortname,
  SUM(ISNULL(nt_1_retailselldetails.Quantity, 0)) AS desp,
  (
    qryretailsugarpurchase.NETQNTL - SUM(ISNULL(nt_1_retailselldetails.Quantity, 0))
  ) AS balance
FROM
  (
    (
      qryretailsugarpurchase
      LEFT JOIN qrymstaccountmaster ON (
        (
          qryretailsugarpurchase.mc = qrymstaccountmaster.accoid
        )
      )
    )
    LEFT JOIN nt_1_retailselldetails ON (
      (
        qryretailsugarpurchase.purchaseid = nt_1_retailselldetails.purchaseid
      )
    )
  )
GROUP BY
  qryretailsugarpurchase.purchaseid,
  qrymstaccountmaster.Ac_Name_E,
  qryretailsugarpurchase.doc_date,
  qryretailsugarpurchase.NETQNTL,
  qryretailsugarpurchase.Company_Code,
  qryretailsugarpurchase.mill_code,
  qryretailsugarpurchase.doc_no,
  qryretailsugarpurchase.subTotal,
  qrymstaccountmaster.Short_Name;