/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50533
Source Host           : localhost:3306
Source Database       : g

Target Server Type    : MYSQL
Target Server Version : 50533
File Encoding         : 65001

Date: 2013-11-13 17:52:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `last_ip` varchar(30) NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  `join_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'admin', 'admin', '9', '127.0.0.1', '0', '0');
INSERT INTO `account` VALUES ('2', 'wang', 'wang', '0', '127.0.0.1', '0', '0');

-- ----------------------------
-- Table structure for `character`
-- ----------------------------
DROP TABLE IF EXISTS `character`;
CREATE TABLE `character` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `exp` int(10) unsigned NOT NULL,
  `money` int(10) unsigned NOT NULL,
  `race` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `class` tinyint(4) NOT NULL DEFAULT '1',
  `hp` smallint(5) unsigned NOT NULL,
  `maxhp` smallint(5) unsigned NOT NULL,
  `mp` smallint(5) unsigned NOT NULL,
  `maxmp` smallint(5) unsigned NOT NULL,
  `del` tinyint(3) unsigned NOT NULL,
  `deltime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of character
-- ----------------------------
INSERT INTO `character` VALUES ('1', '1', 'Admin', '15', '10', '999999', '1', '1', '100', '100', '100', '100', '0', '0');
INSERT INTO `character` VALUES ('2', '2', 'Wang', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `creature_template`
-- ----------------------------
DROP TABLE IF EXISTS `creature_template`;
CREATE TABLE `creature_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of creature_template
-- ----------------------------

-- ----------------------------
-- Table structure for `item_subclass`
-- ----------------------------
DROP TABLE IF EXISTS `item_subclass`;
CREATE TABLE `item_subclass` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_subclass
-- ----------------------------

-- ----------------------------
-- Table structure for `item_template`
-- ----------------------------
DROP TABLE IF EXISTS `item_template`;
CREATE TABLE `item_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `class` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `subclass` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `level` smallint(5) unsigned NOT NULL,
  `required_level` smallint(5) unsigned NOT NULL,
  `quality` tinyint(3) unsigned NOT NULL,
  `bonding` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_template
-- ----------------------------

-- ----------------------------
-- Table structure for `object_template`
-- ----------------------------
DROP TABLE IF EXISTS `object_template`;
CREATE TABLE `object_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of object_template
-- ----------------------------

-- ----------------------------
-- Table structure for `world`
-- ----------------------------
DROP TABLE IF EXISTS `world`;
CREATE TABLE `world` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world
-- ----------------------------

-- ----------------------------
-- Table structure for `x_config`
-- ----------------------------
DROP TABLE IF EXISTS `x_config`;
CREATE TABLE `x_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_config
-- ----------------------------

-- ----------------------------
-- Table structure for `y_skill`
-- ----------------------------
DROP TABLE IF EXISTS `y_skill`;
CREATE TABLE `y_skill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of y_skill
-- ----------------------------
INSERT INTO `y_skill` VALUES ('1', '魔法', '1', '魔法的技巧');
INSERT INTO `y_skill` VALUES ('2', '战术', '1', '战斗的技巧');
INSERT INTO `y_skill` VALUES ('3', '双持', '1', null);
INSERT INTO `y_skill` VALUES ('4', '盾术', '1', null);
INSERT INTO `y_skill` VALUES ('5', '剑', '1', null);
INSERT INTO `y_skill` VALUES ('6', '斧', '1', null);
INSERT INTO `y_skill` VALUES ('7', '锤', '1', null);
INSERT INTO `y_skill` VALUES ('8', '棍', '1', null);
INSERT INTO `y_skill` VALUES ('9', '弓', '1', null);
INSERT INTO `y_skill` VALUES ('10', '火', '1', null);
INSERT INTO `y_skill` VALUES ('11', '水', '1', null);
INSERT INTO `y_skill` VALUES ('12', '风', '1', null);
INSERT INTO `y_skill` VALUES ('13', '土', '1', null);
INSERT INTO `y_skill` VALUES ('14', '光', '1', null);
INSERT INTO `y_skill` VALUES ('15', '暗', '1', null);
INSERT INTO `y_skill` VALUES ('31', '急救', '0', null);
INSERT INTO `y_skill` VALUES ('32', '骑术', '0', null);
INSERT INTO `y_skill` VALUES ('33', '钓鱼', '0', null);
INSERT INTO `y_skill` VALUES ('34', '采药', '0', null);
INSERT INTO `y_skill` VALUES ('35', '剥皮', '0', null);
INSERT INTO `y_skill` VALUES ('36', '采矿', '0', null);
INSERT INTO `y_skill` VALUES ('37', '伐木', '0', null);
INSERT INTO `y_skill` VALUES ('61', '烹饪', '0', null);
INSERT INTO `y_skill` VALUES ('62', '炼金', '0', null);
INSERT INTO `y_skill` VALUES ('63', '裁缝', '0', null);
INSERT INTO `y_skill` VALUES ('64', '制皮', '0', null);
INSERT INTO `y_skill` VALUES ('65', '锻造', '0', null);
INSERT INTO `y_skill` VALUES ('66', '珠宝加工', '0', null);
INSERT INTO `y_skill` VALUES ('67', '木匠', '0', null);
INSERT INTO `y_skill` VALUES ('68', '工程', '0', null);
INSERT INTO `y_skill` VALUES ('69', '附魔', '0', null);
INSERT INTO `y_skill` VALUES ('70', '铭文', '0', null);
INSERT INTO `y_skill` VALUES ('71', '机关', '0', null);
INSERT INTO `y_skill` VALUES ('72', '驯兽术', '0', null);

-- ----------------------------
-- Table structure for `y_spell`
-- ----------------------------
DROP TABLE IF EXISTS `y_spell`;
CREATE TABLE `y_spell` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of y_spell
-- ----------------------------

-- ----------------------------
-- Table structure for `zone`
-- ----------------------------
DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zone
-- ----------------------------

-- ----------------------------
-- Table structure for `z_character_class_copy`
-- ----------------------------
DROP TABLE IF EXISTS `z_character_class_copy`;
CREATE TABLE `z_character_class_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_character_class_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `z_character_race`
-- ----------------------------
DROP TABLE IF EXISTS `z_character_race`;
CREATE TABLE `z_character_race` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_character_race
-- ----------------------------

-- ----------------------------
-- Table structure for `z_item_class`
-- ----------------------------
DROP TABLE IF EXISTS `z_item_class`;
CREATE TABLE `z_item_class` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_item_class
-- ----------------------------
INSERT INTO `z_item_class` VALUES ('1', '武器', null);
INSERT INTO `z_item_class` VALUES ('2', '护甲', null);
INSERT INTO `z_item_class` VALUES ('3', '原材料', null);

-- ----------------------------
-- Table structure for `z_skill_class`
-- ----------------------------
DROP TABLE IF EXISTS `z_skill_class`;
CREATE TABLE `z_skill_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_skill_class
-- ----------------------------
