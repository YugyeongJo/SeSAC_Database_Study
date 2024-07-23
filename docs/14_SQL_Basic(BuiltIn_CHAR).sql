USE bookdb;

SELECT *
FROM book;

-- bookname과 publisher 문자열 연결하기
SELECT CONCAT(bookname, ':', publisher)
FROM book;

-- 대소문자 변경하기
SELECT LOWER('Database SQL'), UPPER('Database SQL');

-- 문자열 길이 반환하기
SELECT LENGTH('Database SQL');
SELECT LENGTH('데이터베이스');
SELECT CHAR_LENGTH('데이터베이스');

-- 공백 제거하기
SELECT LTRIM('   데이터베이스   ');
SELECT RTRIM('   데이터베이스   ');
SELECT TRIM('   데이터베이스   ');

-- 문자열 변경하기
SELECT REPLACE('데이터베이스 프로그래밍', '데이터베이스', '웹');

