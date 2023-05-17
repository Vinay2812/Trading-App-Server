SELECT
  nt_1_tenderdetails.Tender_No AS Tender_No,
  nt_1_tenderdetails.Company_Code AS Company_Code,
  nt_1_tenderdetails.Buyer AS Buyer,
  nt_1_tenderdetails.Buyer_Quantal AS Buyer_Quantal,
  nt_1_tenderdetails.Sale_Rate AS Sale_Rate,
  nt_1_tenderdetails.Commission_Rate AS Commission_Rate,
  nt_1_tenderdetails.Sauda_Date AS Sauda_Date,
  nt_1_tenderdetails.Lifting_Date AS Lifting_Date,
  nt_1_tenderdetails.Narration AS Narration,
  nt_1_tenderdetails.ID AS ID,
  nt_1_tenderdetails.Buyer_Party AS Buyer_Party,
  nt_1_tenderdetails.AutoID AS AutoID,
  nt_1_tenderdetails.IsActive AS IsActive,
  nt_1_tenderdetails.year_code AS year_code,
  nt_1_tenderdetails.Branch_Id AS Branch_Id,
  nt_1_tenderdetails.Delivery_Type AS Delivery_Type,
  nt_1_tenderdetails.tenderid AS tenderid,
  nt_1_tenderdetails.tenderdetailid AS tenderdetailid,
  nt_1_tenderdetails.buyerid AS buyerid,
  nt_1_tenderdetails.buyerpartyid AS buyerpartyid,
  nt_1_tenderdetails.sub_broker AS sub_broker,
  nt_1_tenderdetails.sbr AS sbr
FROM
  nt_1_tenderdetails
WHERE
  (
    (nt_1_tenderdetails.Buyer = 2)
    AND (nt_1_tenderdetails.Buyer_Quantal <> 0)
  );