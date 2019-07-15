/*
 Navicat Premium Data Transfer

 Source Server         : 阿狗
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 15/07/2019 22:39:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `custName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custMobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custLevel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `t_customer_ibfk_1`(`custLevel`) USING BTREE,
  CONSTRAINT `t_customer_ibfk_1` FOREIGN KEY (`custLevel`) REFERENCES `t_dict` (`did`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, '百度', '网络', '400-800-8888', '15516980142', 1);
INSERT INTO `t_customer` VALUES (2, '新浪', '网络', '400-690-0000', '18703735051', 2);
INSERT INTO `t_customer` VALUES (3, '网易', '网络', '0571-26201163', '13586982572', 2);
INSERT INTO `t_customer` VALUES (4, '腾讯', '移动', '0755-83765566', '15058522683', 1);
INSERT INTO `t_customer` VALUES (5, '阿里巴巴', '网络', '400-800-1688', '78878787878', 2);
INSERT INTO `t_customer` VALUES (7, '胡亚宾', '捡的', '7474741', '18339587506', 3);
INSERT INTO `t_customer` VALUES (8, '浏阳河', '市场', '546546', '23213843', 1);

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, '普通客户');
INSERT INTO `t_dict` VALUES (2, 'vip客户');
INSERT INTO `t_dict` VALUES (3, '穷逼');

-- ----------------------------
-- Table structure for t_linkman
-- ----------------------------
DROP TABLE IF EXISTS `t_linkman`;
CREATE TABLE `t_linkman`  (
  `linkid` int(11) NOT NULL AUTO_INCREMENT,
  `linkName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkGender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkMobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clid` int(11) NOT NULL,
  PRIMARY KEY (`linkid`) USING BTREE,
  INDEX `t_linkman_ibfk_1`(`clid`) USING BTREE,
  CONSTRAINT `t_linkman_ibfk_1` FOREIGN KEY (`clid`) REFERENCES `t_customer` (`cid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_linkman
-- ----------------------------
INSERT INTO `t_linkman` VALUES (1, '小杨', '女', '656556', '222', 1);
INSERT INTO `t_linkman` VALUES (2, 'rose', '女', '654545', '98889', 3);
INSERT INTO `t_linkman` VALUES (3, '小丽', '女', '12356', '595988', 1);
INSERT INTO `t_linkman` VALUES (4, 'jim', '男', '12333', '8989595', 1);
INSERT INTO `t_linkman` VALUES (5, '小李', '男', '23123', '221321', 2);
INSERT INTO `t_linkman` VALUES (6, '小胡', '男', '3636336', '15516901325', 4);
INSERT INTO `t_linkman` VALUES (7, '小兵', '男', '456587945', '546421', 8);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'Tom', '123456', '日本');
INSERT INTO `t_user` VALUES (2, 'rose', '654321', '韩国');
INSERT INTO `t_user` VALUES (4, '小明', '999', '上海');
INSERT INTO `t_user` VALUES (5, '宝宝', '455556', '浙江');
INSERT INTO `t_user` VALUES (8, '小白', '123456', '郑州');
INSERT INTO `t_user` VALUES (9, '亚宾', '111', '大阪');
INSERT INTO `t_user` VALUES (10, '小白', '123456', '郑州');
INSERT INTO `t_user` VALUES (11, '小白', '123456', '郑州');
INSERT INTO `t_user` VALUES (12, 'hello', '111', '上海');

-- ----------------------------
-- Table structure for t_visit
-- ----------------------------
DROP TABLE IF EXISTS `t_visit`;
CREATE TABLE `t_visit`  (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `vaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uvid` int(11) NOT NULL,
  `cvid` int(11) NOT NULL,
  `vcontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`vid`) USING BTREE,
  INDEX `uvid`(`uvid`) USING BTREE,
  INDEX `t_visit_ibfk_2`(`cvid`) USING BTREE,
  CONSTRAINT `t_visit_ibfk_1` FOREIGN KEY (`uvid`) REFERENCES `t_user` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `t_visit_ibfk_2` FOREIGN KEY (`cvid`) REFERENCES `t_customer` (`cid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_visit
-- ----------------------------
INSERT INTO `t_visit` VALUES (1, '百度To阿里巴巴', 12, 5, '百度To阿里巴巴');
INSERT INTO `t_visit` VALUES (2, '拜访地址新浪新浪', 4, 2, '新浪新浪新浪新浪');
INSERT INTO `t_visit` VALUES (6, '加拿大', 1, 1, '你猜');
INSERT INTO `t_visit` VALUES (7, '中国 杭州', 2, 5, '交易');
INSERT INTO `t_visit` VALUES (8, '英国', 2, 3, '售后');
INSERT INTO `t_visit` VALUES (9, '韩国', 2, 8, '洽谈');
INSERT INTO `t_visit` VALUES (10, '日本', 2, 1, '你猜');
INSERT INTO `t_visit` VALUES (11, '南非', 1, 1, '抢劫');
INSERT INTO `t_visit` VALUES (12, '拜访地址', 9, 4, '拜访内容');
INSERT INTO `t_visit` VALUES (13, '拜访地址', 1, 1, '拜访内容');
INSERT INTO `t_visit` VALUES (14, '拜访地址', 1, 1, '拜访内容');
INSERT INTO `t_visit` VALUES (15, '拜访地址', 1, 1, '拜访内容');
INSERT INTO `t_visit` VALUES (16, '拜访地址', 1, 1, '拜访内容');
INSERT INTO `t_visit` VALUES (17, '拜访地址', 1, 1, '拜访内容');
INSERT INTO `t_visit` VALUES (18, '拜访地址1', 4, 3, '拜访内容3');
INSERT INTO `t_visit` VALUES (19, '拜访地址', 4, 2, '拜访内容3');

SET FOREIGN_KEY_CHECKS = 1;
