SELECT
  dbo.NT_1_AwakDetail.Tran_Type,
  dbo.NT_1_AwakDetail.Doc_No,
  dbo.NT_1_AwakDetail.Cust_Code,
  dbo.NT_1_AwakDetail.Item_Code,
  dbo.NT_1_AwakDetail.Bill_No,
  dbo.NT_1_AwakDetail.Qty,
  dbo.NT_1_AwakDetail.Net_Wt,
  dbo.NT_1_AwakDetail.Purc_Rate,
  dbo.NT_1_AwakDetail.Purc_Amnt,
  dbo.NT_1_AwakDetail.Sale_Rate,
  dbo.NT_1_AwakDetail.Sale_Amnt,
  dbo.NT_1_AwakDetail.Company_Code,
  dbo.NT_1_AwakDetail.Year_Code,
  dbo.NT_1_AwakDetail.detail_id,
  dbo.NT_1_AwakDetail.Purc_Amnt - dbo.NT_1_AwakDetail.Sale_Amnt AS Loss,
  dbo.NT_1_Awakhead.DOC_DATE,
  dbo.NT_1_AccountMaster.Ac_Name_E,
  dbo.NT_1_qryItemSystemMaster.System_Name_E
FROM
  dbo.NT_1_AwakDetail
  LEFT JOIN dbo.NT_1_qryItemSystemMaster ON dbo.NT_1_AwakDetail.Item_Code = dbo.NT_1_qryItemSystemMaster.System_Code
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_qryItemSystemMaster.Company_Code
  LEFT JOIN dbo.NT_1_AccountMaster ON dbo.NT_1_AwakDetail.Cust_Code = dbo.NT_1_AccountMaster.Ac_Code
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_AccountMaster.Company_Code
  LEFT JOIN dbo.NT_1_Awakhead ON dbo.NT_1_AwakDetail.Tran_Type = dbo.NT_1_Awakhead.TRAN_TYPE
  AND dbo.NT_1_AwakDetail.Doc_No = dbo.NT_1_Awakhead.doc_no
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_Awakhead.Company_Code
  AND dbo.NT_1_AwakDetail.Year_Code = dbo.NT_1_Awakhead.Year_Code
WHERE
  (
    dbo.NT_1_AwakDetail.Sale_Rate < dbo.NT_1_AwakDetail.Purc_Rate
  )
  AND (dbo.NT_1_AwakDetail.Cust_Code <> 2);