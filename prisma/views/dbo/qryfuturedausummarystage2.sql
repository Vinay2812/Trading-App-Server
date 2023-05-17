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
  CASE
    WHEN buyqty = 0 THEN 0
    ELSE buyvalue / buyqty / lot_size
  END AS buyavg,
  Sqleqty,
  salevalue,
  CASE
    WHEN Sqleqty = 0 THEN 0
    ELSE salevalue / Sqleqty / lot_size
  END AS saleavg,
  CASE
    WHEN balanceqty = 0 THEN 0
    ELSE balancevalue / balanceqty / Lot_Size
  END AS balanceavg,
  balanceqty,
  balancevalue
FROM
  dbo.qryfuturedausummarystage1 AS F;