SELECT
  qrymstsuppiler.citygststatecode,
  dbo.nt_1_gstratemaster.GST_Name,
  dbo.nt_1_gstratemaster.Rate,
  dbo.nt_1_gstratemaster.IGST AS igstrate,
  dbo.nt_1_gstratemaster.SGST AS sgstrate,
  dbo.nt_1_gstratemaster.CGST AS cgstrate,
  dbo.nt_1_other_purchase.Doc_No,
  dbo.nt_1_other_purchase.Doc_Date,
  dbo.nt_1_other_purchase.Supplier_Code,
  dbo.nt_1_other_purchase.Exp_Ac,
  dbo.nt_1_other_purchase.Narration,
  dbo.nt_1_other_purchase.Taxable_Amount,
  dbo.nt_1_other_purchase.GST_RateCode,
  dbo.nt_1_other_purchase.CGST_Rate,
  dbo.nt_1_other_purchase.CGST_Amount,
  dbo.nt_1_other_purchase.SGST_Rate,
  dbo.nt_1_other_purchase.SGST_Amount,
  dbo.nt_1_other_purchase.IGST_Rate,
  dbo.nt_1_other_purchase.IGST_Amount,
  dbo.nt_1_other_purchase.Other_Amount,
  dbo.nt_1_other_purchase.Bill_Amount,
  dbo.nt_1_other_purchase.Company_Code,
  dbo.nt_1_other_purchase.Created_By,
  dbo.nt_1_other_purchase.Modified_By,
  dbo.nt_1_other_purchase.Created_Date,
  dbo.nt_1_other_purchase.Modified_Date,
  dbo.nt_1_other_purchase.Year_Code,
  dbo.nt_1_other_purchase.TDS_Amt,
  dbo.nt_1_other_purchase.TDS_Per,
  dbo.nt_1_other_purchase.TDS,
  dbo.nt_1_other_purchase.TDS_Cutt_AcCode,
  dbo.nt_1_other_purchase.TDS_AcCode,
  dbo.nt_1_other_purchase.opid,
  dbo.nt_1_other_purchase.sc,
  dbo.nt_1_other_purchase.ea,
  dbo.nt_1_other_purchase.tca,
  dbo.nt_1_other_purchase.tac,
  qrymstsuppiler.Ac_Name_E AS suppilername,
  qrymstexp.Ac_Name_E AS expname,
  qrymsttdscutaccode.Ac_Name_E AS tdscutacname,
  qrymsttdaccode.Ac_Name_E AS tdsacname,
  CONVERT(
    varchar(10),
    dbo.nt_1_other_purchase.Doc_Date,
    103
  ) AS doc_dateConverted,
  dbo.nt_1_other_purchase.billno,
  dbo.nt_1_other_purchase.ASN_No,
  dbo.nt_1_other_purchase.einvoiceno,
  qrymstsuppiler.Gst_No,
  qrymstsuppiler.GSTStateCode
FROM
  dbo.nt_1_other_purchase
  LEFT JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_other_purchase.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.nt_1_other_purchase.GST_RateCode = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.qrymstaccountmaster AS qrymsttdaccode ON dbo.nt_1_other_purchase.tac = qrymsttdaccode.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrymsttdscutaccode ON dbo.nt_1_other_purchase.tca = qrymsttdscutaccode.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrymstexp ON dbo.nt_1_other_purchase.ea = qrymstexp.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrymstsuppiler ON dbo.nt_1_other_purchase.sc = qrymstsuppiler.accoid;