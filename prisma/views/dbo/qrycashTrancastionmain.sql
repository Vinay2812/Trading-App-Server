SELECT
  *
FROM
  qryTendercashtransaction
UNION
SELECT
  *
FROM
  qryTenderDetailCashTransaction
UNION
SELECT
  *
FROM
  qryDocashtransaction
UNION
SELECT
  *
FROM
  qryCashTransaction;