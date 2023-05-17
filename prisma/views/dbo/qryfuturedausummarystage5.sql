SELECT
  dbo.qryfuturedausummarystage4.*,
  dbo.Script_Master.Script_Name
FROM
  dbo.qryfuturedausummarystage4
  LEFT JOIN dbo.Script_Master ON dbo.qryfuturedausummarystage4.Script_Code = dbo.Script_Master.FNO_Script_No;