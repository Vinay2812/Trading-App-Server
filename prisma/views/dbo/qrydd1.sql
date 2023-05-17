SELECT
  paymentto.Ac_Name_E AS paymenttoname,
  dbo.nt_1_tender.Tender_No,
  salebillto.Short_Name AS partyname,
  dbo.nt_1_citymaster.city_name_e AS partyplace,
  nt_1_citymaster_1.city_name_e AS paymenttocity,
  dbo.nt_1_deliveryorder.quantal,
  dbo.nt_1_deliveryorder.sale_rate AS rate,
  dbo.nt_1_deliveryorder.PurchaseRate AS dorate,
  dbo.nt_1_gstratemaster.Rate AS gstrate,
  dbo.nt_1_deliveryorder.sale_rate * dbo.nt_1_gstratemaster.Rate / 100 + dbo.nt_1_deliveryorder.sale_rate AS srgst,
  dbo.nt_1_deliveryorder.PurchaseRate * dbo.nt_1_gstratemaster.Rate / 100 + dbo.nt_1_deliveryorder.PurchaseRate AS prgst,
  dbo.nt_1_sugarsale.RoundOff AS saleroundoff,
  dbo.nt_1_sugarpurchase.OTHER_AMT AS purcroundoff,
  dbo.nt_1_sugarpurchase.TCS_Amt AS tcsaspurc,
  dbo.nt_1_sugarsale.TCS_Amt AS tcsassale,
  dbo.nt_1_sugarpurchase.Bill_Amount AS purcamt,
  dbo.nt_1_sugarsale.Bill_Amount AS saleamt,
  0 AS recdamt,
  dbo.nt_1_deliveryorder.doc_no,
  dbo.nt_1_deliveryorder.company_code,
  dbo.nt_1_deliveryorder.Year_Code,
  CONVERT(
    varchar(10),
    dbo.nt_1_sugarpurchase.doc_date,
    103
  ) AS doc_date,
  dbo.nt_1_deliveryorder.doc_date AS DOCDATE
FROM
  dbo.nt_1_citymaster AS nt_1_citymaster_1
  RIGHT JOIN dbo.nt_1_deliveryorder
  JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_deliveryorder.GstRateCode = dbo.nt_1_gstratemaster.Doc_no
  JOIN dbo.nt_1_sugarpurchase ON dbo.nt_1_deliveryorder.voucher_no = dbo.nt_1_sugarpurchase.doc_no
  AND dbo.nt_1_deliveryorder.Year_Code = dbo.nt_1_sugarpurchase.Year_Code
  JOIN dbo.nt_1_accountmaster AS paymentto
  JOIN dbo.nt_1_tender ON paymentto.accoid = dbo.nt_1_tender.pt;