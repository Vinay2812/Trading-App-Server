SELECT
  A.Ac_Name_E,
  G.TRAN_TYPE,
  G.CASHCREDIT,
  G.DOC_NO,
  G.AC_CODE,
  G.DOC_DATE,
  G.UNIT_Code,
  G.NARRATION,
  G.AMOUNT,
  G.TENDER_ID,
  G.TENDER_ID_DETAIL,
  G.VOUCHER_ID,
  G.COMPANY_CODE,
  G.YEAR_CODE,
  G.ORDER_CODE,
  G.DRCR,
  G.DRCR_HEAD,
  G.ADJUSTED_AMOUNT,
  G.Branch_Code,
  G.SORT_TYPE,
  G.SORT_NO,
  A.Ac_type,
  A.Ac_rate
FROM
  dbo.nt_1_gledger AS G
  JOIN dbo.nt_1_accountmaster AS A ON G.AC_CODE = A.Ac_Code
WHERE
  (A.Ac_type = 'F');