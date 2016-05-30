-- Hamzah Shafeeq
-- Bonus assignment




-------CREATE TABLES--------

DROP TABLE Options;
DROP TABLE Customer;
DROP TABLE PurchInvoice;
DROP TABLE Car;
DROP TABLE SalesmanCust;
DROP TABLE ServWorkOrd;
DROP TABLE ServDesc;
DROP TABLE SalesInvoice;
DROP TABLE InvOption;
DROP TABLE InvTrade;
DROP TABLE CarOption;
DROP TABLE Prospect;


CREATE TABLE Options
(OptionCode CHAR(2) NOT NULL,
 OptionDesc VARCHAR(60),
 OptionListPrice DECIMAL(6,2),
 OptionCost DECIMAL(6,2),
 CONSTRAINT pkOptions PRIMARY KEY(OptionCode)
);

CREATE TABLE Customer
(CustName VARCHAR(20) NOT NULL,
 CustAddress VARCHAR(20),
 CustCity VARCHAR(20),
 CustProvince VARCHAR(20),
 CustPostal VARCHAR(20),
 CustHomePhone VARCHAR(20),
 CustWorkPhone VARCHAR(20),
 CONSTRAINT pkcustomer PRIMARY KEY(CustName)
);

CREATE TABLE PurchInvoice
(PurchInvNo CHAR(2) NOT NULL,
 PurchasedFrom VARCHAR(20),
 PurchDate DATE,
 CONSTRAINT pkPurchInvoice PRIMARY KEY(PurchInvNo)
);

CREATE TABLE Car
(CarSerial CHAR(2) NOT NULL,
 CarMake VARCHAR(20),
 CarModel VARCHAR(20),
 CarYear VARCHAR(20),
 CarExtColour VARCHAR(20),
 CarTrim VARCHAR(20),
 CarEngine VARCHAR(20),
 BaseListPrice DECIMAL(6,2),
 PurchInvNo CHAR(2),
 PurchCost DECIMAL(6,2),
 CONSTRAINT fkcar FOREIGN KEY(PurchInvNo) REFERENCES PurchInvoice(PurchInvNo),
 CONSTRAINT pkcar PRIMARY KEY(CarSerial)
);

CREATE TABLE SalesmanCust 
(Salesman VARCHAR(20) NOT NULL,
 CustName VARCHAR(20),
 CONSTRAINT pksalesmanCust PRIMARY KEY (Salesman, CustName),
 CONSTRAINT fksalesmanCust FOREIGN KEY (CustName) REFERENCES Customer (CustName) 
);

CREATE TABLE ServWorkOrd
(WorkOrderNo CHAR(2) NOT NULL,
 WorkOrderDate DATE,
 CustName VARCHAR(20),
 CarSerial CHAR(2),
 PartPrice DECIMAL(6,2),
 LabourPrice DECIMAL(6,2),
 Tax DECIMAL(6,2),
 CONSTRAINT fk1servWorkOrd FOREIGN KEY(CustName) REFERENCES Customer(CustName),
 CONSTRAINT fk2servWorkOrd FOREIGN KEY(CarSerial) REFERENCES Car(CarSerial),
 CONSTRAINT pkservWorkOrd PRIMARY KEY(WorkOrderNo)
);

CREATE TABLE ServDesc
(WorkOrderNo CHAR(2),
 WorkDesc VARCHAR(60),
 CONSTRAINT fkservWorkOrd FOREIGN KEY(WorkOrderNo) REFERENCES ServWorkOrd(WorkOrderNo),
 CONSTRAINT pkServDesc PRIMARY KEY(WorkOrderNo, WorkDesc)
);

CREATE TABLE SalesInvoice
(InvNo CHAR(2) NOT NULL,
 CustName VARCHAR(20),
 CarSerial CHAR(2),
 InvDate DATE,
 Salesman VARCHAR(20),
 InsFire VARCHAR(60),
 InsCollision VARCHAR(60),
 InsLiab VARCHAR(60),
 InsDamage VARCHAR(60),
 Taxes DECIMAL(6,2),
 FreightPrepCost DECIMAL(6,2),
 LicFee DECIMAL(6,2),
 OtherFeeCost DECIMAL(6,2),
 OtherFeePrice DECIMAL(6,2),
 Commission DECIMAL(6,2),
 CONSTRAINT fk1SalesInvoice FOREIGN KEY(CustName) REFERENCES Customer(CustName),
 CONSTRAINT fk2SalesInvoice FOREIGN KEY(CarSerial) REFERENCES Car(CarSerial),
 CONSTRAINT pkSalesInvoice PRIMARY KEY(InvNo)
);

