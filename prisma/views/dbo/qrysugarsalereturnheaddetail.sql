SELECT
  dbo.qrysugarsalereturnhead.doc_no,
  dbo.qrysugarsalereturnhead.PURCNO,
  dbo.qrysugarsalereturnhead.doc_date,
  dbo.qrysugarsalereturnhead.doc_dateConverted,
  dbo.qrysugarsalereturnhead.Ac_Code,
  dbo.qrysugarsalereturnhead.Unit_Code,
  dbo.qrysugarsalereturnhead.mill_code,
  dbo.qrysugarsalereturnhead.FROM_STATION,
  dbo.qrysugarsalereturnhead.TO_STATION,
  dbo.qrysugarsalereturnhead.LORRYNO,
  dbo.qrysugarsalereturnhead.BROKER,
  dbo.qrysugarsalereturnhead.wearhouse,
  dbo.qrysugarsalereturnhead.subTotal,
  dbo.qrysugarsalereturnhead.LESS_FRT_RATE,
  dbo.qrysugarsalereturnhead.freight,
  dbo.qrysugarsalereturnhead.cash_advance,
  dbo.qrysugarsalereturnhead.bank_commission,
  dbo.qrysugarsalereturnhead.OTHER_AMT,
  dbo.qrysugarsalereturnhead.Bill_Amount,
  dbo.qrysugarsalereturnhead.Due_Days,
  dbo.qrysugarsalereturnhead.NETQNTL,
  dbo.qrysugarsalereturnhead.Company_Code,
  dbo.qrysugarsalereturnhead.Year_Code,
  dbo.qrysugarsalereturnhead.Branch_Code,
  dbo.qrysugarsalereturnhead.Created_By,
  dbo.qrysugarsalereturnhead.Modified_By,
  dbo.qrysugarsalereturnhead.Tran_Type,
  dbo.qrysugarsalereturnhead.DO_No,
  dbo.qrysugarsalereturnhead.Transport_Code,
  dbo.qrysugarsalereturnhead.CGSTRate,
  dbo.qrysugarsalereturnhead.CGSTAmount,
  dbo.qrysugarsalereturnhead.SGSTRate,
  dbo.qrysugarsalereturnhead.SGSTAmount,
  dbo.qrysugarsalereturnhead.IGSTRate,
  dbo.qrysugarsalereturnhead.IGSTAmount,
  dbo.qrysugarsalereturnhead.GstRateCode,
  dbo.qrysugarsalereturnhead.purcyearcode,
  dbo.qrysugarsalereturnhead.ac,
  dbo.qrysugarsalereturnhead.uc,
  dbo.qrysugarsalereturnhead.mc,
  dbo.qrysugarsalereturnhead.bc,
  dbo.qrysugarsalereturnhead.srid,
  dbo.qrysugarsalereturnhead.sbid,
  dbo.qrysugarsalereturnhead.Ac_Name_E,
  dbo.qrysugarsalereturnhead.citygststatecode,
  dbo.qrysugarsalereturnhead.unitname,
  dbo.qrysugarsalereturnhead.millname,
  dbo.qrysugarsalereturnhead.brokername,
  dbo.qrysugarsalereturnhead.GST_Name,
  dbo.qrysugarsalereturnhead.gstrate,
  dbo.qrysugarsalereturnhead.IGST,
  dbo.qrysugarsalereturnhead.SGST,
  dbo.qrysugarsalereturnhead.CGST,
  dbo.qrysugarsalereturnhead.bill_to,
  dbo.qrysugarsalereturnhead.bt,
  dbo.qrysugarsalereturnhead.billtoname,
  dbo.qrysugarsalereturnhead.billtoaddress,
  dbo.qrysugarsalereturnhead.billtopincode,
  dbo.qrysugarsalereturnhead.billtogstno,
  dbo.qrysugarsalereturnhead.billtocityname,
  dbo.qrysugarsalereturnhead.billtostatecode,
  dbo.qrysugarsalereturnhead.millshortname,
  dbo.qrysugarsalereturnhead.transportname,
  dbo.qrysugarsalereturnhead.tc,
  dbo.qrysugarsalereturndetail.detail_id,
  dbo.qrysugarsalereturndetail.item_code,
  dbo.qrysugarsalereturndetail.narration,
  dbo.qrysugarsalereturndetail.Quantal,
  dbo.qrysugarsalereturndetail.packing,
  dbo.qrysugarsalereturndetail.bags,
  dbo.qrysugarsalereturndetail.rate,
  dbo.qrysugarsalereturndetail.item_Amount,
  dbo.qrysugarsalereturndetail.srdtid,
  dbo.qrysugarsalereturndetail.ic,
  dbo.qrysugarsalereturndetail.itemname,
  dbo.qrysugarsalereturnhead.FromAcName,
  dbo.qrysugarsalereturnhead.FromAc,
  dbo.qrysugarsalereturnhead.BillToCity,
  dbo.qrysugarsalereturnhead.BillToState,
  dbo.qrysugarsalereturnhead.BillToGSTStateCode,
  dbo.qrysugarsalereturnhead.BillToGst_No,
  dbo.qrysugarsalereturnhead.ShipToCity,
  dbo.qrysugarsalereturnhead.ShipToAddress,
  dbo.qrysugarsalereturnhead.ShipToCompanyPan,
  dbo.qrysugarsalereturnhead.ShipToGSTStateCode,
  dbo.qrysugarsalereturnhead.transportShort_Name,
  dbo.qrysugarsalereturnhead.TCS_Amt,
  dbo.qrysugarsalereturnhead.TCS_Net_Payable,
  dbo.qrysugarsalereturnhead.TCS_Rate,
  dbo.qrysugarsalereturndetail.HSN,
  dbo.qrysugarsalereturnhead.einvoiceno,
  dbo.qrysugarsalereturnhead.ackno,
  dbo.qrysugarsalereturnhead.ASN_No,
  dbo.qrysugarsalereturnhead.PO_Details,
  dbo.qrysugarsalereturnhead.Eway_Bill_No,
  dbo.qrysugarsalereturnhead.Gst_No,
  dbo.qrysugarsalereturnhead.CompanyPan,
  dbo.qrysugarsalereturnhead.BillToFSSAI,
  dbo.qrysugarsalereturnhead.BillToTAN,
  dbo.qrysugarsalereturnhead.ShipToFSSAI,
  dbo.qrysugarsalereturnhead.ShipToTAN,
  dbo.qrysugarsalereturnhead.MillFSSAI,
  dbo.qrysugarsalereturnhead.QRCode
FROM
  dbo.qrysugarsalereturnhead
  LEFT JOIN dbo.qrysugarsalereturndetail ON dbo.qrysugarsalereturnhead.srid = dbo.qrysugarsalereturndetail.srid;