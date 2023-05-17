SELECT
  DOC_DATE,
  COMPANY_CODE,
  YEAR_CODE,
  SUM(
    CASE
      WHEN drcr = 'C'
      AND ac_code <> 1 THEN amount
      ELSE 0
    END
  ) AS cramt,
  SUM(
    CASE
      WHEN drcr = 'D'
      AND ac_code <> 1 THEN amount
      ELSE 0
    END
  ) AS dramt
FROM
  dbo.nt_1_gledger
GROUP BY
  DOC_DATE,
  COMPANY_CODE,
  YEAR_CODE;