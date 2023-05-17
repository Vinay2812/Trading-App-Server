SELECT
  dbo.qrytenderhead.Tender_No,
  dbo.qrytenderhead.Company_Code,
  dbo.qrytenderhead.Tender_Date,
  dbo.qrytenderhead.Lifting_Date,
  dbo.qrytenderhead.Mill_Code,
  dbo.qrytenderhead.Grade,
  dbo.qrytenderhead.Quantal,
  dbo.qrytenderhead.Packing,
  dbo.qrytenderhead.Bags,
  dbo.qrytenderhead.Payment_To,
  dbo.qrytenderhead.Tender_From,
  dbo.qrytenderhead.Tender_DO,
  dbo.qrytenderhead.Voucher_By,
  dbo.qrytenderhead.Broker,
  dbo.qrytenderhead.Excise_Rate,
  dbo.qrytenderhead.Narration,
  dbo.qrytenderhead.Mill_Rate,
  dbo.qrytenderhead.Created_By,
  dbo.qrytenderhead.Modified_By,
  dbo.qrytenderhead.Year_Code,
  dbo.qrytenderhead.Purc_Rate,
  dbo.qrytenderhead.type,
  dbo.qrytenderhead.Branch_Id,
  dbo.qrytenderhead.Voucher_No,
  dbo.qrytenderhead.Sell_Note_No,
  dbo.qrytenderhead.Brokrage,
  dbo.qrytenderhead.tenderid,
  dbo.qrytenderhead.mc,
  dbo.qrytenderhead.itemcode,
  dbo.qrytenderhead.season,
  dbo.qrytenderhead.pt,
  dbo.qrytenderhead.tf,
  dbo.qrytenderhead.td,
  dbo.qrytenderhead.vb,
  dbo.qrytenderhead.bk,
  dbo.qrytenderhead.ic,
  dbo.qrytenderhead.itemname,
  dbo.qrytenderhead.brokername,
  dbo.qrytenderhead.voucherbyname,
  dbo.qrytenderhead.tenderdoname,
  dbo.qrytenderhead.tenderfromname,
  dbo.qrytenderhead.paymenttoname,
  dbo.qrytenderhead.millname,
  dbo.qrytenderhead.millgstno,
  dbo.qrytenderhead.millstatecode,
  dbo.qrytenderhead.paymenttogstno,
  dbo.qrytenderhead.paymenttogststatecode,
  dbo.qrytenderhead.paymenttocityname,
  dbo.qrytenderhead.paymenttocitypincode,
  dbo.qrytenderhead.paymenttocitystate,
  dbo.qrytenderhead.paymenttocitygststatecode,
  dbo.qrytenderhead.voucherbycityname,
  dbo.qrytenderhead.voucherbycitypincode,
  dbo.qrytenderhead.voucherbycitystate,
  dbo.qrytenderhead.voucherbycitygststatecode,
  dbo.qrytenderhead.brokercityname,
  dbo.qrytenderhead.brokercitypincode,
  dbo.qrytenderhead.brokercitystate,
  dbo.qrytenderhead.brokercitygststatecode,
  dbo.qrytenderhead.millcodecityname,
  dbo.qrytenderhead.millcodecitypincode,
  dbo.qrytenderhead.millcodecitystate,
  dbo.qrytenderhead.millcodecitygststatecode,
  dbo.qrytenderhead.tendorfromcityname,
  dbo.qrytenderhead.tendorfromcitypincode,
  dbo.qrytenderhead.tendorfromcitystate,
  dbo.qrytenderhead.tendorfromcitygststatecode,
  dbo.qrytenderhead.tendorduocityname,
  dbo.qrytenderhead.tendorduocitypincode,
  dbo.qrytenderhead.tendorduocitystate,
  dbo.qrytenderhead.tendorduocitygststatecode,
  dbo.qryutrheaddetail.doc_no AS utrdoc_no,
  dbo.qryutrheaddetail.doc_date AS utrdoc_date,
  dbo.qryutrheaddetail.bank_ac AS utrbank_accode,
  dbo.qryutrheaddetail.utr_no,
  dbo.qryutrheaddetail.narration_header,
  dbo.qryutrheaddetail.bankname,
  dbo.qryutrheaddetail.utrgradename,
  dbo.qryutrheaddetail.detailamount,
  dbo.qryutrheaddetail.utrdetailid,
  CASE
    WHEN dbo.qryutrheaddetail.Adjusted_Amt > 0 THEN dbo.qryutrheaddetail.Adjusted_Amt
    ELSE 0
  END AS Adjusted_Amt,
  dbo.qrytenderhead.Tender_DateConverted,
  dbo.qrytenderhead.Lifting_DateConverted,
  dbo.qrytenderhead.TCS_Amt,
  dbo.qrytenderhead.millshortname,
  CASE
    WHEN dbo.qryutrheaddetail.Adjusted_Amt < 0 THEN dbo.qryutrheaddetail.Adjusted_Amt
    ELSE 0
  END AS adj_amt,
  dbo.qrytenderhead.TDS_Amt,
  ISNULL(dbo.qrypartydispatch.Quantal, 0) AS PartyDispQty,
  dbo.qrypartydispatch.Quantal * (
    (
      dbo.qrytenderhead.Quantal * (
        dbo.qrytenderhead.Mill_Rate + dbo.qrytenderhead.Excise_Rate
      ) + ISNULL(dbo.qrytenderhead.TCS_Amt, 0) - ISNULL(dbo.qrytenderhead.TDS_Amt, 0)
    ) / dbo.qrytenderhead.Quantal
  ) AS partypayment,
  dbo.qrytenderhead.Party_Bill_Rate
FROM
  dbo.qrytenderhead
  LEFT JOIN dbo.qrypartydispatch ON dbo.qrytenderhead.tenderid = dbo.qrypartydispatch.tenderid
  LEFT JOIN dbo.qryutrheaddetail ON dbo.qrytenderhead.tenderid = dbo.qryutrheaddetail.tenderid
WHERE
  (dbo.qrytenderhead.AutoPurchaseBill = 'Y');