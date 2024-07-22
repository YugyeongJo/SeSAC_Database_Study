-- DATABASE 생성하기
CREATE DATABASE BookDB;

-- DATABASE TABLE 사용하기 
USE BookDB;

-- TABLE 생성하기
CREATE TABLE Book(
	bookid	INT
    , bookname	VARCHAR(20)
    , publisher VARCHAR(20)
    , price INT
);

-- 데이터 삽입하기
-- INSERT INTO BOOK (bookid, bookname, publisher, price) 
-- VALUES(100, '데이터베이스', '한빛아카데미', 27000)
-- ;
INSERT INTO BOOK (bookid, bookname, publisher, price) 
VALUES 
(101, '데이터베이스', '한빛아카데미', 22000)
, (102, 'JSP 프로그래밍', '생능출판사', 26000)
, (103, '자바스크립트', '길벗', 45000)
, (104, '데이터베이스 배움터', '생능출판사', 30000)
;

-- 데이터 조회하기
-- SELECT *
-- FROM Book;
SELECT bookname, publisher
FROM Book;

-- TABLE 삭제하기
DROP TABLE Book; 

-- DATABASE 삭제하기  
DROP DATABASE BookDB;