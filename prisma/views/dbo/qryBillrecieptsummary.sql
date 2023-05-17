SELECT
  dt,
  ttype,
  [#],
  Party,
  lorry,
  Qntl,
  Mill,
  VocAmount,
  Company_Code,
  Year_Code,
  Ac_Code,
  SUM(reciept) + SUM(adj) + SUM(acadj) AS recieved,
  VocAmount - (SUM(reciept) + SUM(adj) + SUM(acadj)) AS short,
  BROKER,
  ASN
FROM
  dbo.qrybillreciept
GROUP BY
  dt,
  ttype,
  [#],
  Party,
  lorry,
  Qntl,
  Mill,
  VocAmount,
  Company_Code,
  Year_Code,
  Ac_Code,
  BROKER,
  ASN;