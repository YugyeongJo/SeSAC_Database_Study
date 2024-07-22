-- 문제 1-1) 학생 데이터베이스(StudentDB) 생성
CREATE DATABASE StudentDB ;

USE StudentDB ; 

-- 문제 1-2) 학생 정보 테이블(StudentInfo) 생성
CREATE TABLE StudentInfo(
	id	INT
    , name	VARCHAR(20)
    , age INT
    , address VARCHAR(20)
    , course VARCHAR(20)
);

-- 문제 1-3) 학생 정보 입력
INSERT INTO StudentInfo (id, name, age, address, course) 
VALUES 
(1, '문종헌', 24, '서울', '영어'),
(2, '김영희', 22, '부산', '수학'),
(3, '이철수', 23, '대구', '컴퓨터공학'),
(4, '박민수', 21, '인천', '물리학'),
(5, '최지현', 25, '광주', '화학'),
(6, '정예림', 22, '대전', '경제학'),
(7, '한동훈', 24, '울산', '경영학'),
(8, '오수진', 23, '수원', '심리학'),
(9, '강민준', 20, '성남', '사회학'),
(10, '윤서현', 21, '제주', '철학');

-- 문제 1-4) 전체 학생의 id와 이름을 검색
SELECT *
FROM studentinfo;