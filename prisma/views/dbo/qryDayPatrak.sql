SELECT
  dbo.nt_1_tender.Tender_No,
  dbo.nt_1_tender.Tender_Date,
  dbo.nt_1_tender.Lifting_Date,
  dbo.nt_1_tender.Quantal AS LotNo,
  SUM(
    CASE
      WHEN nt_1_tenderdetails.ID <> 1 THEN nt_1_tenderdetails.Buyer_Quantal
      ELSE 0
    END
  ) AS SaudaQntl,
  dbo.nt_1_tender.Company_Code,
  dbo.nt_1_tender.Grade,
  dbo.nt_1_tender.Year_Code,
  dbo.nt_1_tender.mc,
  dbo.nt_1_tender.pt,
  dbo.nt_1_tender.season,
  dbo.nt_1_tender.Mill_Code,
  dbo.nt_1_tender.Packing,
  dbo.nt_1_tender.Bags,
  dbo.nt_1_tender.Payment_To,
  dbo.nt_1_tender.Tender_From,
  dbo.nt_1_tender.Tender_DO,
  dbo.nt_1_tender.Voucher_By,
  dbo.nt_1_tender.Broker,
  dbo.nt_1_tender.Excise_Rate,
  dbo.nt_1_tender.Narration,
  dbo.nt_1_tender.Mill_Rate,
  dbo.nt_1_tender.Created_By,
  dbo.nt_1_tender.Modified_By,
  dbo.nt_1_tender.Purc_Rate,
  dbo.nt_1_tender.type,
  dbo.nt_1_tender.Branch_Id,
  dbo.nt_1_tender.Voucher_No,
  dbo.nt_1_tender.Sell_Note_No,
  dbo.nt_1_tender.Brokrage,
  dbo.nt_1_tender.tenderid,
  dbo.nt_1_tender.itemcode,
  dbo.nt_1_tender.tf,
  dbo.nt_1_tender.td,
  dbo.nt_1_tender.vb,
  dbo.nt_1_tender.bk,
  dbo.nt_1_tender.ic,
  dbo.nt_1_tender.gstratecode,
  dbo.nt_1_tender.CashDiff,
  dbo.nt_1_tender.TCS_Rate,
  dbo.nt_1_tender.TCS_Amt,
  dbo.nt_1_tender.commissionid,
  dbo.nt_1_tender.Voucher_Type,
  dbo.nt_1_tender.Party_Bill_Rate,
  dbo.nt_1_tender.TDS_Rate,
  dbo.nt_1_tender.TDS_Amt
FROM
  dbo.nt_1_tender
  LEFT JOIN dbo.nt_1_tenderdetails ON dbo.nt_1_tender.tenderid = dbo.nt_1_tenderdetails.tenderid
GROUP BY
  dbo.nt_1_tender.Tender_No,
  dbo.nt_1_tender.Tender_Date,
  dbo.nt_1_tender.Lifting_Date,
  dbo.nt_1_tender.Quantal,
  dbo.nt_1_tender.Company_Code,
  dbo.nt_1_tender.Grade,
  dbo.nt_1_tender.Year_Code,
  dbo.nt_1_tender.mc,
  dbo.nt_1_tender.pt,
  dbo.nt_1_tender.season,
  dbo.nt_1_tender.Mill_Code,
  dbo.nt_1_tender.Packing,
  dbo.nt_1_tender.Bags,
  dbo.nt_1_tender.Payment_To,
  dbo.nt_1_tender.Tender_From,
  dbo.nt_1_tender.Tender_DO,
  dbo.nt_1_tender.Voucher_By,
  dbo.nt_1_tender.Broker,
  dbo.nt_1_tender.Excise_Rate,
  dbo.nt_1_tender.Narration,
  dbo.nt_1_tender.Mill_Rate,
  dbo.nt_1_tender.Created_By,
  dbo.nt_1_tender.Modified_By,
  dbo.nt_1_tender.Purc_Rate,
  dbo.nt_1_tender.type,
  dbo.nt_1_tender.Branch_Id,
  dbo.nt_1_tender.Voucher_No,
  dbo.nt_1_tender.Sell_Note_No,
  dbo.nt_1_tender.Brokrage,
  dbo.nt_1_tender.tenderid,
  dbo.nt_1_tender.itemcode,
  dbo.nt_1_tender.tf,
  dbo.nt_1_tender.td,
  dbo.nt_1_tender.vb,
  dbo.nt_1_tender.bk,
  dbo.nt_1_tender.ic,
  dbo.nt_1_tender.gstratecode,
  dbo.nt_1_tender.CashDiff,
  dbo.nt_1_tender.TCS_Rate,
  dbo.nt_1_tender.TCS_Amt,
  dbo.nt_1_tender.commissionid,
  dbo.nt_1_tender.Voucher_Type,
  dbo.nt_1_tender.Party_Bill_Rate,
  dbo.nt_1_tender.TDS_Rate,
  dbo.nt_1_tender.TDS_Amt;