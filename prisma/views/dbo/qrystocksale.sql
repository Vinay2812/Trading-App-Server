SELECT
  nt_1_sugarsale.doc_no AS doc_no,
  nt_1_sugarsale.doc_date AS doc_date,
  nt_1_sugarsale.Ac_Code AS Ac_Code,
  nt_1_sugarsale.Company_Code AS Company_Code,
  nt_1_sugarsale.Year_Code AS Year_Code,
  nt_1_sugarsale.DO_No AS DO_No,
  nt_1_sugarsale.Tran_Type AS Tran_Type,
  nt_1_sugarsale.ac AS ac,
  nt_1_sugarsaledetails.item_code AS item_code,
  nt_1_sugarsaledetails.Quantal AS Quantal,
  nt_1_sugarsaledetails.bags AS bags,
  nt_1_sugarsaledetails.item_Amount AS item_Amount,
  nt_1_sugarsaledetails.ic AS ic,
  nt_1_sugarsale.mill_code AS mill_code,
  nt_1_sugarsale.mc AS mc
FROM
  (
    nt_1_sugarsale
    JOIN nt_1_sugarsaledetails ON (
      (
        nt_1_sugarsale.saleid = nt_1_sugarsaledetails.saleid
      )
    )
  );