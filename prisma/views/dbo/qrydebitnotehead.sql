SELECT
  dbo.debitnotehead.tran_type,
  dbo.debitnotehead.doc_no,
  dbo.debitnotehead.doc_date,
  CONVERT(varchar(10), dbo.debitnotehead.doc_date, 103) AS doc_dateConverted,
  dbo.debitnotehead.ac_code,
  dbo.debitnotehead.bill_no,
  dbo.debitnotehead.bill_date,
  CONVERT(varchar(10), dbo.debitnotehead.bill_date, 103) AS bill_dateConverted,
  dbo.debitnotehead.bill_id,
  dbo.debitnotehead.bill_type,
  dbo.debitnotehead.texable_amount,
  dbo.debitnotehead.gst_code,
  dbo.debitnotehead.cgst_rate,
  dbo.debitnotehead.cgst_amount,
  dbo.debitnotehead.sgst_rate,
  dbo.debitnotehead.sgst_amount,
  dbo.debitnotehead.igst_rate,
  dbo.debitnotehead.igst_amount,
  dbo.debitnotehead.bill_amount,
  dbo.debitnotehead.Company_Code,
  dbo.debitnotehead.Year_Code,
  dbo.debitnotehead.Branch_Code,
  dbo.debitnotehead.Created_By,
  dbo.debitnotehead.Modified_By,
  dbo.debitnotehead.misc_amount,
  dbo.debitnotehead.ac,
  dbo.debitnotehead.dcid,
  dbo.qrymstaccountmaster.Ac_Name_E,
  dbo.qrymstaccountmaster.Address_E,
  dbo.qrymstaccountmaster.City_Code,
  dbo.qrymstaccountmaster.Pincode,
  dbo.qrymstaccountmaster.Gst_No,
  dbo.qrymstaccountmaster.Email_Id,
  dbo.qrymstaccountmaster.AC_Pan,
  dbo.qrymstaccountmaster.Mobile_No,
  dbo.qrymstaccountmaster.GSTStateCode,
  dbo.qrymstaccountmaster.cityname,
  dbo.qrymstaccountmaster.citygststatecode,
  dbo.nt_1_gstratemaster.GST_Name,
  dbo.nt_1_gstratemaster.Rate,
  dbo.nt_1_gstratemaster.SGST,
  dbo.nt_1_gstratemaster.CGST,
  dbo.nt_1_gstratemaster.IGST,
  dbo.debitnotehead.ASNNO,
  dbo.debitnotehead.Ewaybillno,
  dbo.debitnotehead.Narration,
  dbo.debitnotehead.Shit_To,
  dbo.debitnotehead.Mill_Code,
  dbo.debitnotehead.st,
  dbo.debitnotehead.mc,
  dbo.debitnotehead.ackno,
  shipto.Ac_Name_E AS ShopTo_Name,
  mill.Ac_Name_E AS Mill_Name,
  dbo.debitnotehead.Unit_Code,
  dbo.debitnotehead.uc,
  uint.Ac_Name_E AS Unit_Name,
  dbo.debitnotehead.TCS_Rate,
  dbo.debitnotehead.TCS_Amt,
  dbo.debitnotehead.TCS_Net_Payable,
  shipto.Address_E AS ShipToAddress,
  shipto.Gst_No AS ShipToGSTNo,
  shipto.GSTStateCode AS ShipToStateCode,
  dbo.qrymstaccountmaster.State_Name,
  shipto.UnregisterGST,
  shipto.State_Name AS shiptostatename,
  dbo.qrymstaccountmaster.Short_Name,
  mill.Short_Name AS millshortname,
  uint.FSSAI AS billtoFSSAI,
  uint.Tan_no AS billtoTAN,
  shipto.FSSAI AS shiptoFSSAI,
  shipto.Tan_no AS shiptoTAN,
  shipto.cityname AS ShipToCity,
  shipto.CompanyPan,
  uint.Gst_No AS unitgstno,
  uint.GSTStateCode AS unitstatecode,
  uint.Address_E AS unitaddress,
  uint.CompanyPan AS unitpanno,
  dbo.debitnotehead.TDS_Amt,
  dbo.debitnotehead.TDS_Rate,
  dbo.debitnotehead.IsDeleted
FROM
  dbo.debitnotehead
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.debitnotehead.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.debitnotehead.gst_code = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.qrymstaccountmaster AS uint ON dbo.debitnotehead.uc = uint.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS mill ON dbo.debitnotehead.mc = mill.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS shipto ON dbo.debitnotehead.st = shipto.accoid
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.debitnotehead.ac = dbo.qrymstaccountmaster.accoid;