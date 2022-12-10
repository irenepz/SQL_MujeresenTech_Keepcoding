-- Primero creamos el esquema

create schema irene_pozoparejo authorization aztltpbe;

-------- COMENZAMOS CREANDO LAS TABLAS --------

-- CORPORATE_GROUP

create table irene_pozoparejo.corporate_groups(
	idGroup varchar(10) not null, -- PK 
	corporateGroup varchar(50) not null
);

alter table irene_pozoparejo.corporate_groups
add constraint corporate_groups_PK primary key (idGroup);

-- BRANDS

create table irene_pozoparejo.brands(
	idBrand varchar(10) not null, -- PK 
	idGroup varchar(10) not null, -- FK -> corporate_groups -> idGroup
	brand varchar(50) not null
);

alter table irene_pozoparejo.brands
add constraint brands_PK primary key (idBrand);

alter table irene_pozoparejo.brands
add constraint brands_idGroup_FK foreign key (idGroup)
references irene_pozoparejo.corporate_groups(idGroup);

-- MODELS

create table irene_pozoparejo.models(
	idModel varchar(10) not null, -- PK 
	idBrand varchar(10) not null, -- FK -> brands -> idBrand
	model varchar(50) not null
);

alter table irene_pozoparejo.models
add constraint models_PK primary key (idModel);

alter table irene_pozoparejo.models
add constraint models_idBrand_FK foreign key (idBrand)
references irene_pozoparejo.brands(idBrand);

-- INSURANCES

create table irene_pozoparejo.insurances(
	idInsurance varchar(10) not null, -- PK 
	insuranceCompany varchar(50) not null
);

alter table irene_pozoparejo.insurances
add constraint insurances_PK primary key (idInsurance);

-- CURRENCY

create table irene_pozoparejo.currency(
	idCurrency varchar(10) not null, -- PK 
	currency varchar(50) not null
);

alter table irene_pozoparejo.currency
add constraint currency_PK primary key (idCurrency);

-- COLOURS

create table irene_pozoparejo.colours(
	idColour varchar(10) not null, -- PK 
	colour varchar(30) not null
);

alter table irene_pozoparejo.colours
add constraint colours_PK primary key (idColour);

-- CARS

create table irene_pozoparejo.cars(
	idCar varchar(10) not null, -- PK
	idModel varchar(10) not null, -- FK -> models -> idModel
	dt_purchase date not null, 
	enrolment varchar(20) not null,
	idColour varchar(20) not null, -- FK -> colours -> idColour
	nKm integer not null,
	description varchar(512) null
);

alter table irene_pozoparejo.cars
add constraint cars_PK primary key (idCar);

alter table irene_pozoparejo.cars
add constraint cars_idModel_FK foreign key (idModel)
references irene_pozoparejo.models(idModel);

alter table irene_pozoparejo.cars
add constraint cars_idColour_FK foreign key (idColour)
references irene_pozoparejo.colours(idColour);

-- HIST_INSURANCE

create table irene_pozoparejo.hist_insurance(
	idCar varchar(10) not null, -- PK, FK -> cars -> idCar
	dt_start date not null, -- PK 
	idInsurance varchar(10) not null, -- FK -> insurances -> idInsurance
	policy_insurance varchar(20) not null,
	description varchar(512) null
);

alter table irene_pozoparejo.hist_insurance
add constraint hist_insurance_PK primary key (idCar, dt_start);

alter table irene_pozoparejo.hist_insurance
add constraint hist_insurance_idCar_FK foreign key (idCar)
references irene_pozoparejo.cars(idCar);

alter table irene_pozoparejo.hist_insurance
add constraint hist_insurance_idInsurance_FK foreign key (idInsurance)
references irene_pozoparejo.insurances(idInsurance);

-- HIST_REVISION

create table irene_pozoparejo.hist_revision(
	idCar varchar(10) not null, -- PK, FK -> cars -> idCar
	dt_revision date not null, -- PK 
	kmRevision integer not null,
	priceRevision integer not null,
	idCurrency varchar(10) not null, -- FK -> currency -> idCurrency
	description varchar(512) null
);

alter table irene_pozoparejo.hist_revision
add constraint hist_revision_PK primary key (idCar, dt_revision);

alter table irene_pozoparejo.hist_revision
add constraint hist_revision_idCar_FK foreign key (idCar)
references irene_pozoparejo.cars(idCar);

alter table irene_pozoparejo.hist_revision
add constraint hist_revision_idCurrency_FK foreign key (idCurrency)
references irene_pozoparejo.currency(idCurrency);

-------------- DML ---------------

-- A continuación introducimos los datos, se irán introduciendo con el mismo orden anterior

-- CORPORATE_GROUP

insert into irene_pozoparejo.corporate_groups (idGroup, corporateGroup) values('001','STK');
insert into irene_pozoparejo.corporate_groups (idGroup, corporateGroup) values('002','TGN');
insert into irene_pozoparejo.corporate_groups (idGroup, corporateGroup) values('003','DRN');
insert into irene_pozoparejo.corporate_groups (idGroup, corporateGroup) values('004','LNS');

-- BRANDS

insert into irene_pozoparejo.brands (idBrand, idGroup, brand) values('001','002','SEAT');
insert into irene_pozoparejo.brands (idBrand, idGroup, brand) values('002','001','OPEL');
insert into irene_pozoparejo.brands (idBrand, idGroup, brand) values('003','001','AUDI');
insert into irene_pozoparejo.brands (idBrand, idGroup, brand) values('004','003','RENAULT');
insert into irene_pozoparejo.brands (idBrand, idGroup, brand) values('005','004','BMW');
insert into irene_pozoparejo.brands (idBrand, idGroup, brand) values('006','002','NISSAN');
insert into irene_pozoparejo.brands (idBrand, idGroup, brand) values('007','003','TESLA');
insert into irene_pozoparejo.brands (idBrand, idGroup, brand) values('008','004','KIA');

