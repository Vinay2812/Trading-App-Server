SELECT
  dbo.nt_1_tender.Tender_No,
  dbo.nt_1_tender.Company_Code,
  dbo.nt_1_tender.Tender_Date,
  CONVERT(varchar(10), dbo.nt_1_tender.Tender_Date, 103) AS Tender_DateConverted,
  dbo.nt_1_tender.Lifting_Date,
  CONVERT(varchar(10), dbo.nt_1_tender.Lifting_Date, 103) AS Lifting_DateConverted,
  dbo.nt_1_tender.Mill_Code,
  dbo.nt_1_tender.Grade,
  dbo.nt_1_tender.Quantal,
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
  dbo.nt_1_tender.Year_Code,
  dbo.nt_1_tender.Purc_Rate,
  dbo.nt_1_tender.type,
  dbo.nt_1_tender.Branch_Id,
  dbo.nt_1_tender.Voucher_No,
  dbo.nt_1_tender.Sell_Note_No,
  dbo.nt_1_tender.Brokrage,
  dbo.nt_1_tender.tenderid,
  dbo.nt_1_tender.mc,
  dbo.nt_1_tender.itemcode,
  dbo.nt_1_tender.season,
  dbo.nt_1_tender.pt,
  dbo.nt_1_tender.tf,
  dbo.nt_1_tender.td,
  dbo.nt_1_tender.vb,
  dbo.nt_1_tender.bk,
  dbo.nt_1_tender.ic,
  dbo.qrymstitem.System_Name_E AS itemname,
  qrybroker.Ac_Name_E AS brokername,
  qryvoucherby.Ac_Name_E AS voucherbyname,
  qrytendorduo.Ac_Name_E AS tenderdoname,
  qrytendorfrom.Ac_Name_E AS tenderfromname,
  qrypaymentto.Ac_Name_E AS paymenttoname,
  qrymillcode.Ac_Name_E AS millname,
  qrymillcode.Gst_No AS millgstno,
  qrymillcode.GSTStateCode AS millstatecode,
  qrypaymentto.Gst_No AS paymenttogstno,
  qrypaymentto.GSTStateCode AS paymenttogststatecode,
  qrypaymentto.cityname AS paymenttocityname,
  qrypaymentto.citypincode AS paymenttocitypincode,
  qrypaymentto.citystate AS paymenttocitystate,
  qrypaymentto.citygststatecode AS paymenttocitygststatecode,
  qryvoucherby.cityname AS voucherbycityname,
  qryvoucherby.citypincode AS voucherbycitypincode,
  qryvoucherby.citystate AS voucherbycitystate,
  qryvoucherby.citygststatecode AS voucherbycitygststatecode,
  qrybroker.cityname AS brokercityname,
  qrybroker.citypincode AS brokercitypincode,
  qrybroker.citystate AS brokercitystate,
  qrybroker.citygststatecode AS brokercitygststatecode,
  qrymillcode.cityname AS millcodecityname,
  qrymillcode.citypincode AS millcodecitypincode,
  qrymillcode.citystate AS millcodecitystate,
  qrymillcode.citygststatecode AS millcodecitygststatecode,
  qrytendorfrom.cityname AS tendorfromcityname,
  qrytendorfrom.citypincode AS tendorfromcitypincode,
  qrytendorfrom.citystate AS tendorfromcitystate,
  qrytendorfrom.citygststatecode AS tendorfromcitygststatecode,
  qrytendorduo.cityname AS tendorduocityname,
  qrytendorduo.citypincode AS tendorduocitypincode,
  qrytendorduo.citystate AS tendorduocitystate,
  qrytendorduo.citygststatecode AS tendorduocitygststatecode,
  qrymillcode.Short_Name AS millshortname,
  dbo.nt_1_tender.gstratecode,
  dbo.nt_1_gstratemaster.GST_Name AS gstratename,
  dbo.nt_1_gstratemaster.Rate AS gstrate,
  dbo.nt_1_gstratemaster.IGST AS igstrate,
  dbo.nt_1_gstratemaster.SGST AS sgstrate,
  dbo.nt_1_gstratemaster.CGST AS cgstrate,
  qrytendorduo.Short_Name AS tenderdoshortname,
  dbo.nt_1_tender.CashDiff,
  dbo.nt_1_tender.TCS_Rate,
  dbo.nt_1_tender.TCS_Amt,
  dbo.nt_1_tender.commissionid,
  dbo.nt_1_tender.Voucher_Type,
  dbo.nt_1_tender.Party_Bill_Rate,
  dbo.nt_1_tender.TDS_Rate,
  dbo.nt_1_tender.TDS_Amt,
  dbo.nt_1_tender.Temptender,
  dbo.qrymstitem.HSN,
  qrybroker.Mobile_No AS brokermobno,
  dbo.nt_1_tender.AutoPurchaseBill,
  qrybroker.Short_Name AS brokershortname,
  dbo.nt_1_tender.bp,
  dbo.nt_1_tender.Bp_Account,
  qrybpaccount_1.Ac_Name_E AS BpAccountName,
  qrybpaccount_1.Short_Name AS BpAccountShort_Name,
  qrybpaccount_1.cityname AS Bpcityname,
  qrypaymentto.Short_Name AS paymenttoshortname
FROM
  dbo.qrymstaccountmaster AS qrypaymentto
  RIGHT JOIN dbo.nt_1_tender ON qrypaymentto.accoid = dbo.nt_1_tender.pt
  LEFT JOIN dbo.qrymstaccountmaster AS qrybpaccount_1 ON dbo.nt_1_tender.bp = qrybpaccount_1.accoid
  RIGHT JOIN dbo.nt_1_gstratemaster ON dbo.nt_1_tender.Company_Code = dbo.nt_1_gstratemaster.Company_Code
  AND dbo.nt_1_tender.gstratecode = dbo.nt_1_gstratemaster.Doc_no
  LEFT JOIN dbo.qrymstaccountmaster AS qrymillcode ON dbo.nt_1_tender.mc = qrymillcode.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrytendorfrom ON dbo.nt_1_tender.tf = qrytendorfrom.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrytendorduo ON dbo.nt_1_tender.td = qrytendorduo.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qryvoucherby ON dbo.nt_1_tender.vb = qryvoucherby.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrybroker ON dbo.nt_1_tender.bk = qrybroker.accoid
  LEFT JOIN dbo.qrymstitem ON dbo.qrymstitem.systemid = dbo.nt_1_tender.ic;