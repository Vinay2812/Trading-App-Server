SELECT
  Doc_No,
  Doc_Date,
  Ac_Code,
  Script_Code,
  Expiry_Date,
  Lot_Size,
  Future_Type,
  buyqty,
  buyvalue,
  buyavg,
  Sqleqty,
  salevalue,
  saleavg,
  balanceavg,
  balanceqty,
  balancevalue,
  profit
FROM
  qryfuturedausummarystage3
WHERE
  balanceqty = 0
UNION
SELECT
  Doc_No,
  Doc_Date,
  Ac_Code,
  Script_Code,
  Expiry_Date,
  Lot_Size,
  Future_Type,
  buyqty,
  buyvalue,
  buyavg,
  0 AS Sqleqty,
  0 AS salevalue,
  0 AS saleavg,
  buyavg AS balanceavg,
  buyqty AS balanceqty,
  buyvalue AS balancevalue,
  0 AS profit
FROM
  qryfuturedausummarystage3
WHERE
  balanceqty > 0
  AND Sqleqty = 0
UNION
SELECT
  Doc_No,
  Doc_Date,
  Ac_Code,
  Script_Code,
  Expiry_Date,
  Lot_Size,
  Future_Type,
  0 AS buyqty,
  0 AS buyvalue,
  0 AS buyavg,
  Sqleqty,
  salevalue,
  saleavg,
  saleavg AS balanceavg,
  - Sqleqty AS balanceqty,
  salevalue AS balancevalue,
  0 AS profit
FROM
  qryfuturedausummarystage3
WHERE
  balanceqty < 0
  AND buyqty = 0
UNION
SELECT
  Doc_No,
  Doc_Date,
  Ac_Code,
  Script_Code,
  Expiry_Date,
  Lot_Size,
  Future_Type,
  Sqleqty AS buyqty,
  Sqleqty * buyavg * Lot_Size AS buyvalue,
  buyavg,
  Sqleqty,
  salevalue,
  saleavg,
  0 AS balanceavg,
  0 AS balanceqty,
  0 AS balancevalue,
  (Sqleqty * buyavg * Lot_Size) - salevalue AS profit
FROM
  qryfuturedausummarystage3
WHERE
  balanceqty > 0
  AND buyqty - Sqleqty > 0
  AND Sqleqty <> 0
UNION
SELECT
  Doc_No,
  Doc_Date,
  Ac_Code,
  Script_Code,
  Expiry_Date,
  Lot_Size,
  Future_Type,
  balanceqty AS buyqty,
  balanceqty * buyavg * Lot_Size AS buyvalue,
  buyavg,
  0 AS Sqleqty,
  0 AS salevalue,
  0 AS saleavg,
  buyavg AS balanceavg,
  balanceqty,
  balanceqty * buyavg * Lot_Size AS balancevalue,
  0 AS profit
FROM
  qryfuturedausummarystage3
WHERE
  balanceqty > 0
  AND buyqty - Sqleqty > 0
  AND Sqleqty <> 0
UNION
SELECT
  Doc_No,
  Doc_Date,
  Ac_Code,
  Script_Code,
  Expiry_Date,
  Lot_Size,
  Future_Type,
  buyqty AS buyqty,
  buyqty * buyavg * Lot_Size AS buyvalue,
  buyavg,
  buyqty AS Sqleqty,
  buyqty * saleavg * Lot_Size AS salevalue,
  saleavg,
  0 AS balanceavg,
  0 AS balanceqty,
  0 AS balancevalue,
  buyvalue - (buyqty * saleavg * Lot_Size) AS profit
FROM
  qryfuturedausummarystage3
WHERE
  balanceqty < 0
  AND buyqty - Sqleqty < 0
  AND buyqty <> 0
UNION
SELECT
  Doc_No,
  Doc_Date,
  Ac_Code,
  Script_Code,
  Expiry_Date,
  Lot_Size,
  Future_Type,
  0 AS buyqty,
  0 AS buyvalue,
  0 AS buyavg,
  ABS(balanceqty) AS Sqleqty,
  balanceqty * saleavg * Lot_Size AS salevalue,
  saleavg,
  saleavg AS balanceavg,
  balanceqty,
  balanceqty * saleavg * Lot_Size AS balancevalue,
  0 AS profit
FROM
  qryfuturedausummarystage3
WHERE
  balanceqty < 0
  AND buyqty - Sqleqty < 0
  AND buyqty <> 0;