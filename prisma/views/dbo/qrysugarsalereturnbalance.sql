SELECT
  dbo.qrysugarsalereturnhead.Tran_Type AS bill_tran_type,
  dbo.qrysugarsalereturnhead.doc_no AS billno,
  dbo.qrysugarsalereturnhead.doc_date,
  dbo.qrysugarsalereturnhead.doc_dateConverted,
  dbo.qrysugarsalereturnhead.Ac_Code,
  dbo.qrysugarsalereturnhead.Ac_Name_E,
  dbo.qrysugarsalereturnhead.Unit_Code,
  dbo.qrysugarsalereturnhead.mill_code,
  dbo.qrysugarsalereturnhead.unitname,
  dbo.qrysugarsalereturnhead.millname,
  dbo.qrysugarsalereturnhead.NETQNTL,
  dbo.qrysugarsalereturnhead.TCS_Net_Payable AS Bill_Amount,
  SUM(ISNULL(dbo.multiple_receipt_detail.Value, 0)) AS received,
  dbo.qrysugarsalereturnhead.TCS_Net_Payable - (
    SUM(ISNULL(dbo.multiple_receipt_detail.Value, 0)) + SUM(ISNULL(dbo.multiple_receipt_detail.AcadjAmt, 0))
  ) AS balance,
  dbo.qrysugarsalereturnhead.Year_Code,
  dbo.qrysugarsalereturnhead.Company_Code,
  dbo.qrysugarsalereturnhead.srid,
  dbo.qrysugarsalereturnhead.millshortname,
  dbo.qrysugarsalereturnhead.ac,
  dbo.qrysugarsalereturnhead.uc,
  dbo.qrysugarsalereturnhead.mc,
  SUM(ISNULL(dbo.multiple_receipt_detail.OnAc, 0)) AS OnAc,
  SUM(ISNULL(dbo.multiple_receipt_detail.AcadjAmt, 0)) AS adjAmt,
  '' AS Delivery_type,
  dbo.qrysugarsalereturnhead.brokername,
  dbo.qrysugarsalereturnhead.BROKER,
  dbo.qrysugarsalereturnhead.LORRYNO,
  dbo.nt_1_sugarsaledetailsreturn.rate,
  dbo.qrysugarsalereturnhead.Short_Name AS billtoshortname
FROM
  dbo.qrysugarsalereturnhead
  LEFT JOIN dbo.nt_1_sugarsaledetailsreturn ON dbo.qrysugarsalereturnhead.srid = dbo.nt_1_sugarsaledetailsreturn.srid
  LEFT JOIN dbo.multiple_receipt_detail ON dbo.qrysugarsalereturnhead.srid = dbo.multiple_receipt_detail.Bill_Auto_Id
  AND dbo.qrysugarsalereturnhead.Tran_Type = dbo.multiple_receipt_detail.Bill_Tran_Type
GROUP BY
  dbo.qrysugarsalereturnhead.Tran_Type,
  dbo.qrysugarsalereturnhead.doc_no,
  dbo.qrysugarsalereturnhead.doc_date,
  dbo.qrysugarsalereturnhead.doc_dateConverted,
  dbo.qrysugarsalereturnhead.Ac_Code,
  dbo.qrysugarsalereturnhead.Ac_Name_E,
  dbo.qrysugarsalereturnhead.Unit_Code,
  dbo.qrysugarsalereturnhead.mill_code,
  dbo.qrysugarsalereturnhead.unitname,
  dbo.qrysugarsalereturnhead.millname,
  dbo.qrysugarsalereturnhead.NETQNTL,
  dbo.qrysugarsalereturnhead.TCS_Net_Payable,
  dbo.qrysugarsalereturnhead.Year_Code,
  dbo.qrysugarsalereturnhead.Company_Code,
  dbo.qrysugarsalereturnhead.srid,
  dbo.qrysugarsalereturnhead.millshortname,
  dbo.qrysugarsalereturnhead.ac,
  dbo.qrysugarsalereturnhead.uc,
  dbo.qrysugarsalereturnhead.mc,
  dbo.multiple_receipt_detail.OnAc,
  dbo.qrysugarsalereturnhead.brokername,
  dbo.qrysugarsalereturnhead.BROKER,
  dbo.qrysugarsalereturnhead.LORRYNO,
  dbo.nt_1_sugarsaledetailsreturn.rate,
  dbo.qrysugarsalereturnhead.Short_Name;