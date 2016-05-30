-- Hamzah Shafeeq
--	DBAS32100
--	CREATE TABLE ASSIGNMENT
--	crtable.sql




DROP TABLE employee;
DROP TABLE prospect;
DROP TABLE servwork;
DROP TABLE servinv;
DROP TABLE invoption;
DROP TABLE baseoption;
DROP TABLE saleinv;
DROP TABLE car;
DROP TABLE customer;
DROP TABLE options;






CREATE TABLE options
(ocode CHAR(4),
 odesc CHAR(30),
 ocost NUMBER(7,2),
 olist NUMBER(7,2),
 CONSTRAINT pkoptions PRIMARY KEY(ocode)
 );



CREATE TABLE customer
(cname CHAR(20),
 caddress CHAR(20),
 ccity CHAR(20),
 cstate CHAR(20),
 czip CHAR(10),
 chphone CHAR(13),
 cbphone CHAR(13),
 CONSTRAINT pkcustomer PRIMARY KEY(cname)
 );


CREATE TABLE car
(serial CHAR(8),
 cname CHAR(20),
 make CHAR(10) NOT NULL,
 model CHAR(8) NOT NULL,
 cyear CHAR(4) NOT NULL,
 color CHAR(12) NOT NULL,
 trim CHAR(16) NOT NULL,
 enginetype CHAR(10) NOT NULL,
 purchinv CHAR(6),
 purchdate DATE,
 purchfrom CHAR(12),
 purchcost NUMBER(9,2),
 freightcost NUMBER(7,2),
 totalcost NUMBER(9,2),
 listprice NUMBER(9,2),
 CONSTRAINT fkcar FOREIGN KEY(cname) REFERENCES customer(cname),
 CONSTRAINT pkcar PRIMARY KEY(serial)
 );
 
 
CREATE TABLE saleinv
(saleinv CHAR(6),
 cname CHAR(20) NOT NULL,
 salesman CHAR(20),
 saledate DATE NOT NULL
       CHECK (saledate > 
       TO_DATE('01-JAN-1990','DD-MON-YYYY')),
 serial CHAR(8) NOT NULL,
 totalprice NUMBER(9,2),
 discount NUMBER(8,2),
 net NUMBER(9,2),
 tax NUMBER(8,2),
 licfee NUMBER(6,2),
 commission NUMBER(8,2),
 tradeserial CHAR(8),
 tradeallow NUMBER(9,2),
 fire CHAR(1)
     CHECK (fire IN ('Y','N')),
 collision CHAR(1)
     CHECK (collision IN ('Y','N')),
 liability CHAR(1)
     CHECK (liability IN ('Y','N')),
 property CHAR(1)
     CHECK (property IN ('Y','N')),
 CONSTRAINT fksaleinv1 FOREIGN KEY(cname) REFERENCES customer(cname),
 CONSTRAINT fksaleinv2 FOREIGN KEY(serial) REFERENCES car(serial),
 CONSTRAINT fksaleinv3 FOREIGN KEY(tradeserial) REFERENCES car(serial),
 CONSTRAINT pksaleinv PRIMARY KEY(saleinv)	 
);
	 

	 

CREATE TABLE baseoption
(serial CHAR(8),
 ocode CHAR(4),
 CONSTRAINT fkbaseoption1 FOREIGN KEY(serial) REFERENCES car(serial),
 CONSTRAINT fkbaseoption2 FOREIGN KEY(ocode) REFERENCES options(ocode),
 CONSTRAINT pkbaseoption PRIMARY KEY(serial,ocode)
 );

CREATE TABLE invoption
(saleinv CHAR(6) NOT NULL,
 ocode CHAR(4) NOT NULL,
 saleprice NUMBER(7,2),
 CONSTRAINT fkinvoption1 FOREIGN KEY(saleinv) REFERENCES saleinv(saleinv),
 CONSTRAINT fkinvoption2 FOREIGN KEY(ocode) REFERENCES options(ocode),
 CONSTRAINT pkinvoption PRIMARY KEY(saleinv, ocode)
 );


CREATE TABLE servinv
(servinv CHAR(5),
 serdate DATE,
 cname CHAR(20) NOT NULL,
 serial CHAR(8) NOT NULL,
 partscost NUMBER(7,2),
 laborcost NUMBER(7,2),
 tax NUMBER(6,2),
 totalcost NUMBER(8,2),
 CONSTRAINT fkservinv1 FOREIGN KEY(cname) REFERENCES customer(cname),
 CONSTRAINT fkservinv2 FOREIGN KEY(serial) REFERENCES car(serial),
 CONSTRAINT pkservinv PRIMARY KEY(servinv)
 );




CREATE TABLE servwork
(servinv CHAR(5),
 workdesc CHAR(8),
 CONSTRAINT fkservwork FOREIGN KEY(servinv) REFERENCES servinv(servinv),
 CONSTRAINT pkservwork PRIMARY KEY (servinv,workdesc)
 );


CREATE TABLE prospect
(cname CHAR(20) NOT NULL,
 make CHAR(10) NOT NULL CHECK (make IN
   ('ACURA','MERCEDES','LAND ROVER','JAGUAR')),
 model CHAR(8),
 cyear CHAR(4),
 color CHAR(12),
 trim CHAR(16),
 ocode CHAR(4),
 CONSTRAINT fkprospect1 FOREIGN KEY(cname) REFERENCES customer(cname),
 CONSTRAINT fkprospect2 FOREIGN KEY(ocode) REFERENCES options(ocode),
 CONSTRAINT pkprospect PRIMARY KEY (cname,make,model,cyear,color,trim,ocode)
 );




CREATE TABLE employee
(empname CHAR(20),
 startdate DATE NOT NULL,
 manager CHAR(20),
 commissionrate NUMBER(2),
 title CHAR(26),
 CONSTRAINT fkemployee FOREIGN KEY(manager) REFERENCES employee(empname),
 CONSTRAINT pkemployee PRIMARY KEY(empname)
 );

