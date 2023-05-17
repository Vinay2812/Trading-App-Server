SELECT
  dbo.Script_Master.FNO_Script_No,
  dbo.Script_Master.Script_Name,
  dbo.Script_Master.Lot_Size,
  dbo.Script_Master.FNO_Type,
  dbo.Script_Master.Company_Code,
  dbo.Script_Master.Created_By,
  dbo.Script_Master.Modified_By,
  dbo.Script_Master.Created_Date,
  dbo.Script_Master.Modified_Date,
  dbo.Script_Master.Year_Code,
  dbo.Script_Master.Face_Value,
  dbo.Script_Master.Script_Id,
  dbo.Expiry_Master.Expiry_Date
FROM
  dbo.Script_Master
  CROSS JOIN dbo.Expiry_Master
WHERE
  (dbo.Script_Master.FNO_Type <> 'E');