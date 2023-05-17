SELECT
  nt_1_systemmaster.System_Type AS System_Type,
  nt_1_systemmaster.System_Code AS System_Code,
  nt_1_systemmaster.System_Name_E AS System_Name_E,
  nt_1_systemmaster.System_Name_R AS System_Name_R,
  nt_1_systemmaster.System_Rate AS System_Rate,
  nt_1_systemmaster.Purchase_AC AS Purchase_AC,
  nt_1_systemmaster.Sale_AC AS Sale_AC,
  nt_1_systemmaster.Vat_AC AS Vat_AC,
  nt_1_systemmaster.Opening_Bal AS Opening_Bal,
  nt_1_systemmaster.KgPerKatta AS KgPerKatta,
  nt_1_systemmaster.Company_Code AS Company_Code,
  nt_1_systemmaster.Year_Code AS Year_Code,
  nt_1_systemmaster.Branch_Code AS Branch_Code,
  nt_1_systemmaster.Created_By AS Created_By,
  nt_1_systemmaster.Modified_By AS Modified_By,
  nt_1_systemmaster.HSN AS HSN,
  nt_1_systemmaster.systemid AS systemid
FROM
  nt_1_systemmaster
WHERE
  (nt_1_systemmaster.System_Type = 'S');