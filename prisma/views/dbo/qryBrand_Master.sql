SELECT
  dbo.Brand_Master.Code,
  dbo.Brand_Master.Marka,
  dbo.Brand_Master.English_Name,
  dbo.Brand_Master.Mal_Code,
  dbo.Brand_Master.Aarambhi_Nag,
  dbo.Brand_Master.Nagache_Vajan,
  dbo.Brand_Master.Type,
  dbo.Brand_Master.Company_Code,
  dbo.Brand_Master.Created_By,
  dbo.Brand_Master.Modified_By,
  dbo.Brand_Master.Created_Date,
  dbo.Brand_Master.Modified_Date,
  dbo.nt_1_systemmaster.System_Name_E,
  dbo.Brand_Master.Wt_Per,
  dbo.nt_1_systemmaster.System_Type
FROM
  dbo.Brand_Master
  LEFT JOIN dbo.nt_1_systemmaster ON dbo.Brand_Master.Mal_Code = dbo.nt_1_systemmaster.System_Code
  AND dbo.Brand_Master.Company_Code = dbo.nt_1_systemmaster.Company_Code
WHERE
  (dbo.nt_1_systemmaster.System_Type = 'I');