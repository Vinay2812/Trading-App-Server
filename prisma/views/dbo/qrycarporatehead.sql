SELECT
  dbo.carporatehead.doc_no,
  dbo.carporatehead.doc_date,
  CONVERT(varchar(10), dbo.carporatehead.doc_date, 103) AS doc_dateConverted,
  dbo.carporatehead.ac_code,
  dbo.carporatehead.unit_code,
  dbo.carporatehead.broker,
  dbo.carporatehead.pono,
  dbo.carporatehead.quantal,
  dbo.carporatehead.sell_rate,
  dbo.carporatehead.remark,
  dbo.carporatehead.company_code,
  dbo.carporatehead.carpid,
  dbo.carporatehead.created_by,
  dbo.carporatehead.modified_by,
  dbo.carporatehead.ac,
  dbo.carporatehead.uc,
  dbo.carporatehead.br,
  dbo.carporatehead.selling_type,
  qrycarporateaccount.Ac_Name_E AS carporatepartyaccountname,
  qrycarporateunit.Ac_Name_E AS carporatepartyunitname,
  qrycarporatebroker.Ac_Name_E AS carporatepartybrokername,
  qrycarporateaccount.Commission,
  dbo.carporatehead.bill_to,
  dbo.carporatehead.bt,
  qrycarporatebillto.Ac_Name_E AS carporatebilltoname,
  dbo.carporatehead.DeliveryType,
  dbo.carporatehead.CommissionRate
FROM
  dbo.carporatehead
  LEFT JOIN dbo.qrymstaccountmaster AS qrycarporatebillto ON dbo.carporatehead.bt = qrycarporatebillto.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrycarporatebroker ON dbo.carporatehead.br = qrycarporatebroker.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrycarporateunit ON dbo.carporatehead.uc = qrycarporateunit.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS qrycarporateaccount ON dbo.carporatehead.ac = qrycarporateaccount.accoid;