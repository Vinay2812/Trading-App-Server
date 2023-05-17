SELECT
  dbo.NT_1_AwakDetail.Bill_No,
  dbo.NT_1_AwakDetail.Cust_Code,
  dbo.NT_1_AccountMaster.Ac_Name_E AS Customer_name,
  dbo.NT_1_Awakhead.DOC_DATE,
  dbo.NT_1_Awakhead.Company_Code,
  dbo.NT_1_Awakhead.Year_Code
FROM
  dbo.NT_1_AccountMaster
  RIGHT JOIN dbo.NT_1_AwakDetail ON dbo.NT_1_AccountMaster.Company_Code = dbo.NT_1_AwakDetail.Company_Code
  AND dbo.NT_1_AccountMaster.Ac_Code = dbo.NT_1_AwakDetail.Cust_Code
  RIGHT JOIN dbo.NT_1_Awakhead ON dbo.NT_1_AwakDetail.Tran_Type = dbo.NT_1_Awakhead.TRAN_TYPE
  AND dbo.NT_1_AwakDetail.Doc_No = dbo.NT_1_Awakhead.doc_no
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_Awakhead.Company_Code
WHERE
  (dbo.NT_1_AwakDetail.Cust_Code <> 2);