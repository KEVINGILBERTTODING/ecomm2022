-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2022 at 09:54 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `CustomerID` int(11) NOT NULL,
  `Address1` varchar(200) NOT NULL,
  `Address2` varchar(200) DEFAULT NULL,
  `State` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Zip` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `CustomerID` int(11) NOT NULL,
  `CardName` varchar(20) NOT NULL,
  `CardNum` varchar(16) NOT NULL,
  `CardComp` varchar(20) NOT NULL,
  `CardExp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `Userpass` varchar(30) NOT NULL,
  `HasMembership` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `Userpass`, `HasMembership`) VALUES
(251059, 'wordpass', 'N'),
(368192, 'password', 'N'),
(592134, 'secretive', 'Y');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `Insert_HasMembership_Y_Or_N` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
    IF NEW.HasMembership NOT IN ('Y', 'N')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'HasMembership must be Y or N';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_HasMembership_Y_Or_N` BEFORE UPDATE ON `customer` FOR EACH ROW BEGIN
    IF NEW.HasMembership NOT IN ('Y', 'N')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'HasMembership must be Y or N';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `DiscountID` int(11) NOT NULL,
  `DiscountPercent` decimal(2,2) DEFAULT NULL,
  `Valid` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`DiscountID`, `DiscountPercent`, `Valid`) VALUES
(5454, '0.05', 'N'),
(7878, '0.10', 'Y');

--
-- Triggers `discount`
--
DELIMITER $$
CREATE TRIGGER `Insert_Valid_Y_Or_N` BEFORE INSERT ON `discount` FOR EACH ROW BEGIN
    IF NEW.Valid NOT IN ('Y', 'N')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Valid must be Y or N';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Valid_Y_Or_N` BEFORE UPDATE ON `discount` FOR EACH ROW BEGIN
    IF NEW.Valid NOT IN ('Y', 'N')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Valid must be Y or N';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `EmployeeEmail` varchar(50) NOT NULL,
  `Supervisor` varchar(50) DEFAULT NULL,
  `Userpass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `EmployeeEmail`, `Supervisor`, `Userpass`) VALUES
(1, '1111@g.com', NULL, 'secure'),
(845523, 'num2@g.com', 'test@g.com', 'pass'),
(359803, 'some@g.com', NULL, 'pass'),
(432591, 'test@g.com', NULL, 'pass');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(9,2) NOT NULL,
  `ItemType` varchar(30) NOT NULL,
  `Seller` varchar(30) NOT NULL,
  `ItemDesc` varchar(200) DEFAULT NULL,
  `Category` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `Quantity`, `Price`, `ItemType`, `Seller`, `ItemDesc`, `Category`) VALUES
(1, 20, '50.00', 'Sweater', 'Adidas', 'A gray sweater that will keep you warm and stylish', 'Sweater'),
(2, 8, '80.00', 'Bayern Jersey', 'Adidas', 'A Bayern Munich home jersey from 2017-2018 season', 'Sports'),
(3, 5, '120.00', 'Soccer Cleets', 'Nike', 'Black and gold soccer cleets that are durable', 'Sports'),
(4, 30, '30.00', 'Jeans', 'Calvin Klein', 'Awesome light blue jeans from an awesome company', 'Pants'),
(5, 20, '40.00', 'Shirt', 'Nike', 'A nice white shirt with a black logo, just do it.', 'Shirt'),
(6, 3, '180.00', 'Ultra Boost', 'Adidas', 'Gray ultraboost that are good for running and style', 'Shoes'),
(1233, 500, '123.00', 'IPhone X', 'Apple', 'A fancy phone', 'Phone'),
(18332, 90, '90.00', 'Soccer Ball', 'Tottenham', 'A ball that wins nothing', 'Sports'),
(81234, 200, '10.00', 'Diamond', 'PewDiePie', NULL, 'Gaming');

-- --------------------------------------------------------

--
-- Table structure for table `ordereditems`
--

CREATE TABLE `ordereditems` (
  `OrderID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordereditems`
--

INSERT INTO `ordereditems` (`OrderID`, `ItemID`, `Quantity`) VALUES
(332, 18332, 20),
(4444, 1233, 5),
(4444, 18332, 10),
(21344, 18332, 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderNum` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date NOT NULL,
  `Completed` char(1) DEFAULT 'N',
  `OrderName` varchar(30) NOT NULL,
  `OrderEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderNum`, `CustomerID`, `OrderDate`, `Completed`, `OrderName`, `OrderEmail`) VALUES
