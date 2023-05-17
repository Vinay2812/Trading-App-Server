SELECT
  dbo.qrysugarpurchasereturnhead.doc_no,
  dbo.qrysugarpurchasereturnhead.PURCNO,
  dbo.qrysugarpurchasereturnhead.PurcTranType,
  dbo.qrysugarpurchasereturnhead.doc_date,
  dbo.qrysugarpurchasereturnhead.Tran_Type,
  dbo.qrysugarpurchasereturnhead.Ac_Code,
  dbo.qrysugarpurchasereturnhead.Company_Code,
  dbo.qrysugarpurchasereturnhead.Year_Code,
  dbo.qrysugarpurchasereturnhead.Bill_To,
  dbo.qrysugarpurchasereturnhead.billtoname,
  dbo.qrysugarpurchasereturnhead.billtostatecode,
  dbo.qrysugarpurchasereturnhead.TCS_Net_Payable,
  dbo.qrysugarpurchasereturnhead.billtostatename,
  dbo.qrySugarSaleAndVouchersForReturnNew.doc_date AS bill_date,
  dbo.qrysugarpurchasereturnhead.Bill_Amount,
  dbo.qrysugarpurchasereturnhead.subTotal,
  dbo.qrysugarpurchasereturnhead.gstrate,
  dbo.qrysugarpurchasereturnhead.billtogstno
FROM
  dbo.qrysugarpurchasereturnhead
  LEFT JOIN dbo.qrySugarSaleAndVouchersForReturnNew ON dbo.qrysugarpurchasereturnhead.PurcTranType = dbo.qrySugarSaleAndVouchersForReturnNew.Tran_Type
  AND dbo.qrysugarpurchasereturnhead.PURCNO = dbo.qrySugarSaleAndVouchersForReturnNew.doc_no;