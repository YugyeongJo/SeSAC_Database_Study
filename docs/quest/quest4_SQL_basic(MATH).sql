USE bookdb;

SELECT *
FROM book;

-- 문제 4-1) 데이터베이스 관련 책 가격의 총액 계산
SELECT SUM(price)
FROM book
WHERE bookname LIKE '%데이터베이스%';

-- 문제 4-2) 출판사가 '한빛아카데미'인 책의 개수 출력
SELECT COUNT(*)
FROM book
WHERE publisher = '한빛아카데미';

-- 문제 4-3) 출판사 별로 가격이 20,000원 이상인 도서의 총 수량을 계산
SELECT publisher, COUNT(*)
FROM book
WHERE price >= 20000
GROUP BY publisher;

-- 문제 4-4) 출판사 별로 가격이 20,000원 이상인 도서의 총 수량을 계산(총 수량이 두 권 이상인 출판사만 조회)
SELECT publisher, COUNT(*)
FROM book
GROUP BY publisher
HAVING COUNT(*) >= 2;

USE studentdb;
-- 문제 4-5) 학생들의 나이 총 합 계산
SELECT SUM(age)
FROM studentinfo;

-- 문제 4-6) 중복을 제거한 과목명 검색
SELECT DISTINCT course
FROM studentinfo;

-- 문제 4-7) '컴퓨터'를 수강하는 학생들의 평균 나이 계산
SELECT AVG(age)
FROM studentinfo
WHERE course LIKE '%컴퓨터%';

-- 문제 4-8) '영어'과목을 수강하는 학생 수를 계산
SELECT COUNT(*) AS 수강인원
FROM studentinfo
WHERE course LIKE '%영어%';

-- 문제 4-9) 각 지역별 학생 수를 계산
SELECT address, COUNT(*) AS 수강인원
FROM studentinfo
GROUP BY address;

-- 문제 4-10) 각 지역별 학생들의 평균 나이를 계산
SELECT address, AVG(age) AS 평균나이
FROM studentinfo
GROUP BY address;

-- 문제 4-11) 과목별 평균 나이가 25세 이상인 과목명과 학생수를 계산
SELECT address, COUNT(*) 수강생수
FROM studentinfo
GROUP BY address
HAVING 수강생수 >= 2;
