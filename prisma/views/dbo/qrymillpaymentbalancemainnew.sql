SELECT
  qrymillpaymentbalancemain.tenderid AS tenderid,
  qrymillpaymentbalancemain.Tender_No AS Tender_No,
  qrymillpaymentbalancemain.Company_Code AS Company_Code,
  qrymillpaymentbalancemain.Tender_Date AS Tender_Date,
  qrymillpaymentbalancemain.Year_Code AS Year_Code,
  qrymillpaymentbalancemain.Lifting_Date AS Lifting_Date,
  qrymillpaymentbalancemain.Mill_Code AS Mill_Code,
  qrymillpaymentbalancemain.Grade AS Grade,
  qrymillpaymentbalancemain.Quantal AS Quantal,
  qrymillpaymentbalancemain.Payment_To AS Payment_To,
  qrymillpaymentbalancemain.Mill_Rate AS Mill_Rate,
  qrymillpaymentbalancemain.Excise_Rate AS Excise_Rate,
  qrymillpaymentbalancemain.millrategst AS millrategst,
  qrymillpaymentbalancemain.millamount AS millamount,
  qrymillpaymentbalancemain.utrdetailid AS utrdetailid,
  qrymillpaymentbalancemain.detailamount AS detailamount,
  qrymillpaymentbalancemain.paidamount AS paidamount,
  qrymillpaymentbalancemain.adjusted AS adjusted,
  qrymillpaymentbalancemain.payableamount AS payableamount,
  qrymillpaymentbalancemain.Tender_DateConverted AS Tender_DateConverted,
  qrymillpaymentbalancemain.Lifting_DateConverted AS Lifting_DateConverted,
  qrymillpaymentbalancemain.pt AS pt,
  qrymillpaymentbalancemain.mc AS mc,
  nt_1_accountmaster_1.Ac_Name_E AS paymenttoname,
  nt_1_accountmaster.Ac_Name_E AS millname
FROM
  (
    (
      qrymillpaymentbalancemain
      LEFT JOIN nt_1_accountmaster ON (
        (
          qrymillpaymentbalancemain.mc = nt_1_accountmaster.accoid
        )
      )
    )
    LEFT JOIN nt_1_accountmaster AS nt_1_accountmaster_1 ON (
      (
        qrymillpaymentbalancemain.pt = nt_1_accountmaster_1.accoid
      )
    )
  );