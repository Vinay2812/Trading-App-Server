SELECT
  dbo.NT_1_Awakhead.CASHCREDIT,
  dbo.NT_1_Awakhead.billno,
  dbo.NT_1_Awakhead.vehno,
  dbo.NT_1_Awakhead.AC_CODE,
  dbo.NT_1_Awakhead.SUBTOTAL,
  dbo.NT_1_Awakhead.purchasevalue,
  dbo.NT_1_Awakhead.salevalue,
  dbo.NT_1_Awakhead.stockvalue,
  dbo.NT_1_Awakhead.netqty,
  dbo.NT_1_Awakhead.addless,
  dbo.NT_1_Awakhead.MARKETSES,
  dbo.NT_1_Awakhead.supercost,
  dbo.NT_1_Awakhead.kharajat,
  dbo.NT_1_Awakhead.AMOUNT,
  dbo.NT_1_Awakhead.vatamt,
  dbo.NT_1_Awakhead.awakno,
  dbo.NT_1_Awakhead.oldcompname AS Expr6,
  dbo.NT_1_Awakhead.adat,
  dbo.NT_1_Awakhead.tdsamount,
  dbo.NT_1_Awakhead.tdsperc,
  dbo.NT_1_Awakhead.awakordercode,
  dbo.NT_1_Awakhead.AwakYearCode,
  dbo.NT_1_AwakDetail.Tran_Type,
  dbo.NT_1_AwakDetail.Doc_No,
  dbo.NT_1_AwakDetail.Cust_Code,
  dbo.NT_1_AwakDetail.Item_Code,
  dbo.NT_1_AwakDetail.Brand_Code,
  dbo.NT_1_AwakDetail.Bill_No,
  dbo.NT_1_AwakDetail.Qty,
  dbo.NT_1_AwakDetail.Net_Wt,
  dbo.NT_1_AwakDetail.Purc_Rate,
  dbo.NT_1_AwakDetail.Purc_Amnt,
  dbo.NT_1_AwakDetail.Sale_Rate,
  dbo.NT_1_AwakDetail.Sale_Amnt,
  dbo.NT_1_AwakDetail.Comm_Rate,
  dbo.NT_1_AwakDetail.Comm_Amnt,
  dbo.NT_1_AwakDetail.Hamali_Code,
  dbo.NT_1_AwakDetail.Hamali_Amnt,
  dbo.NT_1_AwakDetail.Packing_Code,
  dbo.NT_1_AwakDetail.Packing_Amnt,
  dbo.NT_1_AwakDetail.Other_Rate,
  dbo.NT_1_AwakDetail.Other_Amnt,
  dbo.NT_1_AwakDetail.Other_PM,
  dbo.NT_1_AwakDetail.Gross_Rate,
  dbo.NT_1_AwakDetail.Gross_Amnt,
  dbo.NT_1_AwakDetail.Sr,
  dbo.NT_1_AwakDetail.Shub_Rate,
  dbo.NT_1_AwakDetail.Shub_Amnt,
  dbo.NT_1_AwakDetail.Panjar_Rate,
  dbo.NT_1_AwakDetail.Panjar_Amnt,
  dbo.NT_1_AwakDetail.Company_Code,
  dbo.NT_1_AwakDetail.detail_id,
  dbo.NT_1_AwakDetail.Created_By,
  dbo.NT_1_AwakDetail.Modified_By,
  dbo.NT_1_AwakDetail.Branch_Code,
  dbo.NT_1_AwakDetail.prefix,
  dbo.NT_1_AwakDetail.ordercode,
  dbo.NT_1_AwakDetail.sbno,
  dbo.NT_1_AwakDetail.LEVI,
  dbo.NT_1_AwakDetail.oldcompname,
  item.System_Name_E AS Item_Name,
  hamali.System_Name_E AS Hamali_Name,
  packing.System_Name_E AS Packing_Name,
  dbo.NT_1_BrandMaster.Brand_Name,
  customer.Ac_Name_E AS Customer_Name,
  dbo.NT_1_Awakhead.Year_Code,
  supplier.Ac_Name_E AS Supplier_Name,
  dbo.NT_1_AwakDetail.Levi_Rate,
  dbo.NT_1_AwakDetail.Insurance_Rate,
  dbo.NT_1_AwakDetail.Levi_Amt,
  dbo.NT_1_AwakDetail.Insurance_Amt,
  CONVERT(varchar(10), dbo.NT_1_Awakhead.DOC_DATE, 103) AS DOC_DATE,
  dbo.NT_1_Awakhead.levi AS levihead,
  dbo.NT_1_Awakhead.TCS_Rate,
  dbo.NT_1_Awakhead.TCS_Amt,
  dbo.NT_1_Awakhead.TCS_Net_Payable,
  dbo.NT_1_Awakhead.GST_RateCode,
  dbo.NT_1_Awakhead.SGST_Amount,
  dbo.NT_1_Awakhead.SGST_Rate,
  dbo.NT_1_Awakhead.CGST_Amount,
  dbo.NT_1_Awakhead.CGST_Rate,
  dbo.NT_1_Awakhead.IGST_Amount,
  dbo.NT_1_Awakhead.IGST_Rate,
  dbo.NT_1_Awakhead.TaxableAmount,
  ISNULL(dbo.NT_1_AwakDetail.Poch_Rate, 0) AS Poch_Rate,
  ISNULL(dbo.NT_1_AwakDetail.Frieght_Rate, 0) AS Frieght_Rate
