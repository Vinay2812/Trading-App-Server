SELECT
  dbo.nt_1_tenderdetails.Tender_No,
  dbo.nt_1_tenderdetails.Company_Code,
  dbo.nt_1_tenderdetails.Buyer,
  dbo.nt_1_tenderdetails.Buyer_Quantal,
  dbo.nt_1_tenderdetails.Sale_Rate,
  dbo.nt_1_tenderdetails.Commission_Rate,
  dbo.nt_1_tenderdetails.Sauda_Date,
  CONVERT(
    varchar(10),
    dbo.nt_1_tenderdetails.Sauda_Date,
    103
  ) AS Sauda_DateConverted,
  dbo.nt_1_tenderdetails.Lifting_Date AS payment_date,
  CONVERT(
    varchar(10),
    dbo.nt_1_tenderdetails.Lifting_Date,
    103
  ) AS payment_dateConverted,
  dbo.nt_1_tenderdetails.Narration,
  dbo.nt_1_tenderdetails.ID,
  dbo.nt_1_tenderdetails.Buyer_Party,
  dbo.nt_1_tenderdetails.AutoID,
  dbo.nt_1_tenderdetails.IsActive,
  dbo.nt_1_tenderdetails.year_code,
  dbo.nt_1_tenderdetails.Branch_Id,
  dbo.nt_1_tenderdetails.Delivery_Type,
  dbo.nt_1_tenderdetails.tenderid,
  dbo.nt_1_tenderdetails.tenderdetailid,
  dbo.nt_1_tenderdetails.buyerid,
  dbo.nt_1_tenderdetails.buyerpartyid,
  qrybuyerid.Ac_Name_E AS buyername,
  qrybuyerid.Gst_No AS buyergstno,
  qrybuyerid.GSTStateCode AS buyergststatecode,
  qrybuyerparty.Ac_Name_E AS buyerpartyname,
  qrybuyerparty.Gst_No AS buyerpartygstno,
  qrybuyerparty.GSTStateCode AS buyerpartygststatecode,
  qrybuyerid.cityname AS buyeridcityname,
  qrybuyerid.citypincode AS buyeridcitypincode,
  qrybuyerid.citystate AS buyeridcitystate,
  qrybuyerid.citygststatecode AS buyeridcitygststatecode,
  qrybuyerparty.cityname AS buyerpartycityname,
  qrybuyerparty.citypincode AS buyerpartycitypincode,
  qrybuyerparty.citystate AS buyerpartycitystate,
  qrybuyerparty.citygststatecode AS buyerpartycitygststatecode,
  dbo.nt_1_tenderdetails.sub_broker,
  dbo.nt_1_tenderdetails.sbr,
  qrysubbroker.Ac_Name_E AS subbrokername,
  qrysubbroker.cityname AS subbrokercityname,
  dbo.nt_1_tenderdetails.tcs_rate,
  dbo.nt_1_tenderdetails.gst_rate,
  dbo.nt_1_tenderdetails.tcs_amt,
  dbo.nt_1_tenderdetails.gst_amt,
  dbo.nt_1_tenderdetails.ShipTo,
  dbo.nt_1_tenderdetails.CashDiff,
  dbo.nt_1_tenderdetails.shiptoid,
  shipto.Ac_Name_E AS ShipToname,
  qrybuyerid.Short_Name AS buyershortname,
  qrybuyerparty.Mobile_No AS buyerpartymobno,
  dbo.nt_1_tenderdetails.BP_Detail,
  dbo.nt_1_tenderdetails.bpid,
  dbo.nt_1_tenderdetails.loding_by_us,
  qrybpdetail.Ac_Name_E AS BPDetailname,
  qrybpdetail.cityname AS BPDetailcityname
FROM
  dbo.qrymstaccountmaster AS qrybpdetail
  RIGHT JOIN dbo.nt_1_tenderdetails ON qrybpdetail.accoid = dbo.nt_1_tenderdetails.bpid
  LEFT JOIN dbo.qrymstaccountmaster AS shipto ON dbo.nt_1_tenderdetails.shiptoid = shipto.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrysubbroker ON dbo.nt_1_tenderdetails.sbr = qrysubbroker.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrybuyerid ON dbo.nt_1_tenderdetails.buyerid = qrybuyerid.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrybuyerparty ON dbo.nt_1_tenderdetails.buyerpartyid = qrybuyerparty.accoid;