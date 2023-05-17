CREATE VIEW [dbo].[qrybillreciept] AS
SELECT
  u.doc_date AS dt,
  u.Tran_Type AS ttype,
  u.doc_no AS [#],
  u.Unit_Name AS Party,
  u.lorry,
  u.NETQNTL AS Qntl,
  a.Short_Name AS Mill,
  u.Bill_Amount AS VocAmount,
  u.Company_Code,
  u.Year_Code,
  u.Ac_Code,
  dbo.multiple_receipt_detail.DOC_NO,
  dbo.multiple_receipt_detail.Doc_Date,
  { fn IFNULL(dbo.multiple_receipt_detail.Value, 0) } AS reciept,
  ISNULL(
    dbo.multiple_receipt_detail.Adj_Value,
    0
  ) AS adj,
  ISNULL(dbo.multiple_receipt_detail.AcadjAmt, 0) AS acadj,
  u.BROKER,
  u.ASN,
  dbo.multiple_receipt_detail.Tran_Type
FROM
  dbo.NT_1_qryVoucherSaleUnion11 AS u
  LEFT OUTER JOIN dbo.multiple_receipt_detail ON u.Tran_Type = dbo.multiple_receipt_detail.Bill_Tran_Type
  AND u.saleid = dbo.multiple_receipt_detail.Bill_Auto_Id
  LEFT OUTER JOIN dbo.nt_1_accountmaster AS a ON u.mill_code = a.Ac_Code
  AND u.Company_Code = a.company_code