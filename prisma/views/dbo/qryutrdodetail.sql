SELECT
  qryutrheaddetail.doc_no AS doc_no,
  qryutrheaddetail.doc_date AS doc_date,
  qryutrheaddetail.bank_ac AS bank_ac,
  qryutrheaddetail.mill_code AS mill_code,
  qryutrheaddetail.amount AS amount,
  qryutrheaddetail.utr_no AS utr_no,
  qryutrheaddetail.narration_header AS narration_header,
  qryutrheaddetail.narration_footer AS narration_footer,
  qryutrheaddetail.Company_Code AS Company_Code,
  qryutrheaddetail.Year_Code AS Year_Code,
  qryutrheaddetail.Branch_Code AS Branch_Code,
  qryutrheaddetail.Created_By AS Created_By,
  qryutrheaddetail.Modified_By AS Modified_By,
  qryutrheaddetail.IsSave AS IsSave,
  qryutrheaddetail.Lott_No AS Lott_No,
  qryutrheaddetail.utrid AS utrid,
  qryutrheaddetail.ba AS ba,
  qryutrheaddetail.mc AS mc,
  qryutrheaddetail.Ac_Name_E AS Ac_Name_E,
  qryutrheaddetail.millname AS millname,
  qryutrheaddetail.millgstno AS millgstno,
  qryutrheaddetail.millemailid AS millemailid,
  qryutrheaddetail.millcityname AS millcityname,
  qryutrheaddetail.millcitystate AS millcitystate,
  qryutrheaddetail.millstatecode AS millstatecode,
  qryutrheaddetail.bankname AS bankname,
  qryutrheaddetail.Detail_Id AS Detail_Id,
  qryutrheaddetail.utrgradename AS utrgradename,
  qryutrheaddetail.detailamount AS detailamount,
  qryutrheaddetail.tenderid AS tenderid,
  qryutrheaddetail.utrdetailid AS utrdetailid,
  qryutrheaddetail.Adjusted_Amt AS Adjusted_Amt,
  qryutrheaddetail.lot_no AS lot_no,
  qryutrheaddetail.lotCompany_Code AS lotCompany_Code,
  qryutrheaddetail.lotYear_Code AS lotYear_Code,
  qryutrheaddetail.doc_dateConverted AS doc_dateConverted,
  qrydoheaddetail.doc_no AS dono,
  qrydoheaddetail.doc_date AS dodate,
  qrydoheaddetail.doc_dateConverted AS dodateconverted,
  qrydoheaddetail.quantal AS quantal,
  qrydoheaddetail.mill_rate AS mill_rate,
  qrydoheaddetail.bankamount AS bankamount,
  qryutrheaddetail.millshortname AS millshortname
FROM
  (
    qryutrheaddetail
    LEFT JOIN qrydoheaddetail ON (
      (
        qryutrheaddetail.utrdetailid = qrydoheaddetail.utrdetailid
      )
    )
  );