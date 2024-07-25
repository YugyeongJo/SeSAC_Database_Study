USE bookdb;

SELECT *
FROM book;

-- 문제 6-1) 도서 제목에 '데이터'가 포함된 도서를 'Data'로 변경한 후 도서 목록을 출력
SELECT REPLACE(bookname, '데이터', 'Data'), publisher, price
FROM book;

-- 문제 6-2) 한빛아카데미에서 출판한 도서의 제목과 제목의 문자 수, 바이트 수를 출력
SELECT bookname, CHAR_LENGTH(bookname), LENGTH(bookname)
FROM book
WHERE publisher = '한빛아카데미';

-- 문제 6-3) Book 테이블에 새로운 속성 추가(주문 날짜: orderdate(DATE타입))
ALTER TABLE book
ADD COLUMN order_date DATE;

-- 문제 6-4) 각 도서에 주문 날짜 데이터 추가 후, 목록을 출력
UPDATE book
SET order_date = '2024-07-25';

SELECT *
FROM book;

-- 문제 6-5) 주문일로부터 10일 후 매출을 확정한다고 할 때, 각 주문의 확정 일자를 계산
SELECT *, ADDDATE(order_date, 10) AS 확정일자
FROM book;