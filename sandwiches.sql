-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Nov 18, 2022 alle 08:52
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE sandwiches;

USE sandwiches;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sandwiches`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `surname` varchar(32) CHARACTER SET utf8 NOT NULL,
  `email` varchar(64) CHARACTER SET utf8 NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 NOT NULL,
  `active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `break`
--

CREATE TABLE `break` (
  `ID` int(11) NOT NULL,
  `break_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `cart`
--

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `total_price` decimal(10,0) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `cart_product`
--

CREATE TABLE `cart_product` (
  `cart_ID` int(11) NOT NULL,
  `product_ID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `catalogue`
--

CREATE TABLE `catalogue` (
  `ID` int(11) NOT NULL,
  `catalogue_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `validity_start_date` date NOT NULL,
  `validity_end_date` date NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `catalogue_product`
--

CREATE TABLE `catalogue_product` (
  `catalogue_ID` int(11) NOT NULL,
  `product_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 NOT NULL,
  `iva_tax` decimal(10,0) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `nutritional_value`
--

CREATE TABLE `nutritional_value` (
  `ID` int(11) NOT NULL,
  `kcal` int(11) NOT NULL,
  `fats` decimal(10,0) NOT NULL,
  `saturated_fats` decimal(10,0) DEFAULT NULL,
  `carbohydrates` decimal(10,0) NOT NULL,
  `sugars` decimal(10,0) DEFAULT NULL,
  `proteins` decimal(10,0) NOT NULL,
  `salt` decimal(10,0) DEFAULT NULL,
  `fiber` decimal(10,0) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `offer_category`
--

CREATE TABLE `offer_category` (
  `offer_ID` int(11) NOT NULL,
  `category_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `order0`
--

CREATE TABLE `order0` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `total_price` decimal(10,0) NOT NULL,
  `date_hour_sale` datetime NOT NULL,
  `break_ID` int(11) NOT NULL,
  `status_ID` int(11) NOT NULL,
  `pickup_ID` int(11) NOT NULL,
  `json` longtext DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `order_product`
--

CREATE TABLE `order_product` (
  `order_ID` int(11) NOT NULL,
  `product_ID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `pickup_point`
--

CREATE TABLE `pickup_point` (
  `ID` int(11) NOT NULL,
  `description` varchar(64) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `category_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `nutritional_value_ID` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `product_tag`
--

CREATE TABLE `product_tag` (
  `product_ID` int(11) NOT NULL,
  `tag_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `special_offer`
--

CREATE TABLE `special_offer` (
  `ID` int(11) NOT NULL,
  `title` varchar(16) CHARACTER SET utf8 NOT NULL,
  `description` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `offer_code` varchar(8) CHARACTER SET utf8 NOT NULL,
  `validity_start_date` date NOT NULL,
  `validity_end_date` date NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `status`
--

CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `description` varchar(16) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tag`
--

CREATE TABLE `tag` (
  `tag_ID` int(11) NOT NULL,
  `tag` varchar(32) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `break`
--
ALTER TABLE `break`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indici per le tabelle `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`cart_ID`,`product_ID`),
  ADD KEY `product_ID` (`product_ID`);

--
-- Indici per le tabelle `catalogue`
--
ALTER TABLE `catalogue`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `catalogue_product`
--
ALTER TABLE `catalogue_product`
  ADD PRIMARY KEY (`catalogue_ID`,`product_ID`),
  ADD KEY `product_ID` (`product_ID`);

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `nutritional_value`
--
ALTER TABLE `nutritional_value`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `offer_category`
--
ALTER TABLE `offer_category`
  ADD PRIMARY KEY (`offer_ID`,`category_ID`),
  ADD KEY `category_ID` (`category_ID`);

--
-- Indici per le tabelle `order0`
--
ALTER TABLE `order0`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `break_ID` (`break_ID`),
  ADD KEY `status_ID` (`status_ID`),
  ADD KEY `pickup_ID` (`pickup_ID`);

--
-- Indici per le tabelle `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_ID`,`product_ID`),
  ADD KEY `product_ID` (`product_ID`);

--
-- Indici per le tabelle `pickup_point`
--
ALTER TABLE `pickup_point`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `category_ID` (`category_ID`),
  ADD KEY `nutritional_value_ID` (`nutritional_value_ID`);

--
-- Indici per le tabelle `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_ID`,`tag_ID`),
  ADD KEY `tag_ID` (`tag_ID`);

--
-- Indici per le tabelle `special_offer`
--
ALTER TABLE `special_offer`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_ID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `account`
--
ALTER TABLE `account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `break`
--
ALTER TABLE `break`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `catalogue`
--
ALTER TABLE `catalogue`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `nutritional_value`
--
ALTER TABLE `nutritional_value`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `order0`
--
ALTER TABLE `order0`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pickup_point`
--
ALTER TABLE `pickup_point`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `special_offer`
--
ALTER TABLE `special_offer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `status`
--
ALTER TABLE `status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tag`
--
ALTER TABLE `tag`
  MODIFY `tag_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `account` (`ID`);

--
-- Limiti per la tabella `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `cart_product_ibfk_1` FOREIGN KEY (`cart_ID`) REFERENCES `cart` (`ID`),
  ADD CONSTRAINT `cart_product_ibfk_2` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`);

--
-- Limiti per la tabella `catalogue_product`
--
ALTER TABLE `catalogue_product`
  ADD CONSTRAINT `catalogue_product_ibfk_1` FOREIGN KEY (`catalogue_ID`) REFERENCES `catalogue` (`ID`),
  ADD CONSTRAINT `catalogue_product_ibfk_2` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`);

--
-- Limiti per la tabella `offer_category`
--
ALTER TABLE `offer_category`
  ADD CONSTRAINT `offer_category_ibfk_1` FOREIGN KEY (`offer_ID`) REFERENCES `special_offer` (`ID`),
  ADD CONSTRAINT `offer_category_ibfk_2` FOREIGN KEY (`category_ID`) REFERENCES `category` (`ID`);

--
-- Limiti per la tabella `order0`
--
ALTER TABLE `order0`
  ADD CONSTRAINT `order0_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `order0_ibfk_2` FOREIGN KEY (`break_ID`) REFERENCES `break` (`ID`),
  ADD CONSTRAINT `order0_ibfk_3` FOREIGN KEY (`status_ID`) REFERENCES `status` (`ID`),
  ADD CONSTRAINT `order0_ibfk_4` FOREIGN KEY (`pickup_ID`) REFERENCES `pickup_point` (`ID`);

--
-- Limiti per la tabella `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_ID`) REFERENCES `order0` (`ID`),
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`);

--
-- Limiti per la tabella `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`nutritional_value_ID`) REFERENCES `nutritional_value` (`ID`);

