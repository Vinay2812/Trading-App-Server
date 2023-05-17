SELECT
  nt_1_utr.doc_no AS doc_no,
  nt_1_utr.doc_date AS doc_date,
  CONVERT(varchar(10), nt_1_utr.doc_date, 103) AS doc_dateConverted,
  nt_1_utr.bank_ac AS bank_ac,
  nt_1_utr.mill_code AS mill_code,
  nt_1_utr.amount AS amount,
  nt_1_utr.utr_no AS utr_no,
  nt_1_utr.narration_header AS narration_header,
  nt_1_utr.narration_footer AS narration_footer,
  nt_1_utr.Company_Code AS Company_Code,
  nt_1_utr.Year_Code AS Year_Code,
  nt_1_utr.Branch_Code AS Branch_Code,
  nt_1_utr.Created_By AS Created_By,
  nt_1_utr.Modified_By AS Modified_By,
  nt_1_utr.IsSave AS IsSave,
  nt_1_utr.Lott_No AS Lott_No,
  nt_1_utr.utrid AS utrid,
  nt_1_utr.ba AS ba,
  nt_1_utr.mc AS mc,
  qrymillmaster.Ac_Name_E AS Ac_Name_E,
  qrymillmaster.Address_E AS millname,
  qrymillmaster.Gst_No AS millgstno,
  qrymillmaster.Email_Id AS millemailid,
  qrymillmaster.cityname AS millcityname,
  qrymillmaster.citystate AS millcitystate,
  qrymillmaster.citygststatecode AS millstatecode,
  qrybankmaster.Ac_Name_E AS bankname,
  qrymillmaster.Short_Name AS millshortname,
  qrymillmaster.Pincode AS MillPincode,
  qrybankmaster.Short_Name AS bankShortName
FROM
  (
    (
      nt_1_utr
      LEFT JOIN qrymstaccountmaster AS qrybankmaster ON ((nt_1_utr.ba = qrybankmaster.accoid))
    )
    LEFT JOIN qrymstaccountmaster AS qrymillmaster ON ((nt_1_utr.mc = qrymillmaster.accoid))
  );