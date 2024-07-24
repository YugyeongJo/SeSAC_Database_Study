-- 문제1) 판매 DB 및 테이블 생성
CREATE DATABASE SalesDB;

USE SalesDB;

CREATE TABLE Customer(
	customer_id	VARCHAR(20) PRIMARY KEY
    , name	VARCHAR(10) NOT NULL
    , age	INT
    , grade	VARCHAR(10)	NOT NULL
    , occupation	VARCHAR(20)
    , reserves	INT DEFAULT 0
);

CREATE TABLE Product(
	product_id	CHAR(3)	PRIMARY KEY
    , product_name	VARCHAR(20)
    , inventory	INT
    , unit_price	INT
    , manufacturer	VARCHAR(20)
);

CREATE TABLE SalesList(
	sales_id	CHAR(3)	PRIMARY KEY
    , customer_id	VARCHAR(20) 
    , sales_product	CHAR(3) 
    , amount	INT
    , address	VARCHAR(30)
    , order_date	DATE
    , FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
    , FOREIGN KEY (sales_product) REFERENCES  Product(product_id)
);

-- 문제2) 각 테이블에 데이터 입력
INSERT INTO Customer 
VALUES 
	('apple', '정소화', 20, 'gold', '학생', 1000)
    , ('banana', '김선우', 25, 'vip', '간호사', 2500)
    , ('carrot', '고명석', 28, 'gold', '교사', 4500)
    , ('orange', '김용욱', 22, 'silver', '학생', 0)
    , ('melon', '성원용', 35, 'gold', '회사원', 5000)
    , ('peach', '오형준', NULL, 'silver', '의사', 300)
    , ('pear', '채광주', 31, 'silver', '회사원', 500);
    
INSERT INTO Product 
VALUES 
	('p01', '그냥만두', 5000, 4500, '대한식품')
    , ('p02', '매운쫄면', 2500, 5500, '민국푸드')
    , ('p03', '쿵떡파이', 3600, 2600, '한빛제과')
    , ('p04', '맛난초콜릿', 1250, 2500, '한빛제과')
    , ('p05', '얼큰라면', 2200, 1200, '대한식품')
    , ('p06', '통통우동', 1000, 1550, '민국푸드')
    , ('p07', '달콤비스킷', 1650, 1500, '한빛제과');
    
INSERT INTO SalesList 
VALUES
    ('o01', 'apple', 'p03', 10, '서울시 마포구', '2022-01-01')
    , ('o02', 'melon', 'p01', 5, '인천시 계양구', '2022-01-10')
    , ('o03', 'banana', 'p06', 45, '경기도 부천시', '2022-01-11')
    , ('o04', 'carrot', 'p02', 8, '부산시 금정구', '2022-02-01')
    , ('o05', 'melon', 'p06', 36, '경기도 용인시', '2022-02-20')
    , ('o06', 'banana', 'p01', 19, '충청북도 보은군 마포구', '2022-03-02')
    , ('o07', 'apple', 'p03', 22, '서울시 영등포구', '2022-03-15')
    , ('o08', 'pear', 'p02', 50, '강원도 춘천시', '2022-04-10')
    , ('o09', 'banana', 'p04', 15, '전라남도 목포시', '2022-04-11')
    , ('o10', 'carrot', 'p03', 20, '경기도 안양시', '2022-05-22');

    
-- 문제 3) 고객 테이블에서 검색
-- 3-1) 고객 테이블에서 아이디, 이름, 등급 검색하세요.
SELECT customer_id, name, grade
FROM Customer;

-- 3-2) 고객 테이블에서 성이 김씨인 고객의 이름, 나이, 등급, 적립금을 검색하세요.
SELECT name, age, grade, reserves
FROM Customer
WHERE name LIKE '김%';

-- 3-3) 고객 테이블에서 아이디가 5자인 고객의 아이디, 이름, 등급을 검색하세요.
SELECT customer_id, name, grade
FROM Customer
WHERE CHAR_LENGTH(customer_id) = 5;

-- 3-4) 고객 테이블에서 나이가 아직 입력되지 않은 고객의 이름을 검색하세요. 
SELECT name
FROM Customer
WHERE age IS NULL;

-- 3-5) 고객 테이블에서 나이가 이미 입력된 고객의 이름을 검색하세요. 
SELECT name
FROM Customer
WHERE age IS NOT NULL;

