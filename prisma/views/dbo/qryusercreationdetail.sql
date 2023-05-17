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
  tbluserdetail.Detail_Id AS Detail_Id,
  tbluserdetail.Program_Name AS Program_Name,
  tbluserdetail.Tran_Type AS Tran_Type,
  tbluserdetail.Permission AS Permission
FROM
  (
    tbluser
    LEFT JOIN tbluserdetail ON ((tbluser.uid = tbluserdetail.uid))
  );