SELECT
  dbo.qryColdStorageHeadDetail.Doc_No,
  dbo.qryColdStorageHeadDetail.Doc_Date,
  dbo.qryColdStorageHeadDetail.Ac_Code,
  dbo.qryColdStorageHeadDetail.Ac_Id,
  dbo.qryColdStorageHeadDetail.Ac_Name_E,
  dbo.qryColdStorageHeadDetail.System_Name_E,
  dbo.qryColdStorageHeadDetail.brandname,
  dbo.qryColdStorageHeadDetail.Inword_No,
  dbo.qryColdStorageHeadDetail.Item_Code,
  dbo.qryColdStorageHeadDetail.Brand_Code,
  dbo.qryColdStorageHeadDetail.No_Of_Bags,
  dbo.qryColdStorageHeadDetail.Wt_Per,
  dbo.qryColdStorageHeadDetail.Net_Wt,
  dbo.qryColdStorageHeadDetail.Company_Code,
  dbo.qryColdStorageHeadDetail.Year_Code,
  dbo.NT_1_ColdStorageBillDetails.Doc_No AS BillNo,
  dbo.NT_1_ColdStorageBillDetails.Delivered_Date,
  dbo.NT_1_ColdStorageBillDetails.Period,
  dbo.NT_1_ColdStorageBillDetails.Bags,
  dbo.NT_1_ColdStorageBillHead.Date,
  dbo.qryColdStorageHeadDetail.csdetailid,
  dbo.qryColdStorageHeadDetail.Inword_Date
FROM
  dbo.NT_1_ColdStorageBillHead
  RIGHT JOIN dbo.NT_1_ColdStorageBillDetails ON dbo.NT_1_ColdStorageBillHead.csid = dbo.NT_1_ColdStorageBillDetails.csid
  RIGHT JOIN dbo.qryColdStorageHeadDetail ON dbo.NT_1_ColdStorageBillDetails.ltid = dbo.qryColdStorageHeadDetail.csdetailid;