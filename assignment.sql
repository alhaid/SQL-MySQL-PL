--------- 1 -----------

SELECT * FROM customer;
SELECT * FROM invoice;
SELECT * FROM invprod;
SELECT * FROM orderprod;
SELECT * FROM orders;
SELECT * FROM part;
SELECT * FROM salesrep;

--------- 2 -----------

SELECT Custno, Custname
FROM customer
WHERE Custcity = 'Mississauga'
ORDER BY Custname DESC;


--------- 3 -----------

SELECT DISTINCT Custname, customer.Custno
FROM customer, orders
WHERE customer.Custno = orders.Custno
AND Srepno IS NULL
ORDER BY Custname ASC;

--------- 4 -----------

SELECT AVG(Unitprice)
FROM part
WHERE Partclass = 'AP';

--------- 5 -----------

SELECT COUNT(Partno)
FROM part
WHERE Partclass = 'sp';

--------- 6 -----------

SELECT COUNT(Onhand)
FROM part;

--------- 7 -----------
--ask about this one --- is it right ??
SELECT AVG(Unitprice)
FROM part, orders
WHERE Partclass = 'sp'
AND Partno IN (SELECT Partno FROM orderprod)
AND orders.Orderdate BETWEEN '2009-01-01' AND '2009-11-01';

--------- 8 -----------

SELECT MAX(Unitprice) as Maximum, Min(Unitprice) as Minimum
FROM part;

--------- 9 -----------

SELECT Partno, Partdesc
FROM part
WHERE Unitprice = (SELECT MAX(Unitprice) FROM part);

--------- 10 -----------

SELECT CONCAT(Custname, CHAR(10), Custstreet, CHAR(10), TRIM(Custcity), ', ', TRIM(Custprov), ' ', Custpcode )
FROM customer
WHERE Custno NOT IN (SELECT Custno FROM orders);

--------- 11 -----------

SELECT Partno, Partdesc, Unitprice
FROM part
WHERE Partdesc LIKE 'A%'
OR Partdesc LIKE 'C%'
OR Partdesc LIKE 'S%';

--------- 12 -----------
--ask about this one --- is it right ??

SELECT p.Partno, Partdesc, Unitprice, o.orderno, orderdate
FROM part p LEFT OUTER JOIN (orders o, orderprod op)
ON Partdesc LIKE 'A%'
OR Partdesc LIKE 'C%'
OR Partdesc LIKE 'S%'
AND p.Partno = op.Partno
AND op.orderno = o.Orderno;

--------- 13 -----------

SELECT Srepname, Custname
FROM salesrep s, customer c
WHERE s.srepno = c.srepno
AND Custname LIKE 'Eric';

--------- 14 -----------

SELECT o.Orderno, sum(Orderqty * Orderprice) AS total
FROM orders o, customer c, orderprod
WHERE o.custno = c.custno
AND custcity = 'Brampton'
GROUP BY o.orderno;

--------- 15 -----------

SELECT Partclass, min(unitprice) as cheapestPrice
FROM part
GROUP BY Partclass;

--------- 16 -----------
--ask about this one --- is it right ??

SELECT c.custno, custname, Custstreet, Custcity, Custprov, Custpcode, op.orderprice
FROM customer c, orders o, orderprod op, part p
WHERE custcity = 'Brampton'
AND c.Custno = o.custno
AND o.orderno = op.orderno
AND op.partno = p.partno
AND op.orderprice >= 500;

SELECT c.custno, custname, Custstreet, Custcity, Custprov, Custpcode, sum(Orderqty * Orderprice) AS total
FROM customer c, orders o, orderprod op, part p
WHERE custcity = 'Brampton'
AND c.Custno = o.custno
AND o.orderno = op.orderno
AND op.partno = p.partno
HAVING total >= 500;


