SELECT
  dbo.nt_1_sugarsalereturn.doc_no,
  dbo.nt_1_sugarsalereturn.PURCNO,
  dbo.nt_1_sugarsalereturn.doc_date,
  CONVERT(
    varchar(10),
    dbo.nt_1_sugarsalereturn.doc_date,
    103
  ) AS doc_dateConverted,
  dbo.nt_1_sugarsalereturn.Ac_Code,
  dbo.nt_1_sugarsalereturn.Unit_Code,
  dbo.nt_1_sugarsalereturn.mill_code,
  dbo.nt_1_sugarsalereturn.FROM_STATION,
  dbo.nt_1_sugarsalereturn.TO_STATION,
  dbo.nt_1_sugarsalereturn.LORRYNO,
  dbo.nt_1_sugarsalereturn.BROKER,
  dbo.nt_1_sugarsalereturn.wearhouse,
  dbo.nt_1_sugarsalereturn.subTotal,
  dbo.nt_1_sugarsalereturn.LESS_FRT_RATE,
  dbo.nt_1_sugarsalereturn.freight,
  dbo.nt_1_sugarsalereturn.cash_advance,
  dbo.nt_1_sugarsalereturn.bank_commission,
  dbo.nt_1_sugarsalereturn.OTHER_AMT,
  dbo.nt_1_sugarsalereturn.Bill_Amount,
  dbo.nt_1_sugarsalereturn.Due_Days,
  dbo.nt_1_sugarsalereturn.NETQNTL,
  dbo.nt_1_sugarsalereturn.Company_Code,
  dbo.nt_1_sugarsalereturn.Year_Code,
  dbo.nt_1_sugarsalereturn.Branch_Code,
  dbo.nt_1_sugarsalereturn.Created_By,
  dbo.nt_1_sugarsalereturn.Modified_By,
  dbo.nt_1_sugarsalereturn.Tran_Type,
  dbo.nt_1_sugarsalereturn.DO_No,
  dbo.nt_1_sugarsalereturn.Transport_Code,
  dbo.nt_1_sugarsalereturn.CGSTRate,
  dbo.nt_1_sugarsalereturn.CGSTAmount,
  dbo.nt_1_sugarsalereturn.SGSTRate,
  dbo.nt_1_sugarsalereturn.SGSTAmount,
  dbo.nt_1_sugarsalereturn.IGSTRate,
  dbo.nt_1_sugarsalereturn.IGSTAmount,
  dbo.nt_1_sugarsalereturn.GstRateCode,
  dbo.nt_1_sugarsalereturn.purcyearcode,
  dbo.nt_1_sugarsalereturn.ac,
  dbo.nt_1_sugarsalereturn.uc,
  dbo.nt_1_sugarsalereturn.mc,
  dbo.nt_1_sugarsalereturn.bc,
  dbo.nt_1_sugarsalereturn.srid,
  dbo.nt_1_sugarsalereturn.sbid,
  qrymstaccount.Ac_Name_E,
  qrymstaccount.citygststatecode,
  qrymstunit.Ac_Name_E AS unitname,
  qrymstmill.Ac_Name_E AS millname,
  qrymstbroker.Ac_Name_E AS brokername,
  dbo.nt_1_gstratemaster.GST_Name,
  dbo.nt_1_gstratemaster.Rate AS gstrate,
  dbo.nt_1_gstratemaster.IGST,
  dbo.nt_1_gstratemaster.SGST,
  dbo.nt_1_gstratemaster.CGST,
  dbo.nt_1_sugarsalereturn.bill_to,
  dbo.nt_1_sugarsalereturn.bt,
  qrymstbillto.Ac_Name_E AS billtoname,
  qrymstbillto.Address_E AS billtoaddress,
  qrymstbillto.Pincode AS billtopincode,
  qrymstbillto.Gst_No AS billtogstno,
  qrymstbillto.cityname AS billtocityname,
  qrymstbillto.citygststatecode AS billtostatecode,
  qrymstmill.Short_Name AS millshortname,
  qrytransportmaster.Ac_Name_E AS transportname,
  dbo.nt_1_sugarsalereturn.tc,
  qrymstbillto.State_Name AS billtostatename,
  qrymstfromac.Ac_Name_E AS FromAcName,
  dbo.nt_1_sugarsalereturn.FromAc,
  dbo.nt_1_sugarsalereturn.gc,
  dbo.nt_1_sugarsalereturn.fa,
  dbo.nt_1_sugarsalereturn.PO_Details,
  dbo.nt_1_sugarsalereturn.ASN_No,
  dbo.nt_1_sugarsalereturn.Eway_Bill_No,
  dbo.nt_1_sugarsalereturn.TCS_Rate,
  dbo.nt_1_sugarsalereturn.TCS_Amt,
  dbo.nt_1_sugarsalereturn.TCS_Net_Payable,
  dbo.nt_1_sugarsalereturn.einvoiceno,
  dbo.nt_1_sugarsalereturn.ackno,
  qrymstaccount.Short_Name AS PartyShortName,
  qrymstbroker.Short_Name AS BrokerShortName,
  qrytransportmaster.Short_Name AS transportShort_Name,
  qrymstfromac.cityname AS BillToCity,
  qrymstfromac.State_Name AS BillToState,
  qrymstfromac.GSTStateCode AS BillToGSTStateCode,
  qrymstfromac.Gst_No AS BillToGst_No,
  qrymstunit.cityname AS ShipToCity,
  qrymstunit.Address_E AS ShipToAddress,
  qrymstunit.CompanyPan AS ShipToCompanyPan,
  qrymstunit.GSTStateCode AS ShipToGSTStateCode,
  qrymstfromac.CompanyPan,
  qrymstunit.Gst_No,
  qrymstfromac.UnregisterGST,
  qrymstfromac.Email_Id,
  qrymstfromac.Short_Name,
  qrymstbillto.FSSAI AS BillToFSSAI,
  qrymstbillto.Tan_no AS BillToTAN,
  qrymstunit.FSSAI AS ShipToFSSAI,
  qrymstunit.Tan_no AS ShipToTAN,
  dbo.nt_1_sugarsalereturn.TDS_Rate,
  dbo.nt_1_sugarsalereturn.TDS_Amt,
  qrymstmill.FSSAI AS MillFSSAI,
  dbo.nt_1_sugarsalereturn.QRCode,
  qrymstfromac.Tan_no,
  dbo.nt_1_sugarsalereturn.IsDeleted
FROM
  dbo.nt_1_sugarsalereturn
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_sugarsalereturn.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.nt_1_gstratemaster.Doc_no = dbo.nt_1_sugarsalereturn.GstRateCode
  LEFT JOIN dbo.qrymstaccountmaster AS qrymstfromac ON dbo.nt_1_sugarsalereturn.fa = qrymstfromac.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrytransportmaster ON dbo.nt_1_sugarsalereturn.tc = qrytransportmaster.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrymstbillto ON dbo.nt_1_sugarsalereturn.bt = qrymstbillto.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrymstbroker ON qrymstbroker.accoid = dbo.nt_1_sugarsalereturn.bc
  LEFT JOIN dbo.qrymstaccountmaster AS qrymstmill ON dbo.nt_1_sugarsalereturn.mc = qrymstmill.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrymstaccount ON dbo.nt_1_sugarsalereturn.ac = qrymstaccount.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrymstunit ON qrymstunit.accoid = dbo.nt_1_sugarsalereturn.uc;