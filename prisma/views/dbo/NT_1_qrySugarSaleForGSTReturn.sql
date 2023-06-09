SELECT
  dbo.nt_1_sugarsale.doc_no,
  dbo.nt_1_sugarsale.doc_date,
  dbo.nt_1_sugarsale.Ac_Code,
  dbo.nt_1_sugarsale.Unit_Code,
  U.Ac_Name_E AS Unit_Name,
  dbo.nt_1_sugarsale.mill_code,
  dbo.nt_1_sugarsale.wearhouse,
  dbo.nt_1_sugarsale.subTotal,
  dbo.nt_1_sugarsale.freight,
  dbo.nt_1_sugarsale.cash_advance,
  dbo.nt_1_sugarsale.bank_commission,
  dbo.nt_1_sugarsale.Bill_Amount,
  dbo.nt_1_sugarsale.Due_Days,
  dbo.nt_1_sugarsale.Company_Code,
  dbo.nt_1_sugarsale.Year_Code,
  dbo.nt_1_sugarsale.Branch_Code,
  dbo.nt_1_sugarsale.Created_By,
  dbo.nt_1_sugarsale.Modified_By,
  dbo.nt_1_sugarsaledetails.detail_id,
  dbo.nt_1_sugarsaledetails.item_code,
  dbo.nt_1_sugarsaledetails.narration,
  dbo.nt_1_sugarsaledetails.Quantal,
  dbo.nt_1_sugarsaledetails.packing,
  dbo.nt_1_sugarsaledetails.bags,
  dbo.nt_1_sugarsaledetails.rate,
  dbo.nt_1_sugarsaledetails.item_Amount,
  party.Ac_Name_E AS PartyName,
  party.Short_Name AS PartyShortname,
  dbo.nt_1_citymaster.city_name_e AS PartyCity,
  mill.Ac_Name_E AS millname,
  mill.Short_Name AS millshortname,
  broker.Ac_Name_E AS brokername,
  broker.Short_Name AS brokershortname,
  dbo.nt_1_systemmaster.System_Name_E AS itemname,
  dbo.nt_1_sugarsale.PURCNO,
  dbo.nt_1_sugarsale.FROM_STATION,
  dbo.nt_1_sugarsale.TO_STATION,
  dbo.nt_1_sugarsale.LORRYNO,
  dbo.nt_1_sugarsale.LESS_FRT_RATE,
  dbo.nt_1_sugarsale.OTHER_AMT,
  dbo.nt_1_sugarsale.NETQNTL,
  dbo.nt_1_sugarsale.BROKER,
  party.Email_Id AS PartyEmail,
  party.Address_E AS partyAddress,
  party.Tin_No AS partyTin,
  dbo.nt_1_sugarsale.DO_No,
  dbo.nt_1_sugarsale.Tran_Type,
  dbo.nt_1_sugarsale.Transport_Code,
  trans.Ac_Name_E AS Transport_Name,
  trans.Short_Name AS TransportShort,
  broker.Short_Name AS BrokerShort,
  dbo.nt_1_sugarsale.RateDiff,
  dbo.nt_1_sugarsale.ASN_No,
  dbo.nt_1_sugarsale.GstRateCode,
  dbo.nt_1_gstratemaster.GST_Name,
  dbo.nt_1_sugarsale.CGSTRate,
  dbo.nt_1_sugarsale.CGSTAmount,
  dbo.nt_1_sugarsale.SGSTRate,
  dbo.nt_1_sugarsale.SGSTAmount,
  dbo.nt_1_sugarsale.IGSTRate,
  dbo.nt_1_sugarsale.IGSTAmount,
  dbo.nt_1_sugarsale.TaxableAmount,
  party.GSTStateCode AS PartyStateCode,
  party.Gst_No AS PartyGST,
  dbo.gststatemaster.State_Name AS PartyState,
  party.UnregisterGST,
  dbo.nt_1_sugarsale.newsbno
FROM
  dbo.nt_1_citymaster
  RIGHT JOIN dbo.nt_1_accountmaster AS party
  LEFT JOIN dbo.gststatemaster ON party.GSTStateCode = dbo.gststatemaster.State_Code;