CREATE TABLE InvOption
(InvNo CHAR(2),
 OptionCode CHAR(2),
 OptionsPrice DECIMAL(6,2),
 CONSTRAINT fk1InvOption FOREIGN KEY(InvNo) REFERENCES SalesInvoice(InvNo),
 CONSTRAINT fk2InvOption FOREIGN KEY(OptionCode) REFERENCES Options(OptionCode),
 CONSTRAINT pkInvOption PRIMARY KEY(InvNo, OptionCode)
);

CREATE TABLE InvTrade
(InvNo CHAR(2),
 CarSerial CHAR(2),
 TradeAllow DECIMAL(6,2),
 CONSTRAINT fk1InvTrade FOREIGN KEY(InvNo) REFERENCES SalesInvoice(InvNo),
 CONSTRAINT fk2InvTrade FOREIGN KEY(CarSerial) REFERENCES Car(CarSerial),
 CONSTRAINT pkInvTrade PRIMARY KEY(InvNo, CarSerial)
);

CREATE TABLE CarOption
(CarSerial CHAR(2),
 OptionCode CHAR(2),
 CONSTRAINT fk1CarOption FOREIGN KEY(OptionCode) REFERENCES Options(OptionCode),
 CONSTRAINT fk2CarOption FOREIGN KEY(CarSerial) REFERENCES Car(CarSerial),
 CONSTRAINT pkCarOption PRIMARY KEY(OptionCode, CarSerial)
);

CREATE TABLE Prospect
(CustName VARCHAR(20),
 CarMake VARCHAR(20),
 CarModel VARCHAR(20),
 CarYear VARCHAR(20),
 CarExtColour VARCHAR(20),
 CarTrim VARCHAR(20),
 OptionCode CHAR(2),
 CONSTRAINT fk1Prospect FOREIGN KEY(CustName) REFERENCES Customer(CustName),
 CONSTRAINT fk2Prospect FOREIGN KEY(OptionCode) REFERENCES Options(OptionCode),
 CONSTRAINT pkProspect PRIMARY KEY(CustName, CarMake, CarModel, CarYear, CarExtColour, CarTrim, OptionCode)
);


-------------AFIGN INDEXES -----------------

--CREATE INDEX fk + TABLE-NAME + FIELD-NAME ON TABLE-NAME(FIELD-NAME);

CREATE INDEX fkCarPurchInvNo ON Car(PurchInvNo);
CREATE INDEX fkSalesmanCustCustName ON SalesmanCust(CustName);
CREATE INDEX fkServWorkOrdCustName ON ServWorkOrd(CustName);
CREATE INDEX fkServWorkOrdCarSerial ON ServWorkOrd(CarSerial);
CREATE INDEX fkServDescWorkOrderNo ON ServDesc(WorkOrderNo);
CREATE INDEX fkSalesInvoiceCustName ON SalesInvoice(CustName);
CREATE INDEX fkSalesInvoiceCarSerial ON SalesInvoice(CarSerial);
CREATE INDEX fkInvOptionInvNo ON InvOption(InvNo);
CREATE INDEX fkInvOptionOptionCode ON InvOption(OptionCode);
CREATE INDEX fkInvTradeInvNo ON InvTrade(InvNo);
CREATE INDEX fkInvTradeCarSerial ON InvTrade(CarSerial);
CREATE INDEX fkCarOptionOptionCode ON CarOption(OptionCode);
CREATE INDEX fkCarOptionCarSerial ON CarOption(CarSerial);
CREATE INDEX fkProspectCustName ON Prospect(CustName);
CREATE INDEX fkProspectOptionCode ON Prospect(OptionCode);

-------------INSERT INTO TABLES ----------------

START TRANSACTION;

INSERT INTO Options(OptionCode, OptionDesc, OptionListPrice, OptionCost) 
VALUES ('01', 'opt1', 8.00, 5.00);
INSERT INTO Options(OptionCode, OptionDesc, OptionListPrice, OptionCost) 
VALUES ('02', 'opt2', 6.00, 3.00);
INSERT INTO Options(OptionCode, OptionDesc, OptionListPrice, OptionCost) 
VALUES ('03', 'opt3', 9.00, 7.00);


