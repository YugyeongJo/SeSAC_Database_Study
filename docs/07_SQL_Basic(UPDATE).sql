USE bookdb;

SELECT *
FROM book;

UPDATE book 
SET price = 25000;

UPDATE book
SET price = 23000
WHERE bookid = 101;