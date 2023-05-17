SELECT
  dbo.qrypurchasehead.purchaseid,
  dbo.qrypurchasehead.millname,
  dbo.qrypurchasehead.doc_date,
  dbo.qrypurchasedetail.Quantal,
  dbo.qrypurchasehead.Company_Code,
  dbo.qrypurchasehead.mill_code,
  dbo.qrypurchasehead.doc_dateConverted,
  dbo.qrypurchasehead.doc_no,
  dbo.qrypurchasehead.subTotal,
  dbo.qryretailsellheaddetail.doc_no AS retail_billno,
  dbo.qryretailsellheaddetail.doc_date AS retail_billdate,
  dbo.qryretailsellheaddetail.Party_Name_New,
  dbo.qryretailsellheaddetail.Party_Name,
  dbo.qryretailsellheaddetail.Quantity,
  dbo.qryretailsellheaddetail.Rate,
  dbo.qrypurchasehead.millshortname,
  dbo.qrypurchasedetail.Brand_Code,
  dbo.qrypurchasedetail.Brand_Name,
  dbo.qrypurchasehead.SelfBal
FROM
  dbo.qryretailsellheaddetail
  RIGHT JOIN dbo.qrypurchasedetail ON dbo.qryretailsellheaddetail.purchaseid = dbo.qrypurchasedetail.purchasedetailid
  RIGHT JOIN dbo.qrypurchasehead ON dbo.qrypurchasedetail.purchaseid = dbo.qrypurchasehead.purchaseid;