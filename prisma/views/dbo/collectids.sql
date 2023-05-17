SELECT
  dbo.nt_1_deliveryorder.GstRateCode AS Doc_no,
  dbo.nt_1_gstratemaster.GST_Name,
  dbo.nt_1_gstratemaster.Rate,
  dbo.nt_1_gstratemaster.IGST,
  dbo.nt_1_gstratemaster.SGST,
  dbo.nt_1_gstratemaster.CGST,
  dbo.nt_1_deliveryorder.mc,
  dbo.nt_1_deliveryorder.gp,
  dbo.nt_1_deliveryorder.st,
  dbo.nt_1_deliveryorder.sb,
  dbo.nt_1_deliveryorder.tc,
  dbo.nt_1_deliveryorder.va,
  dbo.nt_1_deliveryorder.ca AS bt,
  dbo.nt_1_deliveryorder.ic,
  dbo.nt_1_deliveryorder.docd,
  dbo.nt_1_deliveryorder.bk,
  dbo.nt_1_deliveryorder.cs AS cscode,
  dbo.nt_1_deliveryorder.quantal AS TenderQty,
  '' AS TID,
  dbo.nt_1_deliveryorder.purc_order AS ID,
  dbo.nt_1_deliveryorder.tenderdetailid AS TDetailID,
  dbo.carporatehead.selling_type AS PDS,
  ISNULL(dbo.carporatehead.ac, 0) AS pdsacID,
  ISNULL(dbo.carporatehead.uc, 0) AS pdsunitID,
  ISNULL(carpac.GSTStateCode, 0) AS pdsPartyStateCode,
  ISNULL(carpunit.GSTStateCode, 0) AS pdsunitStateCode,
  '' AS billtoStateCode,
  paymentstate.GSTStateCode AS PaymentStateCode,
  dbo.nt_1_tender.pt AS paymentid,
  dbo.nt_1_tender.Payment_To AS paymentTo,
  dbo.nt_1_deliveryorder.company_code,
  dbo.nt_1_deliveryorder.Year_Code,
  dbo.nt_1_deliveryorder.doc_no AS DoDoc_no,
  dbo.qrymstitem.Purchase_AC AS PurchAc,
  dbo.qrymstitem.PurcAcid AS Purcid,
  dbo.qrymstitem.Sale_AC AS SaleAc,
  dbo.qrymstitem.SaleAcid AS Saleid,
  dbo.nt_1_deliveryorder.doid,
  '' AS UnitCity,
  '' AS paymentShort,
  dbo.nt_1_deliveryorder.TDSAcId,
  dbo.nt_1_deliveryorder.CashDiffAcId
FROM
  dbo.nt_1_deliveryorder
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_deliveryorder.company_code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.nt_1_deliveryorder.GstRateCode = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.qrymstitem ON dbo.nt_1_deliveryorder.ic = dbo.qrymstitem.systemid
  LEFT JOIN dbo.nt_1_accountmaster AS paymentstate
  LEFT JOIN dbo.nt_1_tender ON dbo.nt_1_tender.pt = paymentstate.accoid;