INSERT INTO Customer(CustName, CustAddress, CustCity, CustProvince, CustPostal, CustHomePhone, CustWorkPhone) 
VALUES ('customer1', '1 main St.', 'Milton', 'ON', 'L1T1W1', '905-111-1111', '647-111-1111');
INSERT INTO Customer(CustName, CustAddress, CustCity, CustProvince, CustPostal, CustHomePhone, CustWorkPhone) 
VALUES ('customer2', '2 main St.', 'Brampton', 'ON', 'L2T2W2', '905-222-222', '647-222-2222');
INSERT INTO Customer(CustName, CustAddress, CustCity, CustProvince, CustPostal, CustHomePhone, CustWorkPhone) 
VALUES ('customer3', '3 main St.', 'Mississauga', 'ON', 'L3T3W3', '905-333-3333', '647-333-3333');


INSERT INTO PurchInvoice(PurchInvNo, PurchasedFrom, PurchDate) 
VALUES ('01', 'store#1', 2001-01-01);
INSERT INTO PurchInvoice(PurchInvNo, PurchasedFrom, PurchDate) 
VALUES ('02', 'store#2', 2002-02-02);
INSERT INTO PurchInvoice(PurchInvNo, PurchasedFrom, PurchDate) 
VALUES ('03', 'store#3', 2003-03-03);


INSERT INTO Car(CarSerial, CarMake, CarModel, CarYear, CarExtColour, CarTrim, CarEngine, BaseListPrice, PurchInvNo, PurchCost) 
VALUES ('01', 'BMW', 'X3', '2011', 'Black', 'AWD 4dr xDrive28i', '4C', 50.00, '01', 40.00);
INSERT INTO Car(CarSerial, CarMake, CarModel, CarYear, CarExtColour, CarTrim, CarEngine, BaseListPrice, PurchInvNo, PurchCost) 
VALUES ('02', 'BMW', 'X5', '2012', 'White', 'AWD 4dr xDrive28d', '6C', 60.00, '02', 50.00);
INSERT INTO Car(CarSerial, CarMake, CarModel, CarYear, CarExtColour, CarTrim, CarEngine, BaseListPrice, PurchInvNo, PurchCost) 
VALUES ('03', 'BMW', 'X6', '2013', 'Red', 'AWD 4dr xDrive35i', '8C', 70.00, '03', 60.00);


INSERT INTO SalesmanCust(Salesman, CustName) 
VALUES ('Salesman1', 'customer1');
INSERT INTO SalesmanCust(Salesman, CustName) 
VALUES ('Salesman2', 'customer2');
INSERT INTO SalesmanCust(Salesman, CustName) 
VALUES ('Salesman3', 'customer3');


INSERT INTO ServWorkOrd(WorkOrderNo, WorkOrderDate, CustName, CarSerial, PartPrice, LabourPrice, Tax) 
VALUES ('01', 2001-01-01, 'customer1', '01', 201.00, 101.00, 13.00);
INSERT INTO ServWorkOrd(WorkOrderNo, WorkOrderDate, CustName, CarSerial, PartPrice, LabourPrice, Tax) 
VALUES ('02', 2002-02-02, 'customer2', '02', 301.00, 201.00, 23.00);
INSERT INTO ServWorkOrd(WorkOrderNo, WorkOrderDate, CustName, CarSerial, PartPrice, LabourPrice, Tax) 
VALUES ('03', 2003-03-03, 'customer3', '03', 401.00, 301.00, 33.00);


INSERT INTO ServDesc(WorkOrderNo, WorkDesc) 
VALUES ('01', 'work#1');
INSERT INTO ServDesc(WorkOrderNo, WorkDesc) 
VALUES ('02', 'work#2');
INSERT INTO ServDesc(WorkOrderNo, WorkDesc) 
VALUES ('03', 'work#3');


