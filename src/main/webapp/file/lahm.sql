/*
Navicat MySQL Data Transfer

Source Server         : linux_lhh
Source Server Version : 50717
Source Host           : 47.106.211.69:3307
Source Database       : lahm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-11-22 17:23:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car_message_log
-- ----------------------------
DROP TABLE IF EXISTS `car_message_log`;
CREATE TABLE `car_message_log` (
  `message_id` varchar(128) NOT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `try_count` int(4) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL COMMENT '消息投递状态 0 投递中 1投递成功 2投递失败',
  `next_retry` timestamp NULL DEFAULT NULL COMMENT '超时时间',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_message_log
-- ----------------------------
INSERT INTO `car_message_log` VALUES ('1539682001575$b1c4327b-eca1-4b2d-8f3d-53ca0d3c55cb', '{\"date\":1538323200000,\"messageId\":\"1539682001575$b1c4327b-eca1-4b2d-8f3d-53ca0d3c55cb\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:48', '2018-10-17 10:05:48', '2018-10-17 10:05:49');
INSERT INTO `car_message_log` VALUES ('1539682001577$5ba5a32c-7e9a-4385-bcf5-f8dac6e6dd41', '{\"date\":1538323200000,\"messageId\":\"1539682001577$5ba5a32c-7e9a-4385-bcf5-f8dac6e6dd41\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:48', '2018-10-17 10:05:48', '2018-10-17 10:05:49');
INSERT INTO `car_message_log` VALUES ('1539682001580$a2a7728f-9561-4421-bc11-72a80afe6f23', '{\"date\":1538323200000,\"messageId\":\"1539682001580$a2a7728f-9561-4421-bc11-72a80afe6f23\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:49', '2018-10-17 10:05:49', '2018-10-17 10:05:49');
INSERT INTO `car_message_log` VALUES ('1539682001581$ea77f331-52e9-4f9b-9157-2a8791ab0865', '{\"date\":1538323200000,\"messageId\":\"1539682001581$ea77f331-52e9-4f9b-9157-2a8791ab0865\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:49', '2018-10-17 10:05:49', '2018-10-17 10:05:49');
INSERT INTO `car_message_log` VALUES ('1539682001582$8f116fc1-3d96-4702-b734-e1e2da2337aa', '{\"date\":1538323200000,\"messageId\":\"1539682001582$8f116fc1-3d96-4702-b734-e1e2da2337aa\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:49', '2018-10-17 10:05:49', '2018-10-17 10:05:50');
INSERT INTO `car_message_log` VALUES ('1539682001585$351d2096-165a-499c-ace0-ef50c9ddf653', '{\"date\":1538323200000,\"messageId\":\"1539682001585$351d2096-165a-499c-ace0-ef50c9ddf653\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:49', '2018-10-17 10:05:49', '2018-10-17 10:05:50');
INSERT INTO `car_message_log` VALUES ('1539682001586$28a74fb5-567c-48b2-ad00-c5fdf1fe00ea', '{\"date\":1538323200000,\"messageId\":\"1539682001586$28a74fb5-567c-48b2-ad00-c5fdf1fe00ea\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:50', '2018-10-17 10:05:50', '2018-10-17 10:05:50');
INSERT INTO `car_message_log` VALUES ('1539682001587$d9d29a2d-0252-45c5-ad6a-686355ae7289', '{\"date\":1538323200000,\"messageId\":\"1539682001587$d9d29a2d-0252-45c5-ad6a-686355ae7289\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:50', '2018-10-17 10:05:50', '2018-10-17 10:05:50');
INSERT INTO `car_message_log` VALUES ('1539682001592$0ee4dbe9-3db8-46ed-bd2f-6fae0c5c93cc', '{\"date\":1538323200000,\"messageId\":\"1539682001592$0ee4dbe9-3db8-46ed-bd2f-6fae0c5c93cc\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:50', '2018-10-17 10:05:50', '2018-10-17 10:05:50');
INSERT INTO `car_message_log` VALUES ('1539682001593$9592db2c-b6b8-4315-bc86-4d2e3e855396', '{\"date\":1538323200000,\"messageId\":\"1539682001593$9592db2c-b6b8-4315-bc86-4d2e3e855396\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:50', '2018-10-17 10:05:50', '2018-10-17 10:05:50');
INSERT INTO `car_message_log` VALUES ('1539682001596$f39e2ac2-52b2-4333-9d1c-2a3ea975b0d9', '{\"date\":1538323200000,\"messageId\":\"1539682001596$f39e2ac2-52b2-4333-9d1c-2a3ea975b0d9\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:50', '2018-10-17 10:05:50', '2018-10-17 10:05:50');
INSERT INTO `car_message_log` VALUES ('1539682001597$880a0a11-7deb-4016-8482-84052d51bceb', '{\"date\":1538323200000,\"messageId\":\"1539682001597$880a0a11-7deb-4016-8482-84052d51bceb\",\"name\":\"小花\",\"price\":666.66}', '0', '1', '2018-10-17 10:06:50', '2018-10-17 10:05:50', '2018-10-17 10:05:50');

-- ----------------------------
-- Table structure for dog
-- ----------------------------
DROP TABLE IF EXISTS `dog`;
CREATE TABLE `dog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dog
-- ----------------------------

-- ----------------------------
-- Table structure for nav
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  `href` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES ('2', '博客专区', '#');
INSERT INTO `nav` VALUES ('3', '大数据', '/lahm/data/index');
INSERT INTO `nav` VALUES ('4', '解决方案', '#');
INSERT INTO `nav` VALUES ('6', '退出', '/lahm/user/logout');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `productContent` varchar(255) DEFAULT NULL,
  `praise` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '马可波罗', '洛克飒飒', '这是一个大故事', '0', '2018-07-11 14:39:23');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin');
INSERT INTO `roles` VALUES ('2', 'user');

-- ----------------------------
-- Table structure for sys_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_data`;
CREATE TABLE `sys_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `income` decimal(50,2) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `shows` bigint(20) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `install` int(11) DEFAULT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_data
-- ----------------------------
INSERT INTO `sys_data` VALUES ('6894', '2017-10-04', 'yh1103', '1100', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6895', '2017-10-05', 'yh1103', '1088', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6896', '2017-10-06', 'yh1103', '1550', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6897', '2017-10-07', 'yh1103', '1655', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6898', '2017-10-08', 'yh1103', '1705', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6899', '2017-10-09', 'yh1103', '1796', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6900', '2017-10-10', 'yh1103', '1531', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6901', '2017-10-11', 'yh1103', '1849', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6902', '2017-10-12', 'yh1103', '1864', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6903', '2017-10-13', 'yh1103', '1826', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6904', '2017-10-14', 'yh1103', '1860', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6905', '2017-10-15', 'yh1103', '1763', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6906', '2017-10-16', 'yh1103', '1791', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6907', '2017-10-17', 'yh1103', '2360', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6908', '2017-10-18', 'yh1103', '1757', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6909', '2017-10-19', 'yh1103', '2016', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6910', '2017-10-20', 'yh1103', '1865', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6911', '2017-10-21', 'yh1103', '1831', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6912', '2017-10-22', 'yh1103', '1934', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6913', '2017-10-23', 'yh1103', '1854', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6914', '2017-10-24', 'yh1103', '1815', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6915', '2017-10-25', 'yh1103', '1795', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6916', '2017-10-26', 'yh1103', '2318', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6917', '2017-10-27', 'yh1103', '2185', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6918', '2017-10-28', 'yh1103', '2007', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6919', '2017-10-29', 'yh1103', '1810', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6920', '2017-10-30', 'yh1103', '1240', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6921', '2017-10-31', 'yh1103', '1067', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6922', '2017-11-01', 'yh1103', '854', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6923', '2017-11-02', 'yh1103', '868', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6924', '2017-11-03', 'yh1103', '798', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6925', '2017-11-04', 'yh1103', '812', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6926', '2017-11-05', 'yh1103', '787', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6927', '2017-11-06', 'yh1103', '1114', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6928', '2017-11-07', 'yh1103', '1077', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6929', '2017-11-08', 'yh1103', '1148', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6930', '2017-11-09', 'yh1103', '1286', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6931', '2017-11-10', 'yh1103', '1120', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6932', '2017-11-11', 'yh1103', '1209', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6933', '2017-11-12', 'yh1103', '1175', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6934', '2017-11-13', 'yh1103', '1227', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6935', '2017-11-14', 'yh1103', '1079', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6936', '2017-11-15', 'yh1103', '1249', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6937', '2017-11-16', 'yh1103', '1324', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6938', '2017-11-17', 'yh1103', '1370', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6939', '2017-11-18', 'yh1103', '1220', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6940', '2017-11-19', 'yh1103', '1328', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6941', '2017-11-20', 'yh1103', '1313', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6942', '2017-11-21', 'yh1103', '1232', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6943', '2017-11-22', 'yh1103', '1392', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6944', '2017-11-23', 'yh1103', '1372', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6945', '2017-11-24', 'yh1103', '1182', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6946', '2017-11-25', 'yh1103', '1324', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6947', '2017-11-26', 'yh1103', '1299', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6948', '2017-11-27', 'yh1103', '1244', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6949', '2017-11-28', 'yh1103', '1462', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6950', '2017-11-29', 'yh1103', '1131', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6951', '2017-11-30', 'yh1103', '1107', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6952', '2017-12-01', 'yh1103', '991', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6953', '2017-12-02', 'yh1103', '828', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6954', '2017-12-03', 'yh1103', '872', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6955', '2017-12-04', 'yh1103', '1037', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6956', '2017-12-05', 'yh1103', '1019', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6957', '2017-12-06', 'yh1103', '1074', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6958', '2017-12-07', 'yh1103', '1319', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6959', '2017-12-08', 'yh1103', '1250', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6960', '2017-12-09', 'yh1103', '1087', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6961', '2017-12-10', 'yh1103', '1174', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6962', '2017-12-11', 'yh1103', '1368', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6963', '2017-12-12', 'yh1103', '1408', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6964', '2017-12-13', 'yh1103', '1196', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6965', '2017-12-14', 'yh1103', '1213', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6966', '2017-12-15', 'yh1103', '1198', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6967', '2017-12-16', 'yh1103', '1293', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6968', '2017-12-17', 'yh1103', '1435', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6969', '2017-12-18', 'yh1103', '1384', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6970', '2017-12-19', 'yh1103', '1280', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6971', '2017-12-20', 'yh1103', '1259', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6972', '2017-12-21', 'yh1103', '1455', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6973', '2017-12-22', 'yh1103', '1353', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6974', '2017-12-23', 'yh1103', '1409', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6975', '2017-12-24', 'yh1103', '1376', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6976', '2017-12-25', 'yh1103', '1503', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6977', '2017-12-26', 'yh1103', '1465', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6978', '2017-12-27', 'yh1103', '1555', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6979', '2017-12-28', 'yh1103', '1708', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6980', '2017-12-29', 'yh1103', '1403', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6981', '2017-12-30', 'yh1103', '1182', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6982', '2017-12-31', 'yh1103', '979', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6983', '2018-01-01', 'yh1103', '1008', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6984', '2018-01-02', 'yh1103', '1125', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6985', '2018-01-03', 'yh1103', '1088', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6986', '2018-01-04', 'yh1103', '978', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6987', '2018-01-05', 'yh1103', '1023', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6988', '2018-01-06', 'yh1103', '587', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6989', '2018-01-07', 'yh1103', '1090', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6990', '2018-01-08', 'yh1103', '1111', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6991', '2018-01-09', 'yh1103', '879', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6992', '2018-01-10', 'yh1103', '930', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6993', '2018-01-11', 'yh1103', '852', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6994', '2018-01-12', 'yh1103', '1008', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6995', '2018-01-13', 'yh1103', '1043', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6996', '2018-01-14', 'yh1103', '1078', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6997', '2018-01-15', 'yh1103', '1089', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6998', '2018-01-16', 'yh1103', '996', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('6999', '2018-01-17', 'yh1103', '1110', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7000', '2018-01-18', 'yh1103', '1035', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7001', '2018-01-19', 'yh1103', '1103', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7002', '2018-01-20', 'yh1103', '1039', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7003', '2018-01-21', 'yh1103', '1136', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7004', '2018-01-22', 'yh1103', '1368', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7005', '2018-01-23', 'yh1103', '1039', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7006', '2018-01-24', 'yh1103', '1098', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7007', '2018-01-25', 'yh1103', '953', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7008', '2018-01-26', 'yh1103', '837', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7009', '2018-01-27', 'yh1103', '764', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7010', '2018-01-28', 'yh1103', '622', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7011', '2018-01-29', 'yh1103', '718', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7012', '2018-01-30', 'yh1103', '642', null, null, null, null, null, null, null);
INSERT INTO `sys_data` VALUES ('7013', '2018-01-31', 'yh1103', '627', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_car
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `message_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1677 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('1665', '2018-10-02', '小三', '666.66', null);
INSERT INTO `t_car` VALUES ('1666', '2018-10-02', '大花', '666.66', null);
INSERT INTO `t_car` VALUES ('1667', '2018-10-02', '小花', '666.66', null);
INSERT INTO `t_car` VALUES ('1668', '2018-10-01', '小花', '666.66', null);
INSERT INTO `t_car` VALUES ('1669', '2018-10-01', '小花', '666.66', null);
INSERT INTO `t_car` VALUES ('1670', '2018-10-01', '小花', '666.66', null);
INSERT INTO `t_car` VALUES ('1671', '2018-10-01', '小花', '666.66', null);
INSERT INTO `t_car` VALUES ('1672', '2018-10-01', '小花', '666.66', null);
INSERT INTO `t_car` VALUES ('1673', '2018-10-01', '小花', '666.66', null);
INSERT INTO `t_car` VALUES ('1674', '2018-10-01', '小花', '666.66', null);
INSERT INTO `t_car` VALUES ('1675', '2018-10-01', '小花', '666.66', null);
INSERT INTO `t_car` VALUES ('1676', '2018-10-01', '小花', '666.66', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `nickName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '123', '1', '万斯大魔王');
INSERT INTO `users` VALUES ('2', 'user', '123', '2', '最快乐的');
INSERT INTO `users` VALUES ('3', '13662339653', '1234', '1', '大帅哥');
INSERT INTO `users` VALUES ('7', 'test', 'test', '3', '小花');
