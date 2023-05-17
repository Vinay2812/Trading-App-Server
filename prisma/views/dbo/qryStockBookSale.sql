SELECT
  'SB' AS Tran_Type,
  dbo.nt_1_sugarsale.doc_date,
  dbo.nt_1_sugarsale.Ac_Code,
  dbo.nt_1_sugarsaledetails.item_code,
  dbo.nt_1_sugarsaledetails.Quantal,
  'C' AS drcr,
  dbo.nt_1_sugarsale.Company_Code,
  dbo.nt_1_sugarsale.Year_Code,
  dbo.nt_1_sugarsale.subTotal AS itemvalue,
  dbo.nt_1_sugarsaledetails.Brand_Code,
  dbo.nt_1_sugarsale.doc_no,
  dbo.nt_1_sugarsale.DO_No AS DoNo,
  dbo.nt_1_sugarsale.mill_code
FROM
  dbo.nt_1_sugarsale
  LEFT JOIN dbo.nt_1_sugarsaledetails ON dbo.nt_1_sugarsale.saleid = dbo.nt_1_sugarsaledetails.saleid
WHERE
  (dbo.nt_1_sugarsale.IsDeleted = 1);