FROM
  dbo.NT_1_Awakhead
  LEFT JOIN dbo.NT_1_AwakDetail ON dbo.NT_1_Awakhead.Year_Code = dbo.NT_1_AwakDetail.Year_Code
  AND dbo.NT_1_Awakhead.TRAN_TYPE = dbo.NT_1_AwakDetail.Tran_Type
  AND dbo.NT_1_Awakhead.doc_no = dbo.NT_1_AwakDetail.Doc_No
  AND dbo.NT_1_Awakhead.Company_Code = dbo.NT_1_AwakDetail.Company_Code
  LEFT JOIN dbo.NT_1_JaggarySystemMaster AS packing ON dbo.NT_1_AwakDetail.Packing_Code = packing.System_Code
  AND dbo.NT_1_AwakDetail.Company_Code = packing.Company_Code
  LEFT JOIN dbo.NT_1_JaggarySystemMaster AS item ON dbo.NT_1_AwakDetail.Item_Code = item.System_Code
  AND dbo.NT_1_AwakDetail.Company_Code = item.Company_Code
  LEFT JOIN dbo.NT_1_JaggarySystemMaster AS hamali ON dbo.NT_1_AwakDetail.Hamali_Code = hamali.System_Code
  AND dbo.NT_1_AwakDetail.Company_Code = hamali.Company_Code
  LEFT JOIN dbo.nt_1_accountmaster AS supplier ON dbo.NT_1_Awakhead.Company_Code = supplier.company_code
  AND dbo.NT_1_Awakhead.AC_CODE = supplier.Ac_Code
  LEFT JOIN dbo.NT_1_BrandMaster ON dbo.NT_1_AwakDetail.Brand_Code = dbo.NT_1_BrandMaster.Doc_No
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_BrandMaster.Company_Code
  LEFT JOIN dbo.nt_1_accountmaster AS customer ON dbo.NT_1_AwakDetail.Cust_Code = customer.Ac_Code
  AND dbo.NT_1_AwakDetail.Company_Code = customer.company_code
WHERE
  (dbo.NT_1_Awakhead.TRAN_TYPE = 'AW')
  AND (item.System_Type = 'I')
  AND (hamali.System_Type = 'H')
  AND (packing.System_Type = 'P');