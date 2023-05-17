SELECT
  dbo.qryDayPatrak.Tender_No,
  dbo.qryDayPatrak.Tender_Date,
  dbo.qryDayPatrak.Lifting_Date,
  nt_1_accountmaster_1.Short_Name AS MillShortName,
  dbo.nt_1_accountmaster.Ac_Name_E AS PaymentTo,
  dbo.qryDayPatrak.LotNo,
  dbo.qryDayPatrak.SaudaQntl,
  ISNULL(SUM(dbo.qryDaypatrakdo.quantal), 0) AS LiftedQntl,
  dbo.qryDayPatrak.SaudaQntl - ISNULL(SUM(dbo.qryDaypatrakdo.quantal), 0) AS UnLiftedQntl,
  dbo.qryDayPatrak.LotNo - dbo.qryDayPatrak.SaudaQntl AS Self,
  dbo.qryDaypatrakdo.company_code,
  dbo.qryDaypatrakdo.Year_Code,
  dbo.qryDayPatrak.season,
  dbo.qryDayPatrak.Grade,
  dbo.qryDayPatrak.mc,
  dbo.qryDayPatrak.pt,
  dbo.qryDayPatrak.Mill_Code,
  dbo.qryDayPatrak.Packing,
  dbo.qryDayPatrak.Bags,
  dbo.qryDayPatrak.Payment_To,
  dbo.qryDayPatrak.Tender_From,
  dbo.qryDayPatrak.Tender_DO,
  dbo.qryDayPatrak.Voucher_By,
  dbo.qryDayPatrak.Broker,
  dbo.qryDayPatrak.Excise_Rate,
  dbo.qryDayPatrak.Narration,
  dbo.qryDayPatrak.Mill_Rate,
  dbo.qryDayPatrak.Created_By,
  dbo.qryDayPatrak.Modified_By,
  dbo.qryDayPatrak.Purc_Rate,
  dbo.qryDayPatrak.type,
  dbo.qryDayPatrak.Branch_Id,
  dbo.qryDayPatrak.Voucher_No,
  dbo.qryDayPatrak.Sell_Note_No,
  dbo.qryDayPatrak.Brokrage,
  dbo.qryDayPatrak.tenderid,
  dbo.qryDayPatrak.itemcode,
  dbo.qryDayPatrak.tf,
  dbo.qryDayPatrak.td,
  dbo.qryDayPatrak.vb,
  dbo.qryDayPatrak.bk,
  dbo.qryDayPatrak.ic,
  dbo.qryDayPatrak.gstratecode,
  dbo.qryDayPatrak.CashDiff,
  dbo.qryDayPatrak.TCS_Rate,
  dbo.qryDayPatrak.TCS_Amt,
  dbo.qryDayPatrak.commissionid,
  dbo.qryDayPatrak.Voucher_Type,
  dbo.qryDayPatrak.Party_Bill_Rate,
  dbo.qryDayPatrak.TDS_Rate,
  dbo.qryDayPatrak.TDS_Amt
FROM
  dbo.qryDaypatrakdo
  RIGHT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1
  RIGHT JOIN dbo.qryDayPatrak
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.qryDayPatrak.pt = dbo.nt_1_accountmaster.accoid;