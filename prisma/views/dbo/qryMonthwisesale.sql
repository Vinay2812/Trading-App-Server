SELECT
  YEAR(dbo.nt_1_sugarsale.doc_date) AS yr,
  MONTH(dbo.nt_1_sugarsale.doc_date) AS mn,
  dbo.nt_1_sugarsale.Company_Code,
  dbo.nt_1_sugarsale.Year_Code,
  ISNULL(SUM(dbo.nt_1_sugarsaledetails.Quantal), 0) AS qntl,
  ISNULL(SUM(dbo.nt_1_sugarsaledetails.item_Amount), 0) AS itmamount
FROM
  dbo.nt_1_sugarsale
  JOIN dbo.nt_1_sugarsaledetails ON dbo.nt_1_sugarsale.saleid = dbo.nt_1_sugarsaledetails.saleid
GROUP BY
  dbo.nt_1_sugarsale.Company_Code,
  dbo.nt_1_sugarsale.Year_Code,
  YEAR(dbo.nt_1_sugarsale.doc_date),
  MONTH(dbo.nt_1_sugarsale.doc_date);