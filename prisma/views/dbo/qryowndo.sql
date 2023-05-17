SELECT
  dbo.nt_1_deliveryorder.doc_no,
  dbo.nt_1_deliveryorder.doc_date,
  CONVERT(
    varchar(10),
    dbo.nt_1_deliveryorder.doc_date,
    103
  ) AS doc_dateConverted,
  dbo.nt_1_deliveryorder.truck_no,
  dbo.nt_1_accountmaster.Short_Name AS millshortname,
  dbo.nt_1_deliveryorder.quantal,
  dbo.nt_1_deliveryorder.PurchaseRate,
  dbo.nt_1_deliveryorder.GETPASSCODE,
  dbo.nt_1_deliveryorder.SaleBillTo,
  dbo.nt_1_deliveryorder.EWayBillChk,
  dbo.nt_1_deliveryorder.purc_no
FROM
  dbo.nt_1_deliveryorder
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.nt_1_deliveryorder.mc = dbo.nt_1_accountmaster.accoid
WHERE
  (dbo.nt_1_deliveryorder.desp_type = 'DI');