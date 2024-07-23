USE studentdb;

SELECT *
FROM studentinfo;

-- 문제 3-1) 나이가 30이상인 학생 정보 검색
SELECT *
FROM studentinfo
WHERE age >= 30;

-- 문제 3-2) '컴퓨터'를 수강하는 학생 정보 검색
SELECT *
FROM studentinfo
WHERE course LIKE '%컴퓨터%' ;

-- 문제 3-3) 이름이 '이철수'인 학생 정보 검색
SELECT *
FROM studentinfo
WHERE name = '이철수';

-- 문제 3-4) 나이가 20~25살 사이인 학생 정보 검색
SELECT *
FROM studentinfo
WHERE age BETWEEN 20 AND 25;

-- 문제 3-5) 나이가 28살이거나 34살인 학생 정보 검색
SELECT *
FROM studentinfo
WHERE age IN (22, 25);

-- 문제 3-6) 성이 '김'씨인 학생 정보 검색
SELECT *
FROM studentinfo
WHERE name LIKE '김%';

-- 문제 3-7) 이름의 두 번째 글자가 '지'이고, 그 뒤는 무엇이든 관계없는 학생 정보 검색
SELECT *
FROM studentinfo
WHERE name LIKE '_지%';

-- 문제 3-8) 나이를 기준으로 오름차순 정렬하여 검색
SELECT *
FROM studentinfo
ORDER BY age;

-- 문제 3-9) 나이가 많은 사람부터 적은 사람 순으로 순차적으로 검색
SELECT *
FROM studentinfo
ORDER BY age DESC;