SELECT
  dbo.nt_1_dodetails.doc_no,
  dbo.nt_1_dodetails.detail_Id,
  dbo.nt_1_dodetails.ddType,
  dbo.nt_1_dodetails.Bank_Code,
  dbo.nt_1_dodetails.Narration,
  dbo.nt_1_dodetails.Amount,
  dbo.nt_1_dodetails.Company_Code,
  dbo.nt_1_dodetails.Year_Code,
  dbo.nt_1_dodetails.Branch_Code,
  dbo.nt_1_dodetails.UTR_NO,
  dbo.nt_1_dodetails.DO_No,
  dbo.nt_1_dodetails.UtrYearCode,
  dbo.nt_1_dodetails.LTNo,
  dbo.nt_1_dodetails.doid,
  dbo.nt_1_dodetails.dodetailid,
  dbo.nt_1_dodetails.bc,
  dbo.nt_1_dodetails.utrdetailid,
  dbo.qrymstaccountmaster.Ac_Name_E AS bankname,
  dbo.qrymstaccountmaster.cityname AS bankcityname,
  dbo.nt_1_utr.doc_date AS UTRDate,
  dbo.nt_1_dodetails.UtrCompanyCode,
  dbo.nt_1_utr.amount AS totUTRAmt
FROM
  dbo.nt_1_dodetails
  LEFT JOIN dbo.nt_1_utr ON dbo.nt_1_dodetails.UtrYearCode = dbo.nt_1_utr.Year_Code
  AND dbo.nt_1_dodetails.UtrCompanyCode = dbo.nt_1_utr.Company_Code
  AND dbo.nt_1_dodetails.UTR_NO = dbo.nt_1_utr.doc_no
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.nt_1_dodetails.bc = dbo.qrymstaccountmaster.accoid;