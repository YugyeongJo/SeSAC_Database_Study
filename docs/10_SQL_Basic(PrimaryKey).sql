CREATE TABLE newBook(
	bookid	INT	PRIMARY KEY
    , bookname	VARCHAR(20)
    , publisher	VARCHAR(20)
    , price	INT
    );
    
INSERT INTO newBook (bookid, bookname, publisher, price)
VALUES 
(100, '데이터베이스', '한빛아카데미', 27000)
, (200, '프로그래밍', '한빛아카데미', 30000)
, (300, '데이터 시각화', '생능출판사', 27000);
-- PRIMARY KEY는 NULL일 수 없으며, 중복일 수 없다.
