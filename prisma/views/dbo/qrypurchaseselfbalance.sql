SELECT
  dbo.qrypurchasehead.purchaseid,
  dbo.qrypurchasehead.millname,
  dbo.qrypurchasehead.doc_date,
  dbo.qrypurchasehead.mill_code,
  dbo.qrypurchasehead.doc_dateConverted,
  dbo.qrypurchasehead.doc_no,
  dbo.qrypurchasehead.subTotal,
  dbo.qrypurchasehead.millshortname,
  dbo.nt_1_deliveryorder.GETPASSCODE,
  dbo.nt_1_deliveryorder.voucher_by,
  dbo.qrypurchasehead.SelfBal,
  dbo.qrypurchasedetail.Brand_Code,
  dbo.qrypurchasedetail.Brand_Name,
  dbo.qrypurchasehead.Company_Code,
  dbo.qrypurchasedetail.bags AS NETQNTL,
  SUM(ISNULL(dbo.Retail_Detail.Qty, 0)) AS desp,
  dbo.qrypurchasedetail.bags - SUM(ISNULL(dbo.Retail_Detail.Qty, 0)) AS balance,
  dbo.qrypurchasedetail.purchasedetailid,
  dbo.qrypurchasehead.Year_Code,
  dbo.qrypurchasedetail.item_code,
  dbo.qrypurchasedetail.itemname,
  dbo.qrymstitem.Gst_Code,
  dbo.qrypurchasedetail.packing,
  dbo.qrymstitem.gstratre,
  dbo.qrymstitem.LodingGst,
  dbo.qrypurchasehead.PURCNO AS dono,
  dbo.Retail_Detail.PD_ID
FROM
  dbo.Retail_Detail
  RIGHT JOIN dbo.qrymstitem
  JOIN dbo.qrypurchasedetail ON dbo.qrymstitem.systemid = dbo.qrypurchasedetail.ic;