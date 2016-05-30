--  Hamzah Shafeeq
--	DBAS32100
--	INSERTINTO TABLE ASSIGNMENT
--	INSERT_HAMZAH-SHAFEEQ.sql



-- Options
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('CD2', 'CD PLAYER'             , 110.00, 195.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('ED3', 'ELECTRONIC INSTRUMENTS', 423.00, 557.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('M24', 'TAPE DECK'             , 210.00, 285.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('R41', 'RECLINING BUCKET SEATS', 305.00, 420.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('S22', 'TINTED SUN ROOF'       , 333.00, 386.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('S20', 'SKI RACK'              , 212.00, 285.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('U20', 'BLACK UPHOLSTRY'       ,  88.00, 106.48);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('M14', 'STEREO RADIO'          , 292.00, 350.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('E01', 'EXTENDED WARRANTY'     , 270.50, 345.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('L07', 'LIGHTING GROUP'        ,  95.25, 109.60);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('R14', 'STEREO RADIO'          , 210.00, 295.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('S23', 'SUN ROOF'              , 300.00, 355.50);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('S88', 'SUN ROOF'              , 430.40, 490.99);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('S54', 'MOON ROOF'             , 310.00, 375.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('W11', 'ALUMINUM WHEELS'       , 500.00, 664.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('SD1', 'DELUXE SOUND SYSTEM'   , 310.00, 488.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('H35', 'HOOD ORNAMENT'         ,  98.50, 145.00);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('L01', 'LIGHTNING STRIPE'      ,  72.20,  95.44);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('R96', 'RADIO W/SURROUND SOUND', 160.00, 190.89);
INSERT INTO options (ocode, odesc                   ,  ocost,  olist)
             VALUES ('R00', 'TINY RADIO W/1 SPEAKER',  67.10,  84.22);
			 
-- Customer
INSERT INTO customer (cname, caddress, ccity, cstate, czip, chphone, cbphone)
			VALUES ('HAMZAH', '123MAIN ST', 'MILTON', 'ON', 'M1R 2I4', '6470004444', '6471112222');
INSERT INTO customer (cname, caddress, ccity, cstate, czip, chphone, cbphone)
			VALUES ('SABAH', '123MISSISSAUGA RD', 'MISSISSAUGA', 'ON', 'L9T 5F6', '9055556666', '9050008888');
-- Car
INSERT INTO car (serial, cname, make, model, cyear, color, trim, enginetype, purchinv, purchdate, purchfrom, purchcost, freightcost, totalcost, listprice)
			VALUES('J16R5251', 'HAMZAH', 'JAGUAR', '525', '2016', 'RED', '525I', '6C', '123456', to_date('2016-01-01', 'YYYY-MM-DD'), 'JAGUAR', 65000.00, 2500.00, 67000.50, 75000.00);
INSERT INTO car (serial, cname, make, model, cyear, color, trim, enginetype, purchinv, purchdate, purchfrom, purchcost, freightcost, totalcost, listprice)
			VALUES('L15B5352', 'SABAH', 'Land Rover', '535', '2015', 'BLUE', '535IL', '8C', '654321', to_date('2015-02-02', 'YYYY-MM-DD'), 'LAND Rover', 55000.00, 2500.00, 57000.50, 65000.00);	

-- BaseOption
INSERT INTO baseoption (serial, ocode)
			VALUES ('J16R5251', 'R00');
			
-- SaleInv
INSERT INTO saleinv (saleinv, cname, salesman, saledate, serial, totalprice, discount, net, tax, licfee, commission, tradeserial, tradeallow, fire, collision, liability, property)
			VALUES ('HS111', 'HAMZAH', 'ALHAID', to_date('2015-12-25', 'YYYY-MM-DD'), 'J16R5251', 67000.50, 1000.00, 8000.00, 2000.00, 250.00, 450.00, null, 12000.00, 'Y', 'Y', 'Y', 'Y');

-- InvOption
INSERT INTO invoption (saleinv, ocode, saleprice)
			VALUES ('HS111', 'R00', 67000.50);
			
-- Prospect
INSERT INTO prospect (cname, make, model, cyear, color, trim, ocode)
			VALUES ('HAMZAH', 'JAGUAR', '525', '2016', 'RED', '525I', 'R00');
INSERT INTO prospect (cname, make, model, cyear, color, trim, ocode)
			VALUES ('HAMZAH', 'LAND ROVER', '535', '2015', 'BLUE', '535IL', 'R00');
	 

-- ServInv
INSERT INTO servinv (servinv, serdate, cname, serial, partscost, laborcost, tax, totalcost)
			VALUES ('00001', to_date('2016-05-06', 'YYYY-MM-DD'), 'HAMZAH', 'J16R5251', 800.00, 500.00, 150.00, 1450.00);
INSERT INTO servinv (servinv, serdate, cname, serial, partscost, laborcost, tax, totalcost)
			VALUES ('00002', to_date('2016-12-09', 'YYYY-MM-DD'), 'HAMZAH', 'J16R5251', 200.00, 100.00, 80.00, 380.00);
INSERT INTO servinv (servinv, serdate, cname, serial, partscost, laborcost, tax, totalcost)
			VALUES ('00003', to_date('2016-08-11', 'YYYY-MM-DD'), 'SABAH', 'L15B5352', 900.00, 400.00, 150.00, 1450.00);


-- ServWork
INSERT INTO servwork (servinv, workdesc)
			VALUES ('00001', 'BREAKS');

			 

COMMIT;

