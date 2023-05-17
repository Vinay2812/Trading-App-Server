SELECT
  s.Tran_Type,
  s.doc_no,
  ' ' AS Suffix,
  s.doc_date,
  s.Ac_Code,
  a.Ac_Name_E AS PartyName,
  s.BROKER,
  c.Ac_Name_E AS BrokerName,
  b.Ac_Name_E AS MillName,
  s.NETQNTL,
  CONVERT(decimal(10, 2), s.TCS_Net_Payable / s.NETQNTL) AS Sale_Rate,
  s.Due_Days,
  s.TCS_Net_Payable - s.TDS_Amt AS Bill_Amount,
  s.Company_Code,
  s.Year_Code,
  s.FROM_STATION,
  s.TO_STATION,
  s.mill_code,
  s.Transport_Code,
  d.Ac_Name_E AS Transport_Name,
  s.cash_advance AS Transport_Advance,
  s.Unit_Code,
  U.Ac_Name_E AS Unit_Name,
  s.ASN_No AS ASN,
  s.LORRYNO AS lorry,
  s.srid,
  s.ac
FROM
  dbo.nt_1_sugarsalereturn AS s
  LEFT JOIN dbo.nt_1_accountmaster AS a ON s.Ac_Code = a.Ac_Code
  AND s.Company_Code = a.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS b ON s.mill_code = b.Ac_Code
  AND s.Company_Code = b.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS c ON s.BROKER = c.Ac_Code
  AND s.Company_Code = c.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS d ON s.Transport_Code = d.Ac_Code
  AND s.Company_Code = d.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS U ON s.Unit_Code = U.Ac_Code
  AND s.Company_Code = U.company_code
WHERE
  (s.Tran_Type = 'RS');