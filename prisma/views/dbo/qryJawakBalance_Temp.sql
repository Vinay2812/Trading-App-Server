SELECT
  dbo.NT_1_AccountMaster.Ac_Name_E,
  dbo.NT_1_qryJogerryitemmaster.System_Name_E AS ItemName,
  dbo.NT_1_BrandMaster.Brand_Name,
  dbo.NT_1_Awakhead_Temp.TRAN_TYPE,
  dbo.NT_1_Awakhead_Temp.CASHCREDIT,
  dbo.NT_1_Awakhead_Temp.doc_no,
  dbo.NT_1_Awakhead_Temp.DOC_DATE,
  dbo.NT_1_Awakhead_Temp.billno,
  dbo.NT_1_Awakhead_Temp.vehno,
  dbo.NT_1_Awakhead_Temp.purchasevalue,
  dbo.NT_1_Awakhead_Temp.SUBTOTAL,
  dbo.NT_1_Awakhead_Temp.AC_CODE,
  dbo.NT_1_Awakhead_Temp.salevalue,
  dbo.NT_1_Awakhead_Temp.stockvalue,
  dbo.NT_1_Awakhead_Temp.netqty,
  dbo.NT_1_Awakhead_Temp.addless,
  dbo.NT_1_Awakhead_Temp.MARKETSES,
  dbo.NT_1_Awakhead_Temp.supercost,
  dbo.NT_1_Awakhead_Temp.kharajat,
  dbo.NT_1_Awakhead_Temp.levi,
  dbo.NT_1_Awakhead_Temp.AMOUNT,
  dbo.NT_1_Awakhead_Temp.Company_Code,
  dbo.NT_1_Awakhead_Temp.vatamt,
  dbo.NT_1_Awakhead_Temp.awakno,
  dbo.NT_1_Awakhead_Temp.oldcompname,
  dbo.NT_1_Awakhead_Temp.adat,
  dbo.NT_1_Awakhead_Temp.tdsamount,
  dbo.NT_1_Awakhead_Temp.tdsperc,
  dbo.NT_1_Awakhead_Temp.Created_By,
  dbo.NT_1_Awakhead_Temp.Modified_By,
  dbo.NT_1_Awakhead_Temp.Branch_Code,
  dbo.NT_1_Awakhead_Temp.Year_Code,
  dbo.NT_1_Awakhead_Temp.AwakYearCode,
  dbo.NT_1_AwakDetail_Temp.awakordercode,
  dbo.NT_1_AwakDetail_Temp.Cust_Code,
  dbo.NT_1_AwakDetail_Temp.Item_Code,
  dbo.NT_1_AwakDetail_Temp.Brand_Code,
  dbo.NT_1_AwakDetail_Temp.Bill_No,
  dbo.NT_1_AwakDetail_Temp.Qty,
  dbo.NT_1_AwakDetail_Temp.Net_Wt,
  dbo.NT_1_AwakDetail_Temp.Purc_Rate,
  dbo.NT_1_AwakDetail_Temp.Purc_Amnt,
  dbo.NT_1_AwakDetail_Temp.Sale_Rate,
  dbo.NT_1_AwakDetail_Temp.Sale_Amnt,
  dbo.NT_1_AwakDetail_Temp.Comm_Rate,
  dbo.NT_1_AwakDetail_Temp.Comm_Amnt,
  dbo.NT_1_AwakDetail_Temp.Hamali_Code,
  dbo.NT_1_AwakDetail_Temp.Hamali_Amnt,
  dbo.NT_1_AwakDetail_Temp.Packing_Code,
  dbo.NT_1_AwakDetail_Temp.Packing_Amnt,
  dbo.NT_1_AwakDetail_Temp.Other_Rate,
  dbo.NT_1_AwakDetail_Temp.Other_Amnt,
  dbo.NT_1_AwakDetail_Temp.Other_PM,
  dbo.NT_1_AwakDetail_Temp.Gross_Rate,
  dbo.NT_1_AwakDetail_Temp.Gross_Amnt,
  dbo.NT_1_AwakDetail_Temp.Sr,
  dbo.NT_1_AwakDetail_Temp.Shub_Rate,
  dbo.NT_1_AwakDetail_Temp.Panjar_Rate,
  dbo.NT_1_AwakDetail_Temp.Shub_Amnt,
  dbo.NT_1_AwakDetail_Temp.Panjar_Amnt,
  dbo.NT_1_AwakDetail_Temp.detail_id
FROM
  dbo.NT_1_Awakhead_Temp
  LEFT JOIN dbo.NT_1_AwakDetail_Temp ON dbo.NT_1_Awakhead_Temp.TRAN_TYPE = dbo.NT_1_AwakDetail_Temp.Tran_Type
  AND dbo.NT_1_Awakhead_Temp.doc_no = dbo.NT_1_AwakDetail_Temp.Doc_No
  AND dbo.NT_1_Awakhead_Temp.Company_Code = dbo.NT_1_AwakDetail_Temp.Company_Code
  AND dbo.NT_1_Awakhead_Temp.Year_Code = dbo.NT_1_AwakDetail_Temp.Year_Code
  LEFT JOIN dbo.NT_1_qryJogerryitemmaster ON dbo.NT_1_AwakDetail_Temp.Item_Code = dbo.NT_1_qryJogerryitemmaster.System_Code
  AND dbo.NT_1_AwakDetail_Temp.Company_Code = dbo.NT_1_qryJogerryitemmaster.Company_Code
  LEFT JOIN dbo.NT_1_AccountMaster ON dbo.NT_1_AwakDetail_Temp.Cust_Code = dbo.NT_1_AccountMaster.Ac_Code
  AND dbo.NT_1_AwakDetail_Temp.Company_Code = dbo.NT_1_AccountMaster.Company_Code
  LEFT JOIN dbo.NT_1_BrandMaster ON dbo.NT_1_AwakDetail_Temp.Brand_Code = dbo.NT_1_BrandMaster.Doc_No
  AND dbo.NT_1_AwakDetail_Temp.Company_Code = dbo.NT_1_BrandMaster.Company_Code
WHERE
  (dbo.NT_1_Awakhead_Temp.TRAN_TYPE = 'JW');