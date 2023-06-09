SELECT
  dbo.qrypurchasehead.doc_no,
  dbo.qrypurchasehead.Tran_Type,
  dbo.qrypurchasehead.PURCNO,
  dbo.qrypurchasehead.doc_date,
  dbo.qrypurchasehead.Ac_Code,
  dbo.qrypurchasehead.Unit_Code,
  dbo.qrypurchasehead.mill_code,
  dbo.qrypurchasehead.FROM_STATION,
  dbo.qrypurchasehead.TO_STATION,
  dbo.qrypurchasehead.LORRYNO,
  dbo.qrypurchasehead.BROKER,
  dbo.qrypurchasehead.wearhouse,
  dbo.qrypurchasehead.subTotal,
  dbo.qrypurchasehead.LESS_FRT_RATE,
  dbo.qrypurchasehead.freight,
  dbo.qrypurchasehead.cash_advance,
  dbo.qrypurchasehead.bank_commission,
  dbo.qrypurchasehead.OTHER_AMT,
  dbo.qrypurchasehead.Bill_Amount,
  dbo.qrypurchasehead.Due_Days,
  dbo.qrypurchasehead.NETQNTL,
  dbo.qrypurchasehead.Company_Code,
  dbo.qrypurchasehead.Year_Code,
  dbo.qrypurchasehead.Branch_Code,
  dbo.qrypurchasehead.Created_By,
  dbo.qrypurchasehead.Modified_By,
  dbo.qrypurchasehead.Bill_No,
  dbo.qrypurchasehead.GstRateCode,
  dbo.qrypurchasehead.CGSTRate,
  dbo.qrypurchasehead.CGSTAmount,
  dbo.qrypurchasehead.SGSTRate,
  dbo.qrypurchasehead.SGSTAmount,
  dbo.qrypurchasehead.IGSTRate,
  dbo.qrypurchasehead.IGSTAmount,
  dbo.qrypurchasehead.EWay_Bill_No,
  dbo.qrypurchasehead.purchaseid,
  dbo.qrypurchasehead.ac,
  dbo.qrypurchasehead.uc,
  dbo.qrypurchasehead.mc,
  dbo.qrypurchasehead.bk,
  dbo.qrypurchasehead.suppliername,
  dbo.qrypurchasehead.suppliergstno,
  dbo.qrypurchasehead.supplierstatecode,
  dbo.qrypurchasehead.unitname,
  dbo.qrypurchasehead.millname,
  dbo.qrypurchasehead.brokername,
  dbo.qrypurchasehead.GST_Name,
  dbo.qrypurchasehead.gstrate,
  dbo.qrypurchasedetail.detail_id,
  dbo.qrypurchasedetail.item_code,
  dbo.qrypurchasedetail.narration AS itemnarration,
  dbo.qrypurchasedetail.Quantal,
  dbo.qrypurchasedetail.packing,
  dbo.qrypurchasedetail.bags,
  dbo.qrypurchasedetail.rate,
  dbo.qrypurchasedetail.item_Amount,
  dbo.qrypurchasedetail.purchasedetailid,
  dbo.qrypurchasedetail.ic,
  dbo.qrypurchasedetail.itemname,
  dbo.qrypurchasehead.doc_dateConverted,
  dbo.qrypurchasehead.grade,
  dbo.qrypurchasehead.mill_inv_date,
  dbo.qrypurchasehead.mill_inv_dateConverted,
  dbo.qrypurchasehead.millshortname,
  dbo.qrypurchasehead.Purcid,
  dbo.qrypurchasehead.SelfBal,
  dbo.qrypurchasedetail.Brand_Code,
  dbo.qrypurchasedetail.Brand_Name,
  dbo.qrypurchasehead.GSTStateCode,
  dbo.qrypurchasehead.SupplierShortname,
  dbo.qrypurchasehead.TCS_Rate,
  dbo.qrypurchasehead.TCS_Amt,
  dbo.qrypurchasehead.TCS_Net_Payable,
  dbo.qrypurchasehead.supplieraddress,
  dbo.qrypurchasehead.CompanyPan,
  dbo.qrypurchasehead.TDS_Amt,
  dbo.qrypurchasehead.TDS_Rate,
  dbo.qrypurchasehead.partyCity,
  dbo.qrypurchasehead.BrokerShort,
  dbo.qrypurchasehead.supllierfssaino,
  dbo.qrypurchasehead.suppliertinno,
  dbo.qrypurchasehead.supplierpan,
  dbo.qrypurchasedetail.HSN
FROM
  dbo.qrypurchasehead
  LEFT JOIN dbo.qrypurchasedetail ON dbo.qrypurchasehead.purchaseid = dbo.qrypurchasedetail.purchaseid;