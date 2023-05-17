SELECT
  dbo.transactdetail.Tran_Type,
  dbo.transactdetail.doc_no,
  dbo.transactdetail.detail_id,
  dbo.transactdetail.debit_ac,
  dbo.transactdetail.credit_ac,
  dbo.transactdetail.Unit_Code,
  dbo.transactdetail.amount,
  dbo.transactdetail.narration,
  dbo.transactdetail.narration2,
  dbo.transactdetail.Company_Code,
  dbo.transactdetail.Year_Code,
  dbo.transactdetail.Branch_Code,
  dbo.transactdetail.Created_By,
  dbo.transactdetail.Modified_By,
  dbo.transactdetail.Voucher_No,
  dbo.transactdetail.Voucher_Type,
  dbo.transactdetail.Adjusted_Amount,
  dbo.transactdetail.Tender_No,
  dbo.transactdetail.TenderDetail_ID,
  dbo.transactdetail.drpFilterValue,
  dbo.transactdetail.CreditAcAdjustedAmount,
  dbo.transactdetail.Branch_name,
  dbo.transactdetail.YearCodeDetail,
  dbo.transactdetail.tranid,
  dbo.transactdetail.ca,
  dbo.transactdetail.uc,
  dbo.transactdetail.tenderdetailid,
  dbo.transactdetail.sbid,
  dbo.transactdetail.da,
  qrydb.Ac_Name_E AS debitname,
  qrycb.Ac_Name_E AS creditname,
  qryunit.Ac_Name_E AS unitname,
  dbo.transactdetail.trandetailid,
  dbo.transactdetail.drcr,
  qrycb.Short_Name AS Shortcreditname,
  dbo.qrytenderheaddetail.millshortname,
  dbo.transactdetail.AcadjAmt,
  dbo.transactdetail.AcadjAccode,
  dbo.transactdetail.ac AS ad,
  dbo.nt_1_accountmaster.Ac_Name_E AS AcadjAcname
FROM
  dbo.transactdetail
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.transactdetail.ac = dbo.nt_1_accountmaster.accoid
  LEFT JOIN dbo.qrytenderheaddetail ON dbo.transactdetail.tenderdetailid = dbo.qrytenderheaddetail.tenderdetailid
  LEFT JOIN dbo.qrymstaccountmaster AS qryunit ON dbo.transactdetail.uc = qryunit.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrycb ON dbo.transactdetail.ca = qrycb.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrydb ON dbo.transactdetail.da = qrydb.accoid;