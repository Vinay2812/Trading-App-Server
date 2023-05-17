SELECT
  System_Type,
  System_Code,
  System_Name_E,
  System_Name_R,
  System_Rate,
  Purchase_AC,
  Sale_AC,
  Vat_AC,
  Opening_Bal,
  Company_Code,
  Year_Code,
  Branch_Code,
  Created_By,
  Modified_By,
  HSN,
  Width,
  LENGTH,
  category,
  Levi,
  Oldcompname,
  System_Type AS Expr1
FROM
  dbo.NT_1_JaggarySystemMaster
WHERE
  (System_Type = 'I');