SELECT
  doc_no AS #, Voucher_No, Voucher_Type, Tran_Type AS Ptype, CONVERT(VARCHAR(10), doc_date, 103) AS tran_date, amount AS PayAmt, narration, Company_Code, Year_Code FROM nt_1_transactdetail WHERE Tran_Type IN ('BR', 'CR') AND Voucher_No <> 0 UNION SELECT doc_no AS #, PURCNO AS Voucher_No, PurcTranType AS Voucher_Type, Tran_Type AS Ptype, CONVERT(VARCHAR(10), doc_date, 103) AS tran_date, TCS_Net_Payable AS PayAmt, narration, Company_Code, Year_Code FROM NT_1_qrySugarPurcListReturn UNION SELECT doc_no AS #, bill_id AS Voucher_No, bill_type AS Voucher_Type, Tran_Type AS Ptype, CONVERT(VARCHAR(10), doc_date, 103) AS tran_date, TCS_Net_Payable AS PayAmt, narration, Company_Code, Year_Code FROM qrydebitnotehead WHERE tran_type IN ('CN') AND IsDeleted = 1 UNION SELECT doc_no AS #, Tender_No AS Voucher_No, 'SB' AS Voucher_Type, Tran_Type AS Ptype, CONVERT(VARCHAR(10), doc_date, 103) AS tran_date, amount AS PayAmt, narration, Company_Code, Year_Code FROM qrytransheaddetail WHERE drpFilterValue = 'B' AND Tran_Type = 'BR' AND Tender_No <> 0 UNION SELECT doc_no AS #, Bill_No AS Voucher_No, Bill_Tran_Type AS Voucher_Type, Tran_Type AS Ptype, CONVERT(VARCHAR(10), doc_date, 103) AS tran_date, Value AS PayAmt, narration, Company_Code, Year_Code FROM qrymultiplereceiptdetail WHERE Tran_Type = 'AB' AND Bill_No <> 0 AND Bill_Tran_Type IN ('SB', 'RS', 'DN') UNION SELECT doc_no AS #, Tender_No AS Voucher_No, 'RR' AS Voucher_Type, Tran_Type AS Ptype, CONVERT(VARCHAR(10), doc_date, 103) AS tran_date, amount AS PayAmt, narration, Company_Code, Year_Code FROM qrytransheaddetail WHERE drpFilterValue = 'R' AND Tran_Type = 'BR' AND Tender_No <> 0;