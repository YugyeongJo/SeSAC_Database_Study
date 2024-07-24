-- 관광 데이터베이스 실습

-- 관광 데이터베이스(tourDB) 생성
CREATE DATABASE tourDB;

-- 관공 데이터베이스(tourDB) 사용
USE tourDB;

-- tourTable 테이블 데이터 조회하기
SELECT *
FROM tourTable;

-- 문제1) 시도명을 한번만 출력 - 2가지 방식으로 작성할 것
SELECT DISTINCT 시도명
FROM tourTable;

-- 문제2) 경기도의 관광지 정보 검색 - 2가지 방식으로 작성할 것
SELECT *
FROM tourTable
WHERE 시도명 = '경기도';

-- 문제3) 쇼핑 분야의 관광지 수 계산
SELECT COUNT(*)
FROM tourTable
WHERE 중분류 = '쇼핑';

-- 문제4) 각 분야 별 관광지 수 계산
SELECT 중분류, COUNT(*) '관광지 수'
FROM tourTable
GROUP BY 중분류
; 

-- 문제5) 테마공원의 이름 및 주소 검색
SELECT 관광지명, 주소
FROM tourTable
WHERE 소분류 = '테마공원';

-- 문제6) 검색건수가 60만 건 이상인 관광지 수 계산
SELECT 소분류, COUNT(*) '관광지 수'
FROM tourTable
WHERE 검색건수 >= 600000
GROUP BY 소분류;

-- 문제7) 가장 인기가 없는 관광지부터 인기가 많은 순으로 조회
SELECT *
FROM tourTable
ORDER BY 검색건수 ASC;

-- 문제8) 10개의 관광지 정보만 조회
SELECT *
FROM tourTable
ORDER BY 검색건수
LIMIT 10;