(332, 592134, '2012-08-10', 'Y', 'NotJames', 'notjames@gmail.com'),
(4444, 368192, '2018-11-25', 'Y', 'Bobby', 'bob.builder@gmail.com'),
(21344, 251059, '2019-04-08', 'N', 'Billy', 'billy.cat@gmail.com');

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `Insert_Completed_Y_Or_N` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
    IF NEW.Completed NOT IN ('Y', 'N')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Completed must be Y or N';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Completed_Y_Or_N` BEFORE UPDATE ON `orders` FOR EACH ROW BEGIN
    IF NEW.Completed NOT IN ('Y', 'N')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Completed must be Y or N';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `OrderID` int(11) NOT NULL,
  `CardName` varchar(20) NOT NULL,
  `CardNum` varchar(16) NOT NULL,
  `CardComp` varchar(20) NOT NULL,
  `CardExp` date NOT NULL,
  `Address1` varchar(200) NOT NULL,
  `Address2` varchar(200) DEFAULT NULL,
  `State` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Zip` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`OrderID`, `CardName`, `CardNum`, `CardComp`, `CardExp`, `Address1`, `Address2`, `State`, `Country`, `Zip`) VALUES
(332, 'James', '6123456789123456', 'Discover', '2018-11-25', 'First', 'Second', 'NY', 'USA', '33333'),
(4444, 'Bobby', '1234567891235674', 'Chase', '2018-11-25', 'First', 'Second', 'NY', 'USA', '11117'),
(21344, 'Billy', '1234567891234567', 'MasterCard', '2018-11-25', 'One', 'Two', 'CAL', 'USA', '22222');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `ID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Named` varchar(30) NOT NULL,
  `DateofBirth` date NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `DateJoined` date NOT NULL,
  `IsEmployee` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`ID`, `Email`, `Named`, `DateofBirth`, `Phone`, `DateJoined`, `IsEmployee`) VALUES
(1, 'gsingh@gmail.com', 'Gur Singh', '1999-01-20', '1234567890', '2019-05-01', 'Y'),
(251059, 'billy.cat@gmail.com', 'Billy', '1996-03-11', '9179179171', '2018-01-24', 'N'),
(359803, 'plane.wire@gmail.com', 'Rayzin', '1967-10-12', '9179179174', '2018-01-27', 'Y'),
(368192, 'bob.builder@gmail.com', 'Bobby', '1998-11-30', '9179179170', '2018-11-23', 'N'),
(432591, 'thom.sanjr@gmail.com', 'Thomsan', '1912-02-07', '4545454545', '2015-05-15', 'Y'),
(592134, 'sam.televi@gmail.com', 'James', '1992-05-14', '9179179172', '2017-09-01', 'N'),
(845523, 'mars.nasa@gmail.com', 'Tenmond', '2001-11-25', '9179179173', '2017-03-26', 'Y');

--
-- Triggers `person`
--
DELIMITER $$
CREATE TRIGGER `Insert_IsEmployee_Y_Or_N` BEFORE INSERT ON `person` FOR EACH ROW BEGIN
    IF NEW.IsEmployee NOT IN ('Y', 'N')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'IsEmployee must be Y or N';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE_IsEmployee_Y_Or_N` BEFORE UPDATE ON `person` FOR EACH ROW BEGIN
    IF NEW.IsEmployee NOT IN ('Y', 'N')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'IsEmployee must be Y or N';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `returnment`
--

CREATE TABLE `returnment` (
  `OrderID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Comments` varchar(200) NOT NULL,
  `Approval` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `returnment`
--

INSERT INTO `returnment` (`OrderID`, `ItemID`, `Quantity`, `Comments`, `Approval`) VALUES
(4444, 1233, 4, 'Balls are broken', NULL);

--
-- Triggers `returnment`
--
DELIMITER $$
CREATE TRIGGER `Insert_Approval` BEFORE INSERT ON `returnment` FOR EACH ROW BEGIN
    IF NEW.Approval NOT IN ('Y', 'N', NULL)
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Completed must be Y, N, or NULL';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Insert_Quantity_Returnment` BEFORE INSERT ON `returnment` FOR EACH ROW BEGIN
	DECLARE x INT;
	SET x = (SELECT o.Quantity From OrderedItems o WHERE o.OrderID = New.OrderID AND o.ItemID = NEW.ItemID);
    IF NEW.Quantity > x
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'The quantity must be less than the quantity of the ordered item';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Approval` BEFORE UPDATE ON `returnment` FOR EACH ROW BEGIN
    IF NEW.Approval NOT IN ('Y', 'N', NULL)
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Updated Approval must be Y, N, or NULL';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Quantity_Returnment` BEFORE UPDATE ON `returnment` FOR EACH ROW BEGIN
	DECLARE x INT;
	SET x = (SELECT o.Quantity From OrderedItems o WHERE o.OrderID = New.OrderID AND o.ItemID = NEW.ItemID);
    IF NEW.Quantity > x
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'The quantity must be less than the quantity of the ordered item';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `CustomerID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Ratings` int(11) NOT NULL,
  `Comments` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`CustomerID`, `ItemID`, `Ratings`, `Comments`) VALUES
