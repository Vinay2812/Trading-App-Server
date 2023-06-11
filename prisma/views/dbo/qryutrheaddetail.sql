SELECT
  qryutrhead.doc_no AS doc_no,
  qryutrhead.doc_date AS doc_date,
  qryutrhead.bank_ac AS bank_ac,
  qryutrhead.mill_code AS mill_code,
  qryutrhead.amount AS amount,
  qryutrhead.utr_no AS utr_no,
  qryutrhead.narration_header AS narration_header,
  qryutrhead.narration_footer AS narration_footer,
  qryutrhead.Company_Code AS Company_Code,
  qryutrhead.Year_Code AS Year_Code,
  qryutrhead.Branch_Code AS Branch_Code,
  qryutrhead.Created_By AS Created_By,
  qryutrhead.Modified_By AS Modified_By,
  qryutrhead.IsSave AS IsSave,
  qryutrhead.Lott_No AS Lott_No,
  qryutrhead.utrid AS utrid,
  qryutrhead.ba AS ba,
  qryutrhead.mc AS mc,
  qryutrhead.Ac_Name_E AS Ac_Name_E,
  qryutrhead.millname AS millname,
  qryutrhead.millgstno AS millgstno,
  qryutrhead.millemailid AS millemailid,
  qryutrhead.millcityname AS millcityname,
  qryutrhead.millcitystate AS millcitystate,
  qryutrhead.millstatecode AS millstatecode,
  qryutrhead.bankname AS bankname,
  nt_1_utrdetail.Detail_Id AS Detail_Id,
  nt_1_utrdetail.grade_no AS utrgradename,
  nt_1_utrdetail.amount AS detailamount,
  nt_1_utrdetail.ln AS tenderid,
  nt_1_utrdetail.utrdetailid AS utrdetailid,
  nt_1_utrdetail.Adjusted_Amt AS Adjusted_Amt,
  nt_1_utrdetail.lot_no AS lot_no,
  nt_1_utrdetail.lotCompany_Code AS lotCompany_Code,
  nt_1_utrdetail.lotYear_Code AS lotYear_Code,
  qryutrhead.doc_dateConverted AS doc_dateConverted,
  qryutrhead.millshortname AS millshortname,
  qryutrhead.MillPincode AS MillPincode
FROM
  (
    qryutrhead
    LEFT JOIN nt_1_utrdetail ON ((qryutrhead.utrid = nt_1_utrdetail.utrid))
  );