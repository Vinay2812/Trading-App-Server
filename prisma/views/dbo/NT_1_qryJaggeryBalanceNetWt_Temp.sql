SELECT
  dbo.NT_1_AccountMaster.Ac_Name_E AS supplierName,
  dbo.NT_1_qryJogerryitemmaster.System_Name_E AS itemname,
  J.awakordercode,
  A.doc_no,
  A.DOC_DATE,
  A.AC_CODE,
  A.Company_Code,
  A.Year_Code,
  A.Item_Code,
  A.Qty AS awakqty,
  A.Net_Wt,
  A.Purc_Rate,
  A.detail_id,
  ISNULL(SUM(J.Qty), 0) AS despatch,
  A.Qty - ISNULL(SUM(J.Qty), 0) AS balnceqty,
  A.Net_Wt - ISNULL(SUM(J.Net_Wt), 0) AS balNetweight,
  A.Purc_Rate AS Expr1,
  CONVERT(
    decimal(10, 2),
    ROUND(
      A.Purc_Rate * (A.Net_Wt - ISNULL(SUM(J.Net_Wt), 0)) / 100,
      2
    )
  ) AS bal
FROM
  dbo.NT_1_AccountMaster
  RIGHT JOIN dbo.qryAwakBalance AS A ON dbo.NT_1_AccountMaster.Ac_Code = A.AC_CODE
  AND dbo.NT_1_AccountMaster.Company_Code = A.Company_Code
  LEFT JOIN dbo.NT_1_qryJogerryitemmaster ON A.Company_Code = dbo.NT_1_qryJogerryitemmaster.Company_Code
  AND A.Item_Code = dbo.NT_1_qryJogerryitemmaster.System_Code
  AND A.Year_Code = dbo.NT_1_qryJogerryitemmaster.Year_Code
  LEFT JOIN dbo.qryJawakBalance_Temp AS J ON A.detail_id = J.awakordercode
  AND A.Year_Code = J.AwakYearCode
  AND A.Item_Code = J.Item_Code
  AND A.doc_no = J.awakno
  AND A.Company_Code = J.Company_Code
GROUP BY
  dbo.NT_1_AccountMaster.Ac_Name_E,
  dbo.NT_1_qryJogerryitemmaster.System_Name_E,
  J.awakordercode,
  A.doc_no,
  A.DOC_DATE,
  A.AC_CODE,
  A.Company_Code,
  A.Year_Code,
  A.Item_Code,
  A.Qty,
  A.Net_Wt,
  A.Purc_Rate,
  A.detail_id;