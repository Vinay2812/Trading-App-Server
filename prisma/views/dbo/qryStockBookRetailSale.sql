SELECT
  Tran_Type,
  Doc_Date,
  Party_Code AS Ac_Code,
  Item_Code,
  SUM(Netkg / 100) AS Qty,
  'C' AS drcr,
  Company_Code,
  Year_Code,
  SUM(Taxable_Amount1) AS itemvalue,
  Brand_Code,
  Doc_No,
  0 AS DoNo,
  MillCode
FROM
  dbo.qryRetailSale
WHERE
  (IsDelete <> 0)
GROUP BY
  Tran_Type,
  Doc_Date,
  Party_Code,
  Company_Code,
  Year_Code,
  Brand_Code,
  Doc_No,
  MillCode,
  Item_Code;