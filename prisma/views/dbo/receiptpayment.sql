SELECT
  dbo.nt_1_transacthead.doc_no,
  dbo.nt_1_transacthead.tran_type,
  dbo.nt_1_transacthead.doc_date,
  nt_1_accountmaster_1.Short_Name AS Ac_Name_E,
  dbo.nt_1_transactdetail.amount,
  dbo.nt_1_transactdetail.credit_ac,
  dbo.nt_1_accountmaster.Short_Name AS Shortcreditname,
  dbo.nt_1_transactdetail.narration,
  dbo.nt_1_transacthead.tranid
FROM
  dbo.nt_1_accountmaster
  RIGHT JOIN dbo.nt_1_transactdetail ON dbo.nt_1_accountmaster.accoid = dbo.nt_1_transactdetail.ca
  RIGHT JOIN dbo.nt_1_transacthead
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.nt_1_transacthead.cb = nt_1_accountmaster_1.accoid;