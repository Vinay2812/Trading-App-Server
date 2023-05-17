SELECT
  DISTINCT dbo.NT_1_GLEDGER.TRAN_TYPE,
  dbo.NT_1_GLEDGER.CASHCREDIT,
  dbo.NT_1_GLEDGER.DOC_NO,
  dbo.NT_1_GLEDGER.DOC_DATE,
  dbo.NT_1_GLEDGER.COMPANY_CODE,
  dbo.NT_1_GLEDGER.YEAR_CODE,
  dbo.NT_1_GLEDGER.Branch_Code,
  dbo.NT_1_GLEDGER.SORT_TYPE,
  dbo.NT_1_GLEDGER.SORT_NO,
  dbo.NT_1_BillWiseQty.Item_Code,
  dbo.NT_1_BillWiseQty.NetQty,
  dbo.NT_1_BillWiseQty.category
FROM
  dbo.NT_1_GLEDGER
  RIGHT JOIN dbo.NT_1_BillWiseQty ON dbo.NT_1_GLEDGER.YEAR_CODE = dbo.NT_1_BillWiseQty.Year_Code
  AND dbo.NT_1_GLEDGER.COMPANY_CODE = dbo.NT_1_BillWiseQty.Company_Code
  AND dbo.NT_1_GLEDGER.DOC_NO = dbo.NT_1_BillWiseQty.Bill_No
  LEFT JOIN dbo.NT_1_qryCategory5kgBox ON dbo.NT_1_BillWiseQty.Company_Code = dbo.NT_1_qryCategory5kgBox.Company_Code
  AND dbo.NT_1_BillWiseQty.Item_Code = dbo.NT_1_qryCategory5kgBox.System_Code
  AND dbo.NT_1_BillWiseQty.category = dbo.NT_1_qryCategory5kgBox.fivekgbox
WHERE
  (dbo.NT_1_BillWiseQty.category = '6')
  AND (dbo.NT_1_GLEDGER.TRAN_TYPE = 'JS')
GROUP BY
  dbo.NT_1_GLEDGER.TRAN_TYPE,
  dbo.NT_1_GLEDGER.CASHCREDIT,
  dbo.NT_1_GLEDGER.DOC_NO,
  dbo.NT_1_GLEDGER.DOC_DATE,
  dbo.NT_1_GLEDGER.COMPANY_CODE,
  dbo.NT_1_GLEDGER.YEAR_CODE,
  dbo.NT_1_GLEDGER.Branch_Code,
  dbo.NT_1_GLEDGER.SORT_TYPE,
  dbo.NT_1_GLEDGER.SORT_NO,
  dbo.NT_1_BillWiseQty.Item_Code,
  dbo.NT_1_BillWiseQty.NetQty,
  dbo.NT_1_BillWiseQty.category;