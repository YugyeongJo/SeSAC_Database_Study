-- 전체 도서 가격의 합 출력 / SUM함수
SELECT SUM(price)
FROM Book;

-- 전체 도서 가격의 합 출력 - 열 제목 추가 / SUM함수
SELECT SUM(price) AS '가격 총합'
FROM Book;

-- 전체 도서들의 평균 가격 출력 / SUM함수
SELECT AVG(price) AS '평균가격' 
FROM Book;

-- 도서의 총 개수 출력 / COUNT함수
SELECT COUNT(*) AS '총 개수'
FROM Book;

-- 최저가 도서 계산 / MIN함수
SELECT MIN(price) AS '최저가' 
FROM Book;

-- 최고가 도서 계산 / MAX함수
SELECT MAX(price) AS '최고가'
FROM Book;