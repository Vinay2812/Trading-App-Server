SELECT
  dbo.NT_1_Awakhead.TRAN_TYPE,
  dbo.NT_1_Awakhead.CASHCREDIT,
  dbo.NT_1_Awakhead.doc_no,
  dbo.NT_1_Awakhead.DOC_DATE,
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
  dbo.NT_1_Awakhead.levi,
  dbo.NT_1_Awakhead.AMOUNT,
  dbo.NT_1_Awakhead.Company_Code,
  dbo.NT_1_Awakhead.vatamt,
  dbo.NT_1_Awakhead.awakno,
  dbo.NT_1_Awakhead.oldcompname,
  dbo.NT_1_Awakhead.adat,
  dbo.NT_1_Awakhead.tdsamount,
  dbo.NT_1_Awakhead.tdsperc,
  dbo.NT_1_Awakhead.Created_By,
  dbo.NT_1_Awakhead.Modified_By,
  dbo.NT_1_Awakhead.Branch_Code,
  dbo.NT_1_Awakhead.Year_Code,
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
  dbo.NT_1_AwakDetail.Sr,
  dbo.NT_1_AwakDetail.Gross_Amnt,
  dbo.NT_1_AwakDetail.Shub_Rate,
  dbo.NT_1_AwakDetail.Shub_Amnt,
  dbo.NT_1_AwakDetail.Panjar_Rate,
  dbo.NT_1_AwakDetail.Panjar_Amnt,
  dbo.NT_1_AwakDetail.detail_id,
  dbo.NT_1_AwakDetail.Cust_Code,
  dbo.NT_1_Awakhead.AwakYearCode,
  dbo.NT_1_AccountMaster.Ac_Name_E,
  dbo.NT_1_qryJogerryitemmaster.System_Name_E AS ItemName,
  dbo.NT_1_BrandMaster.Brand_Name,
  dbo.NT_1_AwakDetail.awakordercode
FROM
  dbo.NT_1_AwakDetail
  JOIN dbo.NT_1_BrandMaster ON dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_BrandMaster.Company_Code
  AND dbo.NT_1_AwakDetail.Brand_Code = dbo.NT_1_BrandMaster.Doc_No
  RIGHT JOIN dbo.NT_1_Awakhead ON dbo.NT_1_AwakDetail.Year_Code = dbo.NT_1_Awakhead.Year_Code
  AND dbo.NT_1_AwakDetail.Tran_Type = dbo.NT_1_Awakhead.TRAN_TYPE
  AND dbo.NT_1_AwakDetail.Doc_No = dbo.NT_1_Awakhead.doc_no
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_Awakhead.Company_Code
  LEFT JOIN dbo.NT_1_qryJogerryitemmaster ON dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_qryJogerryitemmaster.Company_Code
  AND dbo.NT_1_AwakDetail.Item_Code = dbo.NT_1_qryJogerryitemmaster.System_Code
  LEFT JOIN dbo.NT_1_AccountMaster ON dbo.NT_1_AwakDetail.Cust_Code = dbo.NT_1_AccountMaster.Ac_Code
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_AccountMaster.Company_Code
WHERE
  (dbo.NT_1_Awakhead.TRAN_TYPE = 'JW');