SELECT
  DISTINCT dbo.nt_1_gledger.AC_CODE,
  dbo.nt_1_gledger.COMPANY_CODE,
  dbo.nt_1_accountmaster.Group_Code
FROM
  dbo.nt_1_gledger
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.nt_1_gledger.COMPANY_CODE = dbo.nt_1_accountmaster.company_code
  AND dbo.nt_1_gledger.AC_CODE = dbo.nt_1_accountmaster.Ac_Code;