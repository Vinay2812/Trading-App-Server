SELECT
  dbo.qryColdStorageHead.Doc_No,
  dbo.qryColdStorageHead.Date,
  dbo.qryColdStorageHead.ConvertDate,
  dbo.qryColdStorageHead.Cash_Credit,
  dbo.qryColdStorageHead.Customer_Code,
  dbo.qryColdStorageHead.GstRateCode,
  dbo.qryColdStorageHead.Subtotal,
  dbo.qryColdStorageHead.CGSTRate,
  dbo.qryColdStorageHead.CGSTAmount,
  dbo.qryColdStorageHead.SGSTRate,
  dbo.qryColdStorageHead.SGSTAmount,
  dbo.qryColdStorageHead.IGSTRate,
  dbo.qryColdStorageHead.IGSTAmount,
  dbo.qryColdStorageHead.Total,
  dbo.qryColdStorageHead.Round_Off,
  dbo.qryColdStorageHead.Final_Amount,
  dbo.qryColdStorageHead.Company_Code,
  dbo.qryColdStorageHead.Year_Code,
  dbo.qryColdStorageHead.Branch_Code,
  dbo.qryColdStorageHead.Created_By,
  dbo.qryColdStorageHead.Modified_By,
  dbo.qryColdStorageHead.billno,
  dbo.qryColdStorageHead.ccid,
  dbo.qryColdStorageHead.csid,
  dbo.qryColdStorageHead.Ac_Name_E,
  dbo.qryColdStorageDetail.Detail_Id,
  dbo.qryColdStorageDetail.Item,
  dbo.qryColdStorageDetail.Lot_No,
  dbo.qryColdStorageDetail.Arrival_Date,
  dbo.qryColdStorageDetail.Period,
  dbo.qryColdStorageDetail.Delivered_Date,
  dbo.qryColdStorageDetail.Bags,
  dbo.qryColdStorageDetail.Weight,
  dbo.qryColdStorageDetail.Rate,
  dbo.qryColdStorageDetail.Amount,
  dbo.qryColdStorageDetail.ltid,
  dbo.qryColdStorageDetail.itid,
  dbo.qryColdStorageDetail.csdetailid,
  dbo.qryColdStorageDetail.Wt_Per,
  dbo.qryColdStorageDetail.Brand,
  dbo.qryColdStorageDetail.Net_Wt,
  dbo.qryColdStorageDetail.ItemName,
  dbo.qryColdStorageDetail.BrandName,
  dbo.qryColdStorageHead.CustomerStateCode,
  dbo.qryColdStorageDetail.HSN,
  dbo.qryColdStorageHead.TCS_Amt,
  dbo.qryColdStorageHead.TCS_Net_Payable,
  dbo.qryColdStorageHead.Gst_No AS PartyGSTNo,
  dbo.qryColdStorageHead.Address_E AS PartyAddress,
  dbo.qryColdStorageHead.FSSAI,
  dbo.qryColdStorageHead.Tan_no
FROM
  dbo.qryColdStorageHead
  LEFT JOIN dbo.qryColdStorageDetail ON dbo.qryColdStorageHead.csid = dbo.qryColdStorageDetail.csid;