/*
Navicat MySQL Data Transfer

Source Server         : 39.98.147.216
Source Server Version : 50715
Source Host           : 39.98.147.216:3306
Source Database       : smart_medical

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2020-07-05 17:21:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_medical_records
-- ----------------------------
DROP TABLE IF EXISTS `tb_medical_records`;
CREATE TABLE `tb_medical_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(100) NOT NULL,
  `doctor_id` varchar(100) NOT NULL,
  `record` varchar(500) NOT NULL,
  `treatment_plan` varchar(255) NOT NULL,
  `sort` int(2) NOT NULL DEFAULT '0',
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medical_records
-- ----------------------------

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `full_parh` varchar(300) NOT NULL,
  `level` int(2) NOT NULL DEFAULT '0',
  `sort` int(3) NOT NULL DEFAULT '0',
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '1', '用户管理', '-1', '1', '1', '0', '0', 'bee', 'bee', '2020-07-04 13:07:38', '2020-07-04 13:07:42');
INSERT INTO `tb_menu` VALUES ('2', '2', '特征管理', '-1', '2', '1', '0', '0', 'bee', 'bee', '2020-07-04 13:10:22', '2020-07-04 13:10:24');
INSERT INTO `tb_menu` VALUES ('3', '3', '科室管理', '-1', '3', '1', '0', '0', 'bee', 'bee', '2020-07-04 13:11:36', '2020-07-04 13:11:38');
INSERT INTO `tb_menu` VALUES ('4', '4', '新增特征', '2', '2/4', '2', '0', '0', 'bee', 'bee', '2020-07-04 23:32:30', '2020-07-04 23:32:37');

-- ----------------------------
-- Table structure for tb_menu_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu_user`;
CREATE TABLE `tb_menu_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menu_user
-- ----------------------------

-- ----------------------------
-- Table structure for tb_patient_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_patient_info`;
CREATE TABLE `tb_patient_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `name` varchar(15) NOT NULL,
  `post_id` varchar(20) NOT NULL,
  `sex` int(2) NOT NULL DEFAULT '1',
  `medical_history` varchar(1000) NOT NULL,
  `sort` int(2) NOT NULL DEFAULT '0',
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_patient_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_code` varchar(255) NOT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '1', '医生', 'ROLE_DOCTOR', '0', 'bee', 'bee', '2020-07-04 10:07:36', '2020-07-04 10:07:39');
INSERT INTO `tb_role` VALUES ('2', '2', '管理员', 'ROLE_ADMIN', '0', 'bee', 'bee', '2020-07-04 10:08:54', '2020-07-04 10:08:51');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(100) NOT NULL,
  `menu_id` varchar(100) NOT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for tb_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_user`;
CREATE TABLE `tb_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_user
-- ----------------------------
INSERT INTO `tb_role_user` VALUES ('2', '2', 'top', '0', 'bee', 'bee', '2020-07-05 12:29:11', '2020-07-05 12:29:14');
INSERT INTO `tb_role_user` VALUES ('3', '1', '123456', '0', 'bee', 'bee', '2020-07-05 12:30:15', '2020-07-05 12:30:18');
INSERT INTO `tb_role_user` VALUES ('4', '1', '4561238', '0', 'bee', 'bee', '2020-07-05 12:53:21', '2020-07-05 12:53:24');
INSERT INTO `tb_role_user` VALUES ('5', '1', 'ceacd915-2878-4914-bc4d-ba1cce20aace', '0', 'bee1', 'bee1', '2020-07-05 06:20:34', '2020-07-05 06:20:35');
INSERT INTO `tb_role_user` VALUES ('6', '1', 'f1fbaff6-41ce-47a9-9831-e98d88d6e39f', '0', 'bee11', 'bee11', '2020-07-05 07:13:22', '2020-07-05 07:13:22');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sort` int(2) NOT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'top', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, null, '0', '0', 'bee', 'bee', '2020-07-04 22:41:39', '2020-07-04 22:41:42');
INSERT INTO `tb_user` VALUES ('2', '123456', 'bee', 'e10adc3949ba59abbe56e057f20f883e', '17638917808', '2476316225@qq.com', '1', '0', 'bee', 'bee', '2020-07-05 11:31:09', '2020-07-05 11:31:12');
INSERT INTO `tb_user` VALUES ('3', 'ceacd915-2878-4914-bc4d-ba1cce20aace', 'bee1', 'e10adc3949ba59abbe56e057f20f883e', '15903991827', '247636225@qq.com', '3', '0', 'bee1', 'bee1', '2020-07-05 06:20:30', '2020-07-05 06:20:31');
INSERT INTO `tb_user` VALUES ('4', 'f1fbaff6-41ce-47a9-9831-e98d88d6e39f', 'bee11', 'e10adc3949ba59abbe56e057f20f883e', '15903191827', '247636125@qq.com', '4', '0', 'bee11', 'bee11', '2020-07-05 07:13:22', '2020-07-05 07:13:22');
