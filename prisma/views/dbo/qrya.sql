SELECT
  group_Type,
  BSGroupName,
  Group_Code,
  group_Summary,
  group_Order,
  AC_CODE AS creditaccode,
  ac_name_e AS creditacname,
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) AS creditamount,
  0 AS debitaccode,
  '' AS debitacname,
  0 AS debitamount
FROM
  qryGledgernew
WHERE
  Company_Code = 1
  AND group_Type = 'T'
  AND DOC_DATE <= '2023-03-31'
  AND group_Summary = 'N'
GROUP BY
  Group_Code,
  BSGroupName,
  group_Summary,
  group_Order,
  Ac_Code,
  ac_name_e,
  group_Type
HAVING
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) < 0
UNION
SELECT
  group_Type,
  BSGroupName,
  Group_Code,
  group_Summary,
  group_Order,
  0 AS creditaccode,
  '' AS creditacname,
  0 AS creditamount,
  AC_CODE AS debitaccode,
  Ac_Name_E AS debitacname,
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) AS debitamount
FROM
  qryGledgernew
WHERE
  Company_Code = 1
  AND group_Type = 'T'
  AND DOC_DATE <= '2023-03-31'
  AND group_Summary = 'N'
GROUP BY
  Group_Code,
  BSGroupName,
  group_Summary,
  group_Order,
  Ac_Code,
  ac_name_e,
  group_Type
HAVING
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) > 0
UNION
SELECT
  group_Type,
  BSGroupName,
  Group_Code,
  group_Summary,
  group_Order,
  0 AS creditaccode,
  '' AS creditacname,
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) AS creditamount,
  0 AS debitaccode,
  '' AS debitacname,
  0 AS debitamount
FROM
  qryGledgernew
WHERE
  Company_Code = 1
  AND group_Type = 'T'
  AND DOC_DATE <= '2023-03-31'
  AND group_Summary = 'Y'
GROUP BY
  Group_Code,
  BSGroupName,
  group_Summary,
  group_Order,
  group_Type
HAVING
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) < 0
UNION
SELECT
  group_Type,
  BSGroupName,
  Group_Code,
  group_Summary,
  group_Order,
  0 AS creditaccode,
  '' AS creditacname,
  0 AS creditamount,
  0 AS debitaccode,
  '' AS debitacname,
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) AS debitamount
FROM
  qryGledgernew
WHERE
  Company_Code = 1
  AND group_Type = 'T'
  AND DOC_DATE <= '2023-03-31'
  AND group_Summary = 'Y'
GROUP BY
  Group_Code,
  BSGroupName,
  group_Summary,
  group_Order,
  group_Type
HAVING
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) > 0
UNION
SELECT
  group_Type,
  BSGroupName,
  Group_Code,
  group_Summary,
  group_Order,
  AC_CODE AS creditaccode,
  ac_name_e AS creditacname,
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) AS creditamount,
  0 AS debitaccode,
  '' AS debitacname,
  0 AS debitamount
FROM
  qryGledgernew
WHERE
  Company_Code = 1
  AND group_Type = 'P'
  AND DOC_DATE <= '2023-03-31'
  AND group_Summary = 'N'
GROUP BY
  Group_Code,
  BSGroupName,
  group_Summary,
  group_Order,
  Ac_Code,
  ac_name_e,
  group_Type
HAVING
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) < 0
UNION
SELECT
  group_Type,
  BSGroupName,
  Group_Code,
  group_Summary,
  group_Order,
  0 AS creditaccode,
  '' AS creditacname,
  0 AS creditamount,
  AC_CODE AS debitaccode,
  Ac_Name_E AS debitacname,
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) AS debitamount
FROM
  qryGledgernew
WHERE
  Company_Code = 1
  AND group_Type = 'P'
  AND DOC_DATE <= '2023-03-31'
  AND group_Summary = 'N'
GROUP BY
  Group_Code,
  BSGroupName,
  group_Summary,
  group_Order,
  Ac_Code,
  ac_name_e,
  group_Type
HAVING
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) > 0
UNION
SELECT
  group_Type,
  BSGroupName,
  Group_Code,
  group_Summary,
  group_Order,
  0 AS creditaccode,
  '' AS creditacname,
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) AS creditamount,
  0 AS debitaccode,
  '' AS debitacname,
  0 AS debitamount
FROM
  qryGledgernew
WHERE
  Company_Code = 1
  AND group_Type = 'P'
  AND DOC_DATE <= '2023-03-31'
  AND group_Summary = 'Y'
GROUP BY
  Group_Code,
  BSGroupName,
  group_Summary,
  group_Order,
  group_Type
HAVING
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) < 0
UNION
SELECT
  group_Type,
  BSGroupName,
  Group_Code,
  group_Summary,
  group_Order,
  0 AS creditaccode,
  '' AS creditacname,
  0 AS creditamount,
  0 AS debitaccode,
  '' AS debitacname,
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) AS debitamount
FROM
  qryGledgernew
WHERE
  Company_Code = 1
  AND group_Type = 'P'
  AND DOC_DATE <= '2023-03-31'
  AND group_Summary = 'Y'
GROUP BY
  Group_Code,
  BSGroupName,
  group_Summary,
  group_Order,
  group_Type
HAVING
  SUM(
    CASE
      drcr
      WHEN 'D' THEN AMOUNT
      WHEN 'C' THEN - amount
    END
  ) > 0;