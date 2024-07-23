USE bookdb;

SELECT *
FROM newBook;

-- 테이블 속성 변경하기 (bookname, publisher 속성에 NOT NULL 제약 조건 추가)
ALTER TABLE newBook MODIFY bookname VARCHAR(20) NOT NULL;
ALTER TABLE newBook MODIFY publisher VARCHAR(20) NOT NULL;
-- Error : Invalid use of NULL value

DELETE FROM newBook
WHERE bookid IS NULL;

INSERT INTO newBook(bookid, bookname, publisher, price)
VALUES(101, NULL, NULL, 25000);
-- 테이블 속성을 변경하였기 때문에 NULL값 불가

-- 데이터 삽입하기
INSERT INTO newBook(bookid, bookname, publisher, price)
VALUES(102, '데이터 시각화', '생능출판사', 25000);

-- 테이블 속성 변경하기(price 속성의 기본값을 10,000원으로 지정)
ALTER TABLE newBook MODIFY price INT DEFAULT 10000;

INSERT INTO newBook(bookid, bookname, publisher)
VALUES(103, '프로그래밍', '한빛아카데미');