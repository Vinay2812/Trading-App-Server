SELECT
  qryutrdobalanceforview.Detail_Id AS Detail_Id,
  qryutrdobalanceforview.doc_no AS doc_no,
  qryutrdobalanceforview.lot_no AS lot_no,
  qryutrdobalanceforview.grade_no AS grade_no,
  qryutrdobalanceforview.Company_Code AS Company_Code,
  qryutrdobalanceforview.Year_Code AS Year_Code,
  qryutrdobalanceforview.utrdetailid AS utrdetailid,
  qryutrdobalanceforview.utrid AS utrid,
  qryutrdobalanceforview.ln AS ln,
  qryutrdobalanceforview.amount AS amount,
  qryutrdobalanceforview.paidamount AS paidamount,
  qryutrdobalanceforview.balanceamount AS balanceamount,
  qryutrhead.doc_no AS utrno,
  qryutrhead.doc_date AS utrdate,
  qryutrhead.doc_dateConverted AS utrdateConverted,
  qryutrhead.mill_code AS mill_code,
  qryutrhead.amount AS utrheadamount,
  qryutrhead.utr_no AS utr_no,
  qryutrhead.narration_header AS narration_header,
  qryutrhead.millshortname AS millshortname,
  qryutrhead.bankname AS bankname
FROM
  (
    qryutrdobalanceforview
    LEFT JOIN qryutrhead ON (
      (qryutrdobalanceforview.utrid = qryutrhead.utrid)
    )
  );