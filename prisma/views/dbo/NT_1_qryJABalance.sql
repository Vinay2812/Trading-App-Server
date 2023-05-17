SELECT
  A.doc_no,
  A.Qty AS awakqty,
  ISNULL(SUM(J.Qty), 0) AS despatch,
  A.Qty - ISNULL(SUM(J.Qty), 0) AS balnceqty,
  A.Item_Code,
  A.Year_Code,
  A.Company_Code,
  A.detail_id,
  A.AC_CODE,
  dbo.nt_1_accountmaster.Ac_Name_E AS supplierName,
  dbo.NT_1_qryJogerryitemmaster.System_Name_E AS itemname,
  A.Net_Wt,
  A.DOC_DATE,
  J.awakordercode
FROM
  dbo.qryAwakBalance AS A
  LEFT JOIN dbo.NT_1_qryJogerryitemmaster ON A.Company_Code = dbo.NT_1_qryJogerryitemmaster.Company_Code
  AND A.Item_Code = dbo.NT_1_qryJogerryitemmaster.System_Code
  LEFT JOIN dbo.qryJawakBalance AS J ON A.detail_id = J.awakordercode
  AND A.Item_Code = J.Item_Code
  AND A.doc_no = J.awakno
  AND A.Year_Code = J.AwakYearCode
  AND A.Company_Code = J.Company_Code
  LEFT JOIN dbo.nt_1_accountmaster ON A.Company_Code = dbo.nt_1_accountmaster.company_code
  AND A.AC_CODE = dbo.nt_1_accountmaster.Ac_Code
GROUP BY
  A.doc_no,
  A.Qty,
  A.Item_Code,
  A.Year_Code,
  A.Company_Code,
  A.detail_id,
  A.AC_CODE,
  dbo.nt_1_accountmaster.Ac_Name_E,
  dbo.NT_1_qryJogerryitemmaster.System_Name_E,
  A.Net_Wt,
  A.DOC_DATE,
  J.awakordercode;