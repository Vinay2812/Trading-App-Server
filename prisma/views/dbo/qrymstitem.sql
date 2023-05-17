SELECT
  dbo.nt_1_systemmaster.System_Type,
  dbo.nt_1_systemmaster.System_Code,
  dbo.nt_1_systemmaster.System_Name_E,
  dbo.nt_1_systemmaster.System_Name_R,
  dbo.nt_1_systemmaster.System_Rate,
  dbo.nt_1_systemmaster.Purchase_AC,
  dbo.nt_1_systemmaster.Sale_AC,
  dbo.nt_1_systemmaster.Vat_AC,
  dbo.nt_1_systemmaster.Opening_Bal,
  dbo.nt_1_systemmaster.KgPerKatta,
  dbo.nt_1_systemmaster.Company_Code,
  dbo.nt_1_systemmaster.Year_Code,
  dbo.nt_1_systemmaster.Branch_Code,
  dbo.nt_1_systemmaster.Created_By,
  dbo.nt_1_systemmaster.Modified_By,
  dbo.nt_1_systemmaster.HSN,
  dbo.nt_1_systemmaster.systemid,
  dbo.nt_1_gstratemaster.Rate AS gstratre,
  purchaseac.accoid AS PurcAcid,
  saleac.accoid AS SaleAcid,
  dbo.nt_1_systemmaster.Opening_Value,
  dbo.nt_1_systemmaster.Gst_Code,
  dbo.nt_1_systemmaster.MarkaSet,
  dbo.nt_1_systemmaster.Supercost,
  dbo.nt_1_systemmaster.Packing,
  dbo.nt_1_systemmaster.LodingGst,
  dbo.nt_1_systemmaster.MarkaPerc,
  dbo.nt_1_systemmaster.SuperPerc,
  dbo.nt_1_systemmaster.RatePer,
  dbo.nt_1_systemmaster.minRate,
  dbo.nt_1_systemmaster.maxRate
FROM
  dbo.nt_1_systemmaster
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_systemmaster.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.nt_1_systemmaster.Gst_Code = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.nt_1_accountmaster AS saleac ON dbo.nt_1_systemmaster.Company_Code = saleac.company_code
  AND dbo.nt_1_systemmaster.Sale_AC = saleac.Ac_Code
  LEFT JOIN dbo.nt_1_accountmaster AS purchaseac ON dbo.nt_1_systemmaster.Company_Code = purchaseac.company_code
  AND dbo.nt_1_systemmaster.Purchase_AC = purchaseac.Ac_Code
WHERE
  (dbo.nt_1_systemmaster.System_Type = 'I');