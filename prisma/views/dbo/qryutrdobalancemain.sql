SELECT
  qryutrdobalanceraw.doc_no AS doc_no,
  qryutrheaddetail.doc_date AS doc_date,
  qryutrheaddetail.bank_ac AS bank_ac,
  qryutrheaddetail.mill_code AS mill_code,
  qryutrheaddetail.amount AS amount,
  qryutrheaddetail.utr_no AS utr_no,
  qryutrheaddetail.narration_header AS narration_header,
  qryutrdobalanceraw.Company_Code AS Company_Code,
  qryutrdobalanceraw.Year_Code AS Year_Code,
  qryutrdobalanceraw.utrid AS utrid,
  qryutrheaddetail.ba AS ba,
  qryutrheaddetail.Ac_Name_E AS Ac_Name_E,
  qryutrheaddetail.mc AS mc,
  qryutrheaddetail.millname AS millname,
  qryutrheaddetail.bankname AS bankname,
  qryutrdobalanceraw.Detail_Id AS Detail_Id,
  qryutrheaddetail.utrgradename AS utrgradename,
  qryutrdobalanceraw.detailamount AS detailamount,
  qryutrdobalanceraw.usedamount AS usedamount,
  qryutrdobalanceraw.balanceamount AS balanceamount
FROM
  (
    qryutrdobalanceraw
    LEFT JOIN qryutrheaddetail ON (
      (
        qryutrdobalanceraw.utrid = qryutrheaddetail.utrid
      )
    )
  );