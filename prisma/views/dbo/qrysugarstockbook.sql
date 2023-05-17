SELECT
  qrystocksale.doc_no AS doc_no,
  qrystocksale.doc_date AS doc_date,
  qrystocksale.Ac_Code AS Ac_Code,
  qrystocksale.Company_Code AS Company_Code,
  qrystocksale.Year_Code AS Year_Code,
  qrystocksale.DO_No AS DO_No,
  qrystocksale.Tran_Type AS Tran_Type,
  qrystocksale.ac AS ac,
  qrystocksale.item_code AS item_code,
  qrystocksale.Quantal AS Qntl,
  qrystocksale.bags AS bags,
  qrystocksale.item_Amount AS amount,
  qrystocksale.ic AS ic,
  qrystocksale.mill_code AS mill_code,
  qrystocksale.mc AS mc
FROM
  qrystocksale
UNION
SELECT
  qrystockpurchase.doc_no AS #, qrystockpurchase.doc_date AS doc_date, qrystockpurchase.Ac_Code AS Ac_Code, qrystockpurchase.Company_Code AS Company_Code, qrystockpurchase.Year_Code AS Year_Code, qrystockpurchase.PURCNO AS DO_No, qrystockpurchase.Tran_Type AS Tran_Type, qrystockpurchase.ac AS ac, qrystockpurchase.item_code AS item_code, qrystockpurchase.Quantal AS Qntl, qrystockpurchase.bags AS bags, qrystockpurchase.item_Amount AS amount, qrystockpurchase.ic AS ic, qrystockpurchase.mill_code AS mill_code, qrystockpurchase.mc AS mc FROM qrystockpurchase UNION SELECT qrystockretailsale.doc_no AS #, qrystockretailsale.doc_date AS doc_date, qrystockretailsale.Party_Code AS Ac_Code, qrystockretailsale.Company_Code AS Company_Code, qrystockretailsale.Year_Code AS Year_Code, 0 AS DO_No, qrystockretailsale.Tran_Type AS Tran_Type, qrystockretailsale.ac AS ac, qrystockretailsale.Item_Code AS item_code, qrystockretailsale.Quantity AS Qntl, qrystockretailsale.Quantity AS bags, qrystockretailsale.Value AS amount, qrystockretailsale.ic AS ic, qrystockretailsale.Mill_Code AS Mill_Code, qrystockretailsale.mc AS mc FROM qrystockretailsale;