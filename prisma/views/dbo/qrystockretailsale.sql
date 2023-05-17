SELECT
  dbo.Retail_Head.Tran_Type,
  dbo.Retail_Head.Doc_No,
  dbo.Retail_Head.Doc_Date,
  dbo.Retail_Head.Company_Code,
  dbo.Retail_Head.Year_Code,
  dbo.Retail_Head.pc,
  dbo.Retail_Detail.Item_Code,
  dbo.Retail_Detail.Qty,
  dbo.Retail_Detail.ic,
  dbo.Retail_Detail.MillCode,
  dbo.Retail_Detail.Value,
  dbo.Retail_Detail.mc,
  dbo.Retail_Head.Party_Code
FROM
  dbo.Retail_Head
  LEFT JOIN dbo.Retail_Detail ON dbo.Retail_Head.Retailid = dbo.Retail_Detail.Retailid
WHERE
  (dbo.Retail_Head.IsDelete = 1);