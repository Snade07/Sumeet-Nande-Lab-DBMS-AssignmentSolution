create table if not exists `supplier`(
`SUP_ID` int primary key,
`SUPP_NAME` varchar(50) NOT NULL,
`SUPP_CITY` varchar(50) NOT NULL,
`SUPP_PHONE` varchar(10)
) ;
create table if not exists `customer`(
`CUS_ID` int primary key,
`CUS_NAME` varchar(50) NOT NULL,
`CUS_PHONE` varchar(10) NOT NULL,
`CUS_CITY` varchar(50) NOT NULL,
`CUS_GENDER` CHAR);

create table if not exists `category`(
`CAT_ID` int primary key,
`CAT_NAME` varchar(50) NOT NULL
);

create table if not exists `product`(
`PRO_ID` int not null primary key,
`PRO_NAME` VARCHAR(20) NOT NULL DEFAULT "DUMMY PRODUCT",
`PRO_DESC` VARCHAR(60),
`CAT_ID` int not null,
FOREIGN KEY (`CAT_ID`) REFERENCES category(`CAT_ID`)
);

create table if not exists `supplier_pricing`(
`PRICING_ID` INT NOT NULL primary key,
`PRO_ID` int not null,
`SUP_ID` int not null,
`SUPP_PRICE` int NOT NULL default "0",
foreign key (`PRO_ID`) references product(`PRO_ID`),
foreign key (`SUP_ID`) references supplier(`SUP_ID`)
);

create table if not exists `order`(
 `ORD_ID` INT NOT NULL PRIMARY KEY,
 `ORD_AMOUNT` INT NOT NULL,
 `ORD_DATE` DATE,
 `CUS_ID` INT NOT NULL,
 `PRICING_ID` INT NOT NULL,
 FOREIGN KEY (`CUS_ID`) REFERENCES customer(`CUS_ID`),
 FOREIGN KEY (`PRICING_ID`) REFERENCES supplier_pricing(`PRICING_ID`)
 );
CREATE TABLE IF NOT EXISTS `rating` (
 `RAT_ID` INT NOT NULL PRIMARY KEY,
 `ORD_ID` INT NOT NULL,
 `RAT_RATSTARS` INT NOT NULL,
 FOREIGN KEY (`ORD_ID`) REFERENCES  `order`(`ORD_ID`)
 );
 
