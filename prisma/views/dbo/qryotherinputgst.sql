SELECT
  dbo.other_input_gst.Doc_No,
  dbo.other_input_gst.TRAN_TYPE,
  dbo.other_input_gst.Doc_Date,
  CONVERT(varchar(10), dbo.other_input_gst.Doc_Date, 103) AS Doc_DateConverted,
  dbo.other_input_gst.SGST_Amt,
  dbo.other_input_gst.CGST_Amt,
  dbo.other_input_gst.IGST_Amt,
  dbo.other_input_gst.Exps_Ac,
  dbo.other_input_gst.Narration,
  dbo.other_input_gst.Company_Code,
  dbo.other_input_gst.Created_By,
  dbo.other_input_gst.Modified_By,
  dbo.other_input_gst.Year_Code,
  dbo.other_input_gst.Oid,
  dbo.other_input_gst.Created_Date,
  dbo.other_input_gst.ea,
  dbo.other_input_gst.Modified_Date,
  dbo.qrymstaccountmaster.Ac_Name_E,
  CONVERT(varchar(10), dbo.other_input_gst.Doc_Date, 103) AS Doc_DateConv
FROM
  dbo.other_input_gst
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.other_input_gst.ea = dbo.qrymstaccountmaster.accoid;