(368192, 1233, 2, 'It would not turn on'),
(592134, 18332, 5, 'It\'s pretty good');

--
-- Triggers `reviews`
--
DELIMITER $$
CREATE TRIGGER `Insert_Ratings_1_to_5` BEFORE INSERT ON `reviews` FOR EACH ROW BEGIN
    IF NEW.Ratings NOT IN ('1', '2', '3', '4', '5')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Rating not 1-5';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Ratings_1_to_5` BEFORE UPDATE ON `reviews` FOR EACH ROW BEGIN
    IF NEW.Ratings NOT IN ('1', '2', '3', '4', '5')
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Rating not 1-5';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `OrderID` int(11) NOT NULL,
  `Address1` varchar(200) NOT NULL,
  `Address2` varchar(200) DEFAULT NULL,
  `State` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Zip` varchar(5) NOT NULL,
  `Fee` int(11) NOT NULL,
  `Company` varchar(20) NOT NULL,
  `ShipName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`OrderID`, `Address1`, `Address2`, `State`, `Country`, `Zip`, `Fee`, `Company`, `ShipName`) VALUES
(332, 'Sacremento', NULL, 'Cal', 'USA', '11117', 3, 'FEDEX', 'Bill'),
(4444, 'First', 'Second', 'NY', 'USA', '11117', 10, 'USPS', 'Bill1'),
(21344, 'Queens', 'City', 'NY', 'USA', '33633', 5, 'UPS', 'Bill2');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `CustomerID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`CustomerID`, `ItemID`, `Quantity`) VALUES
(251059, 18332, 2),
(368192, 1233, 5),
(592134, 81234, 50);

--
-- Triggers `shoppingcart`
--
DELIMITER $$
CREATE TRIGGER `Insert_Quantity_ShoppingCart` BEFORE INSERT ON `shoppingcart` FOR EACH ROW BEGIN
	DECLARE x INT;
	SET x = (SELECT i.Quantity From ITEM i WHERE i.ItemID = New.ItemID);
    IF NEW.Quantity > x
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'The quantity must be less than the quantity of the item';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Quantity_ShoppingCart` BEFORE UPDATE ON `shoppingcart` FOR EACH ROW BEGIN
	DECLARE x INT;
	SET x = (SELECT i.Quantity From ITEM i WHERE i.ItemID = New.ItemID);
    IF NEW.Quantity > x
    THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'The quantity must be less than the quantity of the item';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `CustomerID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`CustomerID`, `ItemID`) VALUES
(251059, 18332),
(368192, 1233),
(592134, 81234);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`CustomerID`,`Address1`,`State`,`Country`,`Zip`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`CustomerID`,`CardName`,`CardNum`,`CardComp`,`CardExp`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`DiscountID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeEmail`),
  ADD KEY `Supervisor` (`Supervisor`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `ordereditems`
--
ALTER TABLE `ordereditems`
  ADD PRIMARY KEY (`OrderID`,`ItemID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderNum`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `returnment`
--
ALTER TABLE `returnment`
  ADD PRIMARY KEY (`OrderID`,`ItemID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`CustomerID`,`ItemID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`CustomerID`,`ItemID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`CustomerID`,`ItemID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `person` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Supervisor`) REFERENCES `employee` (`EmployeeEmail`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `person` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ordereditems`
--
ALTER TABLE `ordereditems`
  ADD CONSTRAINT `ordereditems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderNum`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `ordereditems_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderNum`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `returnment`
--
ALTER TABLE `returnment`
  ADD CONSTRAINT `returnment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `ordereditems` (`OrderID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `returnment_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `ordereditems` (`ItemID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderNum`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
