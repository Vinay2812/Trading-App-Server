SELECT
  dbo.NT_1_Awakhead.TRAN_TYPE,
  dbo.NT_1_Awakhead.doc_no,
  dbo.NT_1_Awakhead.DOC_DATE,
  dbo.NT_1_AwakDetail.Bill_No,
  dbo.NT_1_Awakhead.Company_Code,
  dbo.NT_1_Awakhead.Year_Code,
  dbo.NT_1_AccountMaster.Ac_Name_E AS Customer_Name
FROM
  dbo.NT_1_AwakDetail
  LEFT JOIN dbo.NT_1_AccountMaster ON dbo.NT_1_AwakDetail.Cust_Code = dbo.NT_1_AccountMaster.Ac_Code
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_AccountMaster.Company_Code
  RIGHT JOIN dbo.NT_1_Awakhead ON dbo.NT_1_AwakDetail.Tran_Type = dbo.NT_1_Awakhead.TRAN_TYPE
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_Awakhead.Company_Code
  AND dbo.NT_1_AwakDetail.Doc_No = dbo.NT_1_Awakhead.doc_no
  LEFT JOIN dbo.NT_1_JSaleHead ON dbo.NT_1_AwakDetail.Bill_No = dbo.NT_1_JSaleHead.doc_no
  AND dbo.NT_1_AwakDetail.Company_Code = dbo.NT_1_JSaleHead.Company_Code
WHERE
  (
    dbo.NT_1_AwakDetail.Bill_No NOT IN (
      SELECT
        doc_no
      FROM
        dbo.NT_1_JSaleHead AS NT_1_JSaleHead_1
    )
  )
  AND (dbo.NT_1_Awakhead.TRAN_TYPE = 'JW');