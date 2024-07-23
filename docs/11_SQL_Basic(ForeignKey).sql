USE bookdb;

-- 기존 데이터를 모두 제거 후, 입력
DELETE FROM newBook;

INSERT INTO newBook (bookid, bookname, publisher, price)
VALUES
(100, '데이터베이스', '한빛아카데미', 27000),
(101, '알고리즘', '한빛미디어', 32000),
(102, '운영체제', '한빛아카데미', 29000),
(103, '자료구조', '비제이퍼블릭', 25000),
(104, '네트워크', '위키북스', 28000),
(105, '컴퓨터 구조', '인피니티북스', 31000),
(106, '프로그래밍 언어론', '생능출판사', 33000),
(107, '인공지능', '에이콘출판', 35000),
(108, '컴파일러', '홍릉과학출판사', 34000),
(109, '소프트웨어 공학', 'ITC', 30000);

SELECT *
FROM newBook;

-- newOrders 테이블 생성하기(bookid 속성을 외래키로 지정)
CREATE TABLE newOrders(
	orderid	VARCHAR(10)	PRIMARY KEY
    , bookid	int	NOT NULL
	, member	VARCHAR(10)	NOT NULL
    , address	VARCHAR(20)	NOT NULL
    , FOREIGN KEY(bookid)	REFERENCES	newBook(bookid)
    );
    
SELECT *
FROM newOrders;

-- 데이터 삽입하기(FK가 정상적인 값이면 정상작동)
INSERT INTO newOrders (orderid, bookid, member, address)
VALUES ('p001', 102, '정수아', '서울');

-- 데이터 삽입하기(FK가 정상적인 값이 아닐 경우 Error)
INSERT INTO newOrders (orderid, bookid, member, address)
VALUES ('p002', 120, '정수아', '서울');

-- 참조 테이블의 데이터 삭제하기
DELETE FROM newBook WHERE bookid = 102;
-- Error : newOrders 테이블에서 bookid 속성을 참조하기 때문에 DELETE 불가하다고 나옴

