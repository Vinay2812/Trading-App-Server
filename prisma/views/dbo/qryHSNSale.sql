SELECT
  doc_date,
  SUM(Bill_Amount) AS BillAmt,
  Company_Code,
  Year_Code,
  SUM(CGSTAmount) AS CgstAmt,
  SUM(SGSTAmount) AS SgstAmt,
  SUM(IGSTAmount) AS IgstAmt,
  SUM(TCS_Amt) AS TCSAmt,
  SUM(TCS_Net_Payable) AS NetPayable,
  Tran_Type,
  HSN
FROM
  dbo.qrysaleheaddetail
GROUP BY
  doc_date,
  Company_Code,
  Year_Code,
  Tran_Type,
  HSN
UNION
SELECT
  date,
  SUM(Final_Amount) AS BillAmt,
  Company_Code,
  Year_Code,
  SUM(CGSTAmount) AS CgstAmt,
  SUM(SGSTAmount) AS SgstAmt,
  SUM(IGSTAmount) AS IgstAmt,
  SUM(TCS_Amt) AS TCSAmt,
  SUM(TCS_Net_Payable) AS NetPayable,
  'CB' AS Tran_Type,
  HSN
FROM
  dbo.qryColdStorageHeadDetailBill
GROUP BY
  date,
  Company_Code,
  Year_Code,
  HSN
UNION
SELECT
  Doc_Date,
  SUM(NetValue) AS BillAmt,
  Company_Code,
  Year_Code,
  SUM(CGSTAmount) AS CgstAmt,
  SUM(SGSTAmount) AS SgstAmt,
  SUM(IGSTAmount) AS IgstAmt,
  SUM(TCS_Amount) AS TCSAmt,
  SUM(NetPayble) AS NetPayable,
  Tran_Type,
  HSN
FROM
  dbo.qryRetailSale
GROUP BY
  Doc_Date,
  Company_Code,
  Year_Code,
  HSN,
  Tran_Type
UNION
SELECT
  Date,
  SUM(Final_Amount) AS BillAmt,
  Company_Code,
  Year_Code,
  SUM(CGSTAmount) AS CgstAmt,
  SUM(SGSTAmount) AS SgstAmt,
  SUM(IGSTAmount) AS IgstAmt,
  SUM(TCS_Amt) AS TCSAmt,
  SUM(TCS_Net_Payable) AS NetPayable,
  'RB' AS Tran_Type,
  HSN
FROM
  dbo.qryrentbillheaddetail
GROUP BY
  Date,
  Company_Code,
  Year_Code,
  HSN
UNION
SELECT
  doc_date,
  SUM(bill_amount) AS BillAmt,
  Company_Code,
  Year_Code,
  SUM(cgst_amount) AS CgstAmt,
  SUM(sgst_amount) AS SgstAmt,
  SUM(igst_amount) AS IgstAmt,
  SUM(TCS_Amt) AS TCSAmt,
  SUM(TCS_Net_Payable) AS NetPayable,
  'LV' AS Tran_Type,
  HSN
FROM
  dbo.qrycommissionbill
GROUP BY
  doc_date,
  Company_Code,
  Year_Code,
  HSN;