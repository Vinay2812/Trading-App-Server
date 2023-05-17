SELECT
  nt_1_dodetails.Amount AS bankamount,
  nt_1_utrdetail.amount AS detailamount,
  nt_1_utrdetail.doc_no AS doc_no,
  nt_1_utrdetail.Detail_Id AS Detail_Id,
  nt_1_utrdetail.Company_Code AS Company_Code,
  nt_1_utrdetail.Year_Code AS Year_Code,
  nt_1_utrdetail.utrid AS utrid,
  nt_1_utrdetail.utrdetailid AS utrdetailid,
  SUM(ISNULL(nt_1_dodetails.Amount, 0)) AS usedamount,
  (
    nt_1_utrdetail.amount - SUM(ISNULL(nt_1_dodetails.Amount, 0))
  ) AS balanceamount
FROM
  (
    nt_1_utrdetail
    LEFT JOIN nt_1_dodetails ON (
      (
        nt_1_utrdetail.utrdetailid = nt_1_dodetails.utrdetailid
      )
    )
  )
GROUP BY
  nt_1_dodetails.Amount,
  nt_1_utrdetail.amount,
  nt_1_utrdetail.doc_no,
  nt_1_utrdetail.Detail_Id,
  nt_1_utrdetail.Company_Code,
  nt_1_utrdetail.Year_Code,
  nt_1_utrdetail.utrid,
  nt_1_utrdetail.utrdetailid;