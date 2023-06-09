SELECT
  dbo.Retail_Head.Doc_No,
  dbo.Retail_Head.Tran_Type,
  dbo.Retail_Head.Doc_Date,
  dbo.Retail_Head.Challan_No,
  dbo.Retail_Head.Challan_Date,
  dbo.Retail_Head.Vahical_No,
  dbo.Retail_Head.Party_Code,
  dbo.Retail_Head.Due_Days,
  dbo.Retail_Head.Due_date,
  dbo.Retail_Head.Total,
  dbo.Retail_Head.Subtotal,
  dbo.Retail_Head.Vat,
  dbo.Retail_Head.Roundoff,
  dbo.Retail_Head.Grand_total,
  dbo.Retail_Head.Delivered,
  dbo.Retail_Head.Taxable_Amount,
  dbo.Retail_Head.Party_Name,
  dbo.Retail_Head.Broker_Code,
  dbo.Retail_Head.CashRecieve,
  dbo.Retail_Head.Party_name_new AS Expr1,
  dbo.Retail_Head.Narration,
  dbo.Retail_Head.TCS_Rate,
  dbo.Retail_Head.TCS_Amount,
  dbo.Retail_Head.TCS_Net_Payble,
  dbo.Retail_Head.NewSBNo,
  dbo.Retail_Head.NewSBDate,
  dbo.Retail_Head.Envoiceno,
  dbo.Retail_Head.ACK,
  dbo.Retail_Head.NetGST,
  dbo.Retail_Head.NetExp,
  dbo.Retail_Head.NetWeight,
  dbo.Retail_Head.NetValue,
  dbo.Retail_Head.NetPayble,
  dbo.Retail_Head.Company_Code,
  dbo.Retail_Head.Created_By,
  dbo.Retail_Head.Modified_By,
  dbo.Retail_Head.Created_Date,
  dbo.Retail_Head.Modified_Date,
  dbo.Retail_Head.Year_Code,
  party.Ac_Name_E AS partyname,
  party.GSTStateCode,
  dbo.Retail_Head.CashCredit,
  NT_1_AccountMaster_1.Ac_Name_E AS brokername,
  dbo.Retail_Head.Party_name_new,
  dbo.Retail_Head.NetHamali,
  dbo.Retail_Head.NetOther,
  dbo.Retail_Head.NetPacking,
  dbo.Retail_Head.NetMarketSess,
  dbo.Retail_Head.NetSuperCost,
  dbo.Retail_Head.NetFrieght,
  dbo.Retail_Head.Shipto,
  dbo.Retail_Head.CGST_Amount,
  dbo.Retail_Head.SGST_Amount,
  dbo.Retail_Head.IGST_Amount,
  shipto.Ac_Name_E AS shiptoacname,
  shipto.Address_E AS shiptoaddress,
  shiptocity.city_name_e AS shiptocity,
  shiptocity.GstStateCode AS shiptostatecode,
  party.Address_E AS billtoaddress,
  dbo.nt_1_citymaster.city_name_e AS billtocityname,
  shipto.Gst_No AS ShipToGst_No,
  party.Gst_No AS PartyGst_No,
  dbo.Retail_Head.EwayBillNo,
  dbo.Retail_Head.Item_value,
  dbo.nt_1_accountmaster.Ac_Name_E AS partynewname,
  '' AS Inword,
  dbo.gststatemaster.State_Name AS billtostatename,
  GSTStateMaster_1.State_Name AS shiptostatename,
  dbo.Retail_Head.Retailid,
  dbo.Retail_Head.pc,
  dbo.Retail_Head.st,
  dbo.Retail_Head.bc,
  dbo.Retail_Head.pcn,
  CONVERT(varchar(10), dbo.Retail_Head.Doc_Date, 103) AS DocDate_Converted,
  CONVERT(varchar(10), dbo.Retail_Head.Challan_Date, 103) AS ChallanDate_Converted,
  CONVERT(varchar(10), dbo.Retail_Head.Due_date, 103) AS Due_date_Converted,
  party.CompanyPan,
  '' AS Terms_condition,
  dbo.Retail_Head.time,
  dbo.Retail_Head.Transport_Code,
  TransportCode.Ac_Name_E AS Transport_Name,
  dbo.Retail_Head.tc,
  party.UnregisterGST,
  shipto.Short_Name,
  dbo.Retail_Head.IsDelete
FROM
  dbo.gststatemaster
  RIGHT JOIN dbo.nt_1_accountmaster AS party ON dbo.gststatemaster.State_Code = party.GSTStateCode
  RIGHT JOIN dbo.nt_1_citymaster ON party.City_Code = dbo.nt_1_citymaster.city_code
  AND party.company_code = dbo.nt_1_citymaster.company_code
  RIGHT JOIN dbo.nt_1_accountmaster AS shipto
  LEFT JOIN dbo.gststatemaster AS GSTStateMaster_1 ON shipto.GSTStateCode = GSTStateMaster_1.State_Code
  RIGHT JOIN dbo.Retail_Head
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.Retail_Head.Company_Code = dbo.nt_1_accountmaster.company_code
  AND dbo.Retail_Head.Party_name_new = dbo.nt_1_accountmaster.Ac_Code
  LEFT JOIN dbo.qrymstaccountmaster AS TransportCode ON dbo.Retail_Head.tc = TransportCode.accoid;