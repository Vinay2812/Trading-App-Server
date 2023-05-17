SELECT
  reverse_charge_head.Tran_Type AS Tran_Type,
  reverse_charge_head.Charge_Type AS Charge_Type,
  reverse_charge_head.Reverce_Charge AS Reverce_Charge,
  reverse_charge_head.Doc_No AS Doc_No,
  reverse_charge_head.Doc_Date AS Doc_Date,
  CONVERT(varchar(10), reverse_charge_head.Doc_Date, 103) AS Doc_DateConverted,
  reverse_charge_head.Supplier_Ac AS Supplier_Ac,
  reverse_charge_head.State_Code AS State_Code,
  reverse_charge_head.Expenses_Ac AS Expenses_Ac,
  reverse_charge_head.Description AS Description,
  reverse_charge_head.Bill_Amount AS Bill_Amount,
  reverse_charge_head.TDS_Applicable AS TDS_Applicable,
  reverse_charge_head.TDS_Bill_Amount AS TDS_Bill_Amount,
  reverse_charge_head.TDS_Rate AS TDS_Rate,
  reverse_charge_head.TDS_Amount AS TDS_Amount,
  reverse_charge_head.TDS_Ac AS TDS_Ac,
  reverse_charge_head.GST_Net_Amount AS GST_Net_Amount,
  reverse_charge_head.HSN AS HSN,
  reverse_charge_head.SAC AS SAC,
  reverse_charge_head.GST_Rate AS GST_Rate,
  reverse_charge_head.CGST_Rate AS CGST_Rate,
  reverse_charge_head.CGST_Amount AS CGST_Amount,
  reverse_charge_head.SGST_Rate AS SGST_Rate,
  reverse_charge_head.SGST_Amount AS SGST_Amount,
  reverse_charge_head.IGST_Rate AS IGST_Rate,
  reverse_charge_head.IGST_Amount AS IGST_Amount,
  reverse_charge_head.Year_Code AS Year_Code,
  reverse_charge_head.Branch_Code AS Branch_Code,
  reverse_charge_head.Created_By AS Created_By,
  reverse_charge_head.Modified_By AS Modified_By,
  reverse_charge_head.Company_Code AS Company_Code,
  reverse_charge_head.Net_Amount AS Net_Amount,
  reverse_charge_head.sa AS sa,
  reverse_charge_head.ea AS ea,
  reverse_charge_head.ta AS ta,
  reverse_charge_head.rcid AS rcid,
  qrymstsupplier.Ac_Name_E AS suppliername,
  qrymstexpenses.Ac_Name_E AS expensesname,
  qrymsttds.Ac_Name_E AS tdsname,
  qrymstsupplier.citygststatecode AS supplierstatecode,
  gststatemaster.State_Name AS State_Name
FROM
  (
    (
      (
        (
          reverse_charge_head
          LEFT JOIN gststatemaster ON (
            (
              reverse_charge_head.State_Code = gststatemaster.State_Code
            )
          )
        )
        LEFT JOIN qrymstaccountmaster AS qrymstsupplier ON ((reverse_charge_head.sa = qrymstsupplier.accoid))
      )
      LEFT JOIN qrymstaccountmaster AS qrymstexpenses ON ((reverse_charge_head.ea = qrymstexpenses.accoid))
    )
    LEFT JOIN qrymstaccountmaster AS qrymsttds ON ((reverse_charge_head.ta = qrymsttds.accoid))
  );