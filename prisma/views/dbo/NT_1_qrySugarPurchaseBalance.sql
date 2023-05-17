SELECT
  p.doc_no,
  p.PURCNO,
  p.Ac_Code,
  p.suppliername AS PartyName,
  p.Unit_Code,
  p.unitname AS Unit_Name,
  p.mill_code,
  p.millname,
  p.FROM_STATION,
  p.TO_STATION,
  p.LORRYNO,
  p.BROKER,
  p.brokername,
  p.wearhouse,
  p.subTotal,
  p.LESS_FRT_RATE,
  p.freight,
  p.cash_advance,
  p.bank_commission,
  p.OTHER_AMT,
  p.Bill_Amount,
  p.Due_Days,
  p.NETQNTL,
  p.Company_Code,
  p.Year_Code,
  p.Branch_Code,
  p.Created_By,
  p.Modified_By,
  p.item_code,
  p.itemname,
  p.itemnarration AS narration,
  p.Quantal,
  p.packing,
  p.bags,
  p.rate,
  p.item_Amount,
  p.partyCity,
  p.millshortname,
  p.Bill_No,
  p.detail_id,
  p.Tran_Type,
  p.SupplierShortname AS PartyShortname,
  p.BrokerShort,
  p.Brand_Code,
  p.Brand_Name,
  p.TCS_Rate,
  p.TDS_Rate,
  p.ic,
  p.Quantal - (
    (
      SELECT
        ISNULL(SUM(Quantal), 0) AS Expr1
      FROM
        dbo.qrysaleheaddetail AS x
      WHERE
        (p.Company_Code = Company_Code)
        AND (p.Year_Code = Year_Code)
        AND (p.doc_no = PURCNO)
    ) + (
      SELECT
        ISNULL(SUM(Netkg), 0) AS Expr1
      FROM
        dbo.qryRetailSale AS y
      WHERE
        (p.Company_Code = Company_Code)
        AND (p.Year_Code = Year_Code)
        AND (p.doc_no = PurcNo)
    )
  ) AS Balance,
  p.doc_date
FROM
  dbo.qrypurchaseheaddetail AS p
  LEFT JOIN dbo.nt_1_accountmaster AS a ON a.Ac_Code = p.mill_code
  AND a.company_code = p.Company_Code
  LEFT JOIN dbo.nt_1_accountmaster AS b ON b.Ac_Code = p.BROKER
  AND b.company_code = p.Company_Code
GROUP BY
  p.doc_no,
  p.PURCNO,
  p.Ac_Code,
  p.suppliername,
  p.Unit_Code,
  p.unitname,
  p.mill_code,
  p.millname,
  p.FROM_STATION,
  p.TO_STATION,
  p.LORRYNO,
  p.BROKER,
  p.brokername,
  p.wearhouse,
  p.subTotal,
  p.LESS_FRT_RATE,
  p.freight,
  p.cash_advance,
  p.bank_commission,
  p.OTHER_AMT,
  p.Bill_Amount,
  p.Due_Days,
  p.NETQNTL,
  p.Company_Code,
  p.Year_Code,
  p.Branch_Code,
  p.Created_By,
  p.Modified_By,
  p.item_code,
  p.itemname,
  p.itemnarration,
  p.Quantal,
  p.packing,
  p.bags,
  p.rate,
  p.item_Amount,
  p.partyCity,
  p.millshortname,
  p.Bill_No,
  p.detail_id,
  p.Tran_Type,
  p.SupplierShortname,
  p.BrokerShort,
  p.doc_date,
  p.Brand_Code,
  p.Brand_Name,
  p.TCS_Rate,
  p.TDS_Rate,
  p.ic;