/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : springcloud

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2018-09-27 15:16:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user1', 'u1', '17', 'beizhu1');
INSERT INTO `user` VALUES ('2', 'user2', 'u2', '24', 'beizhu2');
