SELECT
  dbo.nt_1_GeneralTran_Head.doc_no,
  dbo.nt_1_GeneralTran_Head.doc_date,
  dbo.nt_1_GeneralTran_Head.gtranid,
  dbo.nt_1_GeneralTran_Head.Created_By,
  dbo.nt_1_GeneralTran_Head.Modified_By,
  dbo.nt_1_GeneralTran_Details.detail_Id,
  dbo.nt_1_GeneralTran_Details.Company_Code,
  dbo.nt_1_GeneralTran_Details.Year_Code,
  dbo.nt_1_GeneralTran_Details.Debit_ac,
  dbo.nt_1_GeneralTran_Details.Credit_ac,
  dbo.nt_1_GeneralTran_Details.amount,
  dbo.nt_1_GeneralTran_Details.narration,
  dbo.nt_1_GeneralTran_Details.dac,
  dbo.nt_1_GeneralTran_Details.cac,
  dac.Ac_Name_E AS DebitAc_Name,
  cac.Ac_Name_E AS CreditAc_NAme,
  dbo.company.Company_Name_E,
  dbo.accountingyear.year,
  CONVERT(
    varchar(10),
    dbo.nt_1_GeneralTran_Head.doc_date,
    103
  ) AS doc_dateConverted,
  dbo.nt_1_GeneralTran_Details.gtrandetailid
FROM
  dbo.nt_1_GeneralTran_Head
  LEFT JOIN dbo.nt_1_GeneralTran_Details ON dbo.nt_1_GeneralTran_Head.gtranid = dbo.nt_1_GeneralTran_Details.gtranid
  LEFT JOIN dbo.accountingyear ON dbo.nt_1_GeneralTran_Details.Year_Code = dbo.accountingyear.yearCode
  LEFT JOIN dbo.company ON dbo.nt_1_GeneralTran_Details.Company_Code = dbo.company.Company_Code
  LEFT JOIN dbo.qrymstaccountmaster AS cac ON dbo.nt_1_GeneralTran_Details.cac = cac.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS dac ON dbo.nt_1_GeneralTran_Details.dac = dac.accoid;