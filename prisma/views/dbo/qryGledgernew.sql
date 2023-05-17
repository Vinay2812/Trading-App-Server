SELECT
  dbo.nt_1_gledger.TRAN_TYPE,
  dbo.nt_1_gledger.CASHCREDIT,
  dbo.nt_1_gledger.DOC_NO,
  dbo.nt_1_gledger.DOC_DATE,
  dbo.nt_1_gledger.AC_CODE,
  dbo.nt_1_gledger.NARRATION,
  dbo.nt_1_gledger.AMOUNT,
  dbo.nt_1_gledger.TENDER_ID,
  dbo.nt_1_gledger.TENDER_ID_DETAIL,
  dbo.nt_1_gledger.VOUCHER_ID,
  dbo.nt_1_gledger.COMPANY_CODE,
  dbo.nt_1_gledger.YEAR_CODE,
  dbo.nt_1_gledger.ORDER_CODE,
  dbo.nt_1_gledger.DRCR,
  dbo.nt_1_gledger.DRCR_HEAD,
  dbo.nt_1_gledger.ADJUSTED_AMOUNT,
  dbo.qrymstaccountmaster.Ac_Name_E,
  dbo.qrymstaccountmaster.Ac_type,
  dbo.qrymstaccountmaster.Address_E,
  dbo.qrymstaccountmaster.Group_Code,
  dbo.qrymstaccountmaster.group_Name_E AS BSGroupName,
  dbo.qrymstaccountmaster.cityname,
  dbo.qrymstaccountmaster.group_Summary,
  dbo.qrymstaccountmaster.group_Order,
  dbo.qrymstaccountmaster.OffPhone,
  dbo.qrymstaccountmaster.Mobile_No,
  dbo.qrymstaccountmaster.group_Type
FROM
  dbo.nt_1_gledger
  LEFT JOIN dbo.qrymstaccountmaster ON dbo.nt_1_gledger.COMPANY_CODE = dbo.qrymstaccountmaster.Company_Code
  AND dbo.nt_1_gledger.AC_CODE = dbo.qrymstaccountmaster.Ac_Code;