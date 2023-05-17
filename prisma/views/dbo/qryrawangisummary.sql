SELECT
  rawangi_book_head.rawangi_date AS rawangi_date,
  rawangi_book_head.Company_Code AS Company_Code,
  rawangi_book_summary.detail_id AS detail_id,
  rawangi_book_summary.mill_code AS mill_code,
  rawangi_book_summary.mill_name AS mill_name,
  rawangi_book_summary.to_station AS to_station,
  rawangi_book_summary.quntl AS quntl,
  rawangi_book_summary.freight AS freight,
  rawangi_book_summary.balance AS balance,
  rawangi_book_summary.mc AS mc,
  rawangi_book_summary.rbsid AS rbsid,
  qrymstaccountmaster.Short_Name AS Short_Name
FROM
  (
    rawangi_book_head
    LEFT JOIN (
      rawangi_book_summary
      LEFT JOIN qrymstaccountmaster ON (
        (
          qrymstaccountmaster.accoid = rawangi_book_summary.mc
        )
      )
    ) ON (
      (
        (
          rawangi_book_summary.Company_Code = rawangi_book_head.Company_Code
        )
        AND (
          rawangi_book_summary.rawangi_date = rawangi_book_head.rawangi_date
        )
      )
    )
  );