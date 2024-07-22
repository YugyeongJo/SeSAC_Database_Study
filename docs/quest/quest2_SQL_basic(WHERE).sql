-- 문제2-1) 제목이 '프로그래밍'으로 끝나는 책 정보 검색
-- 제목의 길이는 상관 없음
-- 책 제목, 가격만 조회
SELECT bookname, price
FROM book
WHERE bookname LIKE '%프로그래밍';

-- 문제 2-2) 제목이 '데이터'로 시작하면서 6자인 책 정보 검색
-- 책의 모든 정보 조회
SELECT *
FROM book
WHERE bookname LIKE '데이터%'
AND CHAR_LENGTH(bookname) = 6
;

-- 문제 2-3) 제목의 세 번째 글자가 '터'인 책 정보 검색
-- 책의 모든 정보 조회
SELECT *
FROM book
WHERE SUBSTRING(bookname, 3, 1) = '터'
;

-- 문제 2-4) '한빛아카데미'의 도서 중 '데이터' 관련된 책 정보 검색
-- 책의 모든 정보 조회
SELECT *
FROM book
WHERE publisher = '한빛아카데미'
AND bookname LIKE '%데이터%';