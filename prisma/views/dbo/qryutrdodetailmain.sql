SELECT
  nt_1_utr.doc_no AS doc_no,
  nt_1_utr.doc_date AS doc_date,
  nt_1_utr.bank_ac AS bank_ac,
  nt_1_utr.mill_code AS mill_code,
  nt_1_utr.amount AS amount,
  nt_1_utr.utr_no AS utr_no,
  nt_1_utr.narration_header AS narration_header,
  nt_1_utr.narration_footer AS narration_footer,
  nt_1_utr.Company_Code AS Company_Code,
  nt_1_utr.Year_Code AS Year_Code,
  nt_1_utr.IsSave AS IsSave,
  nt_1_utr.utrid AS utrid,
  nt_1_utr.ba AS ba,
  nt_1_utr.mc AS mc,
  nt_1_utrdetail.Detail_Id AS Detail_Id,
  nt_1_utrdetail.grade_no AS grade_no,
  nt_1_utrdetail.lotYear_Code AS lotYear_Code,
  nt_1_utrdetail.Adjusted_Amt AS Adjusted_Amt,
  nt_1_utrdetail.amount AS detailamount,
  nt_1_utrdetail.utrdetailid AS utrdetailid,
  qrymstaccountmaster.Ac_Name_E AS millname,
  qrymstaccountmaster.Gst_No AS millgstno,
  qrymstaccountmaster.Email_Id AS millemailid,
  qrymstaccountmaster.Short_Name AS millshortname,
  qrymstaccountmaster.cityname AS millcityname,
  qrymstaccountmaster.citystate AS citystate,
  qrymstaccountmaster.citygststatecode AS millstatecode,
  qrymstaccountmaster.State_Name AS millcitystate,
  nt_1_utrdetail.ln AS tenderid,
  nt_1_utrdetail.lotCompany_Code AS lotCompany_Code,
  nt_1_utrdetail.LTNo AS lot_no,
  nt_1_dodetails.Amount AS bankamount,
  nt_1_deliveryorder.quantal AS quantal,
  nt_1_deliveryorder.mill_rate AS mill_rate,
  nt_1_deliveryorder.doc_no AS dono,
  nt_1_deliveryorder.doc_date AS dodate
FROM
  (
    (
      nt_1_utr
      LEFT JOIN qrymstaccountmaster ON ((nt_1_utr.mc = qrymstaccountmaster.accoid))
    )
    LEFT JOIN (
      nt_1_utrdetail
      LEFT JOIN (
        nt_1_deliveryorder
        LEFT JOIN nt_1_dodetails ON ((nt_1_deliveryorder.doid = nt_1_dodetails.doid))
      ) ON (
        (
          nt_1_dodetails.utrdetailid = nt_1_utrdetail.utrdetailid
        )
      )
    ) ON ((nt_1_utrdetail.utrid = nt_1_utr.utrid))
  );