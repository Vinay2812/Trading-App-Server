SELECT
  nt_1_tender.td AS td,
  qryselftenderbalance.Tender_No AS Tender_No,
  nt_1_tender.Tender_Date AS Tender_Date,
  qrymillname.Short_Name AS millshortname,
  nt_1_tender.Lifting_Date AS Lifting_Date,
  qrydoname.Short_Name AS tenderdoname,
  nt_1_tender.Grade AS Grade,
  nt_1_tender.Mill_Rate AS Mill_Rate,
  qryselftenderbalance.desp AS balance,
  qryselftenderbalance.tenderid AS tenderid,
  nt_1_tender.Mill_Code AS Mill_Code,
  nt_1_tender.mc AS mc,
  nt_1_tender.Company_Code AS Company_Code,
  nt_1_tender.Year_Code AS Year_Code,
  qryselftenderbalance.Buyer AS Buyer
FROM
  (
    (
      (
        qryselftenderbalance
        JOIN nt_1_tender ON (
          (
            qryselftenderbalance.tenderid = nt_1_tender.tenderid
          )
        )
      )
      LEFT JOIN qrymstaccountmaster AS qrydoname ON ((nt_1_tender.td = qrydoname.accoid))
    )
    LEFT JOIN qrymstaccountmaster AS qrymillname ON ((nt_1_tender.mc = qrymillname.accoid))
  );