USE bookdb;

SELECT *
FROM book;

-- Book 테이블에 다음 속성 추가

-- VARCHAR(10) 자료형을 가진 isbn 속성 추가
ALTER TABLE book 
ADD isbn VARCHAR(10);

-- book 테이블 isbn 속성의 데이터 타입을 INT로 변경
ALTER TABLE book 
MODIFY isbn INT;

-- book 테이블의 isbn 속성의 이름을 '일련번호'로 변경
ALTER TABLE book
CHANGE isbn 일련번호 INT;

-- book 테이블의 일련번호 속성을 삭제
ALTER TABLE book
DROP COLUMN 일련번호;