SELECT
  rawangi_book_head.rawangi_date AS rawangi_date,
  rawangi_book_head.Company_Code AS Company_Code,
  rawangi_book_detail.detail_id AS detail_id,
  rawangi_book_detail.mill_code AS mill_code,
  rawangi_book_detail.mill_name AS mill_name,
  rawangi_book_detail.to_station AS to_station,
  rawangi_book_detail.quntl AS quntl,
  rawangi_book_detail.freight AS freight,
  rawangi_book_detail.truck_no AS truck_no,
  rawangi_book_detail.vasuli AS vasuli,
  rawangi_book_detail.rbdid AS rbdid,
  rawangi_book_detail.rbsid AS rbsid
FROM
  (
    rawangi_book_head
    LEFT JOIN rawangi_book_detail ON (
      (
        (
          rawangi_book_head.rawangi_date = rawangi_book_detail.rawangi_date
        )
        AND (
          rawangi_book_head.Company_Code = rawangi_book_detail.Company_Code
        )
      )
    )
  );