INSERT INTO SalesInvoice(InvNo, CustName, CarSerial, InvDate, Salesman, InsFire, InsCollision, InsLiab, InsDamage, Taxes, FreightPrepCost, LicFee, OtherFeeCost, OtherFeePrice, Commission) 
VALUES ('01', 'customer1', '01', 2001-01-01, 'Salesman1', 'insFire #1', 'InsCollision #1', 'InsLiab #1','InsDamage #1', 20.00, 2000.00, 300.00, 200.00, 100.00, 350.00);
INSERT INTO SalesInvoice(InvNo, CustName, CarSerial, InvDate, Salesman, InsFire, InsCollision, InsLiab, InsDamage, Taxes, FreightPrepCost, LicFee, OtherFeeCost, OtherFeePrice, Commission) 
VALUES ('02', 'customer2', '02', 2002-02-02, 'Salesman2', 'insFire #2', 'InsCollision #2', 'InsLiab #2','InsDamage #2', 30.00, 3000.00, 400.00, 300.00, 200.00, 450.00);
INSERT INTO SalesInvoice(InvNo, CustName, CarSerial, InvDate, Salesman, InsFire, InsCollision, InsLiab, InsDamage, Taxes, FreightPrepCost, LicFee, OtherFeeCost, OtherFeePrice, Commission) 
VALUES ('03', 'customer3', '03', 2003-03-03, 'Salesman3', 'insFire #3', 'InsCollision #3', 'InsLiab #3','InsDamage #3', 40.00, 4000.00, 400.00, 100.00, 200.00, 650.00);


INSERT INTO InvOption(InvNo, OptionCode, OptionsPrice) 
VALUES ('01', '01', 250.00);
INSERT INTO InvOption(InvNo, OptionCode, OptionsPrice) 
VALUES ('02', '02', 350.00);
INSERT INTO InvOption(InvNo, OptionCode, OptionsPrice) 
VALUES ('03', '03', 450.00);


INSERT INTO InvTrade(InvNo, CarSerial, TradeAllow) 
VALUES ('01', '01', 4500.00);
INSERT INTO InvTrade(InvNo, CarSerial, TradeAllow) 
VALUES ('02', '02', 5500.00);
INSERT INTO InvTrade(InvNo, CarSerial, TradeAllow) 
VALUES ('03', '03', 5500.00);


INSERT INTO CarOption(CarSerial, OptionCode) 
VALUES ('01', '01');
INSERT INTO CarOption(CarSerial, OptionCode) 
VALUES ('02', '02');
INSERT INTO CarOption(CarSerial, OptionCode) 
VALUES ('03', '03');


INSERT INTO Prospect(CustName, CarMake, CarModel, CarYear, CarExtColour, CarTrim, OptionCode) 
VALUES ('customer1', 'BMW', '300', '2011', 'Black', 'FWD 4dr Drive28i', '01');
INSERT INTO Prospect(CustName, CarMake, CarModel, CarYear, CarExtColour, CarTrim, OptionCode) 
VALUES ('customer2', 'BMW', '500', '2012', 'White', 'AWD 4dr Drive28i', '02');
INSERT INTO Prospect(CustName, CarMake, CarModel, CarYear, CarExtColour, CarTrim, OptionCode) 
VALUES ('customer3', 'BMW', '700', '2013', 'Red', 'AWD 4dr Drive35i', '03');

------------- VIEWS ----------------

CREATE OR REPLACE VIEW salesInvoiceView AS
SELECT *
FROM SalesInvoice;

CREATE OR REPLACE VIEW vehicleInventoryRecordView AS
SELECT DISTINCT opt.OptionCode, opt.OptionDesc, opt.OptionListPrice, opt.OptionCost, c.CarSerial, c.CarMake, c.CarModel, c.CarYear, c.CarExtColour, c.CarTrim, c.CarEngine, c.BaseListPrice, pi.PurchInvNo, c.PurchCost, pi.PurchasedFrom, pi.PurchDate
FROM car c, CarOption cp, options opt, PurchInvoice pi
WHERE opt.optionCode = cp.optionCode
AND cp.carSerial = c.carSerial
AND pi.purchInvNo = c.purchInvNo;

CREATE OR REPLACE VIEW AccSaSupServInvView AS
SELECT DISTINCT si.InvNo,  InvDate, si.CustName, Salesman, si.CarSerial, InsFire, InsCollision, InsLiab,  
InsDamage, Taxes, FreightPrepCost, LicFee, OtherFeeCost, OtherFeePrice,  Commission,
OptionCode, OptionsPrice, TradeAllow, swo.WorkOrderNo, WorkOrderDate, PartPrice, LabourPrice, Tax,
WorkDesc
FROM SalesInvoice si, InvOption io, InvTrade it, ServWorkOrd swo, ServDesc sd
WHERE si.invno = io.invno
AND io.invno = it.invno
AND si.CarSerial = swo.CarSerial
AND sd.workorderno = swo.workorderno;
--COMMIT;







