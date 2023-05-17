SELECT
  qrysugarstockbook.doc_no AS doc_no,
  qrysugarstockbook.doc_date AS doc_date,
  qrysugarstockbook.Ac_Code AS Ac_Code,
  qrysugarstockbook.Company_Code AS Company_Code,
  qrysugarstockbook.Year_Code AS Year_Code,
  qrysugarstockbook.DO_No AS DO_No,
  qrysugarstockbook.Tran_Type AS Tran_Type,
  qrysugarstockbook.ac AS ac,
  qrysugarstockbook.item_code AS item_code,
  qrysugarstockbook.Qntl AS Qntl,
  qrysugarstockbook.bags AS bags,
  qrysugarstockbook.amount AS amount,
  qrysugarstockbook.ic AS ic,
  qrysugarstockbook.mill_code AS mill_code,
  qrysugarstockbook.mc AS mc,
  qrymstaccountmaster.Ac_Name_E AS PartyName,
  qrymill.Short_Name AS millShortName,
  qrymstitem.System_Name_E AS itemname
FROM
  (
    (
      (
        qrysugarstockbook
        LEFT JOIN qrymstitem ON ((qrysugarstockbook.ic = qrymstitem.systemid))
      )
      LEFT JOIN qrymstaccountmaster AS qrymill ON ((qrysugarstockbook.mc = qrymill.accoid))
    )
    LEFT JOIN qrymstaccountmaster ON (
      (
        qrysugarstockbook.ac = qrymstaccountmaster.accoid
      )
    )
  );