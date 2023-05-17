SELECT
  dbo.nt_1_sugarsale.doc_no,
  CONVERT(varchar(10), dbo.nt_1_sugarsale.doc_date, 103) AS docdate,
  dbo.nt_1_sugarsale.Ac_Code,
  dbo.nt_1_sugarsale.Company_Code,
  dbo.nt_1_sugarsale.Year_Code,
  dbo.nt_1_sugarsale.saleid AS Billid,
  dbo.nt_1_sugarsale.TCS_Net_Payable AS Amount,
  nt_1_accountmaster_1.Ac_Name_E,
  dbo.nt_1_sugarsale.Tran_Type,
  dbo.nt_1_sugarsale.Unit_Code AS ShipTo,
  shipto.Ac_Name_E AS ShipToName,
  dbo.nt_1_sugarsale.mill_code AS MillCode,
  Mill.Ac_Name_E AS MillName,
  dbo.nt_1_sugarsale.uc,
  dbo.nt_1_sugarsale.mc,
  dbo.nt_1_sugarsale.Bill_To,
  dbo.nt_1_sugarsale.bt,
  BillTo.Ac_Name_E AS BillToName,
  dbo.nt_1_sugarsale.NETQNTL AS Qty,
  dbo.nt_1_sugarsale.IsDeleted
FROM
  dbo.nt_1_sugarsale
  LEFT JOIN dbo.nt_1_accountmaster AS BillTo ON dbo.nt_1_sugarsale.bt = BillTo.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS Mill ON dbo.nt_1_sugarsale.mc = Mill.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS shipto ON dbo.nt_1_sugarsale.uc = shipto.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.nt_1_sugarsale.ac = nt_1_accountmaster_1.accoid
WHERE
  dbo.nt_1_sugarsale.IsDeleted <> 0
UNION
SELECT
  dbo.Retail_Head.Doc_No,
  CONVERT(varchar(10), dbo.Retail_Head.Doc_Date, 103) AS docdate,
  dbo.Retail_Head.Party_Code,
  dbo.Retail_Head.Company_Code,
  dbo.Retail_Head.Year_Code,
  dbo.Retail_Head.Retailid AS Billid,
  dbo.Retail_Head.TCS_Net_Payble,
  nt_1_accountmaster_1.Ac_Name_E,
  dbo.Retail_Head.Tran_Type,
  dbo.Retail_Head.Shipto AS ShipTo,
  shipto.Ac_Name_E AS ShipToName,
  0 AS MillCode,
  '' AS MillName,
  0 AS uc,
  0 AS mc,
  0 AS Bill_To,
  0 AS bt,
  '' AS BillToName,
  0 AS Qty,
  '1' AS IsDeleted
FROM
  dbo.Retail_Head
  LEFT JOIN dbo.nt_1_accountmaster AS shipto ON dbo.Retail_Head.st = shipto.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.Retail_Head.pc = nt_1_accountmaster_1.accoid
UNION
SELECT
  dbo.commission_bill.doc_no,
  CONVERT(varchar(10), dbo.commission_bill.doc_date, 103) AS docdate,
  dbo.commission_bill.ac_code,
  dbo.commission_bill.Company_Code,
  dbo.commission_bill.Year_Code,
  dbo.commission_bill.commissionid AS Billid,
  dbo.commission_bill.TCS_Net_Payable,
  dbo.nt_1_accountmaster.Ac_Name_E,
  'LV' AS Tran_Type,
  0 AS ShipTo,
  '' AS ShipToName,
  dbo.commission_bill.mill_code AS MillCode,
  mill.Ac_Name_E AS MillName,
  0 AS uc,
  dbo.commission_bill.mc,
  0 AS Bill_To,
  0 AS bt,
  '' AS BillToName,
  qntl AS Qty,
  '1' AS IsDeleted
