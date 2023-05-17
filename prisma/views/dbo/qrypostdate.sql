SELECT
  post_date.Post_Date AS Post_Date,
  post_date.Inword_Date AS Inword_Date,
  post_date.Outword_Date AS Outword_Date,
  post_date.Company_Code AS Company_Code,
  post_date.Year_Code AS Year_Code,
  post_date.Created_By AS Created_By,
  post_date.Created_Date AS Created_Date,
  CONVERT(varchar(10), post_date.Post_Date, 103) AS postdateconversion,
  CONVERT(varchar(10), post_date.Inword_Date, 103) AS inworddateconversion,
  CONVERT(varchar(10), post_date.Outword_Date, 103) AS outworddateconversion
FROM
  post_date;