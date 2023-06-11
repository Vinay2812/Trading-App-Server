SELECT
  dbo.qrycarporatehead.doc_no,
  dbo.qrycarporatehead.doc_date,
  dbo.qrycarporatehead.doc_dateConverted,
  dbo.qrycarporatehead.ac_code,
  dbo.qrycarporatehead.unit_code,
  dbo.qrycarporatehead.broker,
  dbo.qrycarporatehead.pono,
  dbo.qrycarporatehead.quantal,
  dbo.qrycarporatehead.sell_rate,
  dbo.qrycarporatehead.remark,
  dbo.qrycarporatehead.company_code,
  dbo.qrycarporatehead.carpid,
  dbo.qrycarporatehead.created_by,
  dbo.qrycarporatehead.modified_by,
  dbo.qrycarporatehead.ac,
  dbo.qrycarporatehead.uc,
  dbo.qrycarporatehead.br,
  dbo.qrycarporatehead.selling_type,
  dbo.qrycarporatehead.carporatepartyaccountname,
  dbo.qrycarporatehead.carporatepartyunitname,
  dbo.qrycarporatehead.carporatepartybrokername,
  dbo.qrycarporatehead.Commission,
  dbo.qrydohead.doc_no AS dono,
  dbo.qrydohead.desp_type,
  dbo.qrydohead.doc_date AS dodate,
  dbo.qrydohead.doc_dateConverted AS dodateconverted,
  dbo.qrydohead.mill_code,
  dbo.qrydohead.grade,
  dbo.qrydohead.quantal AS doqntl,
  dbo.qrydohead.mill_rate,
  dbo.qrydohead.sale_rate,
  dbo.qrydohead.truck_no,
  dbo.qrydohead.FreightPerQtl,
  dbo.qrydohead.Freight_Amount,
  dbo.qrydohead.Delivery_Type,
  dbo.qrydohead.Invoice_No,
  dbo.qrydohead.SB_No,
  dbo.qrydohead.millname,
  dbo.qrydohead.getpassname,
  dbo.qrydohead.shiptoname,
  dbo.qrydohead.salebillname,
  dbo.qrydohead.transportname,
  dbo.qrydohead.doname,
  dbo.qrydohead.itemname,
  dbo.qrydohead.millshortname,
  dbo.qrycarporatehead.bill_to,
  dbo.qrycarporatehead.bt,
  dbo.qrycarporatehead.carporatebilltoname,
  dbo.qrydohead.vasuli_amount,
  dbo.qrydohead.voucher_type,
  dbo.qrycarporatehead.DeliveryType,
  dbo.qrycarporatehead.CommissionRate,
  dbo.qrydohead.Carporate_Sale_No,
  dbo.qrydohead.voucher_no,
  dbo.nt_1_sugarsale.ASN_No
FROM
  dbo.nt_1_sugarsale
  RIGHT JOIN dbo.qrydohead ON dbo.nt_1_sugarsale.saleid = dbo.qrydohead.saleid
  RIGHT JOIN dbo.qrycarporatehead ON dbo.qrydohead.cs = dbo.qrycarporatehead.carpid;