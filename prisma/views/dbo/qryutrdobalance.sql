SELECT
  qryutrdodetail.doc_no AS doc_no,
  qryutrdodetail.doc_date AS doc_date,
  qryutrdodetail.bank_ac AS bank_ac,
  qryutrdodetail.mill_code AS mill_code,
  qryutrdodetail.amount AS amount,
  qryutrdodetail.utr_no AS utr_no,
  qryutrdodetail.narration_header AS narration_header,
  qryutrdodetail.Company_Code AS Company_Code,
  qryutrdodetail.Year_Code AS Year_Code,
  qryutrdodetail.utrid AS utrid,
  qryutrdodetail.ba AS ba,
  qryutrdodetail.Ac_Name_E AS Ac_Name_E,
  qryutrdodetail.mc AS mc,
  qryutrdodetail.millname AS millname,
  qryutrdodetail.bankname AS bankname,
  qryutrdodetail.Detail_Id AS Detail_Id,
  qryutrdodetail.utrgradename AS utrgradename,
  qryutrdodetail.detailamount AS detailamount,
  qryutrdodetail.utrdetailid AS utrdetailid,
  SUM(ISNULL(qryutrdodetail.bankamount, 0)) AS usedamount,
  (
    qryutrdodetail.detailamount - SUM(ISNULL(qryutrdodetail.bankamount, 0))
  ) AS balanceamount
FROM
  qryutrdodetail
GROUP BY
  qryutrdodetail.doc_no,
  qryutrdodetail.doc_date,
  qryutrdodetail.bank_ac,
  qryutrdodetail.mill_code,
  qryutrdodetail.amount,
  qryutrdodetail.utr_no,
  qryutrdodetail.narration_header,
  qryutrdodetail.Company_Code,
  qryutrdodetail.Year_Code,
  qryutrdodetail.utrid,
  qryutrdodetail.ba,
  qryutrdodetail.Ac_Name_E,
  qryutrdodetail.mc,
  qryutrdodetail.millname,
  qryutrdodetail.bankname,
  qryutrdodetail.Detail_Id,
  qryutrdodetail.utrgradename,
  qryutrdodetail.detailamount,
  qryutrdodetail.utrdetailid;