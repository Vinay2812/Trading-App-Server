SELECT
  'TD' AS Tran_type,
  dbo.nt_1_tender.Tender_No AS Doc_no,
  dbo.nt_1_tender.Tender_Date AS Doc_Date,
  dbo.nt_1_tender.Bp_Account AS Ac_Code,
  dbo.nt_1_accountmaster.Short_Name + ' MR: ' + CAST(dbo.nt_1_tender.Mill_Rate AS VARCHAR) + ' Qty ' + CAST(dbo.nt_1_tender.Quantal AS VARCHAR) + ' ' + CAST(dbo.nt_1_tender.CashDiff AS VARCHAR) + ' ' + dbo.nt_1_tender.Narration AS Narration,
  dbo.nt_1_tender.Quantal * ABS(dbo.nt_1_tender.CashDiff) AS Amount,
  CASE
    WHEN Quantal * CashDiff > 0 THEN 'D'
    ELSE 'C'
  END AS DRCR,
  dbo.nt_1_tender.Company_Code,
  dbo.nt_1_tender.tenderid
FROM
  dbo.nt_1_tender
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.nt_1_tender.mc = dbo.nt_1_accountmaster.accoid
WHERE
  (
    dbo.nt_1_tender.Quantal * dbo.nt_1_tender.CashDiff <> 0
  );