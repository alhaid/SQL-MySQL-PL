
-- 1
SELECT * FROM S2.customer;
SELECT * FROM S2.car;
SELECT * FROM S2.saleinv;
SELECT * FROM S2.invoption;
SELECT * FROM S2.servwork;
SELECT * FROM S2.options;
SELECT * FROM S2.baseoption;
SELECT * FROM S2.servinv;
SELECT * FROM S2.prospect;

--2
SELECT COUNT(*)
FROM s2.saleinv
WHERE fire = 'Y'
OR collision = 'Y'
OR liability = 'Y'
OR property = 'Y';

--3
SELECT DISTINCT c.cname, cstreet, ccity, cprov, cpostal, chphone, cbphone
FROM s2.customer c, s2.prospect p
WHERE c.cname = p.cname
AND UPPER(make) = 'JAGUAR'
AND UPPER(color) = 'BLUE';

--4
SELECT DISTINCT c.cname, chphone, cbphone
FROM s2.customer c, s2.saleinv s, s2.car r
WHERE c.cname = s.cname
AND s.serial = r.serial
AND UPPER(make) = 'JAGUAR'
AND UPPER(model) = 'XJR'
AND cbphone IS NULL
ORDER BY c.cname;

--5
SELECT AVG(s.totalcost)
FROM s2.servinv s, s2.car c
WHERE s.serial = c.serial
AND UPPER(make) = 'MERCEDES'
AND cyear = '2009';

--6
SELECT DISTINCT c.cname, chphone
FROM s2.customer c, s2.saleinv sl
WHERE c.cname = sl.cname
AND sl.serial NOT IN (SELECT DISTINCT serial FROM s2.servinv); 

--7
SELECT cname || CHR(10) || cstreet || CHR(10) || TRIM(ccity) ||
       ', ' || TRIM(cprov) || ' ' || cpostal AS "Big Spenders"
FROM s2.customer c, s2.saleinv sa
WHERE c.cname = sa.cname
AND sa.totalprice = (SELECT MAX(totalprice) FROM s2.saleinv);

--8
SELECT c.make, COUNT(s.servinv) AS total, AVG(s.totalcost) AS average
FROM s2.servinv s, s2.car c, s2.saleinv sa
WHERE c.serial = sa.serial
AND sa.serial = s.serial 
AND UPPER(c.make) IN ('LAND ROVER', 'MERCEDES', 'JAGUAR')
AND sa.saledate BETWEEN to_date('2009-02-01', 'YYYY-MM-DD') AND to_date('2012-01-01', 'YYYY-MM-DD')
GROUP BY make;

--9
SELECT salesman, COUNT(salesman)
FROM s2.saleinv
GROUP BY salesman
HAVING  COUNT(salesman) < 3;

--10
SELECT s.cname, o.odesc
FROM s2.saleinv s, s2.baseoption b, s2.options o
WHERE s.serial = b.serial
AND b.ocode = o.ocode
AND upper(o.odesc) LIKE '%SUN ROOF%'
UNION
SELECT s.cname, o.odesc
FROM s2.saleinv s, s2.invoption i, s2.options o
WHERE s.saleinv = i.saleinv
AND i.ocode = o.ocode
AND upper(o.odesc) LIKE '%SUN ROOF%';

--11
SELECT c.serial, c.make, c.model, o.ocode, o.odesc, o.olist
FROM s2.car c, s2.baseoption b, s2.options o
WHERE c.cyear = '2012'
AND c.cname IS NULL
AND c.serial = b.serial
AND b.ocode = o.ocode(+);


--12
SELECT DISTINCT c.cname, c.ccity, SUM(saleprice)
FROM s2.customer c, s2.saleinv s, s2.invoption i
WHERE UPPER(c.ccity) = 'BRAMPTON'
AND c.cname = s.cname
AND s.saleinv = i.saleinv
GROUP BY c.cname, c.ccity
HAVING SUM(saleprice) >= 1000;

--13
SELECT DISTINCT c.cname, c.cstreet, c.ccity, c.cprov, c.cpostal, c.chphone, p.make, p.model, p.cyear, p.color
FROM s2.customer c, s2.prospect p, s2.car ca
WHERE c.cname = p.cname
AND ca.cname IS NULL
AND p.make = ca.make
AND p.model = ca.model
AND p.cyear = ca.cyear
AND p.color = ca.color;



















