SELECT
  'CB' AS Tran_Type,
  dbo.NT_1_ColdStorageBillHead.Date AS doc_date,
  dbo.NT_1_ColdStorageBillHead.Customer_Code AS Ac_Code,
  dbo.NT_1_ColdStorageBillDetails.Item AS item_code,
  dbo.NT_1_ColdStorageBillDetails.Bags AS Quanta,
  'C' AS drcrl,
  dbo.NT_1_ColdStorageBillHead.Company_Code,
  dbo.NT_1_ColdStorageBillHead.Year_Code,
  dbo.NT_1_ColdStorageBillHead.Subtotal AS itemvalue,
  dbo.NT_1_ColdStorageBillDetails.Brand_Code,
  dbo.NT_1_ColdStorageBillHead.Doc_No,
  0 AS DoNo,
  0 AS mill_code
FROM
  dbo.NT_1_ColdStorageBillHead
  LEFT JOIN dbo.NT_1_ColdStorageBillDetails ON dbo.NT_1_ColdStorageBillHead.Doc_No = dbo.NT_1_ColdStorageBillDetails.Doc_No;