SELECT
  dbo.debitnotedetail.tran_type,
  dbo.debitnotedetail.doc_no,
  dbo.debitnotedetail.dcid,
  dbo.debitnotedetail.expac_code,
  dbo.debitnotedetail.value,
  dbo.debitnotedetail.expac,
  dbo.debitnotedetail.dcdetailid,
  dbo.debitnotedetail.detail_Id,
  dbo.debitnotedetail.company_code,
  dbo.debitnotedetail.year_code,
  dbo.qrymstaccountmaster.Ac_Name_E AS expacaccountname,
  dbo.debitnotedetail.Item_Code,
  dbo.debitnotedetail.Quantal,
  dbo.debitnotedetail.ic,
  dbo.qrymstitem.System_Name_E AS Item_Name,
  dbo.qrymstitem.HSN
FROM
  dbo.debitnotedetail
  LEFT JOIN dbo.qrymstitem ON dbo.debitnotedetail.ic = dbo.qrymstitem.systemid
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.debitnotedetail.expac = dbo.qrymstaccountmaster.accoid;