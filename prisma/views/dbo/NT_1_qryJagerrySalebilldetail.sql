SELECT
  Item_Code AS Item,
  ItemName,
  Qty,
  doc_no,
  TRAN_TYPE,
  Company_Code,
  Year_Code,
  Bill_no,
  Cust_Code
FROM
  dbo.NT_1_awakSale
UNION
SELECT
  Item_Code AS Item,
  ItemName,
  Qty,
  doc_no,
  TRAN_TYPE,
  Company_Code,
  Year_Code,
  Bill_no,
  Cust_Code
FROM
  qryJawakBalance;