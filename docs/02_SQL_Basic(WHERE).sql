-- 가격이 25,000원 이상인 책 정보 검색
SELECT *
FROM book
WHERE price > 25000; 

-- 가격이 10,000원 이상 25,000원 이하인 책 정보 검색
SELECT *
FROM book
WHERE price BETWEEN 10000 AND 25000;

-- 출판사가 '길벗' 또는 '생능출판사'인 책 정보 검색
SELECT *
FROM book
WHERE publisher IN ('길벗', '생능출판사');

-- 출판사가 '길벗' 또는 '생능출판사'가 아닌 책 정보 검색
SELECT *
FROM book
WHERE publisher NOT IN ('길벗', '생능출판사');

-- 데이터베이스를 출간한 출판사 검색
SELECT publisher
FROM book
WHERE bookname LIKE '데이터베이스';

-- 책 이름에 '데이터베이스'가 포함된 책 이름과 출판사 검색
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '%데이터베이스%';

-- 왼쪽 두 번째 위치에 '이'라는 문자를 갖는 책 이름을 검색
SELECT bookname 
FROM book
WHERE bookname LIKE '_이%';

-- 출판사가 '길벗' 또는 '생능출판사'인 책 정보 검색
SELECT * 
FROM book
WHERE publisher='길벗' OR publisher='생능출판사';

-- 데이터 관련 도서 중, 가격이 30,000원 이상인 책 검색
SELECT *
FROM Book
WHERE bookname LIKE '%데이터%' AND price >= 30000;