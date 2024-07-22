USE bookdb;

-- '길벗' 출판사의 데이터 삭제
DELETE FROM book
WHERE publisher = '길벗';

SELECT *
FROM book;