-- 3-6) 고객 테이블에서 이름, 등급, 나이를 검색하되, 나이를 기준으로 내림차순 정렬하세요. 
SELECT name, grade, age
FROM Customer
ORDER BY age DESC;

-- 3-7) 고객 테이블에서 고객이 몇명 등록되어 있는지 검색하세요. 
SELECT COUNT(*) 고객수
FROM Customer;

-- 3-8) 고객 테이블에서 적립금 평균이 1,000원 이상인 등급에 대해 등급별 고객수와 적립금 평균을 검색하세요.
SELECT grade, COUNT(*), AVG(reserves) 평균적립금
FROM Customer
GROUP BY grade
HAVING 평균적립금 >= 1000;

-- 문제 4) 제품 및 주문 테이블에서 검색
-- 4-1) 제품 테이블에서 제조업체를 중복을 제거하여 검색하세요. 
SELECT DISTINCT manufacturer
FROM Product;

-- 4-2) 제품 테이블에서 제품명과 단가를 검색하되, 단가에 500원을 더해 '조정 단가'라는 새 이름으로 검색하세요. 
SELECT product_name, (unit_price+500) '조정 단가'
FROM Product;

-- 4-3) 제품 테이블에서 한빛제과가 제조한 제품의 제품명, 재고량, 단가를 검색하세요. 
SELECT product_name, inventory, unit_price
FROM Product
WHERE manufacturer = '한빛제과';

-- 4-4) 주문 테이블에서 apple 고객이 15개 이상 주문한 주문제품, 수량, 주문일자를 검색하세요. 
SELECT customer_id, sales_product, SUM(amount) 수량, MAX(order_date) 최근주문일
FROM SalesList
WHERE customer_id = 'apple'
GROUP BY customer_id, sales_product
HAVING SUM(amount) >= 15;

-- 4-5) 제품 테이블에서 모든 제품의 단가 평균을 검색하세요. 
SELECT AVG(unit_price) 단가
FROM Product;

-- 4-6) 제조업체 별로 제품의 개수와 가장 비싼 단가를 검색하세요.
SELECT manufacturer, COUNT(product_id) 제품수, MAX(unit_price) 최고가
FROM Product
GROUP BY manufacturer;

-- 4-7) 제품을 3개 이상 제조한 제조업체의 제품의 개수와 가장 비싼 단가를 검색하세요. 
SELECT manufacturer, COUNT(product_id) 제품수, MAX(unit_price) 최고가
FROM Product
GROUP BY manufacturer
HAVING 제품수 >= 3;

-- 문제 5) 외래키를 이용하여 검색
-- 5-1) banana 고객이 주문한 제품의 이름을 검색하세요. 
SELECT DISTINCT P.product_name
FROM Product P, SalesList S
WHERE S.customer_id = 'banana';

-- 5-2) 나이가 30세 이상인 고객이 주문한 제품의 번호와 주문일자를 검색하세요. 
SELECT S.sales_product, S.order_date
FROM SalesList S, Customer C
WHERE C.age >= 30 AND S.customer_id = C.customer_id;

-- 5-3) 제조업체 별 총 주문 수량을 검색하세요.(제품 상관없음)
SELECT P.manufacturer, SUM(S.amount)
FROM SalesList S, Product P
WHERE S.sales_product = P.product_id
GROUP BY P.manufacturer;

-- 5-4) 고객 별 주문 총 수량을 검색하세요.
SELECT C.name, SUM(S.amount)
FROM SalesList S, Customer C
WHERE S.customer_id = C.customer_id
GROUP BY S.customer_id;

-- 5-5) 가격이 4500원인 제품을 주문한 고객의 이름과 제품명을 검색하세요. 
SELECT C.name, P.product_name
FROM SalesList S, Product P, Customer C
WHERE S.sales_product = P.product_id AND S.customer_id = C.customer_id
AND P.unit_price = 4500;

-- 5-6) 고객의 이름과 고객이 주문한 제품의 이름을 검색하세요. (고객의 이름을 정렬하여 출력할 것)
SELECT C.name, P.product_name
FROM SalesList S, Product P, Customer C
WHERE S.sales_product = P.product_id AND S.customer_id = C.customer_id
ORDER BY 1;

-- 5-7) 고객 정보 및 주문 정보에 관한 데이터를 고객별로 정렬하여 출력하세요. 
SELECT C.*, S.*, P.*
FROM SalesList S, Product P, Customer C
WHERE S.sales_product = P.product_id AND S.customer_id = C.customer_id 
ORDER BY C.name