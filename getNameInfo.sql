-- Student Name: Hamzah Shafeeq
-- Procedure assignment
CREATE OR REPLACE PROCEDURE getInfo
(v_cname IN customer.cname%TYPE,
 v_sum OUT NUMBER,
 v_count OUT NUMBER)
 
AS
BEGIN
	SELECT sum(totalprice), count(cname)		
	INTO v_sum, v_count
	FROM saleinv
	where cname = v_cname;
END;
/