--
-- Limiti per la tabella `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `product_tag_ibfk_2` FOREIGN KEY (`tag_ID`) REFERENCES `tag` (`tag_ID`);
COMMIT;

CREATE TABLE `ingredient` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `description` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `available_quantity` decimal(10,0) NOT NULL
) ;

CREATE TABLE `product_ingredient` (
  `product_ID` int(11) NOT NULL,
  `ingredient_ID` int(11) NOT NULL,
  `ingredient_quantity` varchar(32) CHARACTER SET utf8 NOT NULL,
  `product_making_notes` varchar(128) CHARACTER SET utf8 DEFAULT NULL
) ;

ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ID`);
 
ALTER TABLE `product_ingredient`
ADD PRIMARY KEY (`product_ID`,`ingredient_ID`),
ADD KEY `ingredient_ID` (`ingredient_ID`);

ALTER TABLE `ingredient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
 
 ALTER TABLE `product_ingredient`
  ADD CONSTRAINT `product_ingredient_ibfk_1` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `product_ingredient_ibfk_2` FOREIGN KEY (`ingredient_ID`) REFERENCES `ingredient` (`ID`);
 
 ALTER TABLE `order0`
  MODIFY `date_hour_sale` datetime NOT NULL default current_timestamp;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

insert into category(name, iva_tax)
values
('panino', 0.22),
('bevanda', 0.18),
('piadina', 0.22);

insert into nutritional_value(kcal, fats, carbohydrates, proteins)
values
(235, 25, 80, 7),
(348, 30, 63, 6),
(249, 17, 65, 25),
(80, 0, 10, 1);

insert into product(name, price, description, quantity, category_ID, nutritional_value_ID)
values
('panino al prosciutto', 3, 'panino fatto col miglior prosciutto in cirolazione', 26, 1, 1),
('panino al salame', 3, 'panino fatto col salame de me nonno', 17, 1, 2),
('panino proteico', 3, 'panino che possono mangiare solo i veri jimbro', 15, 1, 3),
('coca cola', 1, 'bevanda frizzante', 24, 2, 4);

insert into ingredient(name, available_quantity, description)
values
('salame', 60, 'salame de me nonno'),
('prosciutto', 35, 'miglior prosciutto in cirolazione'),
('pane', 80, 'pane da panino'),
('bresaola', 40, 'we jim');

insert into product_ingredient(product_ID, ingredient_ID, ingredient_quantity, product_making_notes)
values
(1, 3, 2, 'se è un panino è ovvio che ci sia del pane :D'),
(2, 3, 2, 'se è un panino è ovvio che ci sia del pane :D'),
(3, 3, 2, 'se è un panino è ovvio che ci sia del pane :D'),
(1, 2, 3, 'per panino al prosciutto'),
(2, 1, 3, 'per panino al salame'),
(3, 4, 4, 'per panino dei jimbro');

INSERT INTO account (name, surname, email, password)
VALUES  ('Andrea', 'Marchetto', 'andrea.marchetto@iisviolamarchesini.edu.it', 'Becco'),
		('Alberto', 'Pavarin', 'alberto.pavarin@iisviolamarchesini.edu.it', 'Sium'),
		('Diego', 'Albertin', 'diego.albertin@iisviolamarchesini.edu.it', 'Stacco');
	
INSERT INTO break (break_time)
VALUES ('9:30:00');

INSERT INTO break (break_time)
VALUES ('11:30:00');

INSERT INTO status (description)
VALUES 
	('ordinato'),
	('pronto'),
	('annullato');

INSERT INTO pickup_point (description)
VALUES 
	('Zona A'),
	('Zona B');
