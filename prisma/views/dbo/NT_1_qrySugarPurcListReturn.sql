SELECT
  dbo.nt_1_sugarpurchasereturn.doc_no,
  dbo.nt_1_sugarpurchasereturn.PURCNO,
  CONVERT(
    varchar(10),
    dbo.nt_1_sugarpurchasereturn.doc_date,
    103
  ) AS doc_date,
  dbo.nt_1_sugarpurchasereturn.Ac_Code,
  dbo.nt_1_sugarpurchasereturn.Unit_Code,
  U.Ac_Name_E AS Unit_Name,
  dbo.nt_1_sugarpurchasereturn.mill_code,
  dbo.nt_1_sugarpurchasereturn.FROM_STATION,
  dbo.nt_1_sugarpurchasereturn.TO_STATION,
  dbo.nt_1_sugarpurchasereturn.LORRYNO,
  dbo.nt_1_sugarpurchasereturn.BROKER,
  dbo.nt_1_sugarpurchasereturn.wearhouse,
  dbo.nt_1_sugarpurchasereturn.subTotal,
  dbo.nt_1_sugarpurchasereturn.LESS_FRT_RATE,
  dbo.nt_1_sugarpurchasereturn.freight,
  dbo.nt_1_sugarpurchasereturn.cash_advance,
  dbo.nt_1_sugarpurchasereturn.bank_commission,
  dbo.nt_1_sugarpurchasereturn.OTHER_AMT,
  dbo.nt_1_sugarpurchasereturn.Bill_Amount,
  dbo.nt_1_sugarpurchasereturn.Due_Days,
  dbo.nt_1_sugarpurchasereturn.NETQNTL,
  dbo.nt_1_sugarpurchasereturn.Company_Code,
  dbo.nt_1_sugarpurchasereturn.Year_Code,
  dbo.nt_1_sugarpurchasereturn.Branch_Code,
  dbo.nt_1_sugarpurchasereturn.Created_By,
  dbo.nt_1_sugarpurchasereturn.Modified_By,
  dbo.nt_1_sugarpurchasedetailsreturn.item_code,
  dbo.nt_1_sugarpurchasedetailsreturn.narration,
  dbo.nt_1_sugarpurchasedetailsreturn.Quantal,
  dbo.nt_1_sugarpurchasedetailsreturn.packing,
  dbo.nt_1_sugarpurchasedetailsreturn.bags,
  dbo.nt_1_sugarpurchasedetailsreturn.rate,
  dbo.nt_1_sugarpurchasedetailsreturn.item_Amount,
  dbo.nt_1_systemmaster.System_Name_E AS itemname,
  dbo.qrymstaccountmaster.Ac_Name_E AS PartyName,
  dbo.qrymstaccountmaster.cityname AS partyCity,
  Broker.Ac_Name_E AS brokerName,
  Mill.Ac_Name_E AS MillName,
  Mill.Short_Name AS millShortName,
  dbo.nt_1_sugarpurchasereturn.Bill_No,
  dbo.nt_1_sugarpurchasedetailsreturn.detail_id,
  dbo.nt_1_sugarpurchasereturn.Tran_Type,
  dbo.qrymstaccountmaster.Short_Name AS PartyShortname,
  Broker.Short_Name AS BrokerShort,
  dbo.nt_1_sugarpurchasereturn.PurcTranType,
  dbo.nt_1_sugarpurchasereturn.CGSTRate,
  dbo.nt_1_sugarpurchasereturn.CGSTAmount,
  dbo.nt_1_sugarpurchasereturn.SGSTRate,
  dbo.nt_1_sugarpurchasereturn.SGSTAmount,
  dbo.nt_1_sugarpurchasereturn.IGSTRate,
  dbo.nt_1_sugarpurchasereturn.IGSTAmount,
  dbo.nt_1_sugarpurchasereturn.GstRateCode,
  dbo.nt_1_gstratemaster.GST_Name,
  dbo.nt_1_sugarpurchasereturn.CGSTRate AS Expr1,
  dbo.nt_1_sugarpurchasereturn.CGSTAmount AS Expr2,
  dbo.nt_1_sugarpurchasereturn.SGSTRate AS Expr3,
  dbo.nt_1_sugarpurchasereturn.SGSTAmount AS Expr4,
  dbo.nt_1_sugarpurchasereturn.IGSTRate AS Expr5,
  dbo.nt_1_sugarpurchasereturn.IGSTAmount AS Expr6,
  dbo.nt_1_sugarpurchasereturn.GstRateCode AS Expr7,
  dbo.nt_1_sugarpurchasereturn.sbid,
  dbo.nt_1_sugarpurchasereturn.TCS_Net_Payable
FROM
  dbo.nt_1_accountmaster AS Mill
  RIGHT JOIN dbo.qrymstaccountmaster
  RIGHT JOIN dbo.nt_1_sugarpurchasereturn
  JOIN dbo.nt_1_sugarpurchasedetailsreturn ON dbo.nt_1_sugarpurchasereturn.doc_no = dbo.nt_1_sugarpurchasedetailsreturn.doc_no
  AND dbo.nt_1_sugarpurchasereturn.Company_Code = dbo.nt_1_sugarpurchasedetailsreturn.Company_Code
  AND dbo.nt_1_sugarpurchasereturn.Year_Code = dbo.nt_1_sugarpurchasedetailsreturn.Year_Code
  JOIN dbo.nt_1_systemmaster ON dbo.nt_1_sugarpurchasedetailsreturn.item_code = dbo.nt_1_systemmaster.System_Code
  AND dbo.nt_1_sugarpurchasedetailsreturn.Company_Code = dbo.nt_1_systemmaster.Company_Code
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_sugarpurchasereturn.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.nt_1_sugarpurchasereturn.GstRateCode = dbo.nt_1_gstratemaster.Doc_no;