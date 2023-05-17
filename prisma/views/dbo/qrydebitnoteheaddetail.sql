SELECT
  dbo.qrydebitnotehead.tran_type,
  dbo.qrydebitnotehead.doc_no,
  dbo.qrydebitnotehead.doc_date,
  dbo.qrydebitnotehead.doc_dateConverted,
  dbo.qrydebitnotehead.ac_code,
  dbo.qrydebitnotehead.bill_no,
  dbo.qrydebitnotehead.bill_date,
  dbo.qrydebitnotehead.bill_id,
  dbo.qrydebitnotehead.bill_type,
  dbo.qrydebitnotehead.texable_amount,
  dbo.qrydebitnotehead.gst_code,
  dbo.qrydebitnotehead.cgst_rate,
  dbo.qrydebitnotehead.cgst_amount,
  dbo.qrydebitnotehead.sgst_rate,
  dbo.qrydebitnotehead.sgst_amount,
  dbo.qrydebitnotehead.igst_rate,
  dbo.qrydebitnotehead.igst_amount,
  dbo.qrydebitnotehead.bill_amount,
  dbo.qrydebitnotehead.Company_Code,
  dbo.qrydebitnotehead.Year_Code,
  dbo.qrydebitnotehead.Branch_Code,
  dbo.qrydebitnotehead.Created_By,
  dbo.qrydebitnotehead.Modified_By,
  dbo.qrydebitnotehead.misc_amount,
  dbo.qrydebitnotehead.ac,
  dbo.qrydebitnotehead.dcid,
  dbo.qrydebitnotehead.Ac_Name_E,
  dbo.qrydebitnotehead.Address_E,
  dbo.qrydebitnotehead.City_Code,
  dbo.qrydebitnotehead.Pincode,
  dbo.qrydebitnotehead.Gst_No,
  dbo.qrydebitnotehead.Email_Id,
  dbo.qrydebitnotehead.AC_Pan,
  dbo.qrydebitnotehead.Mobile_No,
  dbo.qrydebitnotehead.GSTStateCode,
  dbo.qrydebitnotehead.cityname,
  dbo.qrydebitnotehead.citygststatecode,
  dbo.qrydebitnotehead.GST_Name,
  dbo.qrydebitnotehead.Rate,
  dbo.qrydebitnotehead.SGST,
  dbo.qrydebitnotehead.CGST,
  dbo.qrydebitnotehead.IGST,
  dbo.qrydebitnotedetail.expac_code,
  dbo.qrydebitnotedetail.value,
  dbo.qrydebitnotedetail.expac,
  dbo.qrydebitnotedetail.dcdetailid,
  dbo.qrydebitnotedetail.detail_Id,
  dbo.qrydebitnotedetail.expacaccountname,
  dbo.qrydebitnotehead.bill_dateConverted,
  dbo.qrydebitnotehead.ASNNO,
  dbo.qrydebitnotehead.Ewaybillno,
  dbo.qrydebitnotehead.Narration,
  dbo.qrydebitnotehead.Shit_To,
  dbo.qrydebitnotehead.Mill_Code,
  dbo.qrydebitnotehead.st,
  dbo.qrydebitnotehead.mc,
  dbo.qrydebitnotehead.ackno,
  dbo.qrydebitnotehead.ShopTo_Name,
  dbo.qrydebitnotehead.Mill_Name,
  dbo.qrydebitnotehead.Unit_Code,
  dbo.qrydebitnotehead.uc,
  dbo.qrydebitnotehead.Unit_Name,
  dbo.qrydebitnotehead.TCS_Rate,
  dbo.qrydebitnotehead.TCS_Amt,
  dbo.qrydebitnotehead.TCS_Net_Payable,
  dbo.qrydebitnotehead.ShipToAddress,
  dbo.qrydebitnotehead.ShipToGSTNo,
  dbo.qrydebitnotehead.ShipToStateCode,
  dbo.qrydebitnotehead.billtoFSSAI,
  dbo.qrydebitnotehead.billtoTAN,
  dbo.qrydebitnotehead.shiptoFSSAI,
  dbo.qrydebitnotehead.shiptoTAN,
  dbo.qrydebitnotehead.CompanyPan,
  dbo.qrydebitnotedetail.Item_Code,
  dbo.qrydebitnotedetail.Quantal,
  dbo.qrydebitnotedetail.ic,
  dbo.qrydebitnotedetail.Item_Name,
  dbo.qrydebitnotedetail.HSN,
  dbo.qrydebitnotehead.unitgstno,
  dbo.qrydebitnotehead.unitstatecode,
  dbo.qrydebitnotehead.unitaddress,
  dbo.qrydebitnotehead.unitpanno,
  dbo.qrydebitnotehead.TDS_Amt,
  dbo.qrydebitnotehead.TDS_Rate,
  dbo.qrydebitnotehead.IsDeleted
FROM
  dbo.qrydebitnotehead
  LEFT JOIN dbo.qrydebitnotedetail ON dbo.qrydebitnotehead.dcid = dbo.qrydebitnotedetail.dcid;