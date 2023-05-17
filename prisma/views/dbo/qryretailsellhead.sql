SELECT
  dbo.nt_1_retailsalehead.Tran_Type,
  dbo.nt_1_retailsalehead.doc_no,
  dbo.nt_1_retailsalehead.doc_date,
  CONVERT(
    varchar(10),
    dbo.nt_1_retailsalehead.doc_date,
    103
  ) AS doc_dateConverted,
  dbo.nt_1_retailsalehead.Challan_No,
  dbo.nt_1_retailsalehead.Challan_Date,
  CONVERT(
    varchar(10),
    dbo.nt_1_retailsalehead.Challan_Date,
    103
  ) AS Challan_DateConverted,
  dbo.nt_1_retailsalehead.Vehical_No,
  dbo.nt_1_retailsalehead.Party_Code,
  dbo.nt_1_retailsalehead.Due_Days,
  dbo.nt_1_retailsalehead.Due_Date,
  CONVERT(
    varchar(10),
    dbo.nt_1_retailsalehead.Due_Date,
    103
  ) AS Due_DateConverted,
  dbo.nt_1_retailsalehead.Total,
  dbo.nt_1_retailsalehead.Subtotal,
  dbo.nt_1_retailsalehead.Vat,
  dbo.nt_1_retailsalehead.Round_Off,
  dbo.nt_1_retailsalehead.Grand_Total,
  dbo.nt_1_retailsalehead.Company_Code,
  dbo.nt_1_retailsalehead.Year_Code,
  dbo.nt_1_retailsalehead.Created_By,
  dbo.nt_1_retailsalehead.Modified_By,
  dbo.nt_1_retailsalehead.Branch_Code,
  dbo.nt_1_retailsalehead.Delivered,
  dbo.nt_1_retailsalehead.GstRateCode,
  dbo.nt_1_retailsalehead.CGSTRate,
  dbo.nt_1_retailsalehead.CGSTAmount,
  dbo.nt_1_retailsalehead.SGSTRate,
  dbo.nt_1_retailsalehead.SGSTAmount,
  dbo.nt_1_retailsalehead.IGSTRate,
  dbo.nt_1_retailsalehead.IGSTAmount,
  dbo.nt_1_retailsalehead.TaxableAmount,
  dbo.nt_1_retailsalehead.Party_Name,
  dbo.nt_1_retailsalehead.Broker_Code,
  dbo.nt_1_retailsalehead.HamaliAmount,
  dbo.nt_1_retailsalehead.CashRecive,
  dbo.nt_1_retailsalehead.Party_Name_New,
  dbo.nt_1_retailsalehead.ac,
  dbo.nt_1_retailsalehead.bc,
  dbo.nt_1_retailsalehead.retailid,
  qryacmaster.Ac_Name_E,
  qryacmaster.Address_E,
  qryacmaster.Pincode,
  qryacmaster.Gst_No,
  qryacmaster.AC_Pan,
  qryacmaster.Mobile_No,
  qryacmaster.cityname,
  qryacmaster.citygststatecode,
  qrybrokermaster.Ac_Name_E AS brokername,
  dbo.nt_1_gstratemaster.GST_Name,
  qryacmaster.State_Name,
  dbo.nt_1_gstratemaster.Rate AS gstrate,
  dbo.nt_1_retailsalehead.Narration,
  dbo.nt_1_retailsalehead.TCS_Rate,
  dbo.nt_1_retailsalehead.TCS_Amt,
  dbo.nt_1_retailsalehead.TCS_Net_Payable
FROM
  dbo.nt_1_retailsalehead
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_retailsalehead.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.nt_1_retailsalehead.GstRateCode = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.qrymstaccountmaster AS qrybrokermaster ON dbo.nt_1_retailsalehead.bc = qrybrokermaster.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qryacmaster ON dbo.nt_1_retailsalehead.ac = qryacmaster.accoid;