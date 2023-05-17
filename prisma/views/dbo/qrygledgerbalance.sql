SELECT
  qrymstaccountmaster.Ac_Code AS Ac_Code,
  qrymstaccountmaster.Ac_Name_E AS Ac_Name_E,
  qrymstaccountmaster.cityname AS cityname,
  nt_1_gledger.COMPANY_CODE AS COMPANY_CODE,
  ISNULL(
    SUM(
      (
        CASE
          nt_1_gledger.DRCR
          WHEN 'D' THEN nt_1_gledger.AMOUNT
          WHEN 'C' THEN -(nt_1_gledger.AMOUNT)
        END
      )
    ),
    0
  ) AS Balance
FROM
  (
    nt_1_gledger
    JOIN qrymstaccountmaster ON ((nt_1_gledger.ac = qrymstaccountmaster.accoid))
  )
GROUP BY
  qrymstaccountmaster.Ac_Code,
  qrymstaccountmaster.Ac_Name_E,
  qrymstaccountmaster.cityname,
  nt_1_gledger.COMPANY_CODE;