SELECT
  dbo.qrysugarpurchasereturnhead.doc_no,
  dbo.qrysugarpurchasereturnhead.doc_dateConverted,
  dbo.qrysugarpurchasereturnhead.millshortname,
  dbo.qrysugarpurchasereturnhead.billtoname,
  dbo.qrysugarpurchasereturnhead.Bill_Amount,
  dbo.qrysugarpurchasereturnhead.Company_Code,
  dbo.qrysugarpurchasereturnhead.Year_Code,
  dbo.qrysugarpurchasereturnhead.prid,
  ISNULL(dbo.qrysugarpurchasereturnhead.NETQNTL, 0) - ISNULL(SUM(dbo.nt_1_sugarsalereturn.NETQNTL), 0) AS Quantal,
  ISNULL(dbo.nt_1_sugarsalereturn.IsDeleted, 1) AS IsDeleted
FROM
  dbo.qrysugarpurchasereturnhead
  LEFT JOIN dbo.nt_1_sugarsalereturn ON dbo.qrysugarpurchasereturnhead.doc_no = dbo.nt_1_sugarsalereturn.PURCNO
  AND dbo.qrysugarpurchasereturnhead.Year_Code = dbo.nt_1_sugarsalereturn.Year_Code
  AND dbo.qrysugarpurchasereturnhead.Company_Code = dbo.nt_1_sugarsalereturn.Company_Code
GROUP BY
  dbo.qrysugarpurchasereturnhead.doc_no,
  dbo.qrysugarpurchasereturnhead.doc_dateConverted,
  dbo.qrysugarpurchasereturnhead.millshortname,
  dbo.qrysugarpurchasereturnhead.billtoname,
  dbo.qrysugarpurchasereturnhead.Bill_Amount,
  dbo.qrysugarpurchasereturnhead.Company_Code,
  dbo.qrysugarpurchasereturnhead.Year_Code,
  dbo.qrysugarpurchasereturnhead.prid,
  dbo.qrysugarpurchasereturnhead.NETQNTL,
  dbo.nt_1_sugarsalereturn.IsDeleted;