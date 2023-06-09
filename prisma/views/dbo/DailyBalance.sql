SELECT
  dbo.trDailypublish.tender_no,
  dbo.trDailypublish.tenderid,
  dbo.trDailypublish.tender_date,
  dbo.trDailypublish.published_qty,
  dbo.trDailypublish.publish_date,
  dbo.trDailypublish.lifting_date,
  dbo.trDailypublish.mill_code,
  dbo.trDailypublish.mc,
  dbo.trDailypublish.payment_to,
  dbo.trDailypublish.item_code,
  dbo.trDailypublish.it,
  dbo.trDailypublish.pt,
  dbo.trDailypublish.doac,
  dbo.trDailypublish.doid,
  dbo.trDailypublish.season,
  dbo.trDailypublish.grade,
  dbo.trDailypublish.unit,
  dbo.trDailypublish.qty,
  dbo.trDailypublish.mill_rate,
  dbo.trDailypublish.sale_rate,
  dbo.trDailypublish.purc_rate,
  dbo.trDailypublish.selling_type,
  dbo.trDailypublish.multipal_of,
  dbo.trDailypublish.auto_confirm,
  dbo.trDailypublish.status,
  dbo.trDailypublish.autoid,
  mill.Ac_Name_E AS millshortname,
  dbo.qryItemMaster.System_Name_E AS itemname,
  pt.Short_Name AS paymenttoshortname,
  tdo.Short_Name AS tenderdoshortname,
  ISNULL(
    SUM(
      CASE
        WHEN dbo.trorderbook.qty <> 'R' THEN dbo.trorderbook.qty
        ELSE 0
      END
    ),
    0
  ) AS sold,
  dbo.trDailypublish.published_qty - ISNULL(
    SUM(
      CASE
        WHEN dbo.trorderbook.qty <> 'R' THEN dbo.trorderbook.qty
        ELSE 0
      END
    ),
    0
  ) AS balance
FROM
  dbo.trDailypublish
  LEFT JOIN dbo.nt_1_accountmaster AS tdo ON dbo.trDailypublish.doac = tdo.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS pt ON dbo.trDailypublish.pt = pt.accoid
  LEFT JOIN dbo.nt_1_accountmaster AS mill ON dbo.trDailypublish.mc = mill.accoid
  LEFT JOIN dbo.qryItemMaster ON dbo.trDailypublish.item_code = dbo.qryItemMaster.System_Code
  LEFT JOIN dbo.trorderbook ON dbo.trDailypublish.tenderid = dbo.trorderbook.tenderid
  AND dbo.trDailypublish.publish_date = dbo.trorderbook.order_date
GROUP BY
  dbo.trDailypublish.tender_no,
  dbo.trDailypublish.tenderid,
  dbo.trDailypublish.tender_date,
  dbo.trDailypublish.published_qty,
  dbo.trDailypublish.publish_date,
  dbo.trDailypublish.lifting_date,
  dbo.trDailypublish.mill_code,
  dbo.trDailypublish.mc,
  dbo.trDailypublish.payment_to,
  dbo.trDailypublish.item_code,
  dbo.trDailypublish.it,
  dbo.trDailypublish.pt,
  dbo.trDailypublish.doac,
  dbo.trDailypublish.doid,
  dbo.trDailypublish.season,
  dbo.trDailypublish.grade,
  dbo.trDailypublish.unit,
  dbo.trDailypublish.qty,
  dbo.trDailypublish.mill_rate,
  dbo.trDailypublish.sale_rate,
  dbo.trDailypublish.purc_rate,
  dbo.trDailypublish.selling_type,
  dbo.trDailypublish.multipal_of,
  dbo.trDailypublish.auto_confirm,
  dbo.trDailypublish.status,
  dbo.trDailypublish.autoid,
  mill.Ac_Name_E,
  dbo.qryItemMaster.System_Name_E,
  pt.Short_Name,
  tdo.Short_Name;