USE studentdb;

SELECT *
FROM studentinfo;

-- 문제 5-1) '문종헌'학생의 주소를 '제주'로 변경
UPDATE studentinfo
SET address = '제주'
WHERE name = '문종헌';

-- 문제 5-2) id가 10인 학생을 삭제
DELETE FROM studentinfo
WHERE id = 10;

-- 문제 5-3) 학생 정보 테이블에 새로운 속성 추가
ALTER TABLE studentinfo ADD score CHAR(2);

-- 문제 5-4) 각 학생의 score 속성에 학점 값 삽입
UPDATE studentinfo SET score = CASE
    WHEN id = 1 THEN 'A'
    WHEN id = 2 THEN 'B'
    WHEN id = 3 THEN 'A'
    WHEN id = 4 THEN 'C'
    WHEN id = 5 THEN 'B'
    WHEN id = 6 THEN 'D'
    WHEN id = 7 THEN 'A'
    WHEN id = 8 THEN 'C'
    WHEN id = 9 THEN 'D'
    WHEN id = 10 THEN 'A'
    ELSE score
END;

-- 문제 5-5) 각 학점 별 학생 수 계산
SELECT score, COUNT(*)
FROM studentinfo
GROUP BY score;

-- 문제 5-6) '컴퓨터공학' 또는 '영어' 과목을 수강하는 학생의 이름 및 과목명 검색
SELECT name, course
FROM studentinfo
WHERE course IN ('컴퓨터공학', '영어');
