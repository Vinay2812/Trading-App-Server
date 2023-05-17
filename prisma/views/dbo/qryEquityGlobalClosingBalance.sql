SELECT
  Company_Code,
  Script_Code,
  SUM(Balance * Rate) AS ClosingValue,
  SUM(BalanceBonus) AS balbonus,
  SUM(Balance) AS bal,
  Year_Code
FROM
  dbo.qryEquityBalance
GROUP BY
  Company_Code,
  Script_Code,
  Year_Code;