FROM
  dbo.commission_bill
  LEFT JOIN dbo.nt_1_accountmaster AS mill ON dbo.commission_bill.mc = mill.accoid
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.commission_bill.ac = dbo.nt_1_accountmaster.accoid
UNION
SELECT
  dbo.nt_1_rentbillhead.Doc_No,
  CONVERT(varchar(10), dbo.nt_1_rentbillhead.Date, 103) AS docdate,
  dbo.nt_1_rentbillhead.Customer_Code,
  dbo.nt_1_rentbillhead.Company_Code,
  dbo.nt_1_rentbillhead.Year_Code,
  dbo.nt_1_rentbillhead.rbid,
  dbo.nt_1_rentbillhead.TCS_Net_Payable,
  dbo.nt_1_accountmaster.Ac_Name_E,
  'RB' AS Tran_Type,
  0 AS ShipTo,
  '' AS ShipToName,
  0 AS MillCode,
  '' AS MillName,
  0 AS uc,
  0 AS mc,
  0 AS Bill_To,
  0 AS bt,
  '' AS BillToName,
  0 AS Qty,
  dbo.nt_1_rentbillhead.IsDeleted
FROM
  dbo.nt_1_accountmaster
  RIGHT JOIN dbo.nt_1_rentbillhead ON dbo.nt_1_accountmaster.accoid = dbo.nt_1_rentbillhead.cc
WHERE
  dbo.nt_1_rentbillhead.IsDeleted <> 0
UNION
SELECT
  dbo.NT_1_ColdStorageBillHead.Doc_No,
  CONVERT(
    varchar(10),
    dbo.NT_1_ColdStorageBillHead.Date,
    103
  ) AS docdate,
  dbo.NT_1_ColdStorageBillHead.Customer_Code,
  dbo.NT_1_ColdStorageBillHead.Company_Code,
  dbo.NT_1_ColdStorageBillHead.Year_Code,
  dbo.NT_1_ColdStorageBillHead.csid,
  dbo.NT_1_ColdStorageBillHead.TCS_Net_Payable,
  dbo.nt_1_accountmaster.Ac_Name_E,
  dbo.NT_1_ColdStorageBillHead.Cash_Credit AS Tran_Type,
  0 AS ShipTo,
  '' AS ShipToName,
  0 AS MillCode,
  '' AS MillName,
  0 AS uc,
  0 AS mc,
  0 AS Bill_To,
  0 AS bt,
  '' AS BillToName,
  0 AS Qty,
  '1' AS IsDeleted
FROM
  dbo.nt_1_accountmaster
  RIGHT JOIN dbo.NT_1_ColdStorageBillHead ON dbo.nt_1_accountmaster.accoid = dbo.NT_1_ColdStorageBillHead.ccid
UNION
SELECT
  dbo.nt_1_sugarsalereturn.doc_no,
  CONVERT(
    varchar(10),
    dbo.nt_1_sugarsalereturn.doc_date,
    103
  ) AS docdate,
  dbo.nt_1_sugarsalereturn.Ac_Code,
  dbo.nt_1_sugarsalereturn.Company_Code,
  dbo.nt_1_sugarsalereturn.Year_Code,
  dbo.nt_1_sugarsalereturn.srid AS Billid,
  dbo.nt_1_sugarsalereturn.TCS_Net_Payable AS Amount,
  nt_1_accountmaster_1.Ac_Name_E,
  dbo.nt_1_sugarsalereturn.Tran_Type,
  dbo.nt_1_sugarsalereturn.Unit_Code AS ShipTo,
  shipto.Ac_Name_E AS ShipToName,
  dbo.nt_1_sugarsalereturn.mill_code AS MillCode,
  mill.Ac_Name_E AS MillName,
  dbo.nt_1_sugarsalereturn.uc,
  dbo.nt_1_sugarsalereturn.mc,
  dbo.nt_1_sugarsalereturn.FromAc AS Bill_To,
  dbo.nt_1_sugarsalereturn.fa AS bt,
  dbo.nt_1_accountmaster.Ac_Name_E AS BillToName,
  dbo.nt_1_sugarsalereturn.NETQNTL AS Qty,
  '1' AS IsDeleted
FROM
  dbo.nt_1_sugarsalereturn
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.nt_1_sugarsalereturn.fa = dbo.nt_1_accountmaster.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS mill ON dbo.nt_1_sugarsalereturn.mc = mill.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS shipto ON dbo.nt_1_sugarsalereturn.uc = shipto.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS nt_1_accountmaster_1 ON dbo.nt_1_sugarsalereturn.ac = nt_1_accountmaster_1.accoid;