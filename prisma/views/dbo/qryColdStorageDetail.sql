SELECT
  dbo.NT_1_ColdStorageBillDetails.Doc_No,
  dbo.NT_1_ColdStorageBillDetails.Detail_Id,
  dbo.NT_1_ColdStorageBillDetails.Item,
  dbo.NT_1_ColdStorageBillDetails.Lot_No,
  CONVERT(
    varchar(10),
    dbo.NT_1_ColdStorageBillDetails.Arrival_Date,
    103
  ) AS Arrival_Date,
  CONVERT(
    varchar(10),
    dbo.NT_1_ColdStorageBillDetails.Delivered_Date,
    103
  ) AS Delivered_Date,
  dbo.NT_1_ColdStorageBillDetails.Period,
  dbo.NT_1_ColdStorageBillDetails.Bags,
  dbo.NT_1_ColdStorageBillDetails.Weight,
  dbo.NT_1_ColdStorageBillDetails.Rate,
  dbo.NT_1_ColdStorageBillDetails.Amount,
  dbo.NT_1_ColdStorageBillDetails.ltid,
  dbo.NT_1_ColdStorageBillDetails.itid,
  dbo.NT_1_ColdStorageBillDetails.csdetailid,
  dbo.NT_1_ColdStorageBillDetails.Wt_Per,
  dbo.NT_1_ColdStorageBillDetails.Brand_Code AS Brand,
  dbo.NT_1_ColdStorageBillDetails.Net_Wt,
  dbo.NT_1_ColdStorageBillDetails.csid,
  dbo.NT_1_ColdStorageBillDetails.Company_Code,
  dbo.NT_1_ColdStorageBillDetails.Year_Code,
  dbo.qrymstitem.System_Name_E AS ItemName,
  dbo.Brand_Master.Marka AS BrandName,
  dbo.qrymstitem.Sale_AC AS SaleAc,
  dbo.qrymstitem.SaleAcid AS Saleid,
  dbo.qrymstitem.HSN
FROM
  dbo.NT_1_ColdStorageBillDetails
  LEFT JOIN dbo.Brand_Master ON dbo.NT_1_ColdStorageBillDetails.Company_Code = dbo.Brand_Master.Company_Code
  AND dbo.NT_1_ColdStorageBillDetails.Brand_Code = dbo.Brand_Master.Code
  LEFT JOIN dbo.qrymstitem ON dbo.NT_1_ColdStorageBillDetails.itid = dbo.qrymstitem.systemid;