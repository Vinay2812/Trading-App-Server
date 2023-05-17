SELECT
  dbo.ColdStorageHead.Doc_No,
  dbo.ColdStorageHead.Doc_Date,
  dbo.ColdStorageHead.Ac_Code,
  dbo.ColdStorageHead.Ac_Id,
  dbo.ColdStorageHead.Inword_No,
  dbo.ColdStorageHead.Inword_Date,
  dbo.ColdStorageHead.Company_Code,
  dbo.ColdStorageHead.Year_Code,
  dbo.ColdStorageHead.Created_By,
  dbo.ColdStorageHead.Modified_By,
  dbo.ColdStorageHead.csid,
  dbo.ColdStorageHead.Vahical_No,
  dbo.ColdStorageHeadDetail.Detail_Id,
  dbo.ColdStorageHeadDetail.Item_Code,
  dbo.ColdStorageHeadDetail.Brand_Code,
  dbo.ColdStorageHeadDetail.No_Of_Bags,
  dbo.ColdStorageHeadDetail.Net_Wt,
  dbo.ColdStorageHeadDetail.Wt_Per,
  dbo.nt_1_accountmaster.Ac_Name_E,
  dbo.nt_1_accountmaster.Gst_No,
  dbo.nt_1_accountmaster.GSTStateCode,
  dbo.ColdStorageHeadDetail.ic,
  dbo.ColdStorageHeadDetail.csdetailid,
  dbo.qrymstitem.System_Name_E,
  dbo.Brand_Master.Marka AS brandname,
  CONVERT(varchar(10), dbo.ColdStorageHead.Doc_Date, 103) AS Doc_Dateconvert,
  CONVERT(
    varchar(10),
    dbo.ColdStorageHead.Inword_Date,
    103
  ) AS Inword_Dateconvert
FROM
  dbo.ColdStorageHeadDetail
  LEFT JOIN dbo.Brand_Master ON dbo.ColdStorageHeadDetail.Brand_Code = dbo.Brand_Master.Code
  AND dbo.ColdStorageHeadDetail.Company_Code = dbo.Brand_Master.Company_Code
  LEFT JOIN dbo.qrymstitem ON dbo.ColdStorageHeadDetail.ic = dbo.qrymstitem.systemid
  RIGHT JOIN dbo.nt_1_accountmaster
  RIGHT JOIN dbo.ColdStorageHead ON dbo.nt_1_accountmaster.accoid = dbo.ColdStorageHead.Ac_Id;