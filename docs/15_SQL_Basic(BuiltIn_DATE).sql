USE bookdb;

SELECT *
FROM book;

-- DBMS 시스템상의 오늘 날짜를 반환
SELECT SYSDATE();

-- 날짜 차이 계산하기
SELECT DATEDIFF('2023-06-05', '2022-06-05');

-- 날짜 더하기
SELECT ADDDATE('2023-06-05', 10);