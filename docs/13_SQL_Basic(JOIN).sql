USE bookdb;

SELECT *
FROM newOrders;

-- 기존 데이터를 모두 제거 후, 입력
DELETE FROM newOrders;

INSERT INTO newOrders (orderid, bookid, member, address)
VALUES 
('p001', 102, '오한솔', '경기')
, ('p002', 107, '김현우', '서울')
, ('p003', 103, '박홍진', '부산')
, ('p004', 102, '김현우', '서울')
, ('p005', 104, '문종헌', '대전')
, ('p006', 105, '김현우', '서울')
, ('p007', 103, '이봉림', '부산')
, ('p008', 102, '정희성', '경기')
, ('p009', 107, '오한솔', '경기')
, ('p010', 103, '김현우', '서울');

-- 2개의 테이블을 이용한 조인 검색
-- 김현우 고객이 주문한 책의 제목과 가격 검색
SELECT newBook.bookname, newBook.price
FROM newBook, newOrders
WHERE newOrders.member = '김현우'
AND newOrders.bookid = newBook.bookid;

-- 도서를 주문한 고객들의 운송장 정보 출력
SELECT newOrders.orderid, newOrders.member, newBook.bookname, newBook.price, neworders.address
FROM newBook, newOrders
WHERE newOrders.bookid = newBook.bookid;