-- MODELS

insert into irene_pozoparejo.models (idModel, idBrand, model) values('001','004','CLIO');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('002','001','LEÓN');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('003','003','A3');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('004','002','CORSA');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('005','004','MEGANE');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('006','002','ASTRA');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('007','007','MODEL 3');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('008','005','i7');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('009','006','MICRA');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('010','001','IBIZA');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('011','008','SPORTAGE');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('012','003','A4');
insert into irene_pozoparejo.models (idModel, idBrand, model) values('013','008','PICANTO');


-- INSURANCES

insert into irene_pozoparejo.insurances (idInsurance, insuranceCompany) values('001','MAPFRE');
insert into irene_pozoparejo.insurances (idInsurance, insuranceCompany) values('002','PELAYO');
insert into irene_pozoparejo.insurances (idInsurance, insuranceCompany) values('003','ALLIANZ');

-- CURRENCY

insert into irene_pozoparejo.currency (idCurrency, currency) values('001','EUR');
insert into irene_pozoparejo.currency (idCurrency, currency) values('002','USD');
insert into irene_pozoparejo.currency (idCurrency, currency) values('003','GBP');

-- COLOURS 

insert into irene_pozoparejo.colours (idColour, colour) values('001','GREEN');
insert into irene_pozoparejo.colours (idColour, colour) values('002','WHITE');
insert into irene_pozoparejo.colours (idColour, colour) values('003','BLACK');
insert into irene_pozoparejo.colours (idColour, colour) values('004','BLUE');

-- CARS

insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0001','012','2020-11-06','1256 HVS','001',9750,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0002','009','2015-06-14','7693 LFA','003',28500,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0003','001','2019-08-03','1385 GFA','004',15000,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0004','006','2015-06-14','8439 OFM','003',32451,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0005','013','2021-07-27','2368 PDL','001',8512,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0006','002','2019-05-23','7318 EDV','002',17625,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0007','008','2017-02-28','4268 TEA','003',21541,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0008','007','2022-01-28','3954 WAD','004',5455,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0009','005','2019-08-03','2394 VLD','003',15368,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0010','010','2021-09-30','7236 LQV','001',7542,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0011','008','2019-05-23','1283 DMW','002',13500,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0012','011','2015-06-14','3539 OAV','003',27642,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0013','001','2017-02-28','9234 VLA','004',23420,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0014','003','2022-01-28','4038 XWZ','003',4320,' ');
insert into irene_pozoparejo.cars (idCar, idModel, dt_purchase, enrolment, idColour, nKm, description) values('0015','004','2015-06-14','6348 NBY','002',35165,' ');

-- HIST_INSURANCE

insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0001','2020-11-10','001','3138846-AL',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0002','2015-06-14','003','3049406-IN',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0003','2019-08-07','002','8103970-JC',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0004','2015-06-15','002','7039409-MC',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0005','2021-07-27','001','2340394-JX',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0006','2019-05-25','003','3680439-PH',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0007','2017-03-01','003','7304394-HI',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0008','2022-01-29','002','9042843-TN',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0009','2019-08-03','001','4362038-OC',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0010','2021-09-30','003','5368061-KN ',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0011','2019-05-23','002','6108349-RL',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0012','2015-06-14','001','1687681-ZU',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0013','2017-02-28','001','2039713-YN',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0014','2022-01-28','003','5106972-AT',' ');
insert into irene_pozoparejo.hist_insurance (idCar, dt_start, idInsurance, policy_insurance, description) values('0015','2015-06-14','002','7126943-WX',' ');

-- HIST_REVISION

insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0001','2022-01-23',9050,50,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0002','2018-05-14',18450,30,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0002','2018-05-18',20103,35,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0002','2020-05-27',23250,30,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0002','2022-05-31',26000,30,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0003','2020-08-13',11493,25,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0003','2022-08-14',13625,25,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0004','2016-03-27',23982,30,'003',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0004','2018-03-15',26154,30,'003',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0004','2020-03-07',28726,30,'003',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0004','2022-03-13',31246,30,'003',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0005','2022-01-24',7862,50,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0006','2020-07-16',13524,25,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0006','2022-07-17',16240,25,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0007','2018-05-20',17012,30,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0007','2020-05-22',18965,30,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0007','2022-05-21',20845,30,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0008','2022-11-23',5000,45,'003',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0009','2020-04-23',12732,45,'003',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0009','2022-04-24',14258,50,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0010','2022-04-20',6542,45,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0011','2020-07-18',10054,45,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0011','2022-07-18',12560,25,'003',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0012','2016-09-02',20301,30,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0012','2018-09-26',22489,30,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0012','2020-09-05',25614,35,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0012','2022-09-03',26984,30,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0013','2018-01-10',15942,45,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0013','2020-01-09',17890,45,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0013','2022-01-08',20050,45,'002',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0014','2022-11-28',4003,50,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0015','2016-02-17',25684,30,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0015','2018-02-20',27402,30,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0015','2020-02-26',29948,30,'001',' ');
insert into irene_pozoparejo.hist_revision (idCar, dt_revision, kmRevision, priceRevision, idCurrency, description) values('0015','2022-02-24',31536,30,'001',' ');


