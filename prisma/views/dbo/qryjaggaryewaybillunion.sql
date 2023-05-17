SELECT
  TRAN_TYPE AS TYPE,
  doc_no,
  Item_Code,
  ItemName,
  Qty,
  Net_Wt,
  Gross_Rate AS Rate,
  Gross_Amnt AS Sale_value,
  Bill_No,
  Brand_Name,
  CONVERT(varchar(10), DOC_DATE, 103) AS DOC_DATE,
  Year_Code,
  Cust_Code,
  Company_Code
FROM
  NT_1_awakSale
WHERE
  Cust_Code <> 2
UNION
ALL
SELECT
  TRAN_TYPE,
  doc_no,
  Item_Code,
  ItemName,
  Qty,
  Net_Wt AS netqty,
  Gross_Rate AS Rate,
  Gross_Amnt AS Sale_value,
  Bill_No,
  Brand_Name,
  CONVERT(varchar(10), DOC_DATE, 103) AS DOC_DATE,
  Year_Code,
  Cust_Code,
  Company_Code
FROM
  qryJawakBalance
WHERE
  Cust_Code <> 2;