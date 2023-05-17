SELECT
  dbo.nt_1_tender.Tender_No,
  dbo.nt_1_tender.Company_Code,
  dbo.nt_1_tender.Tender_Date,
  dbo.nt_1_tender.Lifting_Date,
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
  dbo.nt_1_tender.Year_Code,
  millcode.Ac_Name_E AS millfullname,
  millcode.Short_Name AS millname,
  dotabel.Ac_Name_E AS dofullname,
  dotabel.Short_Name AS doname,
  dbo.nt_1_tenderdetails.Buyer,
  salebroker.Ac_Name_E AS buyerbrokerfullname,
  salebroker.Short_Name AS buyerbrokershortname,
  dbo.nt_1_tenderdetails.Buyer_Party,
  saleparty.Ac_Name_E AS salepartyfullname,
  saleparty.Short_Name AS salepartyname,
  paymentto.Ac_Name_E AS paymenttofullname,
  paymentto.Short_Name AS paymentto,
  tenderfrom.Ac_Name_E AS tenderfromfullname,
  tenderfrom.Short_Name AS tenderfromname,
  voucherby.Ac_Name_E AS voucherbyfullname,
  voucherby.Short_Name AS voucherby,
  dbo.nt_1_tenderdetails.Buyer_Quantal,
  dbo.nt_1_tenderdetails.Sale_Rate,
  dbo.nt_1_tenderdetails.Commission_Rate,
  dbo.nt_1_tenderdetails.ID,
  dbo.nt_1_tenderdetails.Narration AS saudanarration,
  broker.Ac_Name_E AS brokerfullname,
  broker.Short_Name AS brokershortname,
  dbo.nt_1_tenderdetails.IsActive,
  dbo.nt_1_tenderdetails.year_code AS TDYearCode,
  dbo.nt_1_tender.Purc_Rate,
  dbo.nt_1_tender.type,
  dbo.nt_1_tender.Voucher_No AS vouchernumber,
  dbo.nt_1_tender.Created_By,
  dbo.nt_1_tender.Modified_By,
  dbo.nt_1_tenderdetails.Delivery_Type,
  dbo.nt_1_tender.Branch_Id AS Branch_Code,
  dbo.nt_1_tender.Sell_Note_No,
  dbo.nt_1_tender.Brokrage,
  dbo.nt_1_tenderdetails.Sauda_Date AS DetailSaudaDate,
  dbo.nt_1_tenderdetails.Lifting_Date AS DetailLiftingDate,
  dbo.nt_1_tenderdetails.loding_by_us
FROM
  dbo.nt_1_tender
  LEFT JOIN dbo.nt_1_accountmaster AS millcode ON dbo.nt_1_tender.Mill_Code = millcode.Ac_Code
  AND dbo.nt_1_tender.Company_Code = millcode.company_code
  LEFT JOIN dbo.nt_1_tenderdetails ON dbo.nt_1_tender.Tender_No = dbo.nt_1_tenderdetails.Tender_No
  AND dbo.nt_1_tender.Company_Code = dbo.nt_1_tenderdetails.Company_Code
  AND dbo.nt_1_tender.Year_Code = dbo.nt_1_tenderdetails.year_code
  LEFT JOIN dbo.nt_1_accountmaster AS broker ON dbo.nt_1_tender.Broker = broker.Ac_Code
  AND dbo.nt_1_tender.Company_Code = broker.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS voucherby ON dbo.nt_1_tender.Voucher_By = voucherby.Ac_Code
  AND dbo.nt_1_tender.Company_Code = voucherby.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS tenderfrom ON dbo.nt_1_tender.Tender_From = tenderfrom.Ac_Code
  AND dbo.nt_1_tender.Company_Code = tenderfrom.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS paymentto ON dbo.nt_1_tender.Payment_To = paymentto.Ac_Code
  AND dbo.nt_1_tender.Company_Code = paymentto.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS saleparty ON dbo.nt_1_tenderdetails.Buyer_Party = saleparty.Ac_Code
  AND dbo.nt_1_tenderdetails.Company_Code = saleparty.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS salebroker ON dbo.nt_1_tenderdetails.Buyer = salebroker.Ac_Code
  AND dbo.nt_1_tenderdetails.Company_Code = salebroker.company_code
  LEFT JOIN dbo.nt_1_accountmaster AS dotabel ON dbo.nt_1_tender.Tender_DO = dotabel.Ac_Code
  AND dbo.nt_1_tender.Company_Code = dotabel.company_code;