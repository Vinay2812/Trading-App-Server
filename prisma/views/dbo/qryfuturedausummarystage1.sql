SELECT
  dbo.Future_Detail.Doc_No,
  dbo.Future_Head.Doc_Date,
  dbo.Future_Head.Ac_Code,
  dbo.Future_Detail.Script_Code,
  dbo.Future_Detail.Expiry_Date,
  dbo.Future_Detail.Lot_Size,
  dbo.Future_Detail.Future_Type,
  SUM(
    CASE
      WHEN buy_sale = 'B' THEN lot_qty
      ELSE 0
    END
  ) AS buyqty,
  SUM(
    CASE
      WHEN buy_sale = 'B' THEN value
      ELSE 0
    END
  ) AS buyvalue,
  SUM(
    CASE
      WHEN buy_sale <> 'B' THEN lot_qty
      ELSE 0
    END
  ) AS Sqleqty,
  SUM(
    CASE
      WHEN buy_sale <> 'B' THEN value
      ELSE 0
    END
  ) AS salevalue,
  SUM(
    CASE
      WHEN buy_sale = 'B' THEN lot_qty
      ELSE 0
    END
  ) - SUM(
    CASE
      WHEN buy_sale <> 'B' THEN lot_qty
      ELSE 0
    END
  ) AS balanceqty,
  SUM(
    CASE
      WHEN buy_sale = 'B' THEN value
      ELSE 0
    END
  ) - SUM(
    CASE
      WHEN buy_sale <> 'B' THEN value
      ELSE 0
    END
  ) AS balancevalue
FROM
  dbo.Future_Detail
  JOIN dbo.Future_Head ON dbo.Future_Detail.Doc_No = dbo.Future_Head.Doc_No
  AND dbo.Future_Detail.Company_Code = dbo.Future_Head.Company_Code
  AND dbo.Future_Detail.Year_Code = dbo.Future_Head.Year_code
GROUP BY
  dbo.Future_Detail.Doc_No,
  dbo.Future_Head.Doc_Date,
  dbo.Future_Head.Ac_Code,
  dbo.Future_Detail.Script_Code,
  dbo.Future_Detail.Expiry_Date,
  dbo.Future_Detail.Lot_Size,
  dbo.Future_Detail.Future_Type;