SELECT
  'TD' AS Tran_type,
  dbo.nt_1_tenderdetails.Tender_No AS Doc_no,
  dbo.nt_1_tenderdetails.Sauda_Date AS Doc_Date,
  dbo.nt_1_tenderdetails.BP_Detail AS Ac_Code,
  'ID' + CAST(dbo.nt_1_tenderdetails.ID AS VARCHAR) + ' MillName: ' + millcode.Short_Name + ' ' + CASE
    WHEN dbo.nt_1_tenderdetails.Buyer = dbo.nt_1_tenderdetails.ShipTo THEN salebillto.Short_Name
    ELSE Shipto.Short_Name
  END + ' BuyQty' + CAST(dbo.nt_1_tenderdetails.Buyer_Quantal AS VARCHAR) + ' BuyQty' + CAST(dbo.nt_1_tenderdetails.Sale_Rate AS VARCHAR) + ' BPAmt' + CAST(dbo.nt_1_tenderdetails.CashDiff AS VARCHAR) + ' ' + dbo.nt_1_tenderdetails.Narration AS Narration,
  dbo.nt_1_tenderdetails.Buyer_Quantal * ABS(dbo.nt_1_tenderdetails.CashDiff) AS Amount,
  CASE
    WHEN Buyer_Quantal * dbo.nt_1_tenderdetails.CashDiff > 0 THEN 'D'
    ELSE 'C'
  END AS DRCR,
  dbo.nt_1_tenderdetails.Company_Code,
  dbo.nt_1_tenderdetails.tenderdetailid
FROM
  dbo.nt_1_tenderdetails
  JOIN dbo.nt_1_tender ON dbo.nt_1_tenderdetails.tenderid = dbo.nt_1_tender.tenderid
  LEFT JOIN dbo.qrymstaccountmaster AS Shipto ON dbo.nt_1_tenderdetails.shiptoid = Shipto.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS salebillto ON dbo.nt_1_tenderdetails.buyerid = salebillto.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS millcode ON dbo.nt_1_tender.mc = millcode.accoid
WHERE
  (
    dbo.nt_1_tenderdetails.Buyer_Quantal * dbo.nt_1_tenderdetails.CashDiff <> 0
  );