SELECT
  SUM(
    ISNULL(dbo.qrytenderdobalnceviewrawunion.quantal, 0)
  ) AS DESPATCH,
  dbo.nt_1_tenderdetails.Buyer_Quantal - SUM(
    ISNULL(dbo.qrytenderdobalnceviewrawunion.quantal, 0)
  ) AS BALANCE,
  dbo.nt_1_tenderdetails.tenderid,
  dbo.nt_1_tenderdetails.tenderdetailid,
  dbo.nt_1_tenderdetails.Buyer,
  dbo.nt_1_tenderdetails.Buyer_Party,
  dbo.nt_1_tenderdetails.Buyer_Quantal,
  dbo.nt_1_tenderdetails.Sale_Rate,
  dbo.nt_1_tenderdetails.buyerid,
  dbo.nt_1_tenderdetails.buyerpartyid,
  dbo.nt_1_tenderdetails.ID,
  dbo.nt_1_tenderdetails.Commission_Rate,
  dbo.nt_1_tenderdetails.Delivery_Type,
  dbo.nt_1_accountmaster.Ac_Name_E AS shiptoname
FROM
  dbo.nt_1_tenderdetails
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.nt_1_tenderdetails.shiptoid = dbo.nt_1_accountmaster.accoid
  LEFT JOIN dbo.qrytenderdobalnceviewrawunion ON dbo.nt_1_tenderdetails.tenderdetailid = dbo.qrytenderdobalnceviewrawunion.tenderdetailid
GROUP BY
  dbo.nt_1_tenderdetails.tenderid,
  dbo.nt_1_tenderdetails.tenderdetailid,
  dbo.nt_1_tenderdetails.Buyer,
  dbo.nt_1_tenderdetails.Buyer_Party,
  dbo.nt_1_tenderdetails.Buyer_Quantal,
  dbo.nt_1_tenderdetails.Sale_Rate,
  dbo.nt_1_tenderdetails.buyerid,
  dbo.nt_1_tenderdetails.buyerpartyid,
  dbo.nt_1_tenderdetails.ID,
  dbo.nt_1_tenderdetails.Commission_Rate,
  dbo.nt_1_tenderdetails.Delivery_Type,
  dbo.nt_1_accountmaster.Ac_Name_E;