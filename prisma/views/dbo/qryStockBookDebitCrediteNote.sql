SELECT
  dbo.debitnotehead.tran_type,
  dbo.debitnotehead.doc_date,
  dbo.debitnotehead.ac_code,
  dbo.debitnotedetail.Item_Code,
  dbo.debitnotedetail.Quantal,
  (
    CASE
      WHEN dbo.debitnotehead.tran_type = 'DN' THEN 'C'
      WHEN dbo.debitnotehead.tran_type = 'CN' THEN 'D'
      WHEN dbo.debitnotehead.tran_type = 'DS' THEN 'D'
      WHEN dbo.debitnotehead.tran_type = 'CS' THEN 'D'
      ELSE ''
    END
  ) AS drcr,
  dbo.debitnotehead.Company_Code,
  dbo.debitnotehead.Year_Code,
  dbo.debitnotedetail.value AS itemvalue,
  0 AS Brand_code,
  dbo.debitnotehead.doc_no,
  0 AS dono,
  dbo.debitnotehead.Mill_Code
FROM
  dbo.debitnotehead
  LEFT JOIN dbo.debitnotedetail ON dbo.debitnotehead.dcid = dbo.debitnotedetail.dcid;