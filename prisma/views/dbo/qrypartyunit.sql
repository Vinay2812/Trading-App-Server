SELECT
  nt_1_partyunit.unit_code AS unit_code,
  nt_1_partyunit.Ac_Code AS Ac_Code,
  nt_1_partyunit.Unit_name AS Unit_name,
  nt_1_partyunit.Remarks AS Remarks,
  nt_1_partyunit.Company_Code AS Company_Code,
  nt_1_partyunit.Year_Code AS Year_Code,
  nt_1_partyunit.Created_By AS Created_By,
  nt_1_partyunit.Modified_By AS Modified_By,
  nt_1_partyunit.ac AS ac,
  nt_1_partyunit.uc AS uc,
  nt_1_partyunit.ucid AS ucid,
  qrymstaccountmaster.Ac_Name_E AS Ac_Name_E,
  qrymstaccountmaster_1.Ac_Name_E AS unitname
FROM
  (
    (
      nt_1_partyunit
      LEFT JOIN qrymstaccountmaster AS qrymstaccountmaster_1 ON (
        (nt_1_partyunit.uc = qrymstaccountmaster_1.accoid)
      )
    )
    LEFT JOIN qrymstaccountmaster ON ((nt_1_partyunit.ac = qrymstaccountmaster.accoid))
  );