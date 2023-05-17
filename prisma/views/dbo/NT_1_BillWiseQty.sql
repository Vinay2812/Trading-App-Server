SELECT
  dbo.NT_1_AwakDetail.Bill_No,
  dbo.NT_1_AwakDetail.Company_Code,
  dbo.NT_1_AwakDetail.Year_Code,
  dbo.NT_1_AwakDetail.Item_Code,
  SUM(dbo.NT_1_AwakDetail.Qty) AS NetQty,
  dbo.NT_1_qryJogerryitemmaster.System_Name_E AS ItemName,
  dbo.NT_1_qryJogerryitemmaster.category
FROM
  dbo.NT_1_AwakDetail
  LEFT JOIN dbo.NT_1_qryJogerryitemmaster ON dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_qryJogerryitemmaster.Company_Code
  AND dbo.NT_1_AwakDetail.Item_Code = dbo.NT_1_qryJogerryitemmaster.System_Code
GROUP BY
  dbo.NT_1_AwakDetail.Bill_No,
  dbo.NT_1_AwakDetail.Company_Code,
  dbo.NT_1_AwakDetail.Year_Code,
  dbo.NT_1_AwakDetail.Item_Code,
  dbo.NT_1_qryJogerryitemmaster.System_Name_E,
  dbo.NT_1_qryJogerryitemmaster.category;