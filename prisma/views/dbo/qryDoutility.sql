SELECT
  dbo.nt_1_deliveryorder.doc_no,
  dbo.nt_1_deliveryorder.doc_date,
  CONVERT(
    varchar(10),
    dbo.nt_1_deliveryorder.doc_date,
    103
  ) AS doc_dateConverted,
  dbo.nt_1_deliveryorder.purc_no,
  dbo.nt_1_deliveryorder.tenderdetailid AS purc_order,
  mill.Short_Name AS millshortname,
  dbo.nt_1_deliveryorder.quantal,
  salebillto.Ac_Name_E AS billtoshortname,
  salebillcity.city_name_e AS salebillcityname,
  shipto.Ac_Name_E AS shiptoshortname,
  shiptocity.city_name_e AS shiptocityname,
  dbo.nt_1_deliveryorder.sale_rate,
  dbo.nt_1_deliveryorder.Tender_Commission,
  dbo.nt_1_deliveryorder.tran_type AS desp_type,
  dbo.nt_1_deliveryorder.truck_no,
  dbo.nt_1_deliveryorder.SB_No,
  dbo.nt_1_deliveryorder.EWay_Bill_No,
  dbo.nt_1_deliveryorder.Delivery_Type,
  transport.Ac_Name_E AS transportshortname,
  dbo.nt_1_deliveryorder.Memo_Advance AS MM_Rate,
  dbo.nt_1_deliveryorder.doid,
  dbo.nt_1_deliveryorder.company_code,
  dbo.nt_1_deliveryorder.Year_Code
FROM
  dbo.nt_1_citymaster AS salebillcity
  RIGHT JOIN dbo.nt_1_accountmaster AS salebillto ON salebillcity.cityid = salebillto.cityid
  RIGHT JOIN dbo.nt_1_deliveryorder ON salebillto.accoid = dbo.nt_1_deliveryorder.sb
  LEFT JOIN dbo.nt_1_accountmaster AS transport ON dbo.nt_1_deliveryorder.tc = transport.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS shipto ON dbo.nt_1_deliveryorder.st = shipto.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS mill ON dbo.nt_1_deliveryorder.mc = mill.accoid
  LEFT JOIN dbo.nt_1_citymaster AS shiptocity ON shipto.cityid = shiptocity.cityid;