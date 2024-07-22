-- Book 테이블에 데이터 추가하기
INSERT INTO BOOK (bookid, bookname, publisher, price) 
VALUES 
(105, '파이썬 프로그래밍', '한빛미디어', 32000),
(106, '리눅스 시스템', '한빛아카데미', 28000),
(107, 'HTML5와 CSS3', '정보문화사', 34000),
(108, '알고리즘 문제 해결 전략', '인사이트', 42000),
(109, 'C++ 완벽 가이드', '길벗', 38000);

-- 각 출판사별 도서 금액의 총합 계산
SELECT publisher, sum(price) 
FROM book
GROUP BY publisher;

-- 각 출판사별 도서 금액의 총합 계산
SELECT bookname, sum(price) 
FROM Book
GROUP BY publisher;
-- 에러 발생 이유 : bookname 속성을 사용하면 안됨. group by를 publisher로 실행했기 때문에 불가능

-- 출판사를 기준으로 그룹화 후, '생능출판사'의 데이터만 검색하여 도서 금액의 총합 계산
SELECT publisher, sum(price) 
FROM book
GROUP BY publisher
Having publisher = '생능출판사';

-- 출판사를 기준으로 그룹화 후, 가격이 20,000원 이상인 도서만 검색하여 도서 금액의 총합 계산
SELECT publisher, sum(price) 
FROM book
GROUP BY publisher
HAVING price > 20000;
-- 에러 발생 이유 : 그룹화에 사용하지 않은 열을 사용하면 안됨