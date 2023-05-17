SELECT
  dbo.NT_1_BrandMaster.Doc_No,
  dbo.NT_1_BrandMaster.Brand_Name,
  dbo.NT_1_BrandMaster.Hamali_Code,
  dbo.NT_1_BrandMaster.Packing_Code,
  dbo.NT_1_BrandMaster.Company_Code,
  dbo.NT_1_BrandMaster.Created_By,
  dbo.NT_1_BrandMaster.Modified_By,
  H.System_Name_E AS HamaliCode_Name,
  P.System_Name_E AS PackingCode_Name
FROM
  dbo.NT_1_BrandMaster
  JOIN dbo.NT_1_JaggarySystemMaster AS H ON dbo.NT_1_BrandMaster.Company_Code = H.Company_Code
  AND dbo.NT_1_BrandMaster.Hamali_Code = H.System_Code
  JOIN dbo.NT_1_JaggarySystemMaster AS P ON dbo.NT_1_BrandMaster.Company_Code = P.Company_Code
  AND dbo.NT_1_BrandMaster.Packing_Code = P.System_Code;