SELECT
  dbo.nt_1_sugarsale.doc_no,
  dbo.nt_1_sugarsale.doc_date,
  [Dispatch(Mill)].Ac_Name_E AS millname,
  [Dispatch(Mill)].Address_E AS milladdress,
  [Dispatch(Mill)].cityname AS millcityname,
  [Dispatch(Mill)].Pincode AS millpincode,
  [Dispatch(Mill)].State_Name AS millstatename,
  [BillTo(From)].Ac_Name_E AS BillToName,
  ShipTo.Ac_Name_E AS ShippTo,
  ShipTo.Address_E,
  [BillTo(From)].Gst_No AS BillToGst,
  ShipTo.cityname AS city_name_e,
  [BillTo(From)].State_Name,
  ShipTo.Pincode,
  dbo.nt_1_systemmaster.System_Name_E,
  dbo.nt_1_systemmaster.HSN,
  dbo.nt_1_sugarsale.NETQNTL,
  dbo.nt_1_sugarsale.TaxableAmount,
  dbo.nt_1_sugarsale.CGSTRate,
  dbo.nt_1_sugarsale.CGSTAmount,
  dbo.nt_1_sugarsale.SGSTRate,
  dbo.nt_1_sugarsale.SGSTAmount,
  dbo.nt_1_sugarsale.IGSTRate,
  dbo.nt_1_sugarsale.IGSTAmount,
  dbo.nt_1_sugarsale.LORRYNO,
  [BillTo(From)].GSTStateCode AS state_code_billto,
  [Dispatch(Mill)].GSTStateCode AS millstatecode,
  ShipTo.GSTStateCode,
  dbo.nt_1_sugarsale.mill_code,
  dbo.nt_1_sugarsale.Unit_Code,
  dbo.nt_1_sugarsale.Company_Code,
  dbo.nt_1_sugarsale.Year_Code,
  dbo.nt_1_sugarsale.DO_No
FROM
  dbo.nt_1_systemmaster
  RIGHT JOIN dbo.nt_1_sugarsaledetails ON dbo.nt_1_systemmaster.systemid = dbo.nt_1_sugarsaledetails.ic
  RIGHT JOIN dbo.nt_1_sugarsale
  LEFT JOIN dbo.qrymstaccountmaster AS ShipTo ON dbo.nt_1_sugarsale.uc = ShipTo.accoid
  LEFT JOIN dbo.qrymstaccountmaster AS [BillTo(From)] ON dbo.nt_1_sugarsale.ac = [BillTo(From)].accoid
  LEFT JOIN dbo.qrymstaccountmaster AS [Dispatch(Mill)] ON dbo.nt_1_sugarsale.mc = [Dispatch(Mill)].accoid;