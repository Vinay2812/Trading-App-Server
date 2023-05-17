SELECT
  nt_1_sugarpurchase.doc_no AS doc_no,
  nt_1_sugarpurchase.Tran_Type AS Tran_Type,
  nt_1_sugarpurchase.PURCNO AS PURCNO,
  nt_1_sugarpurchase.doc_date AS doc_date,
  nt_1_sugarpurchase.Ac_Code AS Ac_Code,
  nt_1_sugarpurchase.mill_code AS mill_code,
  nt_1_sugarpurchase.Company_Code AS Company_Code,
  nt_1_sugarpurchase.Year_Code AS Year_Code,
  nt_1_sugarpurchase.ac AS ac,
  nt_1_sugarpurchase.mc AS mc,
  nt_1_sugarpurchasedetails.item_code AS item_code,
  nt_1_sugarpurchasedetails.Quantal AS Quantal,
  nt_1_sugarpurchasedetails.bags AS bags,
  nt_1_sugarpurchasedetails.item_Amount AS item_Amount,
  nt_1_sugarpurchasedetails.ic AS ic
FROM
  (
    nt_1_sugarpurchase
    JOIN nt_1_sugarpurchasedetails ON (
      (
        nt_1_sugarpurchase.purchaseid = nt_1_sugarpurchasedetails.purchaseid
      )
    )
  );