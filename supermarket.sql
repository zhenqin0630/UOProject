/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : supermarket

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-07 19:37:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for clothes
-- ----------------------------
DROP TABLE IF EXISTS `clothes`;
CREATE TABLE `clothes` (
  `good_ID` int(11) NOT NULL,
  `good_code` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` enum('XXL','XL','L','M','S','XS','XXS') DEFAULT NULL,
  `color` enum('pink','black','white','purple','blue','green','yellow','orange','silver','grey','red') DEFAULT NULL,
  `material` enum('terylene','woolen','leathery','cotton','silk','acrylic') DEFAULT NULL,
  KEY `clothes_fk` (`good_ID`),
  CONSTRAINT `clothes_fk` FOREIGN KEY (`good_ID`) REFERENCES `goods` (`goods_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clothes
-- ----------------------------
INSERT INTO `clothes` VALUES ('3', 'm1', 'underwear', 'M', 'pink', 'silk');
INSERT INTO `clothes` VALUES ('3', 's2', 'underwear', 'S', 'black', 'silk');
INSERT INTO `clothes` VALUES ('3', 's3', 'underwear', 'S', 'white', 'silk');
INSERT INTO `clothes` VALUES ('3', 'm2', 'underwear', 'M', 'black', 'silk');
INSERT INTO `clothes` VALUES ('3', 'xs1', 'underwear', 'XS', 'pink', 'silk');
INSERT INTO `clothes` VALUES ('3', 'xxs4', 'underwear', 'XXS', 'purple', 'silk');
INSERT INTO `clothes` VALUES ('8', 'm2', 't-shirt', 'M', 'black', 'cotton');
INSERT INTO `clothes` VALUES ('8', 'l3', 't-shirt', 'L', 'white', 'cotton');
INSERT INTO `clothes` VALUES ('8', 's11', 't-shirt', 'S', 'red', 'cotton');
INSERT INTO `clothes` VALUES ('8', 'xl10', 't-shirt', 'XL', 'grey', 'cotton');
INSERT INTO `clothes` VALUES ('8', 'xxl2', 't-shirt', 'XXL', 'black', 'cotton');
INSERT INTO `clothes` VALUES ('13', 'm2', 'jaket', 'M', 'black', 'terylene');
INSERT INTO `clothes` VALUES ('13', 'l3', 'jaket', 'L', 'white', 'terylene');
INSERT INTO `clothes` VALUES ('13', 'xl3', 'jaket', 'XL', 'white', 'terylene');
INSERT INTO `clothes` VALUES ('13', 'xxl2', 'jaket', 'XXL', 'black', 'terylene');
INSERT INTO `clothes` VALUES ('14', 'm2', 'underwear', 'M', 'black', 'acrylic');
INSERT INTO `clothes` VALUES ('14', 'm10', 'underwear', 'M', 'grey', 'acrylic');
INSERT INTO `clothes` VALUES ('14', 's10', 'underwear', 'S', 'grey', 'acrylic');
INSERT INTO `clothes` VALUES ('14', 'l2', 'underwear', 'L', 'black', 'acrylic');
INSERT INTO `clothes` VALUES ('14', 'l10', 'underwear', 'L', 'grey', 'acrylic');
INSERT INTO `clothes` VALUES ('14', 'xl10', 'underwear', 'XL', 'grey', 'acrylic');
INSERT INTO `clothes` VALUES ('14', 'xxl2', 'underwear', 'XXL', 'black', 'acrylic');
INSERT INTO `clothes` VALUES ('22', 'm2', 't-shirt', 'M', 'black', 'cotton');
INSERT INTO `clothes` VALUES ('22', 'xl9', 't-shirt', 'XL', 'silver', 'cotton');
INSERT INTO `clothes` VALUES ('22', 'xl4', 't-shirt', 'XL', 'purple', 'cotton');
INSERT INTO `clothes` VALUES ('22', 'l3', 't-shirt', 'L', 'white', 'cotton');
INSERT INTO `clothes` VALUES ('22', 'xxl10', 't-shirt', 'XXL', 'grey', 'cotton');

-- ----------------------------
-- Table structure for daily_use
-- ----------------------------
DROP TABLE IF EXISTS `daily_use`;
CREATE TABLE `daily_use` (
  `good_id` int(11) NOT NULL,
  `type` enum('hair','mouth','face','body') DEFAULT NULL,
  KEY `daily_fk` (`good_id`),
  CONSTRAINT `daily_fk` FOREIGN KEY (`good_id`) REFERENCES `goods` (`goods_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daily_use
-- ----------------------------
INSERT INTO `daily_use` VALUES ('4', 'body');
INSERT INTO `daily_use` VALUES ('5', 'hair');
INSERT INTO `daily_use` VALUES ('19', 'mouth');
INSERT INTO `daily_use` VALUES ('20', 'mouth');
INSERT INTO `daily_use` VALUES ('21', 'mouth');
INSERT INTO `daily_use` VALUES ('23', 'face');
INSERT INTO `daily_use` VALUES ('24', 'face');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `SSN` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` enum('female','male') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` bigint(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  KEY `SSN` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('332268', 'David', 'Levin', 'male', '45', '15412282290', '4771 Revolution Rd');
INSERT INTO `employee` VALUES ('944355', 'Hayden', 'Harker', 'male', '40', '15412282933', '4665 Linkon Rd');
INSERT INTO `employee` VALUES ('455688', 'Becca', 'Bigwood', 'female', '37', '15034414868', '3220 Washington St');
INSERT INTO `employee` VALUES ('122886', 'Brian', 'Drury', 'male', '42', '15055505505', '4228 24th Ave');
INSERT INTO `employee` VALUES ('433568', 'Maria', 'Dresser', 'female', '34', '5411152240', '2250  18th Ave');
INSERT INTO `employee` VALUES ('655860', 'Chris', 'Horton', 'female', '26', '15412282990', '1551 Corburg St');
INSERT INTO `employee` VALUES ('668660', 'Susan', 'Hall', 'female', '23', '15035505228', '4752 Olive St');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `good_ID` int(11) NOT NULL,
  `type` enum('cooked food','drink','dairy','snack','fruit','vegetable','meat') DEFAULT NULL,
  `expiration` varchar(255) DEFAULT NULL,
  KEY `food_fk` (`good_ID`),
  CONSTRAINT `food_fk` FOREIGN KEY (`good_ID`) REFERENCES `goods` (`goods_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('6', 'snack', '6 months');
INSERT INTO `food` VALUES ('9', 'drink', '12 months');
INSERT INTO `food` VALUES ('10', 'drink', '12 months');
INSERT INTO `food` VALUES ('11', 'drink', '12 months');
INSERT INTO `food` VALUES ('12', 'drink', '12 months');
INSERT INTO `food` VALUES ('15', 'fruit', '7 days');
INSERT INTO `food` VALUES ('16', 'fruit', '7 days');
INSERT INTO `food` VALUES ('17', 'vegetable', '7 days');
INSERT INTO `food` VALUES ('18', 'vegetable', '7 days');
INSERT INTO `food` VALUES ('26', 'cooked food', '24 hours');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_ID` int(11) NOT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  `manufacturer_ID` int(11) DEFAULT NULL,
  `supplier_ID` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  KEY `manufacturer` (`manufacturer_ID`),
  KEY `supplier` (`supplier_ID`),
  KEY `goods_ID` (`goods_ID`),
  CONSTRAINT `manufacturer` FOREIGN KEY (`manufacturer_ID`) REFERENCES `manufacturer` (`manufacturer_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `supplier` FOREIGN KEY (`supplier_ID`) REFERENCES `supplier` (`supplier_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'Adidas Performance Hyperfast', '99.99', '2', '5', 'A good tennis shoes');
INSERT INTO `goods` VALUES ('2', 'Nike Air Force', '79.99', '1', '5', 'A nice Nike basketball shoes');
INSERT INTO `goods` VALUES ('3', 'Victoria Secret', '89.99', '4', '5', 'Good underwear');
INSERT INTO `goods` VALUES ('4', 'Dove Body Wash', '14.99', '14', '4', 'Very well body wash');
INSERT INTO `goods` VALUES ('5', 'Olay hair Shampoo', '14.99', '13', '4', 'very well hair wash');
INSERT INTO `goods` VALUES ('6', 'Lays Potato', '3.99', '7', '2', 'Really delicous');
INSERT INTO `goods` VALUES ('7', 'MeiGuan Night Bright Slipper', '16.99', '8', '1', 'New concept of design, high techology product & pretty appearance');
INSERT INTO `goods` VALUES ('8', 'Polo T-shirt', '39.99', '6', '5', 'cool t_shirt, very suit for old man');
INSERT INTO `goods` VALUES ('9', 'Coke Cola', '1.99', '9', '2', 'well known drink');
INSERT INTO `goods` VALUES ('10', 'Pepsi', '1.99', '10', '2', 'well known drink');
INSERT INTO `goods` VALUES ('11', 'Sprite', '1.99', '9', '2', 'very knowdgeable');
INSERT INTO `goods` VALUES ('12', 'Seven Up', '1.99', '10', '2', 'really cool drink');
INSERT INTO `goods` VALUES ('13', 'Cloum down jacket', '189.99', '3', '5', 'reallky warm, make you hot');
INSERT INTO `goods` VALUES ('14', 'CK men\'s underpants', '29.99', '6', '5', 'really comfortable, make you more sexy');
INSERT INTO `goods` VALUES ('15', 'Organic Apple', '1.99', '11', '3', 'green and organic');
INSERT INTO `goods` VALUES ('16', 'Super Apple', '1.49', '12', '3', 'very sweet');
INSERT INTO `goods` VALUES ('17', 'Local green pepper', '0.99', '12', '3', 'really spicy');
INSERT INTO `goods` VALUES ('18', 'Organic pepper', '1.19', '11', '3', 'organic with a little spicy ');
INSERT INTO `goods` VALUES ('19', 'Crest lemon toothpaste', '3.99', '15', '6', 'good smile toothpaste');
INSERT INTO `goods` VALUES ('20', 'Crest valina toothpaste', '4.49', '15', '6', 'make you teeth more white');
INSERT INTO `goods` VALUES ('21', 'Crest soft toothbrush', '6.99', '15', '6', 'really really soft toothbrush');
INSERT INTO `goods` VALUES ('22', 'Tommoy Shirt', '49.99', '5', '5', 'good manu and good quality');
INSERT INTO `goods` VALUES ('23', 'Conditioning Spray', '13.99', '14', '4', 'used for your face');
INSERT INTO `goods` VALUES ('24', 'Micro-Sculpting Cream Face', '14.99', '13', '4', 'used to wash your face');
INSERT INTO `goods` VALUES ('25', 'Adidas  Reinforce', '129.99', '2', '5', 'good shoes for run');
INSERT INTO `goods` VALUES ('26', 'Fried Chicken', '2.99', '16', '2', 'really delicous');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `SSN` varchar(255) NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  KEY `manage_seller` (`SSN`),
  CONSTRAINT `manage_seller` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('332268', 'general manager', '4000');
INSERT INTO `manager` VALUES ('944355', 'assistant manager', '3700');
INSERT INTO `manager` VALUES ('455688', 'finance manager', '3500');

-- ----------------------------
-- Table structure for manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
  `manufacturer_ID` int(11) NOT NULL,
  `manufacturer_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` bigint(36) DEFAULT NULL,
  PRIMARY KEY (`manufacturer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------
INSERT INTO `manufacturer` VALUES ('1', 'Nike', 'Oakway Center, 135 Oakway Rd', 'Eugene', 'OR', 'US', '15036716453');
INSERT INTO `manufacturer` VALUES ('2', 'Adidas', '5055 N Greeley Aave', 'Portland', 'OR', 'US', '18004481796');
INSERT INTO `manufacturer` VALUES ('3', 'Columbia', '14375 NW Science Park', 'Portland', 'OR', 'US', '18006226953');
INSERT INTO `manufacturer` VALUES ('4', 'Victoria', '164 Buckingham Palace Rd', 'London', '9TP', 'UK', '443432221234');
INSERT INTO `manufacturer` VALUES ('5', 'Tommy Hilfiger', 'Woodburn Outlet', 'Woodburn', 'OR', 'US', '15039818883');
INSERT INTO `manufacturer` VALUES ('6', 'Calvin Klein', '205 West 39th Street', 'NY', 'NY', 'US', '12127192600');
INSERT INTO `manufacturer` VALUES ('7', 'Lays', '2800 Silver Star Rd', 'Orlando', 'FL', 'US', '13212951810');
INSERT INTO `manufacturer` VALUES ('8', 'Meiguan', '917 Chengxiang Rd', 'ShangHai', 'ShangHai', 'CN', '15419539877');
INSERT INTO `manufacturer` VALUES ('9', 'Coke', '2250 Patterson St', 'LA', 'CA', 'US', '13239749771');
INSERT INTO `manufacturer` VALUES ('10', 'Pepsi', '13th & Olive', 'San', 'CA', 'US', '13239655451');
INSERT INTO `manufacturer` VALUES ('11', 'Vinyard', '1671 Ferry St', 'Eugene', 'OR', 'US', '15412212770');
INSERT INTO `manufacturer` VALUES ('12', 'Sunset', '776 Unversity St', 'Salm', 'OR', 'US', '15412737694');
INSERT INTO `manufacturer` VALUES ('13', 'Olay', '1356 Blizzard Rd', 'NY', 'NY', 'US', '12127199230');
INSERT INTO `manufacturer` VALUES ('14', 'Dove', '2420 Corburg Rd', 'Miami', 'FL', 'US', '13212993343');
INSERT INTO `manufacturer` VALUES ('15', 'Crest', '911 Alert Rd', 'NY', 'NY', 'US', '12327192344');
INSERT INTO `manufacturer` VALUES ('16', 'Duck King', '1 Duck Rd', 'Eugene', 'OR', 'US', '15415415541');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `member_ID` varchar(255) NOT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `phone` bigint(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  KEY `member_ID` (`member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'Alice Going', '15412272880', '1020 Dea St');
INSERT INTO `member` VALUES ('2', 'Yueqi Zhu', '15412272889', '1560 Plc Rd');
INSERT INTO `member` VALUES ('3', 'Bob Zhang', '15412232764', '1105 Fenton Ave');
INSERT INTO `member` VALUES ('4', 'Yumika', '15412322980', '1223 Star Rd');
INSERT INTO `member` VALUES ('5', 'Mike Price', '15412999991', '1190 Ohio Ave');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `receipt_num` int(11) NOT NULL,
  `goods_ID` int(11) NOT NULL,
  `goods_num` int(11) DEFAULT NULL,
  KEY `receipt_num_fk` (`receipt_num`),
  KEY `good_id_fk_in_order` (`goods_ID`),
  CONSTRAINT `good_id_fk_in_order` FOREIGN KEY (`goods_ID`) REFERENCES `goods` (`goods_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `receipt_num_fk` FOREIGN KEY (`receipt_num`) REFERENCES `receipt` (`receipt_num`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('11850', '1', '1');
INSERT INTO `order` VALUES ('11850', '5', '1');
INSERT INTO `order` VALUES ('11850', '6', '3');
INSERT INTO `order` VALUES ('11850', '10', '10');
INSERT INTO `order` VALUES ('11850', '21', '1');
INSERT INTO `order` VALUES ('12210', '9', '8');
INSERT INTO `order` VALUES ('12210', '3', '2');
INSERT INTO `order` VALUES ('12210', '7', '1');
INSERT INTO `order` VALUES ('12210', '15', '6');
INSERT INTO `order` VALUES ('12210', '18', '4');
INSERT INTO `order` VALUES ('12215', '22', '2');
INSERT INTO `order` VALUES ('12215', '25', '1');
INSERT INTO `order` VALUES ('12336', '13', '1');
INSERT INTO `order` VALUES ('12545', '9', '12');
INSERT INTO `order` VALUES ('12545', '10', '12');
INSERT INTO `order` VALUES ('12545', '6', '5');
INSERT INTO `order` VALUES ('12697', '4', '2');
INSERT INTO `order` VALUES ('12697', '5', '2');
INSERT INTO `order` VALUES ('12697', '19', '3');
INSERT INTO `order` VALUES ('12698', '21', '1');
INSERT INTO `order` VALUES ('12850', '3', '3');
INSERT INTO `order` VALUES ('12850', '4', '4');
INSERT INTO `order` VALUES ('12995', '24', '1');
INSERT INTO `order` VALUES ('12995', '8', '1');
INSERT INTO `order` VALUES ('12995', '2', '1');
INSERT INTO `order` VALUES ('13300', '15', '4');
INSERT INTO `order` VALUES ('13300', '16', '4');
INSERT INTO `order` VALUES ('13380', '1', '2');
INSERT INTO `order` VALUES ('13380', '25', '1');
INSERT INTO `order` VALUES ('14410', '19', '3');
INSERT INTO `order` VALUES ('14410', '20', '4');
INSERT INTO `order` VALUES ('15660', '26', '12');
INSERT INTO `order` VALUES ('15660', '12', '12');
INSERT INTO `order` VALUES ('15660', '6', '6');

-- ----------------------------
-- Table structure for receipt
-- ----------------------------
DROP TABLE IF EXISTS `receipt`;
CREATE TABLE `receipt` (
  `receipt_num` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `member_ID` varchar(255) DEFAULT NULL,
  `seller_ID` varchar(11) DEFAULT NULL,
  KEY `member_id` (`member_ID`),
  KEY `printer` (`seller_ID`),
  KEY `receipt_num` (`receipt_num`),
  CONSTRAINT `member_id` FOREIGN KEY (`member_ID`) REFERENCES `member` (`member_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `printer` FOREIGN KEY (`seller_ID`) REFERENCES `seller` (`SSN`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receipt
-- ----------------------------
INSERT INTO `receipt` VALUES ('11850', '2016-10-12', '1', '433568');
INSERT INTO `receipt` VALUES ('12210', '2016-10-13', '2', '433568');
INSERT INTO `receipt` VALUES ('12215', '2016-10-14', '5', '433568');
INSERT INTO `receipt` VALUES ('12336', '2016-10-20', '3', '655860');
INSERT INTO `receipt` VALUES ('12545', '2016-10-28', '1', '655860');
INSERT INTO `receipt` VALUES ('12697', '2016-10-30', '4', '122886');
INSERT INTO `receipt` VALUES ('12698', '2016-10-31', '4', '122886');
INSERT INTO `receipt` VALUES ('12850', '2016-11-06', '3', '668660');
INSERT INTO `receipt` VALUES ('12995', '2016-11-22', '3', '655860');
INSERT INTO `receipt` VALUES ('13300', '2016-11-16', '1', '433568');
INSERT INTO `receipt` VALUES ('13380', '2016-11-30', '5', '122886');
INSERT INTO `receipt` VALUES ('14410', '2016-12-01', '2', '122886');
INSERT INTO `receipt` VALUES ('15660', '2016-12-07', '1', '668660');

-- ----------------------------
-- Table structure for sale_goods
-- ----------------------------
DROP TABLE IF EXISTS `sale_goods`;
CREATE TABLE `sale_goods` (
  `good_ID` int(11) NOT NULL,
  `sale_price` decimal(10,0) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  KEY `sale` (`good_ID`),
  CONSTRAINT `sale` FOREIGN KEY (`good_ID`) REFERENCES `goods` (`goods_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_goods
-- ----------------------------
INSERT INTO `sale_goods` VALUES ('1', '80', '2016-11-25', '2016-12-01');
INSERT INTO `sale_goods` VALUES ('2', '70', '2016-11-25', '2016-12-01');
INSERT INTO `sale_goods` VALUES ('7', '14', '2016-11-25', '2016-12-01');
INSERT INTO `sale_goods` VALUES ('8', '30', '2016-11-25', '2016-12-01');
INSERT INTO `sale_goods` VALUES ('13', '110', '2016-11-25', '2016-12-01');
INSERT INTO `sale_goods` VALUES ('22', '35', '2016-11-25', '2016-12-01');

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `SSN` varchar(255) NOT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `super_ssn` varchar(255) DEFAULT NULL,
  KEY `ssn` (`SSN`),
  KEY `supervise` (`super_ssn`),
  CONSTRAINT `supervise` FOREIGN KEY (`super_ssn`) REFERENCES `manager` (`SSN`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ssn` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('122886', '2000', '332268');
INSERT INTO `seller` VALUES ('433568', '2000', '332268');
INSERT INTO `seller` VALUES ('655860', '2000', '944355');
INSERT INTO `seller` VALUES ('668660', '1600', '944355');

-- ----------------------------
-- Table structure for shoes
-- ----------------------------
DROP TABLE IF EXISTS `shoes`;
CREATE TABLE `shoes` (
  `good_ID` int(11) NOT NULL,
  `good_code` varchar(255) NOT NULL,
  `type` enum('running','slipper','leather','board','football','tennis','basketball') DEFAULT NULL,
  `size` enum('12','11.5','11','10.5','10','9.5','9','8.5','8','7.5','7') DEFAULT NULL,
  `color` enum('pink','black','white','yellow','green','blue','grey','silver','orange','red') DEFAULT NULL,
  KEY `shoes_fk` (`good_ID`),
  CONSTRAINT `shoes_fk` FOREIGN KEY (`good_ID`) REFERENCES `goods` (`goods_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoes
-- ----------------------------
INSERT INTO `shoes` VALUES ('1', 'b85', 'tennis', '8.5', 'black');
INSERT INTO `shoes` VALUES ('1', 's90', 'tennis', '9', 'silver');
INSERT INTO `shoes` VALUES ('1', 'r95', 'tennis', '9.5', 'red');
INSERT INTO `shoes` VALUES ('1', 'r90', 'tennis', '9', 'red');
INSERT INTO `shoes` VALUES ('1', 'b90', 'tennis', '9', 'black');
INSERT INTO `shoes` VALUES ('1', 'b100', 'tennis', '10', 'black');
INSERT INTO `shoes` VALUES ('1', 'b110', 'tennis', '11', 'black');
INSERT INTO `shoes` VALUES ('1', 'y85', 'tennis', '8.5', 'yellow');
INSERT INTO `shoes` VALUES ('2', 'b80', 'basketball', '8', 'black');
INSERT INTO `shoes` VALUES ('2', 'y85', 'basketball', '8.5', 'yellow');
INSERT INTO `shoes` VALUES ('2', 'y95', 'basketball', '9.5', 'yellow');
INSERT INTO `shoes` VALUES ('2', 'w100', 'basketball', '10', 'white');
INSERT INTO `shoes` VALUES ('2', 'b95', 'basketball', '9.5', 'black');
INSERT INTO `shoes` VALUES ('2', 'r95', 'basketball', '9.5', 'red');
INSERT INTO `shoes` VALUES ('2', 'w110', 'basketball', '11', 'white');
INSERT INTO `shoes` VALUES ('7', 'p85', 'slipper', '8.5', 'pink');
INSERT INTO `shoes` VALUES ('7', 'w85', 'slipper', '8.5', 'white');
INSERT INTO `shoes` VALUES ('7', 'p105', 'slipper', '10.5', 'pink');
INSERT INTO `shoes` VALUES ('7', 'w105', 'slipper', '10.5', 'white');
INSERT INTO `shoes` VALUES ('7', 'bl85', 'slipper', '8.5', 'blue');
INSERT INTO `shoes` VALUES ('7', 'bl105', 'slipper', '10.5', 'blue');
INSERT INTO `shoes` VALUES ('25', 'b90', 'running', '9', 'black');
INSERT INTO `shoes` VALUES ('25', 'b95', 'running', '9.5', 'black');
INSERT INTO `shoes` VALUES ('25', 'w95', 'running', '9.5', 'white');
INSERT INTO `shoes` VALUES ('25', 'w85', 'running', '8.5', 'white');
INSERT INTO `shoes` VALUES ('25', 'r90', 'running', '9', 'red');
INSERT INTO `shoes` VALUES ('25', 'r100', 'running', '10', 'red');
INSERT INTO `shoes` VALUES ('25', 'r115', 'running', '11.5', 'red');
INSERT INTO `shoes` VALUES ('25', 'b110', 'running', '11', 'black');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplier_ID` int(11) NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` bigint(36) DEFAULT NULL,
  `manager_ssn` varchar(255) DEFAULT NULL,
  KEY `supplier_ID` (`supplier_ID`),
  KEY `manager` (`manager_ssn`),
  CONSTRAINT `manager` FOREIGN KEY (`manager_ssn`) REFERENCES `manager` (`SSN`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'QinZhen', '13th & Olive #4410', '15419539877', '944355');
INSERT INTO `supplier` VALUES ('2', 'Xuesong', 'Spencer View', '15412212860', '944355');
INSERT INTO `supplier` VALUES ('3', 'LiZhou', 'Chase', '15412212877', '455688');
INSERT INTO `supplier` VALUES ('4', 'BroJava', 'Mountain Village', '15415943838', '455688');
INSERT INTO `supplier` VALUES ('5', 'Obama', 'White House', '154191199911', '455688');
INSERT INTO `supplier` VALUES ('6', 'ShuHen', 'Duck Village', '15412212881', '455688');
