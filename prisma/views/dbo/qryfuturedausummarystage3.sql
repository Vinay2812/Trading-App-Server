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
  CASE
    WHEN balanceqty = 0 THEN (buyvalue - salevalue)
    WHEN balanceqty < 0 THEN (buyqty * buyavg * Lot_Size) - (buyqty * saleavg * Lot_Size)
    ELSE (Sqleqty * buyavg * Lot_Size) - (Sqleqty * saleavg * Lot_Size)
  END AS profit
FROM
  dbo.qryfuturedausummarystage2;