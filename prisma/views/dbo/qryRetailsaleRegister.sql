SELECT
  dbo.Retail_Head.Doc_No,
  dbo.Retail_Head.Tran_Type,
  dbo.Retail_Head.Doc_Date,
  dbo.Retail_Head.Challan_No,
  dbo.Retail_Head.Challan_Date,
  dbo.Retail_Head.Vahical_No,
  dbo.Retail_Head.Party_Code,
  dbo.Retail_Head.Due_Days,
  dbo.Retail_Head.Due_date,
  dbo.Retail_Head.Total,
  dbo.Retail_Head.Subtotal,
  dbo.Retail_Head.Vat,
  dbo.Retail_Head.Roundoff,
  dbo.Retail_Head.Grand_total,
  dbo.Retail_Head.Delivered,
  dbo.Retail_Head.CGST_Rate,
  dbo.Retail_Head.CGST_Amount,
  dbo.Retail_Head.SGST_Rate,
  dbo.Retail_Head.SGST_Amount,
  dbo.Retail_Head.IGST_Rate,
  dbo.Retail_Head.IGST_Amount,
  dbo.Retail_Head.Taxable_Amount,
  dbo.Retail_Head.Party_Name,
  dbo.Retail_Head.Broker_Code,
  dbo.Retail_Head.CashRecieve,
  dbo.Retail_Head.Party_name_new,
  dbo.Retail_Head.Narration,
  dbo.Retail_Head.TCS_Rate,
  dbo.Retail_Head.TCS_Amount,
  dbo.Retail_Head.TCS_Net_Payble,
  dbo.Retail_Head.NewSBNo,
  dbo.Retail_Head.NewSBDate,
  dbo.Retail_Head.Envoiceno,
  dbo.Retail_Head.ACK,
  dbo.Retail_Head.NetGST,
  dbo.Retail_Head.NetExp,
  dbo.Retail_Head.NetWeight,
  dbo.Retail_Head.NetValue,
  dbo.Retail_Head.NetPayble,
  dbo.Retail_Head.Company_Code,
  dbo.Retail_Head.Created_By,
  dbo.Retail_Head.Modified_By,
  dbo.Retail_Head.Created_Date,
  dbo.Retail_Head.Modified_Date,
  dbo.Retail_Head.Year_Code,
  dbo.Retail_Head.CashCredit,
  dbo.Retail_Head.NetHamali,
  dbo.Retail_Head.NetOther,
  dbo.Retail_Head.NetPacking,
  dbo.Retail_Head.NetMarketSess,
  dbo.Retail_Head.NetSuperCost,
  dbo.Retail_Head.NetFrieght,
  dbo.Retail_Head.Shipto,
  dbo.Retail_Head.Item_value,
  dbo.Retail_Head.EwayBillNo,
  dbo.nt_1_accountmaster.Ac_Name_E,
  dbo.nt_1_accountmaster.Gst_No
FROM
  dbo.Retail_Head
  LEFT JOIN dbo.nt_1_accountmaster ON dbo.Retail_Head.Party_Code = dbo.nt_1_accountmaster.Ac_Code
  AND dbo.Retail_Head.Company_Code = dbo.nt_1_accountmaster.company_code;