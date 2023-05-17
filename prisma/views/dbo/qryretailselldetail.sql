SELECT
  nt_1_retailselldetails.detail_id AS detail_id,
  nt_1_retailselldetails.doc_no AS doc_no,
  nt_1_retailselldetails.Tran_Type AS Tran_Type,
  nt_1_retailselldetails.Mill_Code AS Mill_Code,
  nt_1_retailselldetails.Item_Code AS Item_Code,
  nt_1_retailselldetails.Quantity AS Quantity,
  nt_1_retailselldetails.Billing_No AS Billing_No,
  nt_1_retailselldetails.Rate AS Rate,
  nt_1_retailselldetails.Value AS Value,
  nt_1_retailselldetails.Vat_Ac AS Vat_Ac,
  nt_1_retailselldetails.vat_percent AS vat_percent,
  nt_1_retailselldetails.vat_amount AS vat_amount,
  nt_1_retailselldetails.Gross AS Gross,
  nt_1_retailselldetails.Company_Code AS Company_Code,
  nt_1_retailselldetails.Year_Code AS Year_Code,
  nt_1_retailselldetails.Branch_Code AS Branch_Code,
  nt_1_retailselldetails.grade AS grade,
  nt_1_retailselldetails.retailid AS retailid,
  nt_1_retailselldetails.retaildetailid AS retaildetailid,
  nt_1_retailselldetails.ic AS ic,
  nt_1_retailselldetails.mc AS mc,
  nt_1_accountmaster.Ac_Name_E AS millname,
  nt_1_systemmaster.System_Name_E AS itemname,
  nt_1_retailselldetails.purchaseid AS purchaseid,
  nt_1_accountmaster.Short_Name AS millshortname,
  nt_1_systemmaster.KgPerKatta AS KgPerKatta,
  nt_1_systemmaster.HSN AS HSN
FROM
  (
    (
      nt_1_retailselldetails
      LEFT JOIN nt_1_systemmaster ON (
        (
          nt_1_retailselldetails.ic = nt_1_systemmaster.systemid
        )
      )
    )
    LEFT JOIN qrymstaccountmaster AS nt_1_accountmaster ON (
      (
        nt_1_retailselldetails.mc = nt_1_accountmaster.accoid
      )
    )
  );