SELECT
  nt_1_citymaster.city_code AS city_code,
  nt_1_citymaster.city_name_e AS city_name_e,
  nt_1_citymaster.pincode AS pincode,
  nt_1_citymaster.Sub_Area AS Sub_Area,
  nt_1_citymaster.city_name_r AS city_name_r,
  nt_1_citymaster.company_code AS company_code,
  nt_1_citymaster.state AS state,
  nt_1_citymaster.Created_By AS Created_By,
  nt_1_citymaster.Modified_By AS Modified_By,
  nt_1_citymaster.Distance AS Distance,
  nt_1_citymaster.GstStateCode AS GstStateCode,
  nt_1_citymaster.cityid AS cityid,
  gststatemaster.State_Name AS gststatename
FROM
  (
    nt_1_citymaster
    LEFT JOIN gststatemaster ON (
      (
        nt_1_citymaster.GstStateCode = gststatemaster.State_Code
      )
    )
  );