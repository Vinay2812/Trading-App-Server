SELECT
  tran_type,
  doc_no,
  '' AS Suffix,
  doc_date,
  ac_code,
  Ac_Name_E AS PartyName,
  '0' AS BROKER,
  '' AS BrokerName,
  Mill_Name AS MillName,
  '0' AS NETQNTL,
  '0' AS Sale_Rate,
  '0' AS Due_Days,
  TCS_Net_Payable AS bill_amount,
  Company_Code,
  Year_Code,
  cityname AS FROM_STATION,
  '' AS TO_STATION,
  Mill_Code,
  '0' AS Transport_Code,
  '' AS Transport_Advance,
  '0' AS cash_advance,
  Shit_To AS Unit_Code,
  ShopTo_Name AS Unit_Name,
  '' AS ASN,
  '' AS lorry,
  dcid AS saleid,
  ac
FROM
  dbo.qrydebitnoteheaddetail
WHERE
  (tran_type = 'DN')
  AND (IsDeleted = 1);