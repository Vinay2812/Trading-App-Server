SELECT
  nt_1_tender.Tender_No AS Tender_No,
  nt_1_tender.tenderid AS tenderid,
  nt_1_tender.Tender_Date AS Tender_Date,
  nt_1_tender.Mill_Code AS Mill_Code,
  nt_1_tender.mc AS mc,
  nt_1_tender.Quantal AS Quantal,
  nt_1_tender.Mill_Rate AS Mill_Rate,
  nt_1_tender.Grade AS Grade,
  qrymstaccountmaster.Short_Name AS Short_Name,
  nt_1_deliveryorder.doc_no AS dono,
  nt_1_deliveryorder.doc_date AS dodate,
  nt_1_deliveryorder.quantal AS doqntl,
  nt_1_sugarsale.doc_no AS billno,
  nt_1_sugarsale.saleid AS saleid,
  nt_1_sugarsale.doc_date AS billdate,
  nt_1_sugarsale.Ac_Code AS billto,
  qrymstaccountmaster_1.Ac_Name_E AS billtoname,
  nt_1_sugarsaledetails.Quantal AS saleqty,
  nt_1_sugarsaledetails.rate AS salerate,
  (
    (
      nt_1_sugarsaledetails.Quantal * nt_1_sugarsaledetails.rate
    ) - (
      nt_1_sugarsaledetails.Quantal * nt_1_tender.Mill_Rate
    )
  ) AS profit,
  nt_1_tender.Company_Code AS Company_Code,
  nt_1_tender.Year_Code AS Year_Code,
  nt_1_deliveryorder.purc_no AS purc_no
FROM
  (
    (
      (
        nt_1_tender
        LEFT JOIN qrymstaccountmaster ON ((qrymstaccountmaster.accoid = nt_1_tender.mc))
      )
      LEFT JOIN nt_1_deliveryorder ON (
        (
          (
            nt_1_deliveryorder.purc_no = nt_1_tender.Tender_No
          )
          AND (
            nt_1_deliveryorder.company_code = nt_1_tender.Company_Code
          )
          AND (
            nt_1_deliveryorder.Year_Code = nt_1_tender.Year_Code
          )
        )
      )
    )
    LEFT JOIN (
      (
        nt_1_sugarsale
        LEFT JOIN qrymstaccountmaster AS qrymstaccountmaster_1 ON (
          (nt_1_sugarsale.ac = qrymstaccountmaster_1.accoid)
        )
      )
      LEFT JOIN nt_1_sugarsaledetails ON (
        (
          nt_1_sugarsaledetails.saleid = nt_1_sugarsale.saleid
        )
      )
    ) ON (
      (
        nt_1_sugarsale.saleid = nt_1_deliveryorder.saleid
      )
    )
  );