SELECT
  'RR' AS Tran_Type,
  s.Doc_No,
  ' ' AS Suffix,
  s.Doc_Date,
  s.Party_Code,
  p.Ac_Name_E AS PartyName,
  s.Broker_Code AS BROKER,
  b.Ac_Name_E AS BrokerName,
  '' AS MillName,
  '0' AS NETQNTL,
  '0' AS Sale_Rate,
  '0' AS Due_Days,
  s.NetPayble - s.TDS_Amt AS Bill_Amount,
  s.Company_Code,
  s.Year_Code,
  '' AS FROM_STATION,
  '' AS TO_STATION,
  s.Shipto,
  s.Transport_Code,
  t.Ac_Name_E AS Transport_Name,
  '0' AS Transport_Advance,
  '0' AS Unit_Code,
  p.Ac_Name_E AS Unit_Name,
  '' AS ASN,
  '' AS lorry,
  s.Retailid,
  s.pc
FROM
  dbo.Retail_Head AS s
  LEFT JOIN dbo.nt_1_accountmaster AS t ON s.Transport_Code = t.Ac_Code
  AND s.Company_Code = t.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS b ON s.bc = b.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS p ON s.pc = p.accoid
WHERE
  (s.IsDelete <> 0);