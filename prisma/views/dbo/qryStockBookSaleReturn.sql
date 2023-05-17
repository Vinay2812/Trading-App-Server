SELECT
  'RS' AS Tran_Type,
  dbo.nt_1_sugarsalereturn.doc_date,
  dbo.nt_1_sugarsalereturn.FromAc,
  dbo.nt_1_sugarsaledetailsreturn.item_code,
  dbo.nt_1_sugarsaledetailsreturn.Quantal,
  'C' AS drcr,
  dbo.nt_1_sugarsalereturn.Company_Code,
  dbo.nt_1_sugarsalereturn.Year_Code,
  dbo.nt_1_sugarsalereturn.subTotal AS itemvalue,
  '0' AS Brand_Code,
  dbo.nt_1_sugarsalereturn.doc_no,
  dbo.nt_1_sugarsalereturn.PURCNO AS DoNO,
  dbo.nt_1_sugarsalereturn.mill_code
FROM
  dbo.nt_1_sugarsalereturn
  JOIN dbo.nt_1_sugarsaledetailsreturn ON dbo.nt_1_sugarsalereturn.srid = dbo.nt_1_sugarsaledetailsreturn.srid
WHERE
  (dbo.nt_1_sugarsalereturn.IsDeleted = 1);