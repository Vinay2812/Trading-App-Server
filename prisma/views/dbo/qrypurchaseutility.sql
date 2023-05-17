SELECT
  dbo.nt_1_sugarpurchase.doc_no,
  CONVERT(
    varchar(10),
    dbo.nt_1_sugarpurchase.doc_date,
    103
  ) AS doc_date,
  dbo.nt_1_accountmaster.Short_Name AS SupplierShortname,
  dbo.nt_1_sugarpurchase.NETQNTL,
  dbo.nt_1_sugarpurchase.Bill_Amount,
  dbo.nt_1_sugarpurchase.EWay_Bill_No,
  dbo.nt_1_sugarpurchase.mill_inv_date,
  dbo.nt_1_sugarpurchase.Bill_No,
  dbo.nt_1_sugarpurchase.purchaseid
FROM
  dbo.nt_1_sugarpurchase
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.nt_1_sugarpurchase.ac = dbo.nt_1_accountmaster.accoid;