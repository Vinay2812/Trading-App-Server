SELECT
  qrysalehead.Tran_Type AS bill_tran_type,
  qrysalehead.doc_no AS billno,
  qrysalehead.doc_date AS doc_date,
  qrysalehead.doc_dateConverted AS doc_dateConverted,
  qrysalehead.Ac_Code AS Ac_Code,
  qrysalehead.billtoname AS billtoname,
  qrysalehead.Unit_Code AS Unit_Code,
  qrysalehead.mill_code AS mill_code,
  qrysalehead.shiptoname AS shiptoname,
  qrysalehead.millname AS millname,
  qrysalehead.NETQNTL AS NETQNTL,
  qrysalehead.Bill_Amount AS Bill_Amount,
  qrysalehead.Year_Code AS Year_Code,
  qrysalehead.Company_Code AS Company_Code,
  qrysalehead.saleid AS saleid,
  multiple_receipt_detail.DOC_NO AS recno,
  multiple_receipt_detail.Doc_Date AS recdate,
  multiple_receipt_detail.Value AS received,
  multiple_receipt_detail.Adj_Value AS adjusted,
  multiple_receipt_detail.Narration AS Narration,
  qrysalehead.millshortname AS millshortname
FROM
  (
    qrysalehead
    LEFT JOIN multiple_receipt_detail ON (
      (
        (
          qrysalehead.saleid = multiple_receipt_detail.Bill_Auto_Id
        )
        AND (
          qrysalehead.Tran_Type = multiple_receipt_detail.Bill_Tran_Type
        )
      )
    )
  );