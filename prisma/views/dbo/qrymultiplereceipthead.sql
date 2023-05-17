SELECT
  qrymstbankcode.Ac_Name_E AS Bankname,
  qrymstaccountcode.Ac_Name_E AS Accountname,
  multiple_receipt_head.Tran_Type AS Tran_Type,
  multiple_receipt_head.DOC_NO AS DOC_NO,
  multiple_receipt_head.mr_no AS mr_no,
  multiple_receipt_head.Doc_Date AS Doc_Date,
  CONVERT(varchar(10), multiple_receipt_head.Doc_Date, 103) AS Doc_DateConverted,
  multiple_receipt_head.Bank_Code AS Bank_Code,
  multiple_receipt_head.bc AS bc,
  multiple_receipt_head.Ac_Code AS Ac_Code,
  multiple_receipt_head.ac AS ac,
  multiple_receipt_head.Amount AS Amount,
  multiple_receipt_head.Company_Code AS Company_Code,
  multiple_receipt_head.Year_Code AS Year_Code,
  multiple_receipt_head.Created_By AS Created_By,
  multiple_receipt_head.Modified_By AS Modified_By,
  multiple_receipt_head.narration AS narration
FROM
  (
    (
      multiple_receipt_head
      LEFT JOIN qrymstaccountmaster AS qrymstaccountcode ON (
        (
          multiple_receipt_head.ac = qrymstaccountcode.accoid
        )
      )
    )
    LEFT JOIN qrymstaccountmaster AS qrymstbankcode ON (
      (multiple_receipt_head.bc = qrymstbankcode.accoid)
    )
  );