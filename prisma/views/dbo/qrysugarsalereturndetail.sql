SELECT
  dbo.nt_1_sugarsaledetailsreturn.doc_no,
  dbo.nt_1_sugarsaledetailsreturn.detail_id,
  dbo.nt_1_sugarsaledetailsreturn.Tran_Type,
  dbo.nt_1_sugarsaledetailsreturn.item_code,
  dbo.nt_1_sugarsaledetailsreturn.narration,
  dbo.nt_1_sugarsaledetailsreturn.Quantal,
  dbo.nt_1_sugarsaledetailsreturn.packing,
  dbo.nt_1_sugarsaledetailsreturn.bags,
  dbo.nt_1_sugarsaledetailsreturn.rate,
  dbo.nt_1_sugarsaledetailsreturn.item_Amount,
  dbo.nt_1_sugarsaledetailsreturn.Company_Code,
  dbo.nt_1_sugarsaledetailsreturn.Year_Code,
  dbo.nt_1_sugarsaledetailsreturn.Branch_Code,
  dbo.nt_1_sugarsaledetailsreturn.Created_By,
  dbo.nt_1_sugarsaledetailsreturn.Modified_By,
  dbo.nt_1_sugarsaledetailsreturn.srid,
  dbo.nt_1_sugarsaledetailsreturn.srdtid,
  dbo.nt_1_sugarsaledetailsreturn.ic,
  dbo.qrymstitem.System_Name_E AS itemname,
  dbo.qrymstitem.HSN
FROM
  dbo.nt_1_sugarsaledetailsreturn
  LEFT JOIN dbo.qrymstitem ON dbo.nt_1_sugarsaledetailsreturn.ic = dbo.qrymstitem.systemid;