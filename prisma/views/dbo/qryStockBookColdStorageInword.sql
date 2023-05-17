SELECT
  'CI' AS Tran_Type,
  dbo.ColdStorageHead.Doc_Date,
  dbo.ColdStorageHead.Ac_Code,
  dbo.ColdStorageHeadDetail.Item_Code,
  dbo.ColdStorageHeadDetail.No_Of_Bags AS Quantal,
  'D' AS drcr,
  dbo.ColdStorageHead.Company_Code,
  dbo.ColdStorageHead.Year_Code,
  0 AS itemvalue,
  dbo.ColdStorageHeadDetail.Brand_Code,
  dbo.ColdStorageHead.Doc_No,
  0 AS DoNO,
  0 AS mill_code
FROM
  dbo.ColdStorageHead
  LEFT JOIN dbo.ColdStorageHeadDetail ON dbo.ColdStorageHead.csid = dbo.ColdStorageHeadDetail.csid;