SELECT
  tbluser.User_Id AS User_Id,
  tbluser.User_Name AS User_Name,
  tbluser.User_Type AS User_Type,
  tbluser.Password AS PASSWORD,
  tbluser.EmailId AS EmailId,
  tbluser.EmailPassword AS EmailPassword,
  tbluser.smtpServerPort AS smtpServerPort,
  tbluser.AuthoGroupID AS AuthoGroupID,
  tbluser.Ac_Code AS Ac_Code,
  tbluser.Company_Code AS Company_Code,
  tbluser.Mobile AS Mobile,
  tbluser.LastActivityDate AS LastActivityDate,
  tbluser.RetryAttempts AS RetryAttempts,
  tbluser.IsLocked AS IsLocked,
  tbluser.LockedDateTime AS LockedDateTime,
  tbluser.Branch_Code AS Branch_Code,
  tbluser.uid AS uid,
  tbluserdetail_report.Program_Name AS Program_Name,
  tbluserdetail_report.Tran_Type AS Tran_Type,
  tbluserdetail_report.Permission AS Permission,
  tbluserdetail_report.Detail_Id AS Detail_Id
FROM
  (
    tbluser
    LEFT JOIN tbluserdetail_report ON ((tbluser.uid = tbluserdetail_report.uid))
  );