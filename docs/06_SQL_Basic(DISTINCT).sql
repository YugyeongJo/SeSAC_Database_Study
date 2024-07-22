USE bookdb;

-- 출판사 이름의 중복을 제거하여 검색
SELECT DISTINCT publisher 
FROM Book;