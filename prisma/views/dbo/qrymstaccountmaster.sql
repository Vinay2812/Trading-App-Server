SELECT
  dbo.nt_1_accountmaster.Ac_Code,
  dbo.nt_1_accountmaster.Ac_Name_E,
  dbo.nt_1_accountmaster.Ac_Name_R,
  dbo.nt_1_accountmaster.Ac_type,
  dbo.nt_1_accountmaster.Ac_rate,
  dbo.nt_1_accountmaster.Address_E,
  dbo.nt_1_accountmaster.Address_R,
  dbo.nt_1_accountmaster.City_Code,
  dbo.nt_1_accountmaster.Pincode,
  dbo.nt_1_accountmaster.Local_Lic_No,
  dbo.nt_1_accountmaster.Tin_No,
  dbo.nt_1_accountmaster.Cst_no,
  dbo.nt_1_accountmaster.Gst_No,
  dbo.nt_1_accountmaster.Email_Id,
  dbo.nt_1_accountmaster.Email_Id_cc,
  dbo.nt_1_accountmaster.Other_Narration,
  dbo.nt_1_accountmaster.ECC_No,
  dbo.nt_1_accountmaster.Bank_Name,
  dbo.nt_1_accountmaster.Bank_Ac_No,
  dbo.nt_1_accountmaster.Bank_Opening,
  dbo.nt_1_accountmaster.bank_Op_Drcr,
  dbo.nt_1_accountmaster.Opening_Balance,
  dbo.nt_1_accountmaster.Drcr,
  dbo.nt_1_accountmaster.Group_Code,
  dbo.nt_1_accountmaster.Created_By,
  dbo.nt_1_accountmaster.Modified_By,
  dbo.nt_1_accountmaster.Short_Name,
  dbo.nt_1_accountmaster.Commission,
  dbo.nt_1_accountmaster.carporate_party,
  dbo.nt_1_accountmaster.referBy,
  dbo.nt_1_accountmaster.OffPhone,
  dbo.nt_1_accountmaster.Fax,
  dbo.nt_1_accountmaster.CompanyPan,
  dbo.nt_1_accountmaster.AC_Pan,
  dbo.nt_1_accountmaster.Mobile_No,
  dbo.nt_1_accountmaster.Is_Login,
  dbo.nt_1_accountmaster.IFSC,
  dbo.nt_1_accountmaster.FSSAI,
  dbo.nt_1_accountmaster.Branch1OB,
  dbo.nt_1_accountmaster.Branch2OB,
  dbo.nt_1_accountmaster.Branch1Drcr,
  dbo.nt_1_accountmaster.Branch2Drcr,
  dbo.nt_1_accountmaster.Locked,
  dbo.nt_1_accountmaster.GSTStateCode,
  dbo.nt_1_accountmaster.UnregisterGST,
  dbo.nt_1_accountmaster.Distance,
  dbo.nt_1_accountmaster.Bal_Limit,
  dbo.nt_1_accountmaster.accoid,
  dbo.nt_1_accountmaster.bsid,
  dbo.nt_1_accountmaster.cityid,
  dbo.nt_1_bsgroupmaster.group_Name_E,
  dbo.nt_1_bsgroupmaster.group_Name_R,
  dbo.nt_1_bsgroupmaster.group_Type,
  dbo.nt_1_bsgroupmaster.group_Summary,
  dbo.nt_1_bsgroupmaster.group_Order,
  dbo.nt_1_bsgroupmaster.Company_Code,
  dbo.nt_1_citymaster.city_name_e AS cityname,
  dbo.nt_1_citymaster.pincode AS citypincode,
  dbo.nt_1_citymaster.state AS citystate,
  dbo.nt_1_citymaster.GstStateCode AS citygststatecode,
  dbo.nt_1_accountmaster.whatsup_no,
  dbo.gststatemaster.State_Name,
  dbo.nt_1_accountmaster.adhar_no,
  dbo.nt_1_accountmaster.Limit_By,
  dbo.nt_1_accountmaster.Tan_no,
  dbo.nt_1_accountmaster.TDSApplicable,
  dbo.nt_1_accountmaster.PanLink,
  dbo.nt_1_accountmaster.Insurance
FROM
  dbo.nt_1_accountmaster
  LEFT JOIN dbo.nt_1_bsgroupmaster ON dbo.nt_1_accountmaster.Group_Code = dbo.nt_1_bsgroupmaster.group_Code
  AND dbo.nt_1_accountmaster.company_code = dbo.nt_1_bsgroupmaster.Company_Code
  LEFT JOIN dbo.nt_1_citymaster ON dbo.nt_1_accountmaster.City_Code = dbo.nt_1_citymaster.city_code
  AND dbo.nt_1_accountmaster.company_code = dbo.nt_1_citymaster.company_code
  LEFT JOIN dbo.gststatemaster ON dbo.nt_1_accountmaster.GSTStateCode = dbo.gststatemaster.State_Code;