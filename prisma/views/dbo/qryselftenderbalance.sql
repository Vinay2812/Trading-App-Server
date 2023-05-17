SELECT
  qryselftenderrecord.Tender_No AS Tender_No,
  qryselftenderrecord.Company_Code AS Company_Code,
  qryselftenderrecord.Buyer AS Buyer,
  qryselftenderrecord.Buyer_Quantal AS Buyer_Quantal,
  qryselftenderrecord.Sale_Rate AS Sale_Rate,
  qryselftenderrecord.Commission_Rate AS Commission_Rate,
  qryselftenderrecord.Sauda_Date AS Sauda_Date,
  qryselftenderrecord.Lifting_Date AS Lifting_Date,
  qryselftenderrecord.Narration AS Narration,
  qryselftenderrecord.ID AS ID,
  qryselftenderrecord.Buyer_Party AS Buyer_Party,
  qryselftenderrecord.AutoID AS AutoID,
  qryselftenderrecord.IsActive AS IsActive,
  qryselftenderrecord.year_code AS year_code,
  qryselftenderrecord.Branch_Id AS Branch_Id,
  qryselftenderrecord.Delivery_Type AS Delivery_Type,
  qryselftenderrecord.tenderid AS tenderid,
  qryselftenderrecord.tenderdetailid AS tenderdetailid,
  qryselftenderrecord.buyerid AS buyerid,
  qryselftenderrecord.buyerpartyid AS buyerpartyid,
  qryselftenderrecord.sub_broker AS sub_broker,
  qryselftenderrecord.sbr AS sbr,
  ISNULL(
    SUM(nt_1_deliveryorder.quantal),
    qryselftenderrecord.Buyer_Quantal
  ) AS desp
FROM
  (
    qryselftenderrecord
    LEFT JOIN nt_1_deliveryorder ON (
      (
        qryselftenderrecord.tenderdetailid = nt_1_deliveryorder.tenderdetailid
      )
    )
  )
GROUP BY
  qryselftenderrecord.Tender_No,
  qryselftenderrecord.Company_Code,
  qryselftenderrecord.Buyer,
  qryselftenderrecord.Buyer_Quantal,
  qryselftenderrecord.Sale_Rate,
  qryselftenderrecord.Commission_Rate,
  qryselftenderrecord.Sauda_Date,
  qryselftenderrecord.Lifting_Date,
  qryselftenderrecord.Narration,
  qryselftenderrecord.ID,
  qryselftenderrecord.Buyer_Party,
  qryselftenderrecord.AutoID,
  qryselftenderrecord.IsActive,
  qryselftenderrecord.year_code,
  qryselftenderrecord.Branch_Id,
  qryselftenderrecord.Delivery_Type,
  qryselftenderrecord.tenderid,
  qryselftenderrecord.tenderdetailid,
  qryselftenderrecord.buyerid,
  qryselftenderrecord.buyerpartyid,
  qryselftenderrecord.sub_broker,
  qryselftenderrecord.sbr;