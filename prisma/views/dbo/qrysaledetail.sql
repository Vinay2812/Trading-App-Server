SELECT
  dbo.nt_1_sugarsaledetails.doc_no,
  dbo.nt_1_sugarsaledetails.detail_id,
  dbo.nt_1_sugarsaledetails.Tran_Type,
  dbo.nt_1_sugarsaledetails.item_code,
  dbo.nt_1_sugarsaledetails.narration,
  dbo.nt_1_sugarsaledetails.Quantal,
  dbo.nt_1_sugarsaledetails.packing,
  dbo.nt_1_sugarsaledetails.bags,
  dbo.nt_1_sugarsaledetails.rate,
  dbo.nt_1_sugarsaledetails.item_Amount,
  dbo.nt_1_sugarsaledetails.Company_Code,
  dbo.nt_1_sugarsaledetails.Year_Code,
  dbo.nt_1_sugarsaledetails.Branch_Code,
  dbo.nt_1_sugarsaledetails.Created_By,
  dbo.nt_1_sugarsaledetails.Modified_By,
  dbo.nt_1_sugarsaledetails.saledetailid,
  dbo.nt_1_sugarsaledetails.saleid,
  dbo.nt_1_sugarsaledetails.ic,
  dbo.qrymstitem.System_Name_E AS itemname,
  dbo.qrymstitem.HSN,
  dbo.nt_1_sugarsaledetails.Brand_Code,
  dbo.Brand_Master.Marka AS Brand_Name
FROM
  dbo.nt_1_sugarsaledetails
  LEFT JOIN dbo.Brand_Master ON dbo.nt_1_sugarsaledetails.Brand_Code = dbo.Brand_Master.Code
  AND dbo.nt_1_sugarsaledetails.Company_Code = dbo.Brand_Master.Company_Code
  LEFT JOIN dbo.qrymstitem ON dbo.nt_1_sugarsaledetails.ic = dbo.qrymstitem.systemid;