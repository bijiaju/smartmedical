/*
Navicat MySQL Data Transfer

Source Server         : 39.98.147.216
Source Server Version : 50705
Source Host           : 39.98.147.216:3306
Source Database       : smart_medical

Target Server Type    : MYSQL
Target Server Version : 50705
File Encoding         : 65001

Date: 2020-12-01 14:55:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for idaas_account_extend
-- ----------------------------
DROP TABLE IF EXISTS `idaas_account_extend`;
CREATE TABLE `idaas_account_extend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(50) DEFAULT NULL,
  `account_id` varchar(50) NOT NULL,
  `attr_id` varchar(50) NOT NULL,
  `attr_field_name` varchar(200) NOT NULL,
  `attr_field_value` varchar(1000) DEFAULT NULL COMMENT '文本类：存储具体的文字内容\n            数字类：存储数字\n            选项类：存储选项编号，多个选项",''隔开',
  `extend` varchar(200) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `create_number` varchar(50) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `update_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_account_extend_account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of idaas_account_extend
-- ----------------------------

-- ----------------------------
-- Table structure for idaas_extend_attr
-- ----------------------------
DROP TABLE IF EXISTS `idaas_extend_attr`;
CREATE TABLE `idaas_extend_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `category` int(11) NOT NULL COMMENT '0：组织机构\n            1：组\n            2：账户',
  `attr_name` varchar(100) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `field_type` varchar(50) NOT NULL COMMENT 'single-line-text：文本\n            multiple-line-text：多行文本\n            integer-number：整数\n            real-number：实数\n            single-selection：单选\n            mutiple-selection：多选\n            dropdown-single-selection：下拉单选\n            dropdown-multiple-selection：下拉多选\n            date：日期\n            time：时间\n            datetime：日期时间',
  `is_fill` int(11) DEFAULT NULL,
  `is_modify` int(11) DEFAULT NULL,
  `is_unique` int(11) DEFAULT NULL,
  `is_valid` int(11) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `extend` varchar(200) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `create_number` varchar(50) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `update_number` varchar(50) DEFAULT NULL,
  `foreign_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_delete_valid` (`category`,`is_delete`,`is_valid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='组织机构、组、账户的自定义扩展属性定义';

-- ----------------------------
-- Records of idaas_extend_attr
-- ----------------------------
INSERT INTO `idaas_extend_attr` VALUES ('28', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', 'temp', '0', '年龄-不用', 'age', 'single-selection', '1', '1', '0', '0', '', '100', null, '0', '2020-09-06 01:53:43', 'bee', '2020-10-31 02:13:23', 'YWJ', '');
INSERT INTO `idaas_extend_attr` VALUES ('29', '4e5f8081-f673-42ab-8b55-e0098bf8b2f2', 'temp', '0', '性别', 'sex', 'single-selection', '1', '1', '0', '1', '', '9', null, '0', '2020-09-06 01:55:23', 'bee', '2020-09-06 04:09:08', 'bee', 'id002');
INSERT INTO `idaas_extend_attr` VALUES ('30', 'dfef97bf-3646-4b5a-bce5-c9ca385b8eed', 'temp', '0', '吸烟', 'smoke', 'single-selection', '1', '1', '0', '1', '', '10', null, '0', '2020-09-06 01:56:09', 'bee', '2020-09-06 05:37:45', 'bee', 'id003');
INSERT INTO `idaas_extend_attr` VALUES ('31', '8cf70fa8-a3de-471f-8560-8dd6a4e7843f', 'temp', '0', '喝酒', 'drink', 'single-selection', '1', '1', '0', '1', '', '11', null, '0', '2020-09-06 01:59:10', 'bee', '2020-09-06 05:37:41', 'bee', 'id004');
INSERT INTO `idaas_extend_attr` VALUES ('35', '2fbefa39-8c30-4146-9da6-43c6afe93278', 'temp', '1', '声嘶', 'hoarseness', 'single-selection', '1', '1', '0', '1', '', '15', null, '0', '2020-09-06 02:03:25', 'bee', '2020-09-06 05:37:38', 'bee', 'id005');
INSERT INTO `idaas_extend_attr` VALUES ('36', 'e293cd4f-df01-4419-8f3b-cb370e58c1a3', 'temp', '1', '咽/喉痛', 'sore-throat', 'single-selection', '1', '1', '0', '1', '', '16', null, '0', '2020-09-06 02:04:20', 'bee', '2020-09-06 05:37:34', 'bee', 'id006');
INSERT INTO `idaas_extend_attr` VALUES ('37', 'f57c8d03-5233-4fa5-949b-ffc38967072a', 'temp', '2', '肿物形态', 'tumor', 'single-selection', '1', '1', '0', '1', '', '17', null, '0', '2020-09-06 02:05:36', 'bee', '2020-09-06 05:37:30', 'bee', 'id013');
INSERT INTO `idaas_extend_attr` VALUES ('38', '806800f4-5e51-4da5-b0d4-6bcfe7edd3f1', 'temp', '2', '肿物色泽', 'tumor-color', 'single-selection', '1', '1', '0', '1', '', '18', null, '0', '2020-09-06 02:06:36', 'bee', '2020-09-06 05:37:25', 'bee', 'id014');
INSERT INTO `idaas_extend_attr` VALUES ('39', '4396079c-cb6f-4f69-8e32-68dc71b77605', 'temp', '1', '咽/喉部异物感', 'aa', 'single-selection', '1', '1', '0', '1', '', '19', null, '0', '2020-09-06 09:00:18', 'bee', '2020-09-06 09:00:18', 'bee', 'id007');
INSERT INTO `idaas_extend_attr` VALUES ('40', 'ff1d81d9-d3cd-421a-9338-cdebbe9b806c', 'temp', '1', '痰中带血', 'ae', 'single-selection', '1', '1', '0', '1', '', '20', null, '0', '2020-09-06 09:01:05', 'bee', '2020-09-06 09:01:05', 'bee', 'id008');
INSERT INTO `idaas_extend_attr` VALUES ('41', '77507fa2-c78a-46ca-ad8a-8a0f3a0883f1', 'temp', '1', '呼吸困难', 'aq', 'single-selection', '1', '1', '0', '1', '', '21', null, '0', '2020-09-06 09:01:48', 'bee', '2020-09-06 09:01:48', 'bee', 'id009');
INSERT INTO `idaas_extend_attr` VALUES ('42', '6f4891ef-16de-4ad8-804a-d3aa7d351ca3', 'temp', '1', '咳嗽', 'eq', 'single-selection', '1', '1', '0', '1', '', '22', null, '0', '2020-09-06 09:02:26', 'bee', '2020-09-06 09:02:26', 'bee', 'id010');
INSERT INTO `idaas_extend_attr` VALUES ('43', 'fd3e22af-bb96-4ce9-a34b-bbd5872b8958', 'temp', '1', '咳痰', 'r', 'single-selection', '1', '1', '0', '1', '', '23', null, '0', '2020-09-06 09:03:04', 'bee', '2020-09-06 09:03:04', 'bee', 'id011');
INSERT INTO `idaas_extend_attr` VALUES ('44', '1bf425d5-6992-423e-a01d-0411dd8ca928', 'temp', '1', '吞咽困难', 'y', 'single-selection', '1', '1', '0', '1', '', '24', null, '0', '2020-09-06 09:03:51', 'bee', '2020-09-06 09:03:51', 'bee', 'id012');
INSERT INTO `idaas_extend_attr` VALUES ('45', '9cec4a5d-6bc1-4910-8dee-b3898a1abab4', 'temp', '2', '声带活动', 'rt', 'single-selection', '1', '1', '0', '1', '', '25', null, '0', '2020-09-06 09:04:34', 'bee', '2020-09-06 09:04:34', 'bee', 'id015');
INSERT INTO `idaas_extend_attr` VALUES ('46', 'fe432dc4-0a79-4173-984c-8f0c5f6706ad', 'temp', '2', '累计范围：累及多个他部位包括声带、前联合、后联合、会厌，杓状软骨、室带、声门下、舌会厌襞、环后区、梨状窝、咽后壁等', 'yt', 'single-selection', '1', '1', '0', '1', '', '26', null, '0', '2020-09-06 09:05:38', 'bee', '2020-09-06 09:05:38', 'bee', 'id016');
INSERT INTO `idaas_extend_attr` VALUES ('49', 'd9427c79-5f0e-4e06-9611-6574f9bfe15b', 'temp', '0', '年龄', 'ageAA', 'integer-number', '1', '1', '0', '1', '', '8', null, '0', '2020-10-30 15:07:16', 'YWJ', '2020-10-31 02:13:35', 'YWJ', 'id001');
INSERT INTO `idaas_extend_attr` VALUES ('50', '00f69c7c-f383-442a-8513-1242989e0985', 'temp', '1', '测试特性哈哈哈', 'Idinhaha', 'multiple-selection', '1', '1', '1', '0', '', '101', null, '1', '2020-11-24 01:39:46', 'YWJ', '2020-11-26 03:28:36', 'YWJ', null);

-- ----------------------------
-- Table structure for idaas_extend_attr_config_number
-- ----------------------------
DROP TABLE IF EXISTS `idaas_extend_attr_config_number`;
CREATE TABLE `idaas_extend_attr_config_number` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attr_id` varchar(50) NOT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `min_value` varchar(100) DEFAULT NULL,
  `max_value` varchar(100) DEFAULT NULL,
  `default_value` varchar(1000) DEFAULT NULL,
  `extend` varchar(200) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `create_number` varchar(50) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `update_number` varchar(50) DEFAULT NULL,
  `foreign_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attr_id_delete` (`attr_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of idaas_extend_attr_config_number
-- ----------------------------
INSERT INTO `idaas_extend_attr_config_number` VALUES ('1', 'd9427c79-5f0e-4e06-9611-6574f9bfe15b', '', '', '', '', null, '0', '2020-10-30 15:07:16', 'YWJ', '2020-10-31 02:13:35', 'YWJ', null);

-- ----------------------------
-- Table structure for idaas_extend_attr_config_selection
-- ----------------------------
DROP TABLE IF EXISTS `idaas_extend_attr_config_selection`;
CREATE TABLE `idaas_extend_attr_config_selection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) NOT NULL,
  `attr_id` varchar(50) NOT NULL,
  `select_value` varchar(255) DEFAULT NULL,
  `content` varchar(1000) NOT NULL,
  `is_default` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `extend` varchar(200) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `create_number` varchar(50) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `update_number` varchar(50) DEFAULT NULL,
  `foreign_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attr_id_delete` (`attr_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of idaas_extend_attr_config_selection
-- ----------------------------
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('24', '96e5845f-b3c0-4838-8fe4-a29f2de0d3b5', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '1', '年轻', '0', '1', null, '0', '2020-09-06 01:53:43', 'bee', '2020-10-31 02:13:23', 'YWJ', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('25', '7cbcbecf-ba55-4bbf-9666-846360274c99', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '2', '中年', '0', '2', null, '0', '2020-09-06 01:53:43', 'bee', '2020-10-31 02:13:23', 'YWJ', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('26', '4fa62a65-e792-47f3-8e8b-816d65061c8e', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '3', '老年', '0', '3', null, '0', '2020-09-06 01:53:43', 'bee', '2020-10-31 02:13:23', 'YWJ', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('27', '9f20fe82-c398-4b6e-95af-468101398ce3', '4e5f8081-f673-42ab-8b55-e0098bf8b2f2', '1', '男', '0', '1', null, '0', '2020-09-06 01:55:23', 'bee', '2020-09-06 04:09:08', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('28', '10789533-07d7-4be5-b170-0ea42c7f6c10', '4e5f8081-f673-42ab-8b55-e0098bf8b2f2', '2', '女', '0', '2', null, '0', '2020-09-06 01:55:23', 'bee', '2020-09-06 04:09:08', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('29', '90532938-f9c6-4285-a79e-411d9b0eebdd', 'dfef97bf-3646-4b5a-bce5-c9ca385b8eed', '1', '吸烟', '0', '1', null, '0', '2020-09-06 01:56:09', 'bee', '2020-09-06 05:37:45', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('30', 'da5d30fa-a2dd-4a0d-98ca-d96503f08bdb', 'dfef97bf-3646-4b5a-bce5-c9ca385b8eed', '0', '不吸烟', '0', '2', null, '0', '2020-09-06 01:56:09', 'bee', '2020-09-06 05:37:45', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('31', 'd20c5cf4-40ed-4cdc-9549-5c34e700953a', '8cf70fa8-a3de-471f-8560-8dd6a4e7843f', '1', '喝酒', '0', '1', null, '0', '2020-09-06 01:59:10', 'bee', '2020-09-06 05:37:41', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('32', 'd32d04d6-3380-4592-9f8e-5aa25b50d28e', '8cf70fa8-a3de-471f-8560-8dd6a4e7843f', '0', '不喝酒', '0', '2', null, '0', '2020-09-06 01:59:10', 'bee', '2020-09-06 05:37:42', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('39', '3e73e89e-b02e-455c-ae2b-5e82f273e02e', '2fbefa39-8c30-4146-9da6-43c6afe93278', '1', '声嘶', '0', '1', null, '0', '2020-09-06 02:03:25', 'bee', '2020-09-06 05:37:38', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('40', '3cb00ec6-596f-4bca-a9e3-3de63aeca849', '2fbefa39-8c30-4146-9da6-43c6afe93278', '0', '无声嘶', '0', '2', null, '0', '2020-09-06 02:03:25', 'bee', '2020-09-06 05:37:38', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('41', '699c8e0f-a8d4-48ab-b5ca-36316bf62ae5', 'e293cd4f-df01-4419-8f3b-cb370e58c1a3', '1', '痛', '0', '1', null, '0', '2020-09-06 02:04:20', 'bee', '2020-09-06 05:37:34', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('42', 'e617d840-0e41-4571-b76d-957137e33ae9', 'e293cd4f-df01-4419-8f3b-cb370e58c1a3', '0', '无痛', '0', '2', null, '0', '2020-09-06 02:04:20', 'bee', '2020-09-06 05:37:34', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('43', '9af6d4c1-4593-44f7-95d6-10621052bfcc', 'f57c8d03-5233-4fa5-949b-ffc38967072a', '1', '粗糙', '0', '1', null, '0', '2020-09-06 02:05:36', 'bee', '2020-09-06 05:37:30', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('44', '39b183b1-e307-41fd-97c2-93eb8dafb500', 'f57c8d03-5233-4fa5-949b-ffc38967072a', '0', '光滑', '0', '2', null, '0', '2020-09-06 02:05:36', 'bee', '2020-09-06 05:37:30', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('45', 'c8baa280-a0a8-4880-ab37-2432b6c43261', '806800f4-5e51-4da5-b0d4-6bcfe7edd3f1', '1', '白色', '0', '1', null, '0', '2020-09-06 02:06:36', 'bee', '2020-09-06 05:37:25', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('46', '61e2d824-4d81-4849-99f8-eb15642d634e', '806800f4-5e51-4da5-b0d4-6bcfe7edd3f1', '0', '粉色', '0', '2', null, '0', '2020-09-06 02:06:36', 'bee', '2020-09-06 05:37:25', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('47', '723ddf8f-f6eb-47df-8478-e1f62f6b7b20', '4396079c-cb6f-4f69-8e32-68dc71b77605', '1', '有异物感', '0', '1', null, '0', '2020-09-06 09:00:18', 'bee', '2020-09-06 09:00:18', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('48', '870e01c6-56d1-4f64-b579-bb624c6ff705', '4396079c-cb6f-4f69-8e32-68dc71b77605', '0', '无异物感', '0', '2', null, '0', '2020-09-06 09:00:18', 'bee', '2020-09-06 09:00:18', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('49', 'fd6251e1-c284-4b2e-a7e9-226bebffc3ec', 'ff1d81d9-d3cd-421a-9338-cdebbe9b806c', '1', '带血', '0', '1', null, '0', '2020-09-06 09:01:05', 'bee', '2020-09-06 09:01:05', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('50', '83dc806e-bfe5-43a6-b2bc-38fa17d5e7d0', 'ff1d81d9-d3cd-421a-9338-cdebbe9b806c', '0', '无血', '0', '2', null, '0', '2020-09-06 09:01:05', 'bee', '2020-09-06 09:01:05', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('51', '793f1a83-2cf9-43f8-a716-e79df16a04d6', '77507fa2-c78a-46ca-ad8a-8a0f3a0883f1', '1', '困难', '0', '1', null, '0', '2020-09-06 09:01:48', 'bee', '2020-09-06 09:01:48', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('52', 'f08a0033-336a-4544-b2a3-c17bf315fa9c', '77507fa2-c78a-46ca-ad8a-8a0f3a0883f1', '0', '不困难', '0', '2', null, '0', '2020-09-06 09:01:48', 'bee', '2020-09-06 09:01:48', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('53', '05a46fa7-efe2-4458-9857-9a8cb9f8364f', '6f4891ef-16de-4ad8-804a-d3aa7d351ca3', '1', '咳嗽', '0', '1', null, '0', '2020-09-06 09:02:26', 'bee', '2020-09-06 09:02:26', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('54', '0250f5aa-f4c6-4557-864d-a6d5b3244e00', '6f4891ef-16de-4ad8-804a-d3aa7d351ca3', '0', '不咳', '0', '2', null, '0', '2020-09-06 09:02:26', 'bee', '2020-09-06 09:02:26', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('55', '8c9d3aa0-870a-4a9d-9931-ab4f315dea4e', 'fd3e22af-bb96-4ce9-a34b-bbd5872b8958', '1', '咳痰', '0', '1', null, '0', '2020-09-06 09:03:04', 'bee', '2020-09-06 09:03:04', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('56', '40f02d0f-e74c-43e9-9acf-73db2b99372e', 'fd3e22af-bb96-4ce9-a34b-bbd5872b8958', '0', '不咳', '0', '2', null, '0', '2020-09-06 09:03:04', 'bee', '2020-09-06 09:03:04', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('57', '3138930e-f921-45ea-805c-ee45b9aa0bc3', '1bf425d5-6992-423e-a01d-0411dd8ca928', '1', '困难', '0', '1', null, '0', '2020-09-06 09:03:51', 'bee', '2020-09-06 09:03:51', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('58', 'c709a4b0-ed79-4078-8c51-599aeca9815e', '1bf425d5-6992-423e-a01d-0411dd8ca928', '0', '不困难', '0', '2', null, '0', '2020-09-06 09:03:51', 'bee', '2020-09-06 09:03:51', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('59', '7d893adc-5707-4801-b23f-483bc9044afd', '9cec4a5d-6bc1-4910-8dee-b3898a1abab4', '1', '受限', '0', '1', null, '0', '2020-09-06 09:04:34', 'bee', '2020-09-06 09:04:34', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('60', '943f770d-65dc-4935-9443-1e545d7388a8', '9cec4a5d-6bc1-4910-8dee-b3898a1abab4', '0', '活动良好', '0', '2', null, '0', '2020-09-06 09:04:34', 'bee', '2020-09-06 09:04:34', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('61', '97f74302-e33b-473d-a9f2-ccefd5db69b6', 'fe432dc4-0a79-4173-984c-8f0c5f6706ad', '1', '累及多个范围', '0', '1', null, '0', '2020-09-06 09:05:38', 'bee', '2020-09-06 09:05:38', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('62', 'dafb439f-595a-4c53-a453-056cc395522a', 'fe432dc4-0a79-4173-984c-8f0c5f6706ad', '0', '无累及', '0', '2', null, '0', '2020-09-06 09:05:38', 'bee', '2020-09-06 09:05:38', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('63', 'c26c67cb-92c8-49a9-94f6-73afb64eb179', '00f69c7c-f383-442a-8513-1242989e0985', '0', '阴', '0', '1', null, '1', '2020-11-24 01:39:46', 'YWJ', '2020-11-26 03:28:36', 'YWJ', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('64', 'f28cc4c6-7d09-4d69-8e8e-f7015399c345', '00f69c7c-f383-442a-8513-1242989e0985', '1', '中', '0', '2', null, '1', '2020-11-24 01:39:46', 'YWJ', '2020-11-26 03:28:36', 'YWJ', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('65', '0a17ea8c-e5d6-4dbd-a4af-ab8bfdb4ed8a', '00f69c7c-f383-442a-8513-1242989e0985', '2', '阳', '0', '3', null, '1', '2020-11-24 01:39:46', 'YWJ', '2020-11-26 03:28:36', 'YWJ', null);

-- ----------------------------
-- Table structure for idaas_extend_attr_config_text
-- ----------------------------
DROP TABLE IF EXISTS `idaas_extend_attr_config_text`;
CREATE TABLE `idaas_extend_attr_config_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attr_id` varchar(50) NOT NULL,
  `max_character_count` int(11) DEFAULT NULL,
  `default_value` varchar(1000) DEFAULT NULL,
  `extend` varchar(200) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `create_number` varchar(50) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `update_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attr_id_delete` (`attr_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of idaas_extend_attr_config_text
-- ----------------------------
INSERT INTO `idaas_extend_attr_config_text` VALUES ('12', 'c1ea25e2-d381-4c7f-9d44-dedff3f3e396', '200', '默认值', null, '0', '2020-08-21 14:56:51', 'bee', '2020-08-21 14:56:51', 'bee');
INSERT INTO `idaas_extend_attr_config_text` VALUES ('13', 'a9d2788f-2b0f-41a4-974d-eb92b261e302', '200', '阿斯顿发', null, '0', '2020-08-31 08:45:10', 'bee', '2020-08-31 08:45:10', 'bee');
INSERT INTO `idaas_extend_attr_config_text` VALUES ('14', '6a02ce74-530a-4f94-8849-fbe402b3ba6c', '200', '23423', null, '1', '2020-08-31 08:47:04', 'bee', '2020-09-06 01:48:08', 'bee');
INSERT INTO `idaas_extend_attr_config_text` VALUES ('15', '3036b13e-2522-4240-ac48-75d2ff51c2ad', '200', '23423', null, '1', '2020-08-31 08:48:15', 'bee', '2020-09-02 13:53:26', 'bee');
INSERT INTO `idaas_extend_attr_config_text` VALUES ('16', '1eee4a27-9f05-48ae-a101-c333250a0a6b', '200', '', null, '1', '2020-09-02 13:25:09', 'bee', '2020-09-06 01:48:04', 'bee');
INSERT INTO `idaas_extend_attr_config_text` VALUES ('17', '6f13c60c-b28a-4068-8e7f-81ccf306aa44', '200', '', null, '1', '2020-09-02 13:25:41', 'bee', '2020-09-06 01:48:06', 'bee');
INSERT INTO `idaas_extend_attr_config_text` VALUES ('18', 'e08c9c92-1931-450e-aae2-797520905dfa', '200', '', null, '1', '2020-09-06 01:27:36', 'bee', '2020-09-06 01:37:22', 'bee');
INSERT INTO `idaas_extend_attr_config_text` VALUES ('19', '8bb27cd0-c45c-4e5f-8525-c832c92233fa', '200', '', null, '1', '2020-09-06 10:47:12', 'bee', '2020-09-06 12:36:05', 'bee');
INSERT INTO `idaas_extend_attr_config_text` VALUES ('20', '2222', '200', '', null, '0', '2020-09-06 13:02:15', 'bee', '2020-09-06 13:02:15', 'bee');

-- ----------------------------
-- Table structure for mdc1
-- ----------------------------
DROP TABLE IF EXISTS `mdc1`;
CREATE TABLE `mdc1` (
  `id` varchar(10) NOT NULL,
  `feature` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `desc` varchar(1024) DEFAULT NULL,
  `treatment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mdc1
-- ----------------------------
INSERT INTO `mdc1` VALUES ('id001', '年龄', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id002', '性别', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id003', '吸烟', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id004', '喝酒', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id005', '声嘶', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id006', '咽喉痛', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id007', '咽喉部异物感', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id008', '痰中带血', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id009', '呼吸困难', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id010', '咳嗽', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id011', '咳痰', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id012', '吞咽困难', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id013', '肿物形态', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id014', '肿物色泽', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id015', '声带活动', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('id016', '累计范围', 'input', '0', null, null);
INSERT INTO `mdc1` VALUES ('sk001', '喉癌', 'output', '1111', null, null);
INSERT INTO `mdc1` VALUES ('sk002', '声带白斑', 'output', '1111', null, null);
INSERT INTO `mdc1` VALUES ('sk003', '声带息肉', 'output', '1111', null, null);

-- ----------------------------
-- Table structure for mdc2
-- ----------------------------
DROP TABLE IF EXISTS `mdc2`;
CREATE TABLE `mdc2` (
  `Rule` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(1024) DEFAULT NULL,
  `belief` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Rule`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mdc2
-- ----------------------------
INSERT INTO `mdc2` VALUES ('1', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"0\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0.8\", \"sk002\": \"0\", \"sk003\": \"0.2\"}');
INSERT INTO `mdc2` VALUES ('2', '{\"id001\": \"3\", \"id002\": \"1\", \"id003\": \"0\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"1\", \"id010\": \"1\", \"id011\": \"1\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"0\", \"id015\": \"1\", \"id016\": \"1\"}', '{\"sk001\": \"1\", \"sk002\": \"0\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('3', '{\"id001\": \"2\", \"id002\": \"0\", \"id003\": \"0\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"1\", \"id011\": \"1\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"0\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0.6\", \"sk002\": \"0\", \"sk003\": \"0.4\"}');
INSERT INTO `mdc2` VALUES ('4', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0.8\", \"sk002\": \"0.2\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('5', '{\"id001\": \"3\", \"id002\": \"1\", \"id003\": \"0\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"0\", \"id015\": \"0\", \"id016\": \"1\"}', '{\"sk001\": \"1\", \"sk002\": \"0\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('6', '{\"id001\": \"3\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0.8\", \"sk002\": \"0.2\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('7', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"1\", \"id010\": \"1\", \"id011\": \"1\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"0\", \"id015\": \"1\", \"id016\": \"1\"}', '{\"sk001\": \"1\", \"sk002\": \"0\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('8', '{\"id001\": \"3\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"1\", \"id009\": \"1\", \"id010\": \"1\", \"id011\": \"1\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"0\", \"id015\": \"1\", \"id016\": \"1\"}', '{\"sk001\": \"1\", \"sk002\": \"0\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('9', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"1\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"0\", \"id015\": \"0\", \"id016\": \"1\"}', '{\"sk001\": \"1\", \"sk002\": \"0\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('10', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"1\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"1\", \"id011\": \"1\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0.8\", \"sk002\": \"0.2\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('11', '{\"id001\": \"1\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"1\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"0\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0.8\", \"sk002\": \"0\", \"sk003\": \"0.2\"}');
INSERT INTO `mdc2` VALUES ('12', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"0\", \"id004\": \"0\", \"id005\": \"0\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0.6\", \"sk003\": \"0.4\"}');
INSERT INTO `mdc2` VALUES ('13', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0.6\", \"sk003\": \"0.4\"}');
INSERT INTO `mdc2` VALUES ('14', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"1\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0.6\", \"sk003\": \"0.4\"}');
INSERT INTO `mdc2` VALUES ('15', '{\"id001\": \"1\", \"id002\": \"1\", \"id003\": \"0\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"1\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"1\", \"id011\": \"1\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0.4\", \"sk003\": \"0.6\"}');
INSERT INTO `mdc2` VALUES ('16', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"1\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0.6\", \"sk002\": \"0.4\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('17', '{\"id001\": \"3\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0.8\", \"sk003\": \"0.2\"}');
INSERT INTO `mdc2` VALUES ('18', '{\"id001\": \"3\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"1\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"1\"}', '{\"sk001\": \"0.8\", \"sk002\": \"0.2\", \"sk003\": \"0\"}');
INSERT INTO `mdc2` VALUES ('19', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0.8\", \"sk003\": \"0.2\"}');
INSERT INTO `mdc2` VALUES ('20', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"1\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"0\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0\", \"sk003\": \"1\"}');
INSERT INTO `mdc2` VALUES ('21', '{\"id001\": \"1\", \"id002\": \"1\", \"id003\": \"0\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"1\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"0\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0\", \"sk003\": \"1\"}');
INSERT INTO `mdc2` VALUES ('22', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"1\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0.6\", \"sk003\": \"0.4\"}');
INSERT INTO `mdc2` VALUES ('23', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"1\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"1\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"0\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0\", \"sk003\": \"1\"}');
INSERT INTO `mdc2` VALUES ('24', '{\"id001\": \"2\", \"id002\": \"1\", \"id003\": \"0\", \"id004\": \"0\", \"id005\": \"1\", \"id006\": \"0\", \"id007\": \"0\", \"id008\": \"0\", \"id009\": \"0\", \"id010\": \"0\", \"id011\": \"0\", \"id012\": \"0\", \"id013\": \"0\", \"id014\": \"0\", \"id015\": \"0\", \"id016\": \"0\"}', '{\"sk001\": \"0\", \"sk002\": \"0\", \"sk003\": \"1\"}');

-- ----------------------------
-- Table structure for not_use_tb_treatment_objection
-- ----------------------------
DROP TABLE IF EXISTS `not_use_tb_treatment_objection`;
CREATE TABLE `not_use_tb_treatment_objection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `diagnosis_result` varchar(255) NOT NULL,
  `treatment_id` varchar(255) NOT NULL,
  `out_feature_json` varchar(1024) DEFAULT NULL,
  `active_rule_json` varchar(2048) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `treatment_plan` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of not_use_tb_treatment_objection
-- ----------------------------
INSERT INTO `not_use_tb_treatment_objection` VALUES ('27', 'd69c1c58-e7f6-489b-a330-77fe94b6735b', '高血压', 'd69c1c58-e7f6-489b-a330-77fe94b6735b', '[\r\n    {\r\n        \"fidOut\": \"sk001\",\r\n        \"fidOutName\": \"喉癌\",\r\n        \"value\": \"34.94%\"\r\n    },\r\n    {\r\n        \"fidOut\": \"sk002\",\r\n        \"fidOutName\": \"声带白斑\",\r\n        \"value\": \"23.81%\"\r\n    },\r\n    {\r\n        \"fidOut\": \"sk003\",\r\n        \"fidOutName\": \"声带息肉\",\r\n        \"value\": \"41.25%\"\r\n    }\r\n]', '[\r\n    {\r\n        \"rid\": \"R1\",\r\n        \"weight\": \"0.04939892178351416\"\r\n    },\r\n    {\r\n        \"rid\": \"R2\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R3\",\r\n        \"weight\": \"0.06586522904468554\"\r\n    },\r\n    {\r\n        \"rid\": \"R4\",\r\n        \"weight\": \"0.06037645995762842\"\r\n    },\r\n    {\r\n        \"rid\": \"R5\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R6\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R7\",\r\n        \"weight\": \"0.04391015269645703\"\r\n    },\r\n    {\r\n        \"rid\": \"R8\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R9\",\r\n        \"weight\": \"0.0384213836093999\"\r\n    },\r\n    {\r\n        \"rid\": \"R10\",\r\n        \"weight\": \"0.06037645995762842\"\r\n    },\r\n    {\r\n        \"rid\": \"R11\",\r\n        \"weight\": \"0.07394269456434804\"\r\n    },\r\n    {\r\n        \"rid\": \"R12\",\r\n        \"weight\": \"0.06037645995762842\"\r\n    },\r\n    {\r\n        \"rid\": \"R13\",\r\n        \"weight\": \"0.054887690870571285\"\r\n    },\r\n    {\r\n        \"rid\": \"R14\",\r\n        \"weight\": \"0.04939892178351416\"\r\n    },\r\n    {\r\n        \"rid\": \"R15\",\r\n        \"weight\": \"0.0806647577065615\"\r\n    },\r\n    {\r\n        \"rid\": \"R16\",\r\n        \"weight\": \"0.054887690870571285\"\r\n    },\r\n    {\r\n        \"rid\": \"R17\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R18\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R19\",\r\n        \"weight\": \"0.04939892178351416\"\r\n    },\r\n    {\r\n        \"rid\": \"R20\",\r\n        \"weight\": \"0.04391015269645703\"\r\n    },\r\n    {\r\n        \"rid\": \"R21\",\r\n        \"weight\": \"0.060498568279921124\"\r\n    },\r\n    {\r\n        \"rid\": \"R22\",\r\n        \"weight\": \"0.054887690870571285\"\r\n    },\r\n    {\r\n        \"rid\": \"R23\",\r\n        \"weight\": \"0.04391015269645703\"\r\n    },\r\n    {\r\n        \"rid\": \"R24\",\r\n        \"weight\": \"0.054887690870571285\"\r\n    }\r\n]', 'asdfasdfasdfasd', '0', 'wangbo', 'wangbo', '2020-10-27 09:32:24', '2020-10-27 09:32:24', '123456');
INSERT INTO `not_use_tb_treatment_objection` VALUES ('28', '984d9bca-53be-43b7-9f2c-a1fdf565b499', '声带息肉', '675bd040-5f07-439a-8434-5ebc1b7ac52b', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"19\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"11\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70\"}]', '[{\"weight\":\"0.0\",\"rid\":\"R1\"},{\"weight\":\"0.0\",\"rid\":\"R2\"},{\"weight\":\"0.0\",\"rid\":\"R3\"},{\"weight\":\"0.0\",\"rid\":\"R4\"},{\"weight\":\"0.0\",\"rid\":\"R5\"},{\"weight\":\"0.0\",\"rid\":\"R6\"},{\"weight\":\"0.0\",\"rid\":\"R7\"},{\"weight\":\"0.0\",\"rid\":\"R8\"},{\"weight\":\"0.0\",\"rid\":\"R9\"},{\"weight\":\"0.0\",\"rid\":\"R10\"},{\"weight\":\"0.29166666666666663\",\"rid\":\"R11\"},{\"weight\":\"0.0\",\"rid\":\"R12\"},{\"weight\":\"0.0\",\"rid\":\"R13\"},{\"weight\":\"0.0\",\"rid\":\"R14\"},{\"weight\":\"0.33333333333333326\",\"rid\":\"R15\"},{\"weight\":\"0.0\",\"rid\":\"R16\"},{\"weight\":\"0.0\",\"rid\":\"R17\"},{\"weight\":\"0.0\",\"rid\":\"R18\"},{\"weight\":\"0.0\",\"rid\":\"R19\"},{\"weight\":\"0.0\",\"rid\":\"R20\"},{\"weight\":\"0.37499999999999994\",\"rid\":\"R21\"},{\"weight\":\"0.0\",\"rid\":\"R22\"},{\"weight\":\"0.0\",\"rid\":\"R23\"},{\"weight\":\"0.0\",\"rid\":\"R24\"}]', 'fsda', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 15:01:32', '2020-10-29 15:01:32', '测试阿斯顿发');
INSERT INTO `not_use_tb_treatment_objection` VALUES ('29', '144aed39-af28-4490-bd16-50dbf7cf08e1', '声带息肉', '675bd040-5f07-439a-8434-5ebc1b7ac52b', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"10\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"20\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70\"}]', '[{\"weight\":\"0.0\",\"rid\":\"R1\"},{\"weight\":\"0.0\",\"rid\":\"R2\"},{\"weight\":\"0.0\",\"rid\":\"R3\"},{\"weight\":\"0.0\",\"rid\":\"R4\"},{\"weight\":\"0.0\",\"rid\":\"R5\"},{\"weight\":\"0.0\",\"rid\":\"R6\"},{\"weight\":\"0.0\",\"rid\":\"R7\"},{\"weight\":\"0.0\",\"rid\":\"R8\"},{\"weight\":\"0.0\",\"rid\":\"R9\"},{\"weight\":\"0.0\",\"rid\":\"R10\"},{\"weight\":\"0.29166666666666663\",\"rid\":\"R11\"},{\"weight\":\"0.0\",\"rid\":\"R12\"},{\"weight\":\"0.0\",\"rid\":\"R13\"},{\"weight\":\"0.0\",\"rid\":\"R14\"},{\"weight\":\"0.33333333333333326\",\"rid\":\"R15\"},{\"weight\":\"0.0\",\"rid\":\"R16\"},{\"weight\":\"0.0\",\"rid\":\"R17\"},{\"weight\":\"0.0\",\"rid\":\"R18\"},{\"weight\":\"0.0\",\"rid\":\"R19\"},{\"weight\":\"0.0\",\"rid\":\"R20\"},{\"weight\":\"0.37499999999999994\",\"rid\":\"R21\"},{\"weight\":\"0.0\",\"rid\":\"R22\"},{\"weight\":\"0.0\",\"rid\":\"R23\"},{\"weight\":\"0.0\",\"rid\":\"R24\"}]', '', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 15:03:44', '2020-10-29 15:03:44', '测试阿斯顿发');
INSERT INTO `not_use_tb_treatment_objection` VALUES ('30', '77540446-a290-449e-bce5-d74241dc8b1a', '声带息肉', '675bd040-5f07-439a-8434-5ebc1b7ac52b', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"10\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"20\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.42\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.23\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.35\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 15:07:03', '2020-10-29 15:07:03', '测试阿斯顿发');
INSERT INTO `not_use_tb_treatment_objection` VALUES ('31', '5bb03eca-e89f-4198-a997-143f84cb7f9b', '声带白斑', '9645586d-5210-4b60-99cd-c89bd19b1d2c', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"10\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"20\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.38\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.25\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.38\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 15:15:04', '2020-10-29 15:15:04', '测试啊时代发生的');
INSERT INTO `not_use_tb_treatment_objection` VALUES ('32', '805b26d9-0e1a-4e50-baaf-5873180281b7', '声带息肉', '09a35977-2b0c-40eb-bb2c-96da0d84e9f4', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"10\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"10\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"80\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.25\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.40\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.35\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '无理由', '0', 'YWJYS', 'YWJYS', '2020-10-30 01:41:44', '2020-10-30 01:41:44', '测试阿斯顿发');
INSERT INTO `not_use_tb_treatment_objection` VALUES ('33', '409d9056-31cb-43db-95b2-61929a203f26', '声带息肉', 'a067ced9-55f0-4ad3-9b6a-4ba16db451da', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"20\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"20\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"60\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.29\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.43\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.29\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '', '0', 'YWJYS', 'YWJYS', '2020-10-30 02:49:30', '2020-10-30 02:49:30', '测试阿斯顿发');
INSERT INTO `not_use_tb_treatment_objection` VALUES ('34', '878a3933-a3b3-42db-ad59-5899ad4d8c9a', '声带息肉', '1ffb8c15-03c1-4788-89c5-69226987f295', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"10\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"20\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.37\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.33\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.30\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '认为结果有问题', '0', 'YWJYS', 'YWJYS', '2020-11-24 01:14:20', '2020-11-24 01:14:20', '测试阿斯顿发');
INSERT INTO `not_use_tb_treatment_objection` VALUES ('35', 'a580bfc8-0141-453b-a8a9-e520b87a6af6', '声带息肉', 'eb1d05b5-cf51-4b88-a72e-708b665221fc', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"30\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"30\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"40\"}]', '[{\"weight\":\"0.04\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.04\",\"rid\":\"R3\"},{\"weight\":\"0.04\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.03\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.04\",\"rid\":\"R9\"},{\"weight\":\"0.04\",\"rid\":\"R10\"},{\"weight\":\"0.13\",\"rid\":\"R11\"},{\"weight\":\"0.03\",\"rid\":\"R12\"},{\"weight\":\"0.04\",\"rid\":\"R13\"},{\"weight\":\"0.04\",\"rid\":\"R14\"},{\"weight\":\"0.15\",\"rid\":\"R15\"},{\"weight\":\"0.04\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.04\",\"rid\":\"R19\"},{\"weight\":\"0.04\",\"rid\":\"R20\"},{\"weight\":\"0.13\",\"rid\":\"R21\"},{\"weight\":\"0.04\",\"rid\":\"R22\"},{\"weight\":\"0.05\",\"rid\":\"R23\"},{\"weight\":\"0.04\",\"rid\":\"R24\"}]', '理由测试说明', '0', 'YWJYS', 'YWJYS', '2020-11-30 14:08:42', '2020-11-30 14:08:42', '测试阿斯顿发');

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` int(2) NOT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES ('6', '1111', '咽喉科', null, '1', '0', 'bee', 'bee', '2020-07-06 11:12:45', '2020-07-06 11:12:48');
INSERT INTO `tb_department` VALUES ('7', '1112', '消化内科', null, '2', '0', 'bee', 'bee', '2020-07-06 11:13:41', '2020-07-08 11:13:45');
INSERT INTO `tb_department` VALUES ('8', '1113', '肛肠科', '备注', '3', '0', 'bee', 'bee', '2020-07-06 11:14:27', '2020-07-23 11:14:30');
INSERT INTO `tb_department` VALUES ('10', '6c773526-5e9f-48e6-b480-079bf59d48ab', '啊', '安生点', '4', '1', 'YWJ', 'YWJ', '2020-10-28 13:37:47', '2020-10-28 13:37:49');
INSERT INTO `tb_department` VALUES ('11', '026cf727-7b31-4216-a418-796a3963ab59', '谁的风格', '谁的风格', '4', '1', 'YWJ', 'YWJ', '2020-10-28 13:38:04', '2020-10-28 13:38:30');
INSERT INTO `tb_department` VALUES ('12', 'cbb83963-4f5d-41d3-a5e4-e8667630c0d9', 'asdfasdfasdf', 'asdf asdfasd', '4', '1', 'YWJ', 'YWJ', '2020-10-30 15:26:41', '2020-10-30 15:26:50');

-- ----------------------------
-- Table structure for tb_department_feature
-- ----------------------------
DROP TABLE IF EXISTS `tb_department_feature`;
CREATE TABLE `tb_department_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` varchar(100) NOT NULL,
  `feature_id` varchar(100) NOT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_department_feature
-- ----------------------------
INSERT INTO `tb_department_feature` VALUES ('4', '1111', 'c1ea25e2-d381-4c7f-9d44-dedff3f3e396', '0', 'bee', 'bee', '2020-08-27 15:03:17', '2020-08-27 15:03:17');
INSERT INTO `tb_department_feature` VALUES ('5', '1111', '22', '0', 'bee', 'bee', '2020-08-27 15:03:17', '2020-08-27 15:03:17');
INSERT INTO `tb_department_feature` VALUES ('6', '1111', '6a02ce74-530a-4f94-8849-fbe402b3ba6c', '0', 'bee', 'bee', '2020-09-02 15:09:29', '2020-09-02 15:09:29');
INSERT INTO `tb_department_feature` VALUES ('10', '1111', '6f13c60c-b28a-4068-8e7f-81ccf306aa44', '0', 'bee', 'bee', '2020-09-06 01:30:54', '2020-09-06 01:30:54');
INSERT INTO `tb_department_feature` VALUES ('11', '1111', '83e43295-af0d-4882-b15b-4e34c3c95303', '0', 'bee', 'bee', '2020-09-06 01:44:52', '2020-09-06 01:44:52');
INSERT INTO `tb_department_feature` VALUES ('12', '1111', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '0', 'bee', 'bee', '2020-09-06 02:06:46', '2020-09-06 02:06:46');
INSERT INTO `tb_department_feature` VALUES ('13', '1111', '4e5f8081-f673-42ab-8b55-e0098bf8b2f2', '0', 'bee', 'bee', '2020-09-06 02:06:56', '2020-09-06 02:06:56');
INSERT INTO `tb_department_feature` VALUES ('14', '1111', 'dfef97bf-3646-4b5a-bce5-c9ca385b8eed', '0', 'bee', 'bee', '2020-09-06 02:07:05', '2020-09-06 02:07:05');
INSERT INTO `tb_department_feature` VALUES ('15', '1111', '8cf70fa8-a3de-471f-8560-8dd6a4e7843f', '0', 'bee', 'bee', '2020-09-06 02:07:13', '2020-09-06 02:07:13');
INSERT INTO `tb_department_feature` VALUES ('16', '1111', '2fbefa39-8c30-4146-9da6-43c6afe93278', '0', 'bee', 'bee', '2020-09-06 02:07:20', '2020-09-06 02:07:20');
INSERT INTO `tb_department_feature` VALUES ('17', '1111', 'e293cd4f-df01-4419-8f3b-cb370e58c1a3', '0', 'bee', 'bee', '2020-09-06 02:07:28', '2020-09-06 02:07:28');
INSERT INTO `tb_department_feature` VALUES ('18', '1111', 'f57c8d03-5233-4fa5-949b-ffc38967072a', '0', 'bee', 'bee', '2020-09-06 02:07:35', '2020-09-06 02:07:35');
INSERT INTO `tb_department_feature` VALUES ('19', '1111', '806800f4-5e51-4da5-b0d4-6bcfe7edd3f1', '0', 'bee', 'bee', '2020-09-06 02:07:46', '2020-09-06 02:07:46');
INSERT INTO `tb_department_feature` VALUES ('20', '1111', '4396079c-cb6f-4f69-8e32-68dc71b77605', '0', 'bee', 'bee', '2020-09-06 09:05:49', '2020-09-06 09:05:49');
INSERT INTO `tb_department_feature` VALUES ('21', '1111', 'ff1d81d9-d3cd-421a-9338-cdebbe9b806c', '0', 'bee', 'bee', '2020-09-06 09:05:59', '2020-09-06 09:05:59');
INSERT INTO `tb_department_feature` VALUES ('22', '1111', 'fe432dc4-0a79-4173-984c-8f0c5f6706ad', '0', 'bee', 'bee', '2020-09-06 09:07:31', '2020-09-06 09:07:31');
INSERT INTO `tb_department_feature` VALUES ('23', '1111', '9cec4a5d-6bc1-4910-8dee-b3898a1abab4', '0', 'bee', 'bee', '2020-09-06 09:07:37', '2020-09-06 09:07:37');
INSERT INTO `tb_department_feature` VALUES ('24', '1111', '1bf425d5-6992-423e-a01d-0411dd8ca928', '0', 'bee', 'bee', '2020-09-06 09:07:44', '2020-09-06 09:07:44');
INSERT INTO `tb_department_feature` VALUES ('25', '1111', 'fd3e22af-bb96-4ce9-a34b-bbd5872b8958', '0', 'bee', 'bee', '2020-09-06 09:07:51', '2020-09-06 09:07:51');
INSERT INTO `tb_department_feature` VALUES ('26', '1111', '6f4891ef-16de-4ad8-804a-d3aa7d351ca3', '0', 'bee', 'bee', '2020-09-06 09:07:58', '2020-09-06 09:07:58');
INSERT INTO `tb_department_feature` VALUES ('27', '1111', '77507fa2-c78a-46ca-ad8a-8a0f3a0883f1', '0', 'bee', 'bee', '2020-09-06 09:08:04', '2020-09-06 09:08:04');
INSERT INTO `tb_department_feature` VALUES ('28', '1111', '8bb27cd0-c45c-4e5f-8525-c832c92233fa', '0', 'bee', 'bee', '2020-09-06 10:54:40', '2020-09-06 10:54:40');
INSERT INTO `tb_department_feature` VALUES ('29', '1112', '8bb27cd0-c45c-4e5f-8525-c832c92233fa', '0', 'bee', 'bee', '2020-09-06 10:54:40', '2020-09-06 10:54:40');
INSERT INTO `tb_department_feature` VALUES ('30', '1111', '2222', '0', 'bee', 'bee', '2020-09-06 13:02:34', '2020-09-06 13:02:34');
INSERT INTO `tb_department_feature` VALUES ('33', '1112', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '0', 'bee', 'bee', '2020-09-06 13:45:30', '2020-09-06 13:45:30');
INSERT INTO `tb_department_feature` VALUES ('34', '1113', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '0', 'bee', 'bee', '2020-09-06 13:45:30', '2020-09-06 13:45:30');
INSERT INTO `tb_department_feature` VALUES ('35', '1111', 'd9427c79-5f0e-4e06-9611-6574f9bfe15b', '0', 'YWJ', 'YWJ', '2020-10-30 15:09:49', '2020-10-30 15:09:49');
INSERT INTO `tb_department_feature` VALUES ('36', '1112', 'd9427c79-5f0e-4e06-9611-6574f9bfe15b', '0', 'YWJ', 'YWJ', '2020-10-30 15:09:49', '2020-10-30 15:09:49');
INSERT INTO `tb_department_feature` VALUES ('37', '1113', 'd9427c79-5f0e-4e06-9611-6574f9bfe15b', '0', 'YWJ', 'YWJ', '2020-10-30 15:09:49', '2020-10-30 15:09:49');
INSERT INTO `tb_department_feature` VALUES ('38', '1111', '00f69c7c-f383-442a-8513-1242989e0985', '0', 'YWJYS', 'YWJYS', '2020-11-24 01:42:29', '2020-11-24 01:42:29');

-- ----------------------------
-- Table structure for tb_disease
-- ----------------------------
DROP TABLE IF EXISTS `tb_disease`;
CREATE TABLE `tb_disease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `department_id` varchar(255) NOT NULL,
  `treatment` varchar(1024) DEFAULT NULL,
  `introduction` varchar(1024) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` int(2) NOT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `foreign_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_disease
-- ----------------------------
INSERT INTO `tb_disease` VALUES ('21', '5fb62003-4ed7-4508-888e-a655f91ae01e', '高血压', 'effbc3b2-f95e-49c1-a009-d71eca0ec432', null, null, '备注', '1', '0', 'bee', 'bee', '2020-08-16 10:56:50', '2020-08-16 10:56:50', null);
INSERT INTO `tb_disease` VALUES ('24', 'ea35c93e-0032-4242-b4d3-381532c19841', '修改为消化科', '1112', '11', '费都是发大水发阿斯蒂芬大奥德赛范德萨阿斯顿发', '发送到啊阿斯顿发', '0', '1', 'bee', 'YWJ', '2020-08-29 13:49:03', '2020-10-28 13:35:55', null);
INSERT INTO `tb_disease` VALUES ('30', 'd3a0bfeb-bfae-404f-b79c-b9f029469037', '慢性鼻炎', '1111', '鼻腔用药： 激素类：毕诺、伯可纳 、辅舒良、内舒拿、雷诺考特等', '阵发性喷嚏发作，大量清水样鼻涕，鼻塞', 'asd', '0', '0', 'bee', 'YWJ', '2020-09-06 03:30:01', '2020-10-28 13:19:31', null);
INSERT INTO `tb_disease` VALUES ('31', 'adfe9dbd-22e8-49cb-9e6c-0ca8fe2b5759', '慢性扁桃体炎', '1111', '扁桃体切除术', '咽痛或反复急性发作，咽部不适、异物感、口臭、刺激性咳嗽', '', '2', '1', 'bee', 'wangbo-1', '2020-09-06 03:30:21', '2020-11-02 13:44:44', null);
INSERT INTO `tb_disease` VALUES ('32', '16820b5f-ed1e-4cbd-9869-7f1b610970c3', '鼻咽癌', '1111', '手术疗法适于对放疗不敏感或放疗后颈淋巴转移未消退者', '易出血，吸鼻后痰中带血或擤出血性鼻涕。耳鸣、耳闷塞感及听力减退，或伴有鼓室积液', '', '3', '0', 'bee', 'bee', '2020-09-06 08:56:34', '2020-09-06 08:56:34', null);
INSERT INTO `tb_disease` VALUES ('33', '41000eb6-edfa-4da1-b7c7-def9e4d724cf', '喉癌', '1111', '1、全喉切除术：适用于T3～T4期喉癌病变，术后喉癌患者会失去喉功能，但经过食管发音训练后获得咽食管音，是很好的喉癌的治疗方法。　　2、水平部分喉切除术：这种喉癌的治疗方法适用于声门上型喉癌，指喉癌的病变累及会厌、室带、杓会厌襞等，但声带未受侵犯。喉癌患者在手术后可基本保留喉功能。　　3、化疗：治疗喉癌，对于晚期喉癌不能手术者，可采用化疗或放疗加化疗的综合疗法，同样是很好的一种喉癌的治疗方法。　　', '喉是人体的发音器官，由声门、声门上和声门下三部分构成。声带属声门区，会厌属声门上区，会厌负责关闭喉，防止食物掉进气管里。喉癌是发生在喉部的恶性肿瘤。\n\n长在声带上的喉癌症状明显，早期就有声音嘶哑。肿瘤长在声门上或声门下，早期症状不明显，或表现为声音嘶哑、异物感、咳嗽等，肿瘤长大后可出现呼吸困难、过度咳嗽、吞咽食物困难、脖子疼或者肿大等。晚期可经淋巴结转移。治疗主要是手术治疗，也可以放疗。', '', '4', '0', 'YWJ', 'YWJ', '2020-10-27 06:17:49', '2020-10-27 06:17:49', 'sk001');
INSERT INTO `tb_disease` VALUES ('34', '4849bea3-a7d8-4ff8-b249-79d5219b16ee', '声带白斑', '1111', '测试啊时代发生的', '不要删除', '', '5', '0', 'YWJ', 'YWJ', '2020-10-27 06:18:37', '2020-11-05 03:16:15', 'sk002');
INSERT INTO `tb_disease` VALUES ('35', 'eb3b951e-e564-4dc1-920b-759872a9d98b', '声带息肉', '1111', '测试阿斯顿发', '不要删除', '', '6', '0', 'YWJ', 'YWJ', '2020-10-27 06:19:32', '2020-11-05 03:16:23', 'sk003');

-- ----------------------------
-- Table structure for tb_medical_records
-- ----------------------------
DROP TABLE IF EXISTS `tb_medical_records`;
CREATE TABLE `tb_medical_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medical_records
-- ----------------------------
INSERT INTO `tb_medical_records` VALUES ('4', 'd69c1c58-e7f6-489b-a330-77fe94b6735b', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '3', '0', 'bee', 'bee', '2020-09-06 04:45:56', '2020-09-06 04:45:56');
INSERT INTO `tb_medical_records` VALUES ('5', '6b78ecb2-8b19-4413-9182-cc39dc977613', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '4', '0', 'bee', 'bee', '2020-09-06 04:48:06', '2020-09-06 04:48:06');
INSERT INTO `tb_medical_records` VALUES ('6', '675bd040-5f07-439a-8434-5ebc1b7ac52b', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '5', '0', 'bee', 'bee', '2020-09-06 05:07:51', '2020-09-06 05:07:51');
INSERT INTO `tb_medical_records` VALUES ('7', '624da3c8-3054-4ee5-a189-76f02609b791', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '6', '0', 'bee', 'bee', '2020-09-06 05:11:23', '2020-09-06 05:11:23');
INSERT INTO `tb_medical_records` VALUES ('8', '03acfd3c-5996-42d5-bf9d-2a1bd4e43ca4', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '7', '0', 'bee', 'bee', '2020-09-06 05:13:07', '2020-09-06 05:13:07');
INSERT INTO `tb_medical_records` VALUES ('9', 'efb8d72a-212f-4424-a7fa-1caad4a17efe', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '8', '0', 'bee', 'bee', '2020-09-06 05:14:16', '2020-09-06 05:14:16');
INSERT INTO `tb_medical_records` VALUES ('10', '8636c724-c580-4762-9c68-f273caea9f2e', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '9', '0', 'bee', 'bee', '2020-09-06 05:20:38', '2020-09-06 05:20:38');
INSERT INTO `tb_medical_records` VALUES ('11', 'f23ccc34-dfe0-420b-9c9a-ad0725d2d76f', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '10', '0', 'bee', 'bee', '2020-09-06 05:22:33', '2020-09-06 05:22:33');
INSERT INTO `tb_medical_records` VALUES ('12', '050b97ff-25df-4d59-8488-4234dde14055', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '11', '0', 'bee', 'bee', '2020-09-06 05:26:35', '2020-09-06 05:26:35');
INSERT INTO `tb_medical_records` VALUES ('13', '16c62387-825e-46f0-a3fd-3c9b963000c5', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '12', '0', 'bee', 'bee', '2020-09-06 05:28:49', '2020-09-06 05:28:49');
INSERT INTO `tb_medical_records` VALUES ('14', '88be3cc0-4362-4cfd-b15e-b40618480827', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '13', '0', 'bee', 'bee', '2020-09-06 05:32:32', '2020-09-06 05:32:32');
INSERT INTO `tb_medical_records` VALUES ('15', '09a50751-b819-4e8a-a12b-9a75b21f4fbe', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '14', '0', 'bee', 'bee', '2020-09-06 05:39:31', '2020-09-06 05:39:31');
INSERT INTO `tb_medical_records` VALUES ('16', '41df550c-5bd8-4285-9666-7ac0856b22e3', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '', '', '15', '0', 'bee', 'bee', '2020-09-06 05:48:04', '2020-09-06 05:48:04');
INSERT INTO `tb_medical_records` VALUES ('17', 'da8c59c7-d291-47d6-9407-8fed34237ac1', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '16', '1', 'bee', 'bee', '2020-09-06 08:17:57', '2020-09-06 08:49:06');
INSERT INTO `tb_medical_records` VALUES ('18', '4e6dda45-fbb5-46a6-974c-ac30aa2e4f71', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '17', '0', 'bee', 'bee', '2020-09-06 08:29:43', '2020-09-06 08:29:43');
INSERT INTO `tb_medical_records` VALUES ('19', '448cd88d-a369-47f2-9a1d-c6aa81dc0203', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '17', '1', 'bee', 'bee', '2020-09-06 08:51:40', '2020-09-06 09:00:39');
INSERT INTO `tb_medical_records` VALUES ('20', 'c0ba853d-4f33-4e74-a0ec-45c384e8f73a', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '17', '0', 'bee', 'bee', '2020-09-06 09:08:12', '2020-09-06 09:08:12');
INSERT INTO `tb_medical_records` VALUES ('21', '654c32ea-cf46-42c7-9bff-ba89643f4823', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '18', '0', 'bee', 'bee', '2020-09-06 09:08:38', '2020-09-06 09:08:38');
INSERT INTO `tb_medical_records` VALUES ('22', 'd6ddbc12-4b4f-4392-a8e7-7d3013caee3b', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '19', '0', 'bee', 'bee', '2020-09-06 09:47:18', '2020-09-06 09:47:18');
INSERT INTO `tb_medical_records` VALUES ('23', '130c6f65-31d0-4dc1-a391-09239b707780', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '20', '0', 'bee', 'bee', '2020-09-06 09:48:00', '2020-09-06 09:48:00');
INSERT INTO `tb_medical_records` VALUES ('24', '65329eb7-b7ad-43c8-9096-db9c35d5efc0', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '21', '0', 'bee', 'bee', '2020-09-06 13:12:21', '2020-09-06 13:12:21');
INSERT INTO `tb_medical_records` VALUES ('25', 'b96fa127-39de-4825-804c-88e4dba74728', 'c5a736e7-05d8-44c5-a01d-a3ce148bf41e', '974d725c-daba-4555-bad2-c07375600862', '', '', '22', '0', 'bee', 'bee', '2020-09-06 13:14:43', '2020-09-06 13:14:43');
INSERT INTO `tb_medical_records` VALUES ('26', '67383df3-21aa-46ff-b4d9-c8666d83cc8c', 'c5a736e7-05d8-44c5-a01d-a3ce148bf41e', '974d725c-daba-4555-bad2-c07375600862', '', '', '23', '0', 'bee', 'bee', '2020-09-06 13:14:59', '2020-09-06 13:14:59');
INSERT INTO `tb_medical_records` VALUES ('27', 'dfda3dc0-616e-47ad-811b-360e41c09f94', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '974d725c-daba-4555-bad2-c07375600862', '', '', '24', '0', 'bee', 'bee', '2020-09-06 13:16:23', '2020-09-06 13:16:23');
INSERT INTO `tb_medical_records` VALUES ('28', '18dbcea1-9f44-44fe-b5d7-28bf72bd572a', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '974d725c-daba-4555-bad2-c07375600862', '', '', '25', '0', 'bee', 'bee', '2020-09-06 13:16:31', '2020-09-06 13:16:31');
INSERT INTO `tb_medical_records` VALUES ('29', 'f3ea368a-3c08-473d-8ca7-0ac0d1b2abf7', 'c5a736e7-05d8-44c5-a01d-a3ce148bf41e', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '26', '0', 'bee', 'bee', '2020-10-17 07:02:31', '2020-10-17 07:02:31');
INSERT INTO `tb_medical_records` VALUES ('30', '4862b998-7f86-4d92-995a-40aaa94b789a', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '27', '0', 'bee', 'bee', '2020-10-25 01:44:42', '2020-10-25 01:44:42');
INSERT INTO `tb_medical_records` VALUES ('31', '86ef1512-9188-4116-a86c-0e4b9bdeefb7', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '28', '0', 'bee', 'bee', '2020-10-25 01:45:49', '2020-10-25 01:45:49');
INSERT INTO `tb_medical_records` VALUES ('32', 'f9def5cf-b2f6-4c46-9992-3b08d83cba4a', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '29', '0', 'bee', 'bee', '2020-10-25 01:51:00', '2020-10-25 01:51:00');
INSERT INTO `tb_medical_records` VALUES ('33', 'fa769aa3-11ae-47d8-ad20-fcd6af93d61d', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '30', '0', 'bee', 'bee', '2020-10-25 01:58:51', '2020-10-25 01:58:51');
INSERT INTO `tb_medical_records` VALUES ('34', '96f46675-6ef9-480d-854d-63ad0bed267b', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '31', '0', 'bee', 'bee', '2020-10-25 02:01:19', '2020-10-25 02:01:19');
INSERT INTO `tb_medical_records` VALUES ('35', 'b3f0cf31-e632-45ea-9d4d-98174a676687', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '32', '0', 'bee', 'bee', '2020-10-25 02:06:10', '2020-10-25 02:06:10');
INSERT INTO `tb_medical_records` VALUES ('36', '842ceae7-a5df-443a-b33f-b76a52f6edb9', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '33', '0', 'bee', 'bee', '2020-10-25 12:03:07', '2020-10-25 12:03:07');
INSERT INTO `tb_medical_records` VALUES ('37', '5ceaa34c-3ea6-4e0c-a888-6830148aee90', '47d94971-412b-43ae-a03c-7f31f2df1b81', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '34', '0', 'bee', 'bee', '2020-10-25 12:09:20', '2020-10-25 12:09:20');
INSERT INTO `tb_medical_records` VALUES ('38', 'cf85f74c-7c17-4731-b5d8-61c015ba4064', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '35', '0', 'YWJ', 'YWJ', '2020-10-28 13:18:32', '2020-10-28 13:18:32');
INSERT INTO `tb_medical_records` VALUES ('39', 'c5b75a97-7597-4da6-9be0-8f106f821ccc', '47d94971-412b-43ae-a03c-7f31f2df1b81', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '36', '0', 'wangbo-1', 'wangbo-1', '2020-10-28 13:46:32', '2020-10-28 13:46:32');
INSERT INTO `tb_medical_records` VALUES ('40', '78839409-5310-4068-8d52-9c2f16543bd5', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '37', '0', 'wangbo-1', 'wangbo-1', '2020-10-28 15:38:10', '2020-10-28 15:38:10');
INSERT INTO `tb_medical_records` VALUES ('41', 'c454dca0-94c7-40bf-9827-7b0cb92a2e42', '47d94971-412b-43ae-a03c-7f31f2df1b81', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '38', '0', 'wangbo-1', 'wangbo-1', '2020-10-28 15:53:00', '2020-10-28 15:53:00');
INSERT INTO `tb_medical_records` VALUES ('42', 'b98b0477-4071-4bd3-8e57-64123f6dfaab', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '39', '0', 'wangbo-1', 'wangbo-1', '2020-10-28 15:55:20', '2020-10-28 15:55:20');
INSERT INTO `tb_medical_records` VALUES ('43', '4283b902-1682-4b43-9d27-c7ad5b310246', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '40', '0', 'wangbo-1', 'wangbo-1', '2020-10-28 15:57:16', '2020-10-28 15:57:16');
INSERT INTO `tb_medical_records` VALUES ('44', 'aa87abba-df68-4cd8-b93e-25030ce95485', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '41', '0', 'wangbo-1', 'wangbo-1', '2020-10-28 15:59:22', '2020-10-28 15:59:22');
INSERT INTO `tb_medical_records` VALUES ('45', 'd2160bd4-3516-480e-9aad-1839986d4449', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '40', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 13:11:59', '2020-10-29 13:11:59');
INSERT INTO `tb_medical_records` VALUES ('46', '029ae3f4-c59a-4801-8f59-5e4c88444c9c', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '41', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 13:43:52', '2020-10-29 13:43:52');
INSERT INTO `tb_medical_records` VALUES ('47', 'be1fbac5-4116-4875-8428-9020f41e1d19', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '42', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 13:48:17', '2020-10-29 13:48:17');
INSERT INTO `tb_medical_records` VALUES ('48', '8ddcc3e2-3d2a-41b8-b096-120412961e51', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '43', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 14:00:40', '2020-10-29 14:00:40');
INSERT INTO `tb_medical_records` VALUES ('49', '15845a7f-bfe5-4e84-be9e-3ff556b24cdd', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '44', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 15:05:46', '2020-10-29 15:05:46');
INSERT INTO `tb_medical_records` VALUES ('50', '9645586d-5210-4b60-99cd-c89bd19b1d2c', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '', '', '45', '0', 'wangbo-1', 'wangbo-1', '2020-10-29 15:13:45', '2020-10-29 15:13:45');
INSERT INTO `tb_medical_records` VALUES ('51', 'ebaa12fc-df25-4d1d-8417-0fb1d18d789d', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '46', '0', 'YWJ', 'YWJ', '2020-10-30 01:34:16', '2020-10-30 01:34:16');
INSERT INTO `tb_medical_records` VALUES ('52', '0ffc2d81-e064-47bf-a196-cbdf30a838a8', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '47', '0', 'YWJYS', 'YWJYS', '2020-10-30 01:36:31', '2020-10-30 01:36:31');
INSERT INTO `tb_medical_records` VALUES ('53', '39eee4eb-d39e-4d6b-9d04-7660268e4a49', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '48', '0', 'YWJYS', 'YWJYS', '2020-10-30 01:37:23', '2020-10-30 01:37:23');
INSERT INTO `tb_medical_records` VALUES ('54', '183c376b-ac03-43f9-8f39-975765d4ed39', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '49', '0', 'YWJYS', 'YWJYS', '2020-10-30 01:39:15', '2020-10-30 01:39:15');
INSERT INTO `tb_medical_records` VALUES ('55', '09a35977-2b0c-40eb-bb2c-96da0d84e9f4', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '50', '0', 'YWJYS', 'YWJYS', '2020-10-30 01:40:08', '2020-10-30 01:40:08');
INSERT INTO `tb_medical_records` VALUES ('56', '25603f80-e9f7-4f6e-bc77-fb07c0184798', '3b1b6c4a-cc39-4b77-bbcb-1ecf7cfd1877', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '51', '0', 'YWJYS', 'YWJYS', '2020-10-30 01:44:32', '2020-10-30 01:44:32');
INSERT INTO `tb_medical_records` VALUES ('57', '243328ca-9b10-4ed8-bdb4-dc634907d934', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '52', '0', 'YWJYS', 'YWJYS', '2020-10-30 01:46:25', '2020-10-30 01:46:25');
INSERT INTO `tb_medical_records` VALUES ('58', '6ca5969a-e321-423f-a801-8bdbf93de9d2', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '53', '0', 'YWJ', 'YWJ', '2020-10-30 02:15:56', '2020-10-30 02:15:56');
INSERT INTO `tb_medical_records` VALUES ('59', 'b22fe80f-c26b-4b38-b8e1-531428af1edc', '47d94971-412b-43ae-a03c-7f31f2df1b81', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '54', '0', 'YWJ', 'YWJ', '2020-10-30 02:41:01', '2020-10-30 02:41:01');
INSERT INTO `tb_medical_records` VALUES ('60', '744f0fc4-8512-4c58-9fd6-a91ac26c52c2', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '55', '0', 'YWJYS', 'YWJYS', '2020-10-30 02:44:44', '2020-10-30 02:44:44');
INSERT INTO `tb_medical_records` VALUES ('61', 'a067ced9-55f0-4ad3-9b6a-4ba16db451da', '47d94971-412b-43ae-a03c-7f31f2df1b81', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '56', '0', 'YWJYS', 'YWJYS', '2020-10-30 02:45:51', '2020-10-30 02:45:51');
INSERT INTO `tb_medical_records` VALUES ('62', 'a2af8324-4791-425a-8be3-fe4a15bb816b', 'b5c434f5-6048-4251-af1d-5732ea57e07f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '57', '0', 'YWJYS', 'YWJYS', '2020-10-30 03:01:24', '2020-10-30 03:01:24');
INSERT INTO `tb_medical_records` VALUES ('63', 'a8eb8483-ae15-4e59-bb40-aad70de8d66e', 'b5c434f5-6048-4251-af1d-5732ea57e07f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '58', '0', 'YWJYS', 'YWJYS', '2020-10-30 03:04:04', '2020-10-30 03:04:04');
INSERT INTO `tb_medical_records` VALUES ('64', '4eadbc5a-40db-414e-b720-1dd01521b72a', 'b5c434f5-6048-4251-af1d-5732ea57e07f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '59', '0', 'YWJYS', 'YWJYS', '2020-10-30 03:14:40', '2020-10-30 03:14:40');
INSERT INTO `tb_medical_records` VALUES ('65', '0bb52526-d728-4938-a6c4-c88fe19cafad', 'b5c434f5-6048-4251-af1d-5732ea57e07f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '60', '0', 'YWJYS', 'YWJYS', '2020-10-30 03:16:26', '2020-10-30 03:16:26');
INSERT INTO `tb_medical_records` VALUES ('66', '0a46811b-8205-461a-8b84-9d56b1e617ff', '47d94971-412b-43ae-a03c-7f31f2df1b81', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '61', '0', 'YWJYS', 'YWJYS', '2020-10-30 07:44:31', '2020-10-30 07:44:31');
INSERT INTO `tb_medical_records` VALUES ('67', '385b4dd3-2393-4dc9-93d2-890a1c18fbfb', '47d94971-412b-43ae-a03c-7f31f2df1b81', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '62', '0', 'YWJ', 'YWJ', '2020-10-30 09:47:32', '2020-10-30 09:47:32');
INSERT INTO `tb_medical_records` VALUES ('68', 'a575b098-b3d1-4089-8cba-3d56cb03faad', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '63', '0', 'YWJYS', 'YWJYS', '2020-10-30 14:29:34', '2020-10-30 14:29:34');
INSERT INTO `tb_medical_records` VALUES ('69', '65502363-a1e7-41ca-8401-a7b7e6c5b850', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '64', '0', 'YWJ', 'YWJ', '2020-10-30 14:55:26', '2020-10-30 14:55:26');
INSERT INTO `tb_medical_records` VALUES ('70', 'c2bf03ef-657a-4c4b-a6e0-13b96a9c2bd9', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '65', '0', 'YWJ', 'YWJ', '2020-10-30 15:08:48', '2020-10-30 15:08:48');
INSERT INTO `tb_medical_records` VALUES ('71', '0b8e41fc-6f92-4f79-9b59-a7a20f44ebdf', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '66', '0', 'YWJ', 'YWJ', '2020-10-30 15:09:55', '2020-10-30 15:09:55');
INSERT INTO `tb_medical_records` VALUES ('72', 'c7f766d2-c7b6-40f0-abd0-ea0e381766df', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '67', '0', 'YWJ', 'YWJ', '2020-10-30 15:13:08', '2020-10-30 15:13:08');
INSERT INTO `tb_medical_records` VALUES ('73', '2a3c4d2b-9e77-49fa-a1e6-4c587135229c', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '68', '0', 'YWJ', 'YWJ', '2020-10-30 15:24:03', '2020-10-30 15:24:03');
INSERT INTO `tb_medical_records` VALUES ('74', 'aff48656-c0ea-4c5f-806f-2ebcb1008da2', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '69', '0', 'YWJ', 'YWJ', '2020-10-30 15:25:19', '2020-10-30 15:25:19');
INSERT INTO `tb_medical_records` VALUES ('75', '5e7d7e81-3182-4326-8173-1afd132312d2', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '70', '0', 'YWJ', 'YWJ', '2020-10-30 15:30:21', '2020-10-30 15:30:21');
INSERT INTO `tb_medical_records` VALUES ('76', '19457623-4b3c-4433-b770-85fab2ec8bc9', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '71', '0', 'YWJ', 'YWJ', '2020-10-30 15:30:42', '2020-10-30 15:30:42');
INSERT INTO `tb_medical_records` VALUES ('77', '02e53728-fe71-482b-99aa-74e4be0bdd56', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '72', '0', 'YWJ', 'YWJ', '2020-10-30 15:31:55', '2020-10-30 15:31:55');
INSERT INTO `tb_medical_records` VALUES ('78', 'cee7d714-aa6f-4e51-9cda-85e21b806010', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '73', '0', 'YWJ', 'YWJ', '2020-10-30 15:32:07', '2020-10-30 15:32:07');
INSERT INTO `tb_medical_records` VALUES ('79', 'eaf777ce-2749-48af-93ab-c8a52446a8a7', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '74', '0', 'YWJ', 'YWJ', '2020-10-30 15:35:18', '2020-10-30 15:35:18');
INSERT INTO `tb_medical_records` VALUES ('80', 'b31bb880-9d83-42fd-8b58-d54726b34db0', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '75', '0', 'YWJ', 'YWJ', '2020-10-30 15:37:23', '2020-10-30 15:37:23');
INSERT INTO `tb_medical_records` VALUES ('81', 'e891ee96-a872-4bb6-befb-3d732d3d82a3', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '76', '0', 'YWJ', 'YWJ', '2020-10-30 15:39:27', '2020-10-30 15:39:27');
INSERT INTO `tb_medical_records` VALUES ('82', '83760205-7f07-4be0-82cd-bff3bc9fb189', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '77', '0', 'YWJ', 'YWJ', '2020-10-30 15:45:22', '2020-10-30 15:45:22');
INSERT INTO `tb_medical_records` VALUES ('83', '01d950b6-0a7a-449a-b35f-e9617e0cedfa', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '78', '0', 'YWJ', 'YWJ', '2020-10-30 15:56:53', '2020-10-30 15:56:53');
INSERT INTO `tb_medical_records` VALUES ('84', '1c9b7dd6-0ebc-4a54-a62d-7621f6adde16', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '79', '0', 'YWJ', 'YWJ', '2020-10-31 02:11:02', '2020-10-31 02:11:02');
INSERT INTO `tb_medical_records` VALUES ('85', '24884585-dd4d-40b9-bc93-5c8a4d0278bc', '47d94971-412b-43ae-a03c-7f31f2df1b81', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '80', '0', 'YWJYS', 'YWJYS', '2020-11-02 01:44:59', '2020-11-02 01:44:59');
INSERT INTO `tb_medical_records` VALUES ('86', '2a2aa18b-6b26-4859-bba9-170bf9b673f0', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '81', '0', 'YWJYS', 'YWJYS', '2020-11-02 01:48:29', '2020-11-02 01:48:29');
INSERT INTO `tb_medical_records` VALUES ('87', 'ae50e665-3a88-4b49-a5e6-207ac5b6a63b', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '82', '0', 'YWJYS', 'YWJYS', '2020-11-02 01:53:34', '2020-11-02 01:53:34');
INSERT INTO `tb_medical_records` VALUES ('88', '4f87771a-f326-441c-bffb-fa68d39d23d5', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '83', '0', 'YWJYS', 'YWJYS', '2020-11-02 01:54:47', '2020-11-02 01:54:47');
INSERT INTO `tb_medical_records` VALUES ('89', '53f4d917-88da-4286-aef9-c5f976f5c87c', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '84', '0', 'YWJ', 'YWJ', '2020-11-02 08:49:12', '2020-11-02 08:49:12');
INSERT INTO `tb_medical_records` VALUES ('90', '9e0a68c1-c6be-4f6f-b15e-63541805df29', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '85', '0', 'YWJYS', 'YWJYS', '2020-11-04 13:00:07', '2020-11-04 13:00:07');
INSERT INTO `tb_medical_records` VALUES ('91', 'd5da27c6-78ec-4a10-941b-3e2b25cab2a2', '8da06702-b347-46fc-971c-9b7ed7a2f235', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '86', '0', 'YWJYS', 'YWJYS', '2020-11-04 13:01:09', '2020-11-04 13:01:09');
INSERT INTO `tb_medical_records` VALUES ('92', 'a5a1a16a-0eb6-451e-b1ee-f339bbaccb0e', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '87', '0', 'YWJYS', 'YWJYS', '2020-11-05 02:29:13', '2020-11-05 02:29:13');
INSERT INTO `tb_medical_records` VALUES ('93', 'bd1e49bc-f6f4-4263-a6a8-f51aedfd6f9d', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '88', '0', 'YWJYS', 'YWJYS', '2020-11-05 02:33:56', '2020-11-05 02:33:56');
INSERT INTO `tb_medical_records` VALUES ('94', '3b4f8a9b-2778-425c-9d3d-dd2dc33c135e', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '89', '0', 'YWJ', 'YWJ', '2020-11-05 02:46:57', '2020-11-05 02:46:57');
INSERT INTO `tb_medical_records` VALUES ('95', '8f3e23b1-7723-42c3-a57c-ae15f62a4d99', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '90', '0', 'YWJ', 'YWJ', '2020-11-05 03:16:50', '2020-11-05 03:16:50');
INSERT INTO `tb_medical_records` VALUES ('96', '2bebdf58-eb10-436d-a2a2-fd33d4df507d', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '91', '0', 'YWJYS', 'YWJYS', '2020-11-05 03:18:11', '2020-11-05 03:18:11');
INSERT INTO `tb_medical_records` VALUES ('97', '94cbb542-2da6-4213-b42d-fc7fbbaba351', 'b5c434f5-6048-4251-af1d-5732ea57e07f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '92', '0', 'YWJYS', 'YWJYS', '2020-11-05 03:18:37', '2020-11-05 03:18:37');
INSERT INTO `tb_medical_records` VALUES ('98', 'dc1a506a-f1a1-47d6-9724-fb1210cae52e', '8da06702-b347-46fc-971c-9b7ed7a2f235', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '93', '0', 'YWJYS', 'YWJYS', '2020-11-05 03:19:15', '2020-11-05 03:19:15');
INSERT INTO `tb_medical_records` VALUES ('99', '62e1609f-d139-4f2b-8a08-2bda5eb2c8f5', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '94', '0', 'YWJYS', 'YWJYS', '2020-11-05 06:40:32', '2020-11-05 06:40:32');
INSERT INTO `tb_medical_records` VALUES ('100', 'a8c77f64-17a0-4922-b760-b5084fa782e4', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '95', '0', 'YWJYS', 'YWJYS', '2020-11-05 06:41:12', '2020-11-05 06:41:12');
INSERT INTO `tb_medical_records` VALUES ('101', '7810130d-d925-43cd-99bd-77fe71ff1631', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '96', '0', 'YWJYS', 'YWJYS', '2020-11-05 06:42:12', '2020-11-05 06:42:12');
INSERT INTO `tb_medical_records` VALUES ('102', 'a85dbf0a-cfc0-4f96-bf5c-aff2731eea82', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '97', '0', 'YWJYS', 'YWJYS', '2020-11-05 06:47:01', '2020-11-05 06:47:01');
INSERT INTO `tb_medical_records` VALUES ('103', 'a1235d12-b5ec-4671-92ab-eb3dd39fb27b', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '98', '0', 'YWJYS', 'YWJYS', '2020-11-06 06:47:00', '2020-11-06 06:47:00');
INSERT INTO `tb_medical_records` VALUES ('104', '190d853b-e66a-450c-88ae-cb638602db52', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '99', '0', 'YWJYS', 'YWJYS', '2020-11-06 06:54:29', '2020-11-06 06:54:29');
INSERT INTO `tb_medical_records` VALUES ('105', 'c6e530b8-7610-4181-b80d-b940cb59391a', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '100', '0', 'YWJYS', 'YWJYS', '2020-11-06 07:36:58', '2020-11-06 07:36:58');
INSERT INTO `tb_medical_records` VALUES ('106', '36e39b95-3ab4-49b5-9324-fbe0c5c3565e', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '101', '0', 'YWJYS', 'YWJYS', '2020-11-06 07:36:58', '2020-11-06 07:36:58');
INSERT INTO `tb_medical_records` VALUES ('107', 'ffde45ea-af73-49aa-8ea0-c6be4199b52f', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '102', '0', 'YWJYS', 'YWJYS', '2020-11-06 07:37:32', '2020-11-06 07:37:32');
INSERT INTO `tb_medical_records` VALUES ('108', '2955211a-0ec5-4a8c-bb51-23126066619f', '47d94971-412b-43ae-a03c-7f31f2df1b81', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '103', '0', 'YWJYS', 'YWJYS', '2020-11-09 01:32:10', '2020-11-09 01:32:10');
INSERT INTO `tb_medical_records` VALUES ('109', 'e5e2bb9d-8ffd-4454-a244-40b5a572a472', 'acee21c3-2a52-46ca-9b95-79c435586bc9', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '104', '0', 'YWJ', 'YWJ', '2020-11-09 01:45:55', '2020-11-09 01:45:55');
INSERT INTO `tb_medical_records` VALUES ('110', '67f634ae-e78a-4bf6-a7e0-d06e7bbc892a', '12ceb31f-2c52-48c2-82cc-cfa65817e17e', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '105', '0', 'YWJ', 'YWJ', '2020-11-09 05:37:16', '2020-11-09 05:37:16');
INSERT INTO `tb_medical_records` VALUES ('111', 'd27054e4-270a-49f7-8d55-7498494fd5be', 'c01eaf59-67e2-4aa5-8a0e-b4ed2797b776', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '106', '0', 'YWJ', 'YWJ', '2020-11-09 13:21:19', '2020-11-09 13:21:19');
INSERT INTO `tb_medical_records` VALUES ('112', 'e0bdd747-5d41-4110-8993-94f703927343', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '107', '0', 'YWJ', 'YWJ', '2020-11-09 13:25:09', '2020-11-09 13:25:09');
INSERT INTO `tb_medical_records` VALUES ('113', '6d7d32e1-1e64-4aec-b04d-2f0be96f66c4', '12ceb31f-2c52-48c2-82cc-cfa65817e17e', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '108', '0', 'YWJ', 'YWJ', '2020-11-09 13:43:08', '2020-11-09 13:43:08');
INSERT INTO `tb_medical_records` VALUES ('114', '2194f66a-fad4-457f-a06b-23c6ecd59ff5', '12ceb31f-2c52-48c2-82cc-cfa65817e17e', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '109', '0', 'YWJYS', 'YWJYS', '2020-11-09 13:46:08', '2020-11-09 13:46:08');
INSERT INTO `tb_medical_records` VALUES ('115', 'b2dffe42-e209-402f-8697-b237778eab72', '12ceb31f-2c52-48c2-82cc-cfa65817e17e', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '110', '0', 'YWJYS', 'YWJYS', '2020-11-09 13:46:25', '2020-11-09 13:46:25');
INSERT INTO `tb_medical_records` VALUES ('116', '16d3c3ff-6257-4e88-8d90-29cc4012a2ef', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '111', '0', 'YWJYS', 'YWJYS', '2020-11-09 13:47:33', '2020-11-09 13:47:33');
INSERT INTO `tb_medical_records` VALUES ('117', '33477ca5-4cf4-4404-b888-0cab1fc974ff', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '112', '0', 'YWJYS', 'YWJYS', '2020-11-11 01:07:52', '2020-11-11 01:07:52');
INSERT INTO `tb_medical_records` VALUES ('118', '8e2ecf7b-3384-497d-a298-eb424c081517', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '113', '0', 'YWJYS', 'YWJYS', '2020-11-11 01:08:45', '2020-11-11 01:08:45');
INSERT INTO `tb_medical_records` VALUES ('119', '8e5e3348-5ff0-4047-aaad-b37cb128a845', 'b5c434f5-6048-4251-af1d-5732ea57e07f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '114', '0', 'YWJYS', 'YWJYS', '2020-11-11 01:09:37', '2020-11-11 01:09:37');
INSERT INTO `tb_medical_records` VALUES ('120', '779b0fec-74bd-4fc7-9d83-df2f2cf325c0', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '115', '0', 'YWJYS', 'YWJYS', '2020-11-19 09:10:16', '2020-11-19 09:10:16');
INSERT INTO `tb_medical_records` VALUES ('121', 'e4c033b1-0442-4ed4-9d28-6f388f3deed1', '8da06702-b347-46fc-971c-9b7ed7a2f235', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '116', '0', 'YWJYS', 'YWJYS', '2020-11-19 09:11:00', '2020-11-19 09:11:00');
INSERT INTO `tb_medical_records` VALUES ('122', '410132e1-0890-41f6-b472-80009bb1baad', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '117', '0', 'YWJYS', 'YWJYS', '2020-11-19 09:11:29', '2020-11-19 09:11:29');
INSERT INTO `tb_medical_records` VALUES ('123', '8c0b1a6b-a2bb-4811-b473-92c5fcdad6e0', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '118', '0', 'YWJYS', 'YWJYS', '2020-11-19 09:12:08', '2020-11-19 09:12:08');
INSERT INTO `tb_medical_records` VALUES ('124', '854c8032-8eed-486d-ada9-fc54a203928c', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '119', '0', 'YWJYS', 'YWJYS', '2020-11-20 15:36:23', '2020-11-20 15:36:23');
INSERT INTO `tb_medical_records` VALUES ('125', '3baffc43-40c2-406f-b580-1e109f06bb94', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '120', '0', 'YWJYS', 'YWJYS', '2020-11-20 15:37:51', '2020-11-20 15:37:51');
INSERT INTO `tb_medical_records` VALUES ('126', '92d7eea0-c359-4ae9-a94f-68d7eeded106', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '121', '0', 'YWJYS', 'YWJYS', '2020-11-20 15:48:50', '2020-11-20 15:48:50');
INSERT INTO `tb_medical_records` VALUES ('127', 'd8149bca-525b-40a4-ba8b-fb2b9bd4c2ff', '8da06702-b347-46fc-971c-9b7ed7a2f235', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '122', '0', 'YWJYS', 'YWJYS', '2020-11-20 16:16:33', '2020-11-20 16:16:33');
INSERT INTO `tb_medical_records` VALUES ('128', 'd52a85a8-4b30-44f5-9b36-0d8c3a20fe9c', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '123', '0', 'YWJYS', 'YWJYS', '2020-11-20 16:19:21', '2020-11-20 16:19:21');
INSERT INTO `tb_medical_records` VALUES ('129', '14d458c8-6b26-472c-be20-c4773ab47435', '47d94971-412b-43ae-a03c-7f31f2df1b81', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '124', '0', 'YWJYS', 'YWJYS', '2020-11-20 16:19:59', '2020-11-20 16:19:59');
INSERT INTO `tb_medical_records` VALUES ('130', '251cac55-ae51-4595-81ff-504881cbe7cb', '9792d3a2-fcb3-471b-ace6-5dd22243b27c', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '125', '0', 'YWJYS', 'YWJYS', '2020-11-21 00:52:42', '2020-11-21 00:52:42');
INSERT INTO `tb_medical_records` VALUES ('131', '7be4638b-4f57-441b-ab51-e27b6992b87c', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '126', '0', 'YWJYS', 'YWJYS', '2020-11-21 01:00:33', '2020-11-21 01:00:33');
INSERT INTO `tb_medical_records` VALUES ('132', '3fff6582-f869-430d-9eba-19c1379978dd', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '127', '0', 'YWJYS', 'YWJYS', '2020-11-21 01:01:42', '2020-11-21 01:01:42');
INSERT INTO `tb_medical_records` VALUES ('133', 'e0a5acbb-6646-4ef4-b8f1-9f2bf487495d', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '128', '0', 'YWJYS', 'YWJYS', '2020-11-21 01:08:22', '2020-11-21 01:08:22');
INSERT INTO `tb_medical_records` VALUES ('134', 'da60da31-309e-4c6f-a415-b63a50445325', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '129', '0', 'YWJYS', 'YWJYS', '2020-11-23 01:29:51', '2020-11-23 01:29:51');
INSERT INTO `tb_medical_records` VALUES ('135', '1eea592a-70d6-49bc-8f2b-65c7c449eba6', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '130', '0', 'YWJYS', 'YWJYS', '2020-11-23 01:32:07', '2020-11-23 01:32:07');
INSERT INTO `tb_medical_records` VALUES ('136', '85e06268-47c4-4435-82d1-5f7c76846445', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '131', '0', 'YWJYS', 'YWJYS', '2020-11-23 01:32:58', '2020-11-23 01:32:58');
INSERT INTO `tb_medical_records` VALUES ('137', '1ffb8c15-03c1-4788-89c5-69226987f295', '47d94971-412b-43ae-a03c-7f31f2df1b81', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '132', '0', 'YWJYS', 'YWJYS', '2020-11-24 01:08:45', '2020-11-24 01:08:45');
INSERT INTO `tb_medical_records` VALUES ('138', '92003f52-d56a-495c-8a9f-9967202a89fa', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '133', '0', 'YWJYS', 'YWJYS', '2020-11-24 01:32:21', '2020-11-24 01:32:21');
INSERT INTO `tb_medical_records` VALUES ('139', '62c4e1b5-519b-4bab-95a9-9f88ac583e36', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '134', '0', 'YWJYS', 'YWJYS', '2020-11-24 01:40:26', '2020-11-24 01:40:26');
INSERT INTO `tb_medical_records` VALUES ('140', '5191806f-6529-49c5-8382-2f49c8859475', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '135', '0', 'YWJYS', 'YWJYS', '2020-11-24 01:42:37', '2020-11-24 01:42:37');
INSERT INTO `tb_medical_records` VALUES ('141', 'ef692bdf-0d28-47c9-926a-a41d1e7b4578', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '136', '0', 'YWJ', 'YWJ', '2020-11-24 14:19:45', '2020-11-24 14:19:45');
INSERT INTO `tb_medical_records` VALUES ('142', 'f306b854-e44e-4b99-9524-beec963b8807', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '137', '0', 'YWJ', 'YWJ', '2020-11-24 14:20:31', '2020-11-24 14:20:31');
INSERT INTO `tb_medical_records` VALUES ('143', '85d81655-fd41-4fcb-9859-89fb6cbaefd5', '018666ed-c957-4b40-a4a9-1a652d6cc54f', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '', '', '138', '0', 'YWJ', 'YWJ', '2020-11-24 14:47:33', '2020-11-24 14:47:33');
INSERT INTO `tb_medical_records` VALUES ('144', 'f01393d4-8a61-431c-b3db-81df0ad280a3', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '139', '0', 'YWJYS', 'YWJYS', '2020-11-25 01:14:52', '2020-11-25 01:14:52');
INSERT INTO `tb_medical_records` VALUES ('145', '9196e0a8-ef1d-473d-882f-4198ee8325ef', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '140', '0', 'YWJYS', 'YWJYS', '2020-11-25 01:16:55', '2020-11-25 01:16:55');
INSERT INTO `tb_medical_records` VALUES ('146', 'eb1d05b5-cf51-4b88-a72e-708b665221fc', '47d94971-412b-43ae-a03c-7f31f2df1b81', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '141', '0', 'YWJYS', 'YWJYS', '2020-11-30 14:06:08', '2020-11-30 14:06:08');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '1', '用户管理', '7', '7/1', '2', '1', '0', 'bee', 'bee', '2020-07-04 13:07:38', '2020-08-31 08:17:54');
INSERT INTO `tb_menu` VALUES ('2', '2', '特征管理', '7', '7/2', '2', '0', '0', 'bee', 'bee', '2020-07-04 13:10:22', '2020-07-04 13:10:24');
INSERT INTO `tb_menu` VALUES ('3', '3', '科室管理', '7', '7/3', '2', '0', '0', 'bee', 'bee', '2020-07-04 13:11:36', '2020-07-04 13:11:38');
INSERT INTO `tb_menu` VALUES ('4', '4', '疾病管理', '7', '7/4', '2', '1', '0', 'bee', 'bee', '2020-07-04 23:32:30', '2020-09-06 08:58:43');
INSERT INTO `tb_menu` VALUES ('5', '5', '病人管理', '7', '7/5', '2', '0', '0', 'bee', 'bee', '2020-07-06 11:16:29', '2020-07-06 11:16:32');
INSERT INTO `tb_menu` VALUES ('7', '7', '系统管理', '-1', '7', '1', '0', '0', 'bee', 'bee', '2020-07-07 12:14:59', '2020-07-07 12:15:02');
INSERT INTO `tb_menu` VALUES ('8', '8', '角色管理', '7', '7/8', '2', '1', '0', 'bee', 'bee', '2020-08-02 16:03:32', '2020-09-06 08:58:20');
INSERT INTO `tb_menu` VALUES ('26', '097f2572-3d03-4cf3-b06f-4f356a9da69d', '新增用户', '5', '7/5/097f2572-3d03-4cf3-b06f-4f356a9da69d', '3', '1', '1', 'bee', 'bee', '2020-08-31 08:27:08', '2020-08-31 08:29:26');
INSERT INTO `tb_menu` VALUES ('27', '8a1fb2d7-dafe-43d2-b063-6103a9599e88', '测试诊断', '8', '7/8/8a1fb2d7-dafe-43d2-b063-6103a9599e88', '3', '1', '1', 'bee', 'bee', '2020-08-31 08:27:52', '2020-08-31 08:27:52');
INSERT INTO `tb_menu` VALUES ('31', 'd35f9d02-8829-4899-8e60-efca57bc7b5e', '日志管理', '7', '7/d35f9d02-8829-4899-8e60-efca57bc7b5e', '2', '1', '0', 'bee', 'bee', '2020-09-06 12:27:40', '2020-09-06 12:27:40');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_patient_info
-- ----------------------------
INSERT INTO `tb_patient_info` VALUES ('2', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '毕洋强', '410822199108111511', '1', '无病史', '1', '0', 'bee', 'bee', '2020-07-05 10:51:20', '2020-10-17 06:04:47');
INSERT INTO `tb_patient_info` VALUES ('3', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '王大雷', '410822199108111512', '1', '无病史', '1', '0', 'bee', 'YWJ', '2020-07-05 11:09:19', '2020-10-28 13:18:14');
INSERT INTO `tb_patient_info` VALUES ('4', '3b1b6c4a-cc39-4b77-bbcb-1ecf7cfd1877', '病人111', '41082219910811151', '1', '病史', '1', '0', 'bee', 'bee', '2020-07-15 13:25:07', '2020-07-15 13:26:27');
INSERT INTO `tb_patient_info` VALUES ('5', '47d94971-412b-43ae-a03c-7f31f2df1b81', '张三', '410822199105161234', '1', '有病', '1', '0', 'bee', 'bee', '2020-08-02 07:37:48', '2020-08-02 07:37:48');
INSERT INTO `tb_patient_info` VALUES ('6', 'c01eaf59-67e2-4aa5-8a0e-b4ed2797b776', '11', '22', '1', '333', '1', '0', 'bee', 'bee', '2020-08-04 13:33:41', '2020-09-06 11:17:04');
INSERT INTO `tb_patient_info` VALUES ('7', 'c5a736e7-05d8-44c5-a01d-a3ce148bf41e', '王大雷2', '412888199402021236', '1', '阿迪', '1', '0', 'bee', 'bee', '2020-08-31 03:32:13', '2020-09-06 13:14:40');
INSERT INTO `tb_patient_info` VALUES ('8', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '测试员haha', '410822199108111514', '0', 'test', '1', '0', 'bee', 'bee', '2020-10-25 01:44:12', '2020-10-25 01:44:12');
INSERT INTO `tb_patient_info` VALUES ('9', 'acee21c3-2a52-46ca-9b95-79c435586bc9', '测试1', '410822199108111513', '1', '111', '1', '0', 'wangbo-1', 'wangbo-1', '2020-10-28 15:41:42', '2020-10-28 15:41:42');
INSERT INTO `tb_patient_info` VALUES ('10', 'aeb5b688-0bb4-4495-ae31-dda7282da7b5', '病人2', '410822199108111515', '1', '111', '1', '0', 'wangbo-1', 'wangbo-1', '2020-10-28 15:53:00', '2020-10-28 15:53:00');
INSERT INTO `tb_patient_info` VALUES ('11', 'bf39c86d-8a9f-4e47-b0fa-be2fc4b36425', '病人名', '310822199108111511', '1', '12312312', '1', '0', 'YWJ', 'YWJ', '2020-10-29 01:46:07', '2020-10-29 01:46:07');
INSERT INTO `tb_patient_info` VALUES ('12', 'e2a0fd7d-5b64-4642-a0be-222a8b7f7434', 'ww', '123456', '1', '12345', '1', '0', 'YWJ', 'YWJ', '2020-10-30 02:41:01', '2020-10-30 02:41:01');
INSERT INTO `tb_patient_info` VALUES ('13', 'b5c434f5-6048-4251-af1d-5732ea57e07f', 'ss', '338798176755060354', '1', '无记录', '1', '0', 'YWJYS', 'YWJYS', '2020-10-30 02:45:51', '2020-10-30 02:57:25');
INSERT INTO `tb_patient_info` VALUES ('14', '8da06702-b347-46fc-971c-9b7ed7a2f235', 'qq', '1234545', '1', '无', '1', '0', 'YWJYS', 'YWJYS', '2020-10-30 07:44:31', '2020-10-30 07:44:31');
INSERT INTO `tb_patient_info` VALUES ('15', '4b40dfa2-520a-4f6d-9108-a726d8245e1a', '阿斯顿发', '阿斯顿发', '1', '阿斯顿发', '1', '0', 'YWJ', 'YWJ', '2020-10-30 09:47:32', '2020-10-30 09:47:32');
INSERT INTO `tb_patient_info` VALUES ('16', 'cf75b1c6-9a06-4e02-8eec-7d5148fea798', 'erer', '221222322233232232', '1', '无', '1', '0', 'YWJYS', 'YWJYS', '2020-11-02 01:44:59', '2020-11-02 01:44:59');
INSERT INTO `tb_patient_info` VALUES ('17', '12ceb31f-2c52-48c2-82cc-cfa65817e17e', '测试病人1', '330501198807081122', '0', '病史描述', '1', '0', 'YWJYS', 'YWJYS', '2020-11-09 01:32:10', '2020-11-09 01:32:10');
INSERT INTO `tb_patient_info` VALUES ('18', '9792d3a2-fcb3-471b-ace6-5dd22243b27c', '333', '333333333333333333', '1', '333', '1', '0', 'YWJYS', 'YWJYS', '2020-11-20 16:19:59', '2020-11-20 16:19:59');
INSERT INTO `tb_patient_info` VALUES ('19', '4f8b911c-5b9b-4714-9a5a-e6ef0d461afc', '测试xx', '330501199909091122', '1', '啊时代发生噶', '1', '0', 'YWJYS', 'YWJYS', '2020-11-24 01:08:45', '2020-11-24 01:08:45');
INSERT INTO `tb_patient_info` VALUES ('20', '8f62075d-1d32-4f98-a0a1-e1e7087cd044', '测试人员1130', '330501197906151319', '0', '测试说明', '1', '0', 'YWJYS', 'YWJYS', '2020-11-30 14:06:08', '2020-11-30 14:06:08');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `role_code` varchar(255) DEFAULT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '1', '医生', null, 'ROLE_DOCTOR', '0', 'bee', 'bee', '2020-07-04 10:07:36', '2020-07-04 10:07:39');
INSERT INTO `tb_role` VALUES ('2', '2', '管理员', null, 'ROLE_ADMIN', '0', 'bee', 'bee', '2020-07-04 10:08:54', '2020-07-04 10:08:51');
INSERT INTO `tb_role` VALUES ('9', 'ab3e7c86-9988-4233-a38d-e61755cc7439', '测试角色', '', 'test', '1', 'bee', 'bee', '2020-09-06 09:32:28', '2020-09-06 09:32:28');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES ('3', '2', '1', '0', 'bee', 'bee', '2020-07-06 12:14:29', '2020-07-06 12:14:31');
INSERT INTO `tb_role_menu` VALUES ('4', '2', '2', '0', 'bee', 'bee', '2020-07-06 12:14:49', '2020-07-06 12:14:52');
INSERT INTO `tb_role_menu` VALUES ('5', '2', '3', '0', 'bee', 'bee', '2020-07-06 12:15:07', '2020-07-06 12:15:10');
INSERT INTO `tb_role_menu` VALUES ('6', '2', '4', '0', 'bee', 'bee', '2020-07-06 12:15:22', '2020-07-06 12:15:25');
INSERT INTO `tb_role_menu` VALUES ('7', '2', '5', '0', 'bee', 'bee', '2020-07-06 12:15:45', '2020-07-06 12:15:48');
INSERT INTO `tb_role_menu` VALUES ('27', '2', '8', '0', 'bee', 'bee', '2020-08-31 08:34:10', '2020-08-31 08:34:10');
INSERT INTO `tb_role_menu` VALUES ('35', '2', 'd35f9d02-8829-4899-8e60-efca57bc7b5e', '0', 'bee', 'bee', '2020-09-06 12:29:33', '2020-09-06 12:29:33');
INSERT INTO `tb_role_menu` VALUES ('37', '1', '5', '0', 'YWJ', 'YWJ', '2020-10-28 05:23:18', '2020-10-28 05:23:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_user
-- ----------------------------
INSERT INTO `tb_role_user` VALUES ('2', '2', 'top', '0', 'bee', 'bee', '2020-07-05 12:29:11', '2020-07-05 12:29:14');
INSERT INTO `tb_role_user` VALUES ('3', '1', '123456', '0', 'bee', 'bee', '2020-07-05 12:30:15', '2020-07-05 12:30:18');
INSERT INTO `tb_role_user` VALUES ('4', '1', '4561238', '0', 'bee', 'bee', '2020-07-05 12:53:21', '2020-07-05 12:53:24');
INSERT INTO `tb_role_user` VALUES ('5', '1', 'ceacd915-2878-4914-bc4d-ba1cce20aace', '0', 'bee1', 'bee1', '2020-07-05 06:20:34', '2020-07-05 06:20:35');
INSERT INTO `tb_role_user` VALUES ('6', '1', 'f1fbaff6-41ce-47a9-9831-e98d88d6e39f', '0', 'bee11', 'bee11', '2020-07-05 07:13:22', '2020-07-05 07:13:22');
INSERT INTO `tb_role_user` VALUES ('7', '2', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '0', 'YWJ', 'YWJ', '2020-07-05 10:17:30', '2020-07-05 10:17:30');
INSERT INTO `tb_role_user` VALUES ('10', '1', 'f5efac26-0860-4414-b156-3d09fb5d2496', '0', 'a1111sdf', 'a1111sdf', '2020-07-06 08:44:55', '2020-07-06 08:44:55');
INSERT INTO `tb_role_user` VALUES ('11', '1', '6b73f61a-3880-46b5-98a0-7d1e561d429c', '0', 'a11111sdf', 'a11111sdf', '2020-07-06 08:45:20', '2020-07-06 08:45:20');
INSERT INTO `tb_role_user` VALUES ('13', '1', 'top', '0', 'bee', 'be', '2020-07-07 12:20:29', '2020-07-07 12:20:31');
INSERT INTO `tb_role_user` VALUES ('14', '1', 'd11176e4-682e-40b6-a82e-17f122c9e391', '0', 'user1', 'user1', '2020-07-14 14:32:38', '2020-07-14 14:32:38');
INSERT INTO `tb_role_user` VALUES ('15', '1', '26b83445-e522-4e74-be38-831603449412', '0', 'user2', 'user2', '2020-07-14 14:44:00', '2020-07-14 14:44:00');
INSERT INTO `tb_role_user` VALUES ('16', '1', '2d188c52-f4f4-4555-b364-12af4cdbfbd9', '0', 'user3', 'user3', '2020-07-14 14:44:16', '2020-07-14 14:44:16');
INSERT INTO `tb_role_user` VALUES ('17', '1', '611af652-71dd-41ca-a778-ac4ddbf5ffc5', '0', 'user4', 'user4', '2020-07-14 14:44:32', '2020-07-14 14:44:32');
INSERT INTO `tb_role_user` VALUES ('18', '1', 'db4b66a9-6cd5-448c-80c9-090ac09b979c', '0', 'wangbo', 'wangbo', '2020-07-14 14:47:41', '2020-07-14 14:47:41');
INSERT INTO `tb_role_user` VALUES ('19', '1', '6cf83ce7-46de-44bf-8047-edf6916c8034', '0', 'wangbo1', 'wangbo1', '2020-07-17 13:48:41', '2020-07-17 13:48:41');
INSERT INTO `tb_role_user` VALUES ('20', '1', 'ba43fc8f-37ee-4b21-b294-aade3fce4491', '0', 'BEE', 'BEE', '2020-07-19 12:20:16', '2020-07-19 12:20:16');
INSERT INTO `tb_role_user` VALUES ('21', '1', '4e35e769-8692-4813-89a0-6572df174f0a', '0', 'AAABBB', 'AAABBB', '2020-07-19 12:21:30', '2020-07-19 12:21:30');
INSERT INTO `tb_role_user` VALUES ('22', '1', 'd0becfbd-e409-4767-b643-d0f2a5bc38ae', '0', 'wangbo123', 'wangbo123', '2020-08-04 13:07:32', '2020-08-04 13:07:32');
INSERT INTO `tb_role_user` VALUES ('27', '1', '1dd45d94-edc3-4b42-9691-a4e6409a2328', '0', 'WXX', 'WXX', '2020-08-09 14:30:16', '2020-08-09 14:30:16');
INSERT INTO `tb_role_user` VALUES ('30', '1', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', '0', 'wangbo', 'wangbo', '2020-08-20 14:21:28', '2020-08-20 14:21:28');
INSERT INTO `tb_role_user` VALUES ('31', '1', '9281a21f-f2a5-4c79-a76f-b1c4a9e2b4d9', '0', 'wangbo1', 'wangbo1', '2020-08-20 14:25:50', '2020-08-20 14:25:50');
INSERT INTO `tb_role_user` VALUES ('32', '1', '5bd2198d-a44b-42d4-8a73-82845be3f4a0', '0', 'BEE', 'BEE', '2020-08-31 11:04:47', '2020-08-31 11:04:47');
INSERT INTO `tb_role_user` VALUES ('33', '2', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', '0', 'wangbo-1', 'wangbo-1', '2020-09-06 02:34:19', '2020-09-06 02:34:19');
INSERT INTO `tb_role_user` VALUES ('34', '1', '974d725c-daba-4555-bad2-c07375600862', '0', 'ZHH', 'ZHH', '2020-09-06 03:19:27', '2020-09-06 03:19:27');
INSERT INTO `tb_role_user` VALUES ('35', '1', '4435baee-1346-4744-8c00-16ef4fc2be77', '0', 'YWJYS', 'YWJYS', '2020-10-09 05:33:13', '2020-10-09 05:33:13');
INSERT INTO `tb_role_user` VALUES ('36', '1', '5c8a1c0f-a37c-4186-9c9a-c44b69f29086', '0', 'YWJ2', 'YWJ2', '2020-10-28 05:20:32', '2020-10-28 05:20:32');

-- ----------------------------
-- Table structure for tb_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_log`;
CREATE TABLE `tb_sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4042 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sys_log
-- ----------------------------
INSERT INTO `tb_sys_log` VALUES ('3567', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-10-28 05:08:45');
INSERT INTO `tb_sys_log` VALUES ('3568', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-28 05:14:14');
INSERT INTO `tb_sys_log` VALUES ('3569', 'YWJ', '退出平台', 'loginOut', '[]', '117.158.214.185', '2020-10-28 05:17:11');
INSERT INTO `tb_sys_log` VALUES ('3570', 'bee', '注册账户', 'doPostNewUserInfo', '[\"{\\\"userName\\\":\\\"YWJ2\\\",\\\"password\\\":\\\"123456\\\",\\\"email\\\":\\\"247636225@yy.com\\\",\\\"phone\\\":\\\"15809712344\\\",\\\"departmentId\\\":\\\"1111\\\"}\"]', '117.158.214.185', '2020-10-28 05:20:32');
INSERT INTO `tb_sys_log` VALUES ('3571', 'YWJ2', '登录平台', 'doPostNewApplicationResource', '[\"YWJ2\",\"1\",\"123456\"]', '117.158.214.185', '2020-10-28 05:20:42');
INSERT INTO `tb_sys_log` VALUES ('3572', 'YWJ2', '退出平台', 'loginOut', '[]', '117.158.214.185', '2020-10-28 05:22:02');
INSERT INTO `tb_sys_log` VALUES ('3573', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '117.158.214.185', '2020-10-28 05:22:09');
INSERT INTO `tb_sys_log` VALUES ('3574', 'YWJYS', '退出平台', 'loginOut', '[]', '117.158.214.185', '2020-10-28 05:22:11');
INSERT INTO `tb_sys_log` VALUES ('3575', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-10-28 05:22:29');
INSERT INTO `tb_sys_log` VALUES ('3576', 'YWJ', '新增角色和菜单关系', 'doPostApplicationRoleResource', '[\"1\",\"5\"]', '117.158.214.185', '2020-10-28 05:23:18');
INSERT INTO `tb_sys_log` VALUES ('3577', 'YWJ', '退出平台', 'loginOut', '[]', '117.158.214.185', '2020-10-28 05:23:27');
INSERT INTO `tb_sys_log` VALUES ('3578', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '117.158.214.185', '2020-10-28 05:23:45');
INSERT INTO `tb_sys_log` VALUES ('3579', 'YWJYS', '退出平台', 'loginOut', '[]', '117.158.214.185', '2020-10-28 05:24:49');
INSERT INTO `tb_sys_log` VALUES ('3580', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '117.158.214.185', '2020-10-28 05:24:54');
INSERT INTO `tb_sys_log` VALUES ('3581', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-10-28 05:25:02');
INSERT INTO `tb_sys_log` VALUES ('3582', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-28 06:01:40');
INSERT INTO `tb_sys_log` VALUES ('3583', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-28 06:03:06');
INSERT INTO `tb_sys_log` VALUES ('3584', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-28 06:04:32');
INSERT INTO `tb_sys_log` VALUES ('3585', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-28 06:06:02');
INSERT INTO `tb_sys_log` VALUES ('3586', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-28 06:12:42');
INSERT INTO `tb_sys_log` VALUES ('3587', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-28 06:13:03');
INSERT INTO `tb_sys_log` VALUES ('3588', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-28 06:13:18');
INSERT INTO `tb_sys_log` VALUES ('3589', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-28 06:34:14');
INSERT INTO `tb_sys_log` VALUES ('3590', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-28 06:37:03');
INSERT INTO `tb_sys_log` VALUES ('3591', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-28 06:37:15');
INSERT INTO `tb_sys_log` VALUES ('3592', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-28 07:01:21');
INSERT INTO `tb_sys_log` VALUES ('3593', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 07:17:44');
INSERT INTO `tb_sys_log` VALUES ('3594', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 07:17:47');
INSERT INTO `tb_sys_log` VALUES ('3595', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 07:17:51');
INSERT INTO `tb_sys_log` VALUES ('3596', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 07:18:01');
INSERT INTO `tb_sys_log` VALUES ('3597', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 07:18:07');
INSERT INTO `tb_sys_log` VALUES ('3598', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 07:18:19');
INSERT INTO `tb_sys_log` VALUES ('3599', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 07:18:38');
INSERT INTO `tb_sys_log` VALUES ('3600', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 09:36:24');
INSERT INTO `tb_sys_log` VALUES ('3601', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 09:36:31');
INSERT INTO `tb_sys_log` VALUES ('3602', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-28 09:41:48');
INSERT INTO `tb_sys_log` VALUES ('3603', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-28 10:22:25');
INSERT INTO `tb_sys_log` VALUES ('3604', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-28 13:05:35');
INSERT INTO `tb_sys_log` VALUES ('3605', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:05:42');
INSERT INTO `tb_sys_log` VALUES ('3606', 'YWJ', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-28 13:11:14');
INSERT INTO `tb_sys_log` VALUES ('3607', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '223.88.82.124', '2020-10-28 13:16:17');
INSERT INTO `tb_sys_log` VALUES ('3608', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-28 13:16:19');
INSERT INTO `tb_sys_log` VALUES ('3609', 'YWJ', '编辑病人信息', 'doPutPatientInfo', '[\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\",\"{\\\"name\\\":\\\"王大雷\\\",\\\"postId\\\":\\\"410822199108111512\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"无病史\\\",\\\"uuid\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\"}\"]', '223.88.82.124', '2020-10-28 13:18:14');
INSERT INTO `tb_sys_log` VALUES ('3610', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"62d34cc0-6a1e-4f14-a2f4-0499992c4cb4\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-28 13:18:33');
INSERT INTO `tb_sys_log` VALUES ('3611', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:19:07');
INSERT INTO `tb_sys_log` VALUES ('3612', 'YWJ', '编辑疾病', 'doPutAccountAllInfo', null, '223.88.82.124', '2020-10-28 13:19:31');
INSERT INTO `tb_sys_log` VALUES ('3613', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:21:52');
INSERT INTO `tb_sys_log` VALUES ('3614', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:28:41');
INSERT INTO `tb_sys_log` VALUES ('3615', 'YWJ', '删除单个账户信息', 'doDeleteAccount', '[\"5c8a1c0f-a37c-4186-9c9a-c44b69f29086\"]', '223.88.82.124', '2020-10-28 13:34:37');
INSERT INTO `tb_sys_log` VALUES ('3616', 'YWJ', '删除疾病信息', 'doDeleteDisease', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '223.88.82.124', '2020-10-28 13:35:55');
INSERT INTO `tb_sys_log` VALUES ('3617', 'YWJ', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"asdf\\\",\\\"treatment\\\":\\\"asdf\\\",\\\"introduction\\\":\\\"啊的说法\\\",\\\"departmentId\\\":\\\"1112\\\",\\\"sort\\\":0,\\\"remark\\\":\\\"安生点\\\"}\"]', '223.88.82.124', '2020-10-28 13:36:15');
INSERT INTO `tb_sys_log` VALUES ('3618', 'YWJ', '删除疾病信息', 'doDeleteDisease', '[\"28e8ea89-7bf5-4c63-bed0-6dd380fa7255\"]', '223.88.82.124', '2020-10-28 13:36:20');
INSERT INTO `tb_sys_log` VALUES ('3619', 'YWJ', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"啊\\\",\\\"sort\\\":4,\\\"remark\\\":\\\"安生点\\\"}\"]', '223.88.82.124', '2020-10-28 13:37:47');
INSERT INTO `tb_sys_log` VALUES ('3620', 'YWJ', '删除科室信息', 'doDeleteDepartment', '[\"6c773526-5e9f-48e6-b480-079bf59d48ab\"]', '223.88.82.124', '2020-10-28 13:37:49');
INSERT INTO `tb_sys_log` VALUES ('3621', 'YWJ', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"谁的风格\\\",\\\"sort\\\":4,\\\"remark\\\":\\\"谁的风格\\\"}\"]', '223.88.82.124', '2020-10-28 13:38:04');
INSERT INTO `tb_sys_log` VALUES ('3622', 'YWJ', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"asdf\\\",\\\"treatment\\\":\\\"asdf\\\",\\\"introduction\\\":\\\"asdf\\\",\\\"departmentId\\\":\\\"026cf727-7b31-4216-a418-796a3963ab59\\\",\\\"sort\\\":0,\\\"remark\\\":\\\"撒旦法\\\"}\"]', '223.88.82.124', '2020-10-28 13:38:25');
INSERT INTO `tb_sys_log` VALUES ('3623', 'YWJ', '删除科室信息', 'doDeleteDepartment', '[\"026cf727-7b31-4216-a418-796a3963ab59\"]', '223.88.82.124', '2020-10-28 13:38:30');
INSERT INTO `tb_sys_log` VALUES ('3624', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"111111\"]', '182.119.90.87', '2020-10-28 13:39:34');
INSERT INTO `tb_sys_log` VALUES ('3625', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"1\",\"111111\"]', '182.119.90.87', '2020-10-28 13:39:41');
INSERT INTO `tb_sys_log` VALUES ('3626', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '182.119.90.87', '2020-10-28 13:39:44');
INSERT INTO `tb_sys_log` VALUES ('3627', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '127.0.0.1', '2020-10-28 13:45:33');
INSERT INTO `tb_sys_log` VALUES ('3628', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-28 13:45:39');
INSERT INTO `tb_sys_log` VALUES ('3629', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.90.87', '2020-10-28 13:46:32');
INSERT INTO `tb_sys_log` VALUES ('3630', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:46:53');
INSERT INTO `tb_sys_log` VALUES ('3631', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:47:05');
INSERT INTO `tb_sys_log` VALUES ('3632', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:47:08');
INSERT INTO `tb_sys_log` VALUES ('3633', 'wangbo-1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '182.119.90.87', '2020-10-28 13:47:17');
INSERT INTO `tb_sys_log` VALUES ('3634', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:47:18');
INSERT INTO `tb_sys_log` VALUES ('3635', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:47:22');
INSERT INTO `tb_sys_log` VALUES ('3636', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-28 13:47:34');
INSERT INTO `tb_sys_log` VALUES ('3637', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '182.119.90.87', '2020-10-28 14:43:05');
INSERT INTO `tb_sys_log` VALUES ('3638', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-28 15:18:33');
INSERT INTO `tb_sys_log` VALUES ('3639', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-28 15:21:37');
INSERT INTO `tb_sys_log` VALUES ('3640', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-28 15:23:09');
INSERT INTO `tb_sys_log` VALUES ('3641', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-28 15:24:38');
INSERT INTO `tb_sys_log` VALUES ('3642', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"1\",\"111111\"]', '182.119.90.87', '2020-10-28 15:37:50');
INSERT INTO `tb_sys_log` VALUES ('3643', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '182.119.90.87', '2020-10-28 15:37:52');
INSERT INTO `tb_sys_log` VALUES ('3644', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.90.87', '2020-10-28 15:38:10');
INSERT INTO `tb_sys_log` VALUES ('3645', 'wangbo-1', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"测试1\\\",\\\"postId\\\":\\\"410822199108111513\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"111\\\"}\"]', '182.119.90.87', '2020-10-28 15:41:42');
INSERT INTO `tb_sys_log` VALUES ('3646', 'wangbo-1', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"病人2\\\",\\\"postId\\\":\\\"410822199108111515\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"111\\\"}\"]', '182.119.90.87', '2020-10-28 15:53:00');
INSERT INTO `tb_sys_log` VALUES ('3647', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.90.87', '2020-10-28 15:53:00');
INSERT INTO `tb_sys_log` VALUES ('3648', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.90.87', '2020-10-28 15:55:20');
INSERT INTO `tb_sys_log` VALUES ('3649', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.90.87', '2020-10-28 15:57:16');
INSERT INTO `tb_sys_log` VALUES ('3650', 'wangbo-1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '182.119.90.87', '2020-10-28 15:58:05');
INSERT INTO `tb_sys_log` VALUES ('3651', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.90.87', '2020-10-28 15:59:22');
INSERT INTO `tb_sys_log` VALUES ('3652', 'wangbo-1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '182.119.90.87', '2020-10-28 15:59:48');
INSERT INTO `tb_sys_log` VALUES ('3653', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"111111\"]', '127.0.0.1', '2020-10-29 01:26:55');
INSERT INTO `tb_sys_log` VALUES ('3654', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-29 01:27:06');
INSERT INTO `tb_sys_log` VALUES ('3655', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-29 01:40:29');
INSERT INTO `tb_sys_log` VALUES ('3656', 'YWJ', '新增病人信息', 'doPostNewPatientInfo', '[\"{     \\\"medicalHistory\\\": \\\"12312312\\\",     \\\"name\\\": \\\"病人名\\\",     \\\"postId\\\": \\\"310822199108111511\\\",     \\\"sex\\\": \\\"1\\\" }\"]', '127.0.0.1', '2020-10-29 01:46:07');
INSERT INTO `tb_sys_log` VALUES ('3657', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 02:58:09');
INSERT INTO `tb_sys_log` VALUES ('3658', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-10-29 05:03:12');
INSERT INTO `tb_sys_log` VALUES ('3659', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 05:17:44');
INSERT INTO `tb_sys_log` VALUES ('3660', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 05:27:36');
INSERT INTO `tb_sys_log` VALUES ('3661', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 05:28:09');
INSERT INTO `tb_sys_log` VALUES ('3662', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 05:58:42');
INSERT INTO `tb_sys_log` VALUES ('3663', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-29 06:07:48');
INSERT INTO `tb_sys_log` VALUES ('3664', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '182.119.91.103', '2020-10-29 13:11:32');
INSERT INTO `tb_sys_log` VALUES ('3665', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.91.103', '2020-10-29 13:11:59');
INSERT INTO `tb_sys_log` VALUES ('3666', 'wangbo-1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '182.119.91.103', '2020-10-29 13:12:33');
INSERT INTO `tb_sys_log` VALUES ('3667', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-29 13:30:22');
INSERT INTO `tb_sys_log` VALUES ('3668', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.91.103', '2020-10-29 13:43:52');
INSERT INTO `tb_sys_log` VALUES ('3669', 'wangbo-1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '182.119.91.103', '2020-10-29 13:44:11');
INSERT INTO `tb_sys_log` VALUES ('3670', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 13:45:05');
INSERT INTO `tb_sys_log` VALUES ('3671', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.91.103', '2020-10-29 13:48:17');
INSERT INTO `tb_sys_log` VALUES ('3672', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 13:55:53');
INSERT INTO `tb_sys_log` VALUES ('3673', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 13:57:03');
INSERT INTO `tb_sys_log` VALUES ('3674', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 13:57:39');
INSERT INTO `tb_sys_log` VALUES ('3675', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 13:58:26');
INSERT INTO `tb_sys_log` VALUES ('3676', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '182.119.91.103', '2020-10-29 14:00:35');
INSERT INTO `tb_sys_log` VALUES ('3677', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.91.103', '2020-10-29 14:00:40');
INSERT INTO `tb_sys_log` VALUES ('3678', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 14:00:42');
INSERT INTO `tb_sys_log` VALUES ('3679', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-29 14:12:10');
INSERT INTO `tb_sys_log` VALUES ('3680', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '182.119.91.103', '2020-10-29 14:51:15');
INSERT INTO `tb_sys_log` VALUES ('3681', 'wangbo-1', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '182.119.91.103', '2020-10-29 14:51:26');
INSERT INTO `tb_sys_log` VALUES ('3682', 'wangbo-1', '否定诊断记录', 'doPostNegativeMedicalInfo', null, '182.119.91.103', '2020-10-29 15:01:32');
INSERT INTO `tb_sys_log` VALUES ('3683', 'wangbo-1', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '182.119.91.103', '2020-10-29 15:02:54');
INSERT INTO `tb_sys_log` VALUES ('3684', 'wangbo-1', '否定诊断记录', 'doPostNegativeMedicalInfo', null, '182.119.91.103', '2020-10-29 15:03:44');
INSERT INTO `tb_sys_log` VALUES ('3685', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.91.103', '2020-10-29 15:05:46');
INSERT INTO `tb_sys_log` VALUES ('3686', 'wangbo-1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '182.119.91.103', '2020-10-29 15:06:11');
INSERT INTO `tb_sys_log` VALUES ('3687', 'wangbo-1', '否定诊断记录', 'doPostNegativeMedicalInfo', null, '182.119.91.103', '2020-10-29 15:07:03');
INSERT INTO `tb_sys_log` VALUES ('3688', 'wangbo-1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a908d8d8-f8c0-44ba-a803-b302077cd32c\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '182.119.91.103', '2020-10-29 15:13:45');
INSERT INTO `tb_sys_log` VALUES ('3689', 'wangbo-1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '182.119.91.103', '2020-10-29 15:14:19');
INSERT INTO `tb_sys_log` VALUES ('3690', 'wangbo-1', '否定诊断记录', 'doPostNegativeMedicalInfo', null, '182.119.91.103', '2020-10-29 15:15:04');
INSERT INTO `tb_sys_log` VALUES ('3691', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"11111\"]', '182.119.91.103', '2020-10-29 16:40:20');
INSERT INTO `tb_sys_log` VALUES ('3692', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '182.119.91.103', '2020-10-29 16:40:22');
INSERT INTO `tb_sys_log` VALUES ('3693', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-10-30 01:33:54');
INSERT INTO `tb_sys_log` VALUES ('3694', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-30 01:34:16');
INSERT INTO `tb_sys_log` VALUES ('3695', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-30 01:34:52');
INSERT INTO `tb_sys_log` VALUES ('3696', 'YWJ', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '117.158.214.185', '2020-10-30 01:35:06');
INSERT INTO `tb_sys_log` VALUES ('3697', 'YWJ', '退出平台', 'loginOut', '[]', '117.158.214.185', '2020-10-30 01:35:33');
INSERT INTO `tb_sys_log` VALUES ('3698', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '117.158.214.185', '2020-10-30 01:35:45');
INSERT INTO `tb_sys_log` VALUES ('3699', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-30 01:36:31');
INSERT INTO `tb_sys_log` VALUES ('3700', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-30 01:37:03');
INSERT INTO `tb_sys_log` VALUES ('3701', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '117.158.214.185', '2020-10-30 01:37:16');
INSERT INTO `tb_sys_log` VALUES ('3702', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-30 01:37:23');
INSERT INTO `tb_sys_log` VALUES ('3703', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-30 01:39:15');
INSERT INTO `tb_sys_log` VALUES ('3704', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-30 01:39:39');
INSERT INTO `tb_sys_log` VALUES ('3705', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-30 01:39:41');
INSERT INTO `tb_sys_log` VALUES ('3706', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-30 01:39:43');
INSERT INTO `tb_sys_log` VALUES ('3707', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '117.158.214.185', '2020-10-30 01:39:52');
INSERT INTO `tb_sys_log` VALUES ('3708', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-30 01:39:58');
INSERT INTO `tb_sys_log` VALUES ('3709', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-30 01:40:08');
INSERT INTO `tb_sys_log` VALUES ('3710', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-30 01:40:34');
INSERT INTO `tb_sys_log` VALUES ('3711', 'YWJYS', '否定诊断记录', 'doPostNegativeMedicalInfo', null, '117.158.214.185', '2020-10-30 01:41:44');
INSERT INTO `tb_sys_log` VALUES ('3712', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"3b1b6c4a-cc39-4b77-bbcb-1ecf7cfd1877\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-30 01:44:32');
INSERT INTO `tb_sys_log` VALUES ('3713', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-30 01:46:25');
INSERT INTO `tb_sys_log` VALUES ('3714', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-30 01:46:47');
INSERT INTO `tb_sys_log` VALUES ('3715', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '117.158.214.185', '2020-10-30 01:47:36');
INSERT INTO `tb_sys_log` VALUES ('3716', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-30 02:09:30');
INSERT INTO `tb_sys_log` VALUES ('3717', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-30 02:11:01');
INSERT INTO `tb_sys_log` VALUES ('3718', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-30 02:11:04');
INSERT INTO `tb_sys_log` VALUES ('3719', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-30 02:11:14');
INSERT INTO `tb_sys_log` VALUES ('3720', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-10-30 02:14:53');
INSERT INTO `tb_sys_log` VALUES ('3721', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-30 02:15:56');
INSERT INTO `tb_sys_log` VALUES ('3722', 'YWJ', '退出平台', 'loginOut', '[]', '117.158.214.185', '2020-10-30 02:18:40');
INSERT INTO `tb_sys_log` VALUES ('3723', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '117.158.214.185', '2020-10-30 02:18:58');
INSERT INTO `tb_sys_log` VALUES ('3724', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '117.158.214.185', '2020-10-30 02:22:31');
INSERT INTO `tb_sys_log` VALUES ('3725', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '60.191.32.71', '2020-10-30 02:39:59');
INSERT INTO `tb_sys_log` VALUES ('3726', 'YWJ', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"ww\\\",\\\"postId\\\":\\\"123456\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"12345\\\"}\"]', '60.191.32.71', '2020-10-30 02:41:01');
INSERT INTO `tb_sys_log` VALUES ('3727', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-10-30 02:41:01');
INSERT INTO `tb_sys_log` VALUES ('3728', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-10-30 02:41:50');
INSERT INTO `tb_sys_log` VALUES ('3729', 'YWJ', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '60.191.32.71', '2020-10-30 02:42:29');
INSERT INTO `tb_sys_log` VALUES ('3730', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '60.191.32.71', '2020-10-30 02:44:16');
INSERT INTO `tb_sys_log` VALUES ('3731', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-10-30 02:44:44');
INSERT INTO `tb_sys_log` VALUES ('3732', 'YWJYS', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"ss\\\",\\\"postId\\\":\\\"338798176755060354\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"无记录\\\"}\"]', '60.191.32.71', '2020-10-30 02:45:51');
INSERT INTO `tb_sys_log` VALUES ('3733', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-10-30 02:45:51');
INSERT INTO `tb_sys_log` VALUES ('3734', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-10-30 02:46:32');
INSERT INTO `tb_sys_log` VALUES ('3735', 'YWJYS', '否定诊断记录', 'doPostNegativeMedicalInfo', null, '60.191.32.71', '2020-10-30 02:49:30');
INSERT INTO `tb_sys_log` VALUES ('3736', 'YWJYS', '编辑病人信息', 'doPutPatientInfo', '[\"b5c434f5-6048-4251-af1d-5732ea57e07f\",\"{\\\"name\\\":\\\"ss\\\",\\\"postId\\\":\\\"338798176755060354\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"无记录\\\",\\\"uuid\\\":\\\"b5c434f5-6048-4251-af1d-5732ea57e07f\\\"}\"]', '60.191.32.71', '2020-10-30 02:57:25');
INSERT INTO `tb_sys_log` VALUES ('3737', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"b5c434f5-6048-4251-af1d-5732ea57e07f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-10-30 03:01:24');
INSERT INTO `tb_sys_log` VALUES ('3738', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-10-30 03:01:45');
INSERT INTO `tb_sys_log` VALUES ('3739', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"b5c434f5-6048-4251-af1d-5732ea57e07f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-10-30 03:04:04');
INSERT INTO `tb_sys_log` VALUES ('3740', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-10-30 03:10:48');
INSERT INTO `tb_sys_log` VALUES ('3741', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"b5c434f5-6048-4251-af1d-5732ea57e07f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-10-30 03:14:40');
INSERT INTO `tb_sys_log` VALUES ('3742', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-10-30 03:15:46');
INSERT INTO `tb_sys_log` VALUES ('3743', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"b5c434f5-6048-4251-af1d-5732ea57e07f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-10-30 03:16:26');
INSERT INTO `tb_sys_log` VALUES ('3744', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-10-30 03:17:40');
INSERT INTO `tb_sys_log` VALUES ('3745', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '117.147.12.146', '2020-10-30 07:40:13');
INSERT INTO `tb_sys_log` VALUES ('3746', 'YWJYS', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"qq\\\",\\\"postId\\\":\\\"1234545\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"无\\\"}\"]', '117.147.12.146', '2020-10-30 07:44:31');
INSERT INTO `tb_sys_log` VALUES ('3747', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.147.12.146', '2020-10-30 07:44:31');
INSERT INTO `tb_sys_log` VALUES ('3748', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.147.12.146', '2020-10-30 07:46:53');
INSERT INTO `tb_sys_log` VALUES ('3749', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-10-30 09:47:14');
INSERT INTO `tb_sys_log` VALUES ('3750', 'YWJ', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"阿斯顿发\\\",\\\"postId\\\":\\\"阿斯顿发\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"阿斯顿发\\\"}\"]', '117.158.214.185', '2020-10-30 09:47:32');
INSERT INTO `tb_sys_log` VALUES ('3751', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-30 09:47:32');
INSERT INTO `tb_sys_log` VALUES ('3752', 'YWJ', '编辑病人信息', 'doPutPatientInfo', '[\"4b40dfa2-520a-4f6d-9108-a726d8245e1a\",\"{\\\"name\\\":\\\"阿斯顿发\\\",\\\"postId\\\":\\\"阿斯顿发当时发生的\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"阿斯顿发\\\",\\\"uuid\\\":\\\"4b40dfa2-520a-4f6d-9108-a726d8245e1a\\\"}\"]', '117.158.214.185', '2020-10-30 09:47:53');
INSERT INTO `tb_sys_log` VALUES ('3753', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-30 14:27:05');
INSERT INTO `tb_sys_log` VALUES ('3754', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-30 14:27:06');
INSERT INTO `tb_sys_log` VALUES ('3755', 'YWJ', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-30 14:29:12');
INSERT INTO `tb_sys_log` VALUES ('3756', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '223.88.82.124', '2020-10-30 14:29:19');
INSERT INTO `tb_sys_log` VALUES ('3757', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 14:29:34');
INSERT INTO `tb_sys_log` VALUES ('3758', 'YWJYS', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-30 14:29:38');
INSERT INTO `tb_sys_log` VALUES ('3759', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '223.88.82.124', '2020-10-30 14:29:54');
INSERT INTO `tb_sys_log` VALUES ('3760', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-30 14:29:57');
INSERT INTO `tb_sys_log` VALUES ('3761', 'YWJ', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-30 14:33:59');
INSERT INTO `tb_sys_log` VALUES ('3762', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-30 14:35:23');
INSERT INTO `tb_sys_log` VALUES ('3763', 'YWJ', '编辑病人信息', 'doPutPatientInfo', '[\"018666ed-c957-4b40-a4a9-1a652d6cc54f\",\"{\\\"name\\\":\\\"毕洋强\\\",\\\"postId\\\":\\\"4108221991081115118\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"无病史\\\",\\\"uuid\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\"}\"]', '223.88.82.124', '2020-10-30 14:50:16');
INSERT INTO `tb_sys_log` VALUES ('3764', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-30 14:51:53');
INSERT INTO `tb_sys_log` VALUES ('3765', 'YWJ', '编辑病人信息', 'doPutPatientInfo', '[\"018666ed-c957-4b40-a4a9-1a652d6cc54f\",\"{\\\"name\\\":\\\"毕洋强\\\",\\\"postId\\\":\\\"4108221991081115118\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"无病史\\\",\\\"uuid\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\"}\"]', '127.0.0.1', '2020-10-30 14:51:58');
INSERT INTO `tb_sys_log` VALUES ('3766', 'YWJ', '编辑病人信息', 'doPutPatientInfo', '[\"018666ed-c957-4b40-a4a9-1a652d6cc54f\",\"{\\\"name\\\":\\\"毕洋强\\\",\\\"postId\\\":\\\"4108221991081115118\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"无病史\\\",\\\"uuid\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\"}\"]', '127.0.0.1', '2020-10-30 14:53:39');
INSERT INTO `tb_sys_log` VALUES ('3767', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-30 14:54:11');
INSERT INTO `tb_sys_log` VALUES ('3768', 'YWJ', '启用/禁用特征', 'doPutExtendAttributeState', '[\"c6e8e525-389d-47de-89c4-0ebe35ae0302\",0]', '223.88.82.124', '2020-10-30 14:55:11');
INSERT INTO `tb_sys_log` VALUES ('3769', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 14:55:26');
INSERT INTO `tb_sys_log` VALUES ('3770', 'YWJ', '启用/禁用特征', 'doPutExtendAttributeState', '[\"c6e8e525-389d-47de-89c4-0ebe35ae0302\",1]', '223.88.82.124', '2020-10-30 14:55:49');
INSERT INTO `tb_sys_log` VALUES ('3771', 'YWJ', '编辑单个特征的信息', 'doPutExtendAttribute', null, '223.88.82.124', '2020-10-30 15:00:14');
INSERT INTO `tb_sys_log` VALUES ('3772', 'YWJ', '编辑单个特征的信息', 'doPutExtendAttribute', null, '223.88.82.124', '2020-10-30 15:00:25');
INSERT INTO `tb_sys_log` VALUES ('3773', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-10-30 15:07:08');
INSERT INTO `tb_sys_log` VALUES ('3774', 'YWJ', '新增特征信息', 'doPostNewExtendAttribute', null, '127.0.0.1', '2020-10-30 15:07:16');
INSERT INTO `tb_sys_log` VALUES ('3775', 'YWJ', '启用/禁用特征', 'doPutExtendAttributeState', '[\"c6e8e525-389d-47de-89c4-0ebe35ae0302\",0]', '223.88.82.124', '2020-10-30 15:07:39');
INSERT INTO `tb_sys_log` VALUES ('3776', 'YWJ', '编辑单个特征的信息', 'doPutExtendAttribute', null, '223.88.82.124', '2020-10-30 15:08:04');
INSERT INTO `tb_sys_log` VALUES ('3777', 'YWJ', '编辑单个特征的信息', 'doPutExtendAttribute', null, '223.88.82.124', '2020-10-30 15:08:20');
INSERT INTO `tb_sys_log` VALUES ('3778', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:08:48');
INSERT INTO `tb_sys_log` VALUES ('3779', 'YWJ', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"d9427c79-5f0e-4e06-9611-6574f9bfe15b\",\"1111,1112,1113\"]', '223.88.82.124', '2020-10-30 15:09:49');
INSERT INTO `tb_sys_log` VALUES ('3780', 'YWJ', '编辑单个特征的信息', 'doPutExtendAttribute', null, '223.88.82.124', '2020-10-30 15:09:51');
INSERT INTO `tb_sys_log` VALUES ('3781', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:09:55');
INSERT INTO `tb_sys_log` VALUES ('3782', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:13:08');
INSERT INTO `tb_sys_log` VALUES ('3783', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:24:03');
INSERT INTO `tb_sys_log` VALUES ('3784', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.88.82.124', '2020-10-30 15:24:26');
INSERT INTO `tb_sys_log` VALUES ('3785', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:25:19');
INSERT INTO `tb_sys_log` VALUES ('3786', 'YWJ', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"asdf\\\",\\\"sort\\\":4,\\\"remark\\\":\\\"asdf \\\"}\"]', '223.88.82.124', '2020-10-30 15:26:41');
INSERT INTO `tb_sys_log` VALUES ('3787', 'YWJ', '编辑科室', 'doPutAccountAllInfo', null, '223.88.82.124', '2020-10-30 15:26:48');
INSERT INTO `tb_sys_log` VALUES ('3788', 'YWJ', '删除科室信息', 'doDeleteDepartment', '[\"cbb83963-4f5d-41d3-a5e4-e8667630c0d9\"]', '223.88.82.124', '2020-10-30 15:26:50');
INSERT INTO `tb_sys_log` VALUES ('3789', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:30:21');
INSERT INTO `tb_sys_log` VALUES ('3790', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:30:42');
INSERT INTO `tb_sys_log` VALUES ('3791', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:31:55');
INSERT INTO `tb_sys_log` VALUES ('3792', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:32:07');
INSERT INTO `tb_sys_log` VALUES ('3793', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:35:18');
INSERT INTO `tb_sys_log` VALUES ('3794', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:37:23');
INSERT INTO `tb_sys_log` VALUES ('3795', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"62d34cc0-6a1e-4f14-a2f4-0499992c4cb4\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:39:27');
INSERT INTO `tb_sys_log` VALUES ('3796', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.88.82.124', '2020-10-30 15:40:00');
INSERT INTO `tb_sys_log` VALUES ('3797', 'YWJ', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '223.88.82.124', '2020-10-30 15:40:08');
INSERT INTO `tb_sys_log` VALUES ('3798', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:45:22');
INSERT INTO `tb_sys_log` VALUES ('3799', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-30 15:54:21');
INSERT INTO `tb_sys_log` VALUES ('3800', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-30 15:54:30');
INSERT INTO `tb_sys_log` VALUES ('3801', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-30 15:56:53');
INSERT INTO `tb_sys_log` VALUES ('3802', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-31 02:10:17');
INSERT INTO `tb_sys_log` VALUES ('3803', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-31 02:11:02');
INSERT INTO `tb_sys_log` VALUES ('3804', 'YWJ', '编辑单个特征的信息', 'doPutExtendAttribute', null, '223.88.82.124', '2020-10-31 02:13:23');
INSERT INTO `tb_sys_log` VALUES ('3805', 'YWJ', '编辑单个特征的信息', 'doPutExtendAttribute', null, '223.88.82.124', '2020-10-31 02:13:35');
INSERT INTO `tb_sys_log` VALUES ('3806', 'YWJ', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-31 02:14:55');
INSERT INTO `tb_sys_log` VALUES ('3807', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '223.88.82.124', '2020-10-31 02:15:11');
INSERT INTO `tb_sys_log` VALUES ('3808', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-31 02:15:14');
INSERT INTO `tb_sys_log` VALUES ('3809', 'YWJ', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-31 02:16:33');
INSERT INTO `tb_sys_log` VALUES ('3810', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-11-02 00:46:50');
INSERT INTO `tb_sys_log` VALUES ('3811', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '60.191.32.71', '2020-11-02 01:44:15');
INSERT INTO `tb_sys_log` VALUES ('3812', 'YWJYS', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"erer\\\",\\\"postId\\\":\\\"221222322233232232\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"无\\\"}\"]', '60.191.32.71', '2020-11-02 01:44:59');
INSERT INTO `tb_sys_log` VALUES ('3813', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-11-02 01:44:59');
INSERT INTO `tb_sys_log` VALUES ('3814', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-11-02 01:45:35');
INSERT INTO `tb_sys_log` VALUES ('3815', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '60.191.32.71', '2020-11-02 01:46:19');
INSERT INTO `tb_sys_log` VALUES ('3816', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-11-02 01:48:29');
INSERT INTO `tb_sys_log` VALUES ('3817', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-11-02 01:53:15');
INSERT INTO `tb_sys_log` VALUES ('3818', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-11-02 01:53:34');
INSERT INTO `tb_sys_log` VALUES ('3819', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-11-02 01:54:02');
INSERT INTO `tb_sys_log` VALUES ('3820', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '60.191.32.71', '2020-11-02 01:54:39');
INSERT INTO `tb_sys_log` VALUES ('3821', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.191.32.71', '2020-11-02 01:54:47');
INSERT INTO `tb_sys_log` VALUES ('3822', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.191.32.71', '2020-11-02 01:55:06');
INSERT INTO `tb_sys_log` VALUES ('3823', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '60.191.32.71', '2020-11-02 01:55:36');
INSERT INTO `tb_sys_log` VALUES ('3824', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-11-02 08:45:44');
INSERT INTO `tb_sys_log` VALUES ('3825', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-11-02 08:48:33');
INSERT INTO `tb_sys_log` VALUES ('3826', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-11-02 08:49:12');
INSERT INTO `tb_sys_log` VALUES ('3827', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '125.41.113.198', '2020-11-02 13:09:40');
INSERT INTO `tb_sys_log` VALUES ('3828', 'wangbo-1', '退出平台', 'loginOut', '[]', '125.41.113.198', '2020-11-02 13:15:16');
INSERT INTO `tb_sys_log` VALUES ('3829', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '125.41.113.198', '2020-11-02 13:15:33');
INSERT INTO `tb_sys_log` VALUES ('3830', 'wangbo-1', '删除疾病信息', 'doDeleteDisease', '[\"eb3b951e-e564-4dc1-920b-759872a9d98b\"]', '125.41.113.198', '2020-11-02 13:42:34');
INSERT INTO `tb_sys_log` VALUES ('3831', 'wangbo-1', '删除疾病信息', 'doDeleteDisease', '[\"4849bea3-a7d8-4ff8-b249-79d5219b16ee\"]', '125.41.113.198', '2020-11-02 13:44:06');
INSERT INTO `tb_sys_log` VALUES ('3832', 'wangbo-1', '删除疾病信息', 'doDeleteDisease', '[\"adfe9dbd-22e8-49cb-9e6c-0ca8fe2b5759\"]', '125.41.113.198', '2020-11-02 13:44:44');
INSERT INTO `tb_sys_log` VALUES ('3833', 'wangbo-1', '退出平台', 'loginOut', '[]', '125.41.113.198', '2020-11-02 13:45:09');
INSERT INTO `tb_sys_log` VALUES ('3834', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '125.41.113.198', '2020-11-02 13:45:19');
INSERT INTO `tb_sys_log` VALUES ('3835', 'wangbo-1', '退出平台', 'loginOut', '[]', '125.41.113.198', '2020-11-02 13:47:10');
INSERT INTO `tb_sys_log` VALUES ('3836', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '125.41.113.198', '2020-11-02 13:49:22');
INSERT INTO `tb_sys_log` VALUES ('3837', 'wangbo-1', '退出平台', 'loginOut', '[]', '125.41.113.198', '2020-11-02 13:49:38');
INSERT INTO `tb_sys_log` VALUES ('3838', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '125.41.113.198', '2020-11-02 13:50:18');
INSERT INTO `tb_sys_log` VALUES ('3839', 'wangbo-1', '退出平台', 'loginOut', '[]', '125.41.113.198', '2020-11-02 13:51:05');
INSERT INTO `tb_sys_log` VALUES ('3840', 'bee', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"1\",\"111111\"]', '125.41.113.198', '2020-11-02 13:51:37');
INSERT INTO `tb_sys_log` VALUES ('3841', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '125.41.113.198', '2020-11-02 13:51:39');
INSERT INTO `tb_sys_log` VALUES ('3842', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '112.10.181.156', '2020-11-04 12:59:04');
INSERT INTO `tb_sys_log` VALUES ('3843', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '112.10.181.156', '2020-11-04 12:59:57');
INSERT INTO `tb_sys_log` VALUES ('3844', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-04 13:00:07');
INSERT INTO `tb_sys_log` VALUES ('3845', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"8da06702-b347-46fc-971c-9b7ed7a2f235\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-04 13:01:09');
INSERT INTO `tb_sys_log` VALUES ('3846', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '218.75.123.171', '2020-11-05 02:29:04');
INSERT INTO `tb_sys_log` VALUES ('3847', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '218.75.123.171', '2020-11-05 02:29:13');
INSERT INTO `tb_sys_log` VALUES ('3848', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '218.75.123.171', '2020-11-05 02:33:56');
INSERT INTO `tb_sys_log` VALUES ('3849', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-11-05 02:46:47');
INSERT INTO `tb_sys_log` VALUES ('3850', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-11-05 02:46:57');
INSERT INTO `tb_sys_log` VALUES ('3851', 'YWJ', '编辑疾病', 'doPutAccountAllInfo', null, '117.158.214.185', '2020-11-05 03:16:15');
INSERT INTO `tb_sys_log` VALUES ('3852', 'YWJ', '编辑疾病', 'doPutAccountAllInfo', null, '117.158.214.185', '2020-11-05 03:16:23');
INSERT INTO `tb_sys_log` VALUES ('3853', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-11-05 03:16:50');
INSERT INTO `tb_sys_log` VALUES ('3854', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-11-05 03:17:10');
INSERT INTO `tb_sys_log` VALUES ('3855', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '218.75.123.171', '2020-11-05 03:18:02');
INSERT INTO `tb_sys_log` VALUES ('3856', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '218.75.123.171', '2020-11-05 03:18:11');
INSERT INTO `tb_sys_log` VALUES ('3857', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '218.75.123.171', '2020-11-05 03:18:30');
INSERT INTO `tb_sys_log` VALUES ('3858', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"b5c434f5-6048-4251-af1d-5732ea57e07f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '218.75.123.171', '2020-11-05 03:18:37');
INSERT INTO `tb_sys_log` VALUES ('3859', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '218.75.123.171', '2020-11-05 03:18:58');
INSERT INTO `tb_sys_log` VALUES ('3860', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"8da06702-b347-46fc-971c-9b7ed7a2f235\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '218.75.123.171', '2020-11-05 03:19:15');
INSERT INTO `tb_sys_log` VALUES ('3861', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '218.75.123.171', '2020-11-05 03:19:38');
INSERT INTO `tb_sys_log` VALUES ('3862', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '218.75.123.171', '2020-11-05 03:19:51');
INSERT INTO `tb_sys_log` VALUES ('3863', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '218.75.123.171', '2020-11-05 06:40:23');
INSERT INTO `tb_sys_log` VALUES ('3864', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '218.75.123.171', '2020-11-05 06:40:32');
INSERT INTO `tb_sys_log` VALUES ('3865', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '218.75.123.171', '2020-11-05 06:40:57');
INSERT INTO `tb_sys_log` VALUES ('3866', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '218.75.123.171', '2020-11-05 06:41:12');
INSERT INTO `tb_sys_log` VALUES ('3867', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '218.75.123.171', '2020-11-05 06:41:36');
INSERT INTO `tb_sys_log` VALUES ('3868', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '218.75.123.171', '2020-11-05 06:42:09');
INSERT INTO `tb_sys_log` VALUES ('3869', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '218.75.123.171', '2020-11-05 06:42:12');
INSERT INTO `tb_sys_log` VALUES ('3870', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '218.75.123.171', '2020-11-05 06:42:33');
INSERT INTO `tb_sys_log` VALUES ('3871', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '218.75.123.171', '2020-11-05 06:42:57');
INSERT INTO `tb_sys_log` VALUES ('3872', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '218.75.123.171', '2020-11-05 06:47:01');
INSERT INTO `tb_sys_log` VALUES ('3873', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '218.75.123.171', '2020-11-05 06:47:51');
INSERT INTO `tb_sys_log` VALUES ('3874', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-11-05 10:08:39');
INSERT INTO `tb_sys_log` VALUES ('3875', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-11-05 10:14:18');
INSERT INTO `tb_sys_log` VALUES ('3876', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '60.12.8.170', '2020-11-06 06:46:52');
INSERT INTO `tb_sys_log` VALUES ('3877', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.12.8.170', '2020-11-06 06:47:00');
INSERT INTO `tb_sys_log` VALUES ('3878', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.12.8.170', '2020-11-06 06:53:22');
INSERT INTO `tb_sys_log` VALUES ('3879', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '60.12.8.170', '2020-11-06 06:54:27');
INSERT INTO `tb_sys_log` VALUES ('3880', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.12.8.170', '2020-11-06 06:54:29');
INSERT INTO `tb_sys_log` VALUES ('3881', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.12.8.170', '2020-11-06 06:56:30');
INSERT INTO `tb_sys_log` VALUES ('3882', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '60.12.8.170', '2020-11-06 07:36:36');
INSERT INTO `tb_sys_log` VALUES ('3883', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.12.8.170', '2020-11-06 07:36:58');
INSERT INTO `tb_sys_log` VALUES ('3884', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.12.8.170', '2020-11-06 07:36:58');
INSERT INTO `tb_sys_log` VALUES ('3885', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.12.8.170', '2020-11-06 07:37:17');
INSERT INTO `tb_sys_log` VALUES ('3886', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.12.8.170', '2020-11-06 07:37:17');
INSERT INTO `tb_sys_log` VALUES ('3887', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.12.8.170', '2020-11-06 07:37:32');
INSERT INTO `tb_sys_log` VALUES ('3888', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.12.8.170', '2020-11-06 07:38:24');
INSERT INTO `tb_sys_log` VALUES ('3889', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '223.93.188.66', '2020-11-09 01:30:58');
INSERT INTO `tb_sys_log` VALUES ('3890', 'YWJYS', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"测试病人1\\\",\\\"postId\\\":\\\"330501198807081122\\\",\\\"sex\\\":\\\"0\\\",\\\"medicalHistory\\\":\\\"病史描述\\\"}\"]', '223.93.188.66', '2020-11-09 01:32:10');
INSERT INTO `tb_sys_log` VALUES ('3891', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.93.188.66', '2020-11-09 01:32:10');
INSERT INTO `tb_sys_log` VALUES ('3892', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.93.188.66', '2020-11-09 01:32:41');
INSERT INTO `tb_sys_log` VALUES ('3893', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '223.93.188.66', '2020-11-09 01:37:58');
INSERT INTO `tb_sys_log` VALUES ('3894', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-11-09 01:45:16');
INSERT INTO `tb_sys_log` VALUES ('3895', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"acee21c3-2a52-46ca-9b95-79c435586bc9\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-11-09 01:45:55');
INSERT INTO `tb_sys_log` VALUES ('3896', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-11-09 05:37:09');
INSERT INTO `tb_sys_log` VALUES ('3897', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"12ceb31f-2c52-48c2-82cc-cfa65817e17e\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-11-09 05:37:16');
INSERT INTO `tb_sys_log` VALUES ('3898', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-11-09 05:37:39');
INSERT INTO `tb_sys_log` VALUES ('3899', 'YWJ', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '117.158.214.185', '2020-11-09 05:37:46');
INSERT INTO `tb_sys_log` VALUES ('3900', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.225', '2020-11-09 13:13:31');
INSERT INTO `tb_sys_log` VALUES ('3901', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"c01eaf59-67e2-4aa5-8a0e-b4ed2797b776\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.225', '2020-11-09 13:21:19');
INSERT INTO `tb_sys_log` VALUES ('3902', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.88.82.225', '2020-11-09 13:21:43');
INSERT INTO `tb_sys_log` VALUES ('3903', 'YWJ', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '223.88.82.225', '2020-11-09 13:22:12');
INSERT INTO `tb_sys_log` VALUES ('3904', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.225', '2020-11-09 13:25:09');
INSERT INTO `tb_sys_log` VALUES ('3905', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.88.82.225', '2020-11-09 13:25:34');
INSERT INTO `tb_sys_log` VALUES ('3906', 'YWJ', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '223.88.82.225', '2020-11-09 13:25:49');
INSERT INTO `tb_sys_log` VALUES ('3907', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"12ceb31f-2c52-48c2-82cc-cfa65817e17e\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.225', '2020-11-09 13:43:08');
INSERT INTO `tb_sys_log` VALUES ('3908', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.88.82.225', '2020-11-09 13:43:39');
INSERT INTO `tb_sys_log` VALUES ('3909', 'YWJ', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '223.88.82.225', '2020-11-09 13:43:44');
INSERT INTO `tb_sys_log` VALUES ('3910', 'YWJ', '退出平台', 'loginOut', '[]', '223.88.82.225', '2020-11-09 13:45:47');
INSERT INTO `tb_sys_log` VALUES ('3911', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '223.88.82.225', '2020-11-09 13:46:00');
INSERT INTO `tb_sys_log` VALUES ('3912', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"12ceb31f-2c52-48c2-82cc-cfa65817e17e\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.225', '2020-11-09 13:46:08');
INSERT INTO `tb_sys_log` VALUES ('3913', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"12ceb31f-2c52-48c2-82cc-cfa65817e17e\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.225', '2020-11-09 13:46:25');
INSERT INTO `tb_sys_log` VALUES ('3914', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.88.82.225', '2020-11-09 13:46:47');
INSERT INTO `tb_sys_log` VALUES ('3915', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '223.88.82.225', '2020-11-09 13:46:53');
INSERT INTO `tb_sys_log` VALUES ('3916', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.225', '2020-11-09 13:47:33');
INSERT INTO `tb_sys_log` VALUES ('3917', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.88.82.225', '2020-11-09 13:47:56');
INSERT INTO `tb_sys_log` VALUES ('3918', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '223.88.82.225', '2020-11-09 13:48:01');
INSERT INTO `tb_sys_log` VALUES ('3919', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '222.137.115.87', '2020-11-09 14:07:01');
INSERT INTO `tb_sys_log` VALUES ('3920', 'wangbo-1', '退出平台', 'loginOut', '[]', '222.137.115.87', '2020-11-09 14:26:13');
INSERT INTO `tb_sys_log` VALUES ('3921', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '222.137.115.87', '2020-11-09 14:31:56');
INSERT INTO `tb_sys_log` VALUES ('3922', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '60.12.8.170', '2020-11-11 01:07:20');
INSERT INTO `tb_sys_log` VALUES ('3923', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.12.8.170', '2020-11-11 01:07:52');
INSERT INTO `tb_sys_log` VALUES ('3924', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.12.8.170', '2020-11-11 01:08:10');
INSERT INTO `tb_sys_log` VALUES ('3925', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.12.8.170', '2020-11-11 01:08:45');
INSERT INTO `tb_sys_log` VALUES ('3926', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.12.8.170', '2020-11-11 01:09:03');
INSERT INTO `tb_sys_log` VALUES ('3927', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '60.12.8.170', '2020-11-11 01:09:32');
INSERT INTO `tb_sys_log` VALUES ('3928', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"b5c434f5-6048-4251-af1d-5732ea57e07f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '60.12.8.170', '2020-11-11 01:09:37');
INSERT INTO `tb_sys_log` VALUES ('3929', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '60.12.8.170', '2020-11-11 01:09:58');
INSERT INTO `tb_sys_log` VALUES ('3930', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '60.12.8.170', '2020-11-11 01:10:09');
INSERT INTO `tb_sys_log` VALUES ('3931', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '210.32.35.21', '2020-11-19 09:10:00');
INSERT INTO `tb_sys_log` VALUES ('3932', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '210.32.35.21', '2020-11-19 09:10:16');
INSERT INTO `tb_sys_log` VALUES ('3933', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '210.32.35.21', '2020-11-19 09:10:32');
INSERT INTO `tb_sys_log` VALUES ('3934', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '210.32.35.21', '2020-11-19 09:10:54');
INSERT INTO `tb_sys_log` VALUES ('3935', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"8da06702-b347-46fc-971c-9b7ed7a2f235\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '210.32.35.21', '2020-11-19 09:11:00');
INSERT INTO `tb_sys_log` VALUES ('3936', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '210.32.35.21', '2020-11-19 09:11:17');
INSERT INTO `tb_sys_log` VALUES ('3937', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '210.32.35.21', '2020-11-19 09:11:26');
INSERT INTO `tb_sys_log` VALUES ('3938', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '210.32.35.21', '2020-11-19 09:11:29');
INSERT INTO `tb_sys_log` VALUES ('3939', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '210.32.35.21', '2020-11-19 09:11:45');
INSERT INTO `tb_sys_log` VALUES ('3940', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '210.32.35.21', '2020-11-19 09:12:05');
INSERT INTO `tb_sys_log` VALUES ('3941', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '210.32.35.21', '2020-11-19 09:12:08');
INSERT INTO `tb_sys_log` VALUES ('3942', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '210.32.35.21', '2020-11-19 09:12:26');
INSERT INTO `tb_sys_log` VALUES ('3943', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '210.32.35.21', '2020-11-19 09:12:36');
INSERT INTO `tb_sys_log` VALUES ('3944', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '210.32.35.21', '2020-11-20 01:54:14');
INSERT INTO `tb_sys_log` VALUES ('3945', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '210.32.35.21', '2020-11-20 01:54:52');
INSERT INTO `tb_sys_log` VALUES ('3946', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '112.10.181.156', '2020-11-20 15:36:17');
INSERT INTO `tb_sys_log` VALUES ('3947', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-20 15:36:23');
INSERT INTO `tb_sys_log` VALUES ('3948', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-20 15:37:03');
INSERT INTO `tb_sys_log` VALUES ('3949', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '112.10.181.156', '2020-11-20 15:37:49');
INSERT INTO `tb_sys_log` VALUES ('3950', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-20 15:37:51');
INSERT INTO `tb_sys_log` VALUES ('3951', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-20 15:38:36');
INSERT INTO `tb_sys_log` VALUES ('3952', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '112.10.181.156', '2020-11-20 15:41:20');
INSERT INTO `tb_sys_log` VALUES ('3953', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '112.10.181.156', '2020-11-20 15:48:20');
INSERT INTO `tb_sys_log` VALUES ('3954', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-20 15:48:50');
INSERT INTO `tb_sys_log` VALUES ('3955', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-20 15:49:20');
INSERT INTO `tb_sys_log` VALUES ('3956', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '112.10.181.156', '2020-11-20 16:16:11');
INSERT INTO `tb_sys_log` VALUES ('3957', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"8da06702-b347-46fc-971c-9b7ed7a2f235\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-20 16:16:33');
INSERT INTO `tb_sys_log` VALUES ('3958', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-20 16:17:34');
INSERT INTO `tb_sys_log` VALUES ('3959', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '112.10.181.156', '2020-11-20 16:19:13');
INSERT INTO `tb_sys_log` VALUES ('3960', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-20 16:19:21');
INSERT INTO `tb_sys_log` VALUES ('3961', 'YWJYS', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"333\\\",\\\"postId\\\":\\\"333333333333333333\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"333\\\"}\"]', '112.10.181.156', '2020-11-20 16:19:59');
INSERT INTO `tb_sys_log` VALUES ('3962', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-20 16:19:59');
INSERT INTO `tb_sys_log` VALUES ('3963', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-20 16:20:22');
INSERT INTO `tb_sys_log` VALUES ('3964', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '112.10.181.156', '2020-11-21 00:52:30');
INSERT INTO `tb_sys_log` VALUES ('3965', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"9792d3a2-fcb3-471b-ace6-5dd22243b27c\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-21 00:52:42');
INSERT INTO `tb_sys_log` VALUES ('3966', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 00:53:08');
INSERT INTO `tb_sys_log` VALUES ('3967', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 00:56:22');
INSERT INTO `tb_sys_log` VALUES ('3968', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 00:57:14');
INSERT INTO `tb_sys_log` VALUES ('3969', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 00:57:41');
INSERT INTO `tb_sys_log` VALUES ('3970', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 00:58:16');
INSERT INTO `tb_sys_log` VALUES ('3971', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 00:58:36');
INSERT INTO `tb_sys_log` VALUES ('3972', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 00:59:48');
INSERT INTO `tb_sys_log` VALUES ('3973', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '112.10.181.156', '2020-11-21 01:00:08');
INSERT INTO `tb_sys_log` VALUES ('3974', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-21 01:00:33');
INSERT INTO `tb_sys_log` VALUES ('3975', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:01:11');
INSERT INTO `tb_sys_log` VALUES ('3976', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '112.10.181.156', '2020-11-21 01:01:38');
INSERT INTO `tb_sys_log` VALUES ('3977', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-21 01:01:42');
INSERT INTO `tb_sys_log` VALUES ('3978', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:02:36');
INSERT INTO `tb_sys_log` VALUES ('3979', 'YWJYS', '认可自动诊断记录', 'doPostSureMedicalInfo', null, '112.10.181.156', '2020-11-21 01:06:11');
INSERT INTO `tb_sys_log` VALUES ('3980', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.10.181.156', '2020-11-21 01:08:22');
INSERT INTO `tb_sys_log` VALUES ('3981', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:08:49');
INSERT INTO `tb_sys_log` VALUES ('3982', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:10:46');
INSERT INTO `tb_sys_log` VALUES ('3983', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:11:32');
INSERT INTO `tb_sys_log` VALUES ('3984', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:11:52');
INSERT INTO `tb_sys_log` VALUES ('3985', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:16:02');
INSERT INTO `tb_sys_log` VALUES ('3986', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:27:44');
INSERT INTO `tb_sys_log` VALUES ('3987', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:30:38');
INSERT INTO `tb_sys_log` VALUES ('3988', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:31:27');
INSERT INTO `tb_sys_log` VALUES ('3989', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.10.181.156', '2020-11-21 01:31:44');
INSERT INTO `tb_sys_log` VALUES ('3990', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '112.10.181.156', '2020-11-21 04:07:45');
INSERT INTO `tb_sys_log` VALUES ('3991', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '112.17.236.174', '2020-11-23 01:29:43');
INSERT INTO `tb_sys_log` VALUES ('3992', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.17.236.174', '2020-11-23 01:29:51');
INSERT INTO `tb_sys_log` VALUES ('3993', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.17.236.174', '2020-11-23 01:30:21');
INSERT INTO `tb_sys_log` VALUES ('3994', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.17.236.174', '2020-11-23 01:32:07');
INSERT INTO `tb_sys_log` VALUES ('3995', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.17.236.174', '2020-11-23 01:32:30');
INSERT INTO `tb_sys_log` VALUES ('3996', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '112.17.236.174', '2020-11-23 01:32:58');
INSERT INTO `tb_sys_log` VALUES ('3997', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '112.17.236.174', '2020-11-23 01:33:31');
INSERT INTO `tb_sys_log` VALUES ('3998', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '124.160.214.84', '2020-11-24 01:07:24');
INSERT INTO `tb_sys_log` VALUES ('3999', 'YWJYS', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"测试xx\\\",\\\"postId\\\":\\\"330501199909091122\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"啊时代发生噶\\\"}\"]', '124.160.214.84', '2020-11-24 01:08:45');
INSERT INTO `tb_sys_log` VALUES ('4000', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '124.160.214.84', '2020-11-24 01:08:45');
INSERT INTO `tb_sys_log` VALUES ('4001', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '124.160.214.84', '2020-11-24 01:10:09');
INSERT INTO `tb_sys_log` VALUES ('4002', 'YWJYS', '否定诊断记录', 'doPostNegativeMedicalInfo', null, '124.160.214.84', '2020-11-24 01:14:20');
INSERT INTO `tb_sys_log` VALUES ('4003', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '124.160.214.84', '2020-11-24 01:32:21');
INSERT INTO `tb_sys_log` VALUES ('4004', 'YWJYS', '退出平台', 'loginOut', '[]', '124.160.214.84', '2020-11-24 01:34:01');
INSERT INTO `tb_sys_log` VALUES ('4005', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '124.160.214.84', '2020-11-24 01:34:11');
INSERT INTO `tb_sys_log` VALUES ('4006', 'YWJ', '新增特征信息', 'doPostNewExtendAttribute', null, '124.160.214.84', '2020-11-24 01:39:46');
INSERT INTO `tb_sys_log` VALUES ('4007', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '124.160.214.84', '2020-11-24 01:40:20');
INSERT INTO `tb_sys_log` VALUES ('4008', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '124.160.214.84', '2020-11-24 01:40:26');
INSERT INTO `tb_sys_log` VALUES ('4009', 'YWJYS', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"00f69c7c-f383-442a-8513-1242989e0985\",\"1111\"]', '124.160.214.84', '2020-11-24 01:42:29');
INSERT INTO `tb_sys_log` VALUES ('4010', 'YWJYS', '编辑单个特征的信息', 'doPutExtendAttribute', null, '124.160.214.84', '2020-11-24 01:42:31');
INSERT INTO `tb_sys_log` VALUES ('4011', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '124.160.214.84', '2020-11-24 01:42:37');
INSERT INTO `tb_sys_log` VALUES ('4012', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.161', '2020-11-24 14:19:16');
INSERT INTO `tb_sys_log` VALUES ('4013', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.161', '2020-11-24 14:19:45');
INSERT INTO `tb_sys_log` VALUES ('4014', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.161', '2020-11-24 14:20:31');
INSERT INTO `tb_sys_log` VALUES ('4015', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.161', '2020-11-24 14:47:22');
INSERT INTO `tb_sys_log` VALUES ('4016', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.161', '2020-11-24 14:47:33');
INSERT INTO `tb_sys_log` VALUES ('4017', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '210.32.35.21', '2020-11-25 01:14:40');
INSERT INTO `tb_sys_log` VALUES ('4018', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '210.32.35.21', '2020-11-25 01:14:52');
INSERT INTO `tb_sys_log` VALUES ('4019', 'YWJYS', '退出平台', 'loginOut', '[]', '210.32.35.21', '2020-11-25 01:16:19');
INSERT INTO `tb_sys_log` VALUES ('4020', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '210.32.35.21', '2020-11-25 01:16:29');
INSERT INTO `tb_sys_log` VALUES ('4021', 'YWJ', '启用/禁用特征', 'doPutExtendAttributeState', '[\"00f69c7c-f383-442a-8513-1242989e0985\",0]', '210.32.35.21', '2020-11-25 01:16:39');
INSERT INTO `tb_sys_log` VALUES ('4022', 'YWJ', '退出平台', 'loginOut', '[]', '210.32.35.21', '2020-11-25 01:16:45');
INSERT INTO `tb_sys_log` VALUES ('4023', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '210.32.35.21', '2020-11-25 01:16:49');
INSERT INTO `tb_sys_log` VALUES ('4024', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"e2a0fd7d-5b64-4642-a0be-222a8b7f7434\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '210.32.35.21', '2020-11-25 01:16:55');
INSERT INTO `tb_sys_log` VALUES ('4025', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '210.32.35.21', '2020-11-25 11:31:56');
INSERT INTO `tb_sys_log` VALUES ('4026', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '111.0.127.80', '2020-11-26 03:28:03');
INSERT INTO `tb_sys_log` VALUES ('4027', 'YWJ', '删除特征属性', 'doDeleteExtendAttribute', '[\"00f69c7c-f383-442a-8513-1242989e0985\"]', '111.0.127.80', '2020-11-26 03:28:36');
INSERT INTO `tb_sys_log` VALUES ('4028', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '111.0.127.80', '2020-11-30 06:27:37');
INSERT INTO `tb_sys_log` VALUES ('4029', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '117.147.5.185', '2020-11-30 14:01:45');
INSERT INTO `tb_sys_log` VALUES ('4030', 'YWJYS', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\" 测试人员1130\\\",\\\"postId\\\":\\\"330501197906151319\\\",\\\"sex\\\":\\\"0\\\",\\\"medicalHistory\\\":\\\"测试说明\\\"}\"]', '117.147.5.185', '2020-11-30 14:06:08');
INSERT INTO `tb_sys_log` VALUES ('4031', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.147.5.185', '2020-11-30 14:06:08');
INSERT INTO `tb_sys_log` VALUES ('4032', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.147.5.185', '2020-11-30 14:06:33');
INSERT INTO `tb_sys_log` VALUES ('4033', 'YWJYS', '否定诊断记录', 'doPostNegativeMedicalInfo', null, '117.147.5.185', '2020-11-30 14:08:42');
INSERT INTO `tb_sys_log` VALUES ('4034', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '223.88.82.64', '2020-11-30 14:35:33');
INSERT INTO `tb_sys_log` VALUES ('4035', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.64', '2020-11-30 14:46:52');
INSERT INTO `tb_sys_log` VALUES ('4036', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-12-01 01:14:44');
INSERT INTO `tb_sys_log` VALUES ('4037', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '127.0.0.1', '2020-12-01 02:26:50');
INSERT INTO `tb_sys_log` VALUES ('4038', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-12-01 02:27:01');
INSERT INTO `tb_sys_log` VALUES ('4039', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '127.0.0.1', '2020-12-01 06:04:46');
INSERT INTO `tb_sys_log` VALUES ('4040', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '127.0.0.1', '2020-12-01 06:10:20');
INSERT INTO `tb_sys_log` VALUES ('4041', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '127.0.0.1', '2020-12-01 06:29:44');

-- ----------------------------
-- Table structure for tb_treatment_inputdata
-- ----------------------------
DROP TABLE IF EXISTS `tb_treatment_inputdata`;
CREATE TABLE `tb_treatment_inputdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `treatment_id` varchar(255) NOT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `data_in_json` varchar(2048) DEFAULT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_treatment_inputdata
-- ----------------------------
INSERT INTO `tb_treatment_inputdata` VALUES ('1', '9b7190f8-fa50-421b-a88e-b2cc168e2d6f', '1111', '11', '[{\"FidIn\":\"id01\",\"Value\":39},{\"FidIn\":\"id001\",\"Value\":1},{\"FidIn\":\"id001\",\"Value\":0},{\"FidIn\":\"id001\",\"Value\":0},{\"FidIn\":\"id001\",\"Value\":1},{\"FidIn\":\"id001\",\"Value\":1},{\"FidIn\":\"id001\",\"Value\":0},{\"FidIn\":\"id001\",\"Value\":0},{\"FidIn\":\"id001\",\"Value\":0},{\"FidIn\":\"id001\",\"Value\":1},{\"FidIn\":\"id001\",\"Value\":1},{\"FidIn\":\"id001\",\"Value\":0},{\"FidIn\":\"id001\",\"Value\":1},{\"FidIn\":\"id001\",\"Value\":1},{\"FidIn\":\"id001\",\"Value\":0},{\"FidIn\":\"id001\",\"Value\":0}]', '0', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', '2020-12-01 02:27:01', '2020-12-01 02:27:01');

-- ----------------------------
-- Table structure for tb_treatment_result
-- ----------------------------
DROP TABLE IF EXISTS `tb_treatment_result`;
CREATE TABLE `tb_treatment_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `diagnosis_result` varchar(255) NOT NULL,
  `treatment_id` varchar(255) NOT NULL,
  `out_feature_json` varchar(1024) DEFAULT NULL,
  `active_rule_json` varchar(1024) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `treatment_plan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_treatment_result
-- ----------------------------
INSERT INTO `tb_treatment_result` VALUES ('28', 'f157b245-fff9-4987-ab23-cc485054315c', '声带息肉', '675bd040-5f07-439a-8434-5ebc1b7ac52b', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"18.50\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"11.23\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70.27\"}]', '[{\"weight\":\"0.0\",\"rid\":\"R1\"},{\"weight\":\"0.0\",\"rid\":\"R2\"},{\"weight\":\"0.0\",\"rid\":\"R3\"},{\"weight\":\"0.0\",\"rid\":\"R4\"},{\"weight\":\"0.0\",\"rid\":\"R5\"},{\"weight\":\"0.0\",\"rid\":\"R6\"},{\"weight\":\"0.0\",\"rid\":\"R7\"},{\"weight\":\"0.0\",\"rid\":\"R8\"},{\"weight\":\"0.0\",\"rid\":\"R9\"},{\"weight\":\"0.0\",\"rid\":\"R10\"},{\"weight\":\"0.29166666666666663\",\"rid\":\"R11\"},{\"weight\":\"0.0\",\"rid\":\"R12\"},{\"weight\":\"0.0\",\"rid\":\"R13\"},{\"weight\":\"0.0\",\"rid\":\"R14\"},{\"weight\":\"0.33333333333333326\",\"rid\":\"R15\"},{\"weight\":\"0.0\",\"rid\":\"R16\"},{\"weight\":\"0.0\",\"rid\":\"R17\"},{\"weight\":\"0.0\",\"rid\":\"R18\"},{\"weight\":\"0.0\",\"rid\":\"R19\"},{\"weight\":\"0.0\",\"rid\":\"R20\"},{\"weight\":\"0.37499999999999994\",\"rid\":\"R21\"},{\"weight\":\"0.0\",\"rid\":\"R22\"},{\"weight\":\"0.0\",\"rid\":\"R23\"},{\"weight\":\"0.0\",\"rid\":\"R24\"}]', '1', null, '0', 'wangbo-1', 'wangbo-1', '2020-10-29 14:51:26', '2020-10-29 14:51:26', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('29', 'd3d2c59a-f91d-4316-a25f-25954d75102f', '声带息肉', '675bd040-5f07-439a-8434-5ebc1b7ac52b', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"18.50\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"11.23\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70.27\"}]', '[{\"weight\":\"0.0\",\"rid\":\"R1\"},{\"weight\":\"0.0\",\"rid\":\"R2\"},{\"weight\":\"0.0\",\"rid\":\"R3\"},{\"weight\":\"0.0\",\"rid\":\"R4\"},{\"weight\":\"0.0\",\"rid\":\"R5\"},{\"weight\":\"0.0\",\"rid\":\"R6\"},{\"weight\":\"0.0\",\"rid\":\"R7\"},{\"weight\":\"0.0\",\"rid\":\"R8\"},{\"weight\":\"0.0\",\"rid\":\"R9\"},{\"weight\":\"0.0\",\"rid\":\"R10\"},{\"weight\":\"0.29166666666666663\",\"rid\":\"R11\"},{\"weight\":\"0.0\",\"rid\":\"R12\"},{\"weight\":\"0.0\",\"rid\":\"R13\"},{\"weight\":\"0.0\",\"rid\":\"R14\"},{\"weight\":\"0.33333333333333326\",\"rid\":\"R15\"},{\"weight\":\"0.0\",\"rid\":\"R16\"},{\"weight\":\"0.0\",\"rid\":\"R17\"},{\"weight\":\"0.0\",\"rid\":\"R18\"},{\"weight\":\"0.0\",\"rid\":\"R19\"},{\"weight\":\"0.0\",\"rid\":\"R20\"},{\"weight\":\"0.37499999999999994\",\"rid\":\"R21\"},{\"weight\":\"0.0\",\"rid\":\"R22\"},{\"weight\":\"0.0\",\"rid\":\"R23\"},{\"weight\":\"0.0\",\"rid\":\"R24\"}]', '1', null, '0', 'wangbo-1', 'wangbo-1', '2020-10-29 15:02:54', '2020-10-29 15:02:54', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('30', '498dc926-ad09-4322-b412-b3208af4ca4e', '声带息肉', 'ebaa12fc-df25-4d1d-8417-0fb1d18d789d', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"14.57\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"14.57\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70.86\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.25\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.40\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.35\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJ', 'YWJ', '2020-10-30 01:35:06', '2020-10-30 01:35:06', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('31', 'c997ea2d-de5c-448a-8590-0401f89eb476', '声带息肉', '0ffc2d81-e064-47bf-a196-cbdf30a838a8', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"21.47\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"12.83\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"65.7\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.32\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.36\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.32\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-10-30 01:37:16', '2020-10-30 01:37:16', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('32', 'b45956ee-80f8-491c-aa84-25bf0a8c556c', '声带息肉', '183c376b-ac03-43f9-8f39-975765d4ed39', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"29.29\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"11.51\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"59.2\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.39\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.33\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.28\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-10-30 01:39:52', '2020-10-30 01:39:52', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('33', '1953337d-2cc1-4e54-962c-b13044bce050', '声带白斑', '243328ca-9b10-4ed8-bdb4-dc634907d934', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"21.52\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"9.24\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"69.24000000000001\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.32\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.29\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.39\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-10-30 01:47:36', '2020-10-30 01:47:36', '测试啊时代发生的');
INSERT INTO `tb_treatment_result` VALUES ('34', '54f99e78-82f0-4927-9d8f-d408b269a895', '声带息肉', 'b22fe80f-c26b-4b38-b8e1-531428af1edc', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"30.57\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"8.92\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"60.51\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.40\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.28\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.32\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJ', 'YWJ', '2020-10-30 02:42:29', '2020-10-30 02:42:29', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('35', '88a1de4a-8ed1-410c-a01c-bd120a765024', '声带息肉', 'e891ee96-a872-4bb6-befb-3d732d3d82a3', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"14.57\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"14.57\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70.86\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.25\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.40\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.35\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJ', 'YWJ', '2020-10-30 15:40:08', '2020-10-30 15:40:08', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('36', 'cefd45c3-fa01-48c9-be0c-056a1cfcc11d', '声带白斑', '24884585-dd4d-40b9-bc93-5c8a4d0278bc', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"37.79\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"7.44\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"54.77\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.46\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.25\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.29\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-02 01:46:19', '2020-11-02 01:46:19', '测试啊时代发生的');
INSERT INTO `tb_treatment_result` VALUES ('37', '4cf1a127-0b33-47df-943f-69230df006ab', '声带息肉', '4f87771a-f326-441c-bffb-fa68d39d23d5', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"20.11\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"14.14\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"65.75\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.31\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.38\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.31\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-02 01:55:36', '2020-11-02 01:55:36', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('38', '497dbf53-a2df-4621-887b-54c24237ac53', '声带息肉', 'dc1a506a-f1a1-47d6-9724-fb1210cae52e', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"36.10\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"5.51\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"58.39\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.45\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.20\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.35\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-05 03:19:51', '2020-11-05 03:19:51', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('39', 'eef48918-2b8f-4f18-98bd-c67e6c15a390', '声带白斑', 'a8c77f64-17a0-4922-b760-b5084fa782e4', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"31.97\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"7.21\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"60.82\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.41\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.24\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.34\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-05 06:42:09', '2020-11-05 06:42:09', '测试啊时代发生的');
INSERT INTO `tb_treatment_result` VALUES ('40', '32c84544-cb55-4eeb-878b-26fec2044ced', '声带白斑', '7810130d-d925-43cd-99bd-77fe71ff1631', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"21.14\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"8.73\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70.13\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.32\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.28\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.40\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-05 06:42:57', '2020-11-05 06:42:57', '测试啊时代发生的');
INSERT INTO `tb_treatment_result` VALUES ('41', 'c5a4333a-5956-4ce1-8858-ebd41515a7e3', '声带息肉', 'a1235d12-b5ec-4671-92ab-eb3dd39fb27b', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"24.14\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"14.25\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"61.61\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.35\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.38\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.27\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-06 06:54:27', '2020-11-06 06:54:27', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('42', '9cbec7ee-5466-486f-8863-04940cc9eae7', '声带息肉', '2955211a-0ec5-4a8c-bb51-23126066619f', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"24.76\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"16.71\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"58.53\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.36\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.43\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.21\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-09 01:37:58', '2020-11-09 01:37:58', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('43', '0a8e496a-b0f5-4e31-bc77-6be7b1c07513', '声带息肉', '67f634ae-e78a-4bf6-a7e0-d06e7bbc892a', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"25.00\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"9.55\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"65.45\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.35\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.29\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.35\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJ', 'YWJ', '2020-11-09 05:37:46', '2020-11-09 05:37:46', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('44', 'edd23069-1428-44e9-905d-8f4379eea4e3', '声带息肉', 'd27054e4-270a-49f7-8d55-7498494fd5be', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"43.00\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"6.14\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"50.86\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.50\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.22\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.28\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJ', 'YWJ', '2020-11-09 13:22:12', '2020-11-09 13:22:12', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('45', '92760690-03c1-4c2e-a6ef-266a7f3b9778', '声带息肉', 'e0bdd747-5d41-4110-8993-94f703927343', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"33.10\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"8.13\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"58.769999999999996\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.42\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.26\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.32\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJ', 'YWJ', '2020-11-09 13:25:49', '2020-11-09 13:25:49', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('46', 'd4fdc950-1824-40de-8cf4-1e44554365ea', '声带息肉', '6d7d32e1-1e64-4aec-b04d-2f0be96f66c4', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"24.76\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"16.71\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"58.53\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.36\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.43\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.21\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJ', 'YWJ', '2020-11-09 13:43:44', '2020-11-09 13:43:44', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('47', 'e3820811-27e0-479b-8796-9f5e91bd4caf', '声带息肉', 'b2dffe42-e209-402f-8697-b237778eab72', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"35.10\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"7.52\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"57.379999999999995\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.44\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.25\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.31\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-09 13:46:53', '2020-11-09 13:46:53', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('48', '26f72230-30d6-4ad0-af28-add50ebcd69a', '声带息肉', '16d3c3ff-6257-4e88-8d90-29cc4012a2ef', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"6.76\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"19.14\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"74.1\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.15\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.50\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.35\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-09 13:48:01', '2020-11-09 13:48:01', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('49', '74d0bedf-0e77-4607-bfff-93faedbe63a4', '声带息肉', '8e2ecf7b-3384-497d-a298-eb424c081517', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"14.56\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"12.13\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"73.31\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.25\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.36\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.39\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-11 01:09:32', '2020-11-11 01:09:32', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('50', 'eab03d8e-e7e9-4676-b8a4-f08d62e46986', '声带息肉', '8e5e3348-5ff0-4047-aaad-b37cb128a845', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"13.67\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"12.18\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"74.15\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.24\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.36\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.40\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-11 01:10:09', '2020-11-11 01:10:09', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('51', '84f98852-20b1-4b1f-9da6-ebace6dda3d2', '声带息肉', '779b0fec-74bd-4fc7-9d83-df2f2cf325c0', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"18.97\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"11.26\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"69.77000000000001\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.30\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.33\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.37\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-19 09:10:54', '2020-11-19 09:10:54', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('52', '444488df-3468-4ed1-8ad9-166bb4dbfaff', '声带息肉', 'e4c033b1-0442-4ed4-9d28-6f388f3deed1', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"35.10\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"7.52\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"57.379999999999995\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.44\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.25\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.31\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-19 09:11:26', '2020-11-19 09:11:26', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('53', 'a07f6d86-e434-45d8-8d5d-b544493275a5', '声带息肉', '410132e1-0890-41f6-b472-80009bb1baad', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"27.21\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"7.56\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"65.22999999999999\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.38\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.25\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.38\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-19 09:12:05', '2020-11-19 09:12:05', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('54', 'dc0495fd-98cc-47e0-b3e8-111c802b3254', '声带息肉', '8c0b1a6b-a2bb-4811-b473-92c5fcdad6e0', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"27.66\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"11.52\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"60.82\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.38\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.33\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.29\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-19 09:12:36', '2020-11-19 09:12:36', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('55', 'f6a7ebe2-cd48-421b-9a59-efca521b472e', '声带息肉', '854c8032-8eed-486d-ada9-fc54a203928c', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"20.86\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"8.38\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70.75999999999999\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.32\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.27\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.41\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-20 15:37:49', '2020-11-20 15:37:49', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('56', 'fe630357-5f41-4576-98c6-5274608d5809', '声带息肉', '3baffc43-40c2-406f-b580-1e109f06bb94', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"16.99\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"13.62\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"69.39\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.28\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.38\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.34\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-20 15:41:20', '2020-11-20 15:41:20', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('57', 'c6215793-ccd7-478e-9ab2-bc41125e24a2', '声带息肉', '251cac55-ae51-4595-81ff-504881cbe7cb', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"18.50\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"11.23\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"70.27\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.29\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.33\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.38\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-21 01:00:08', '2020-11-21 01:00:08', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('58', '100ef597-4d81-453c-97c6-d9866d5471cd', '声带息肉', '7be4638b-4f57-441b-ab51-e27b6992b87c', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"30.61\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"11.48\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"57.91\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.40\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.33\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.27\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-21 01:01:38', '2020-11-21 01:01:38', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('59', '17e2f87f-5953-4de7-9cd1-a3b09260b151', '声带息肉', '3fff6582-f869-430d-9eba-19c1379978dd', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"24.76\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"16.71\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"58.53\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.36\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.43\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.21\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '1', null, '0', 'YWJYS', 'YWJYS', '2020-11-21 01:06:11', '2020-11-21 01:06:11', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('60', '17e2f87f-5953-4de7-9cd1-a3b09260b153', '声带息肉', '3fff6582-f869-430d-9eba-19c1379978dd', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"24.76\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"16.71\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"58.53\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.36\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.43\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.21\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '2', null, '0', 'YWJYS', 'YWJYS', '2020-11-21 01:06:11', '2020-11-21 01:06:11', '测试阿斯顿发');
INSERT INTO `tb_treatment_result` VALUES ('61', '100ef897-4d81-453c-97c6-d9866d5471cd', '声带息肉', '7be4638b-4f57-441b-ab51-e27b6992b87c', '[{\"fidOut\":\"sk001\",\"fidOutName\":\"喉癌\",\"value\":\"30.61\"},{\"fidOut\":\"sk002\",\"fidOutName\":\"声带白斑\",\"value\":\"11.48\"},{\"fidOut\":\"sk003\",\"fidOutName\":\"声带息肉\",\"value\":\"57.91\"}]', '[{\"weight\":\"0.00\",\"rid\":\"R1\"},{\"weight\":\"0.00\",\"rid\":\"R2\"},{\"weight\":\"0.00\",\"rid\":\"R3\"},{\"weight\":\"0.00\",\"rid\":\"R4\"},{\"weight\":\"0.00\",\"rid\":\"R5\"},{\"weight\":\"0.00\",\"rid\":\"R6\"},{\"weight\":\"0.00\",\"rid\":\"R7\"},{\"weight\":\"0.00\",\"rid\":\"R8\"},{\"weight\":\"0.00\",\"rid\":\"R9\"},{\"weight\":\"0.00\",\"rid\":\"R10\"},{\"weight\":\"0.40\",\"rid\":\"R11\"},{\"weight\":\"0.00\",\"rid\":\"R12\"},{\"weight\":\"0.00\",\"rid\":\"R13\"},{\"weight\":\"0.00\",\"rid\":\"R14\"},{\"weight\":\"0.33\",\"rid\":\"R15\"},{\"weight\":\"0.00\",\"rid\":\"R16\"},{\"weight\":\"0.00\",\"rid\":\"R17\"},{\"weight\":\"0.00\",\"rid\":\"R18\"},{\"weight\":\"0.00\",\"rid\":\"R19\"},{\"weight\":\"0.00\",\"rid\":\"R20\"},{\"weight\":\"0.27\",\"rid\":\"R21\"},{\"weight\":\"0.00\",\"rid\":\"R22\"},{\"weight\":\"0.00\",\"rid\":\"R23\"},{\"weight\":\"0.00\",\"rid\":\"R24\"}]', '2', null, '0', 'YWJYS', 'YWJYS', '2020-11-21 01:01:38', '2020-11-21 01:01:38', '测试阿斯顿发');

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
  `sex` int(2) DEFAULT NULL,
  `department_id` varchar(255) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `sort` int(2) NOT NULL,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(255) NOT NULL,
  `update_user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'top', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, null, null, '', null, '0', '0', 'bee', 'bee', '2020-07-04 22:41:39', '2020-07-04 22:41:42');
INSERT INTO `tb_user` VALUES ('5', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', 'YWJ', 'e10adc3949ba59abbe56e057f20f883e', '13291812767', 'ywj\'123@123.com', null, '1111', null, '5', '0', 'YWJ', 'YWJ', '2020-07-05 10:17:30', '2020-07-05 10:17:30');
INSERT INTO `tb_user` VALUES ('20', '1dd45d94-edc3-4b42-9691-a4e6409a2328', 'WAXX', 'e10adc3949ba59abbe56e057f20f883e', '15903991236', '247636225@yy.com', null, '1111', null, '3', '1', 'WXX', 'bee', '2020-08-09 14:30:16', '2020-08-09 15:15:50');
INSERT INTO `tb_user` VALUES ('21', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', 'wangbo', 'e10adc3949ba59abbe56e057f20f883e', '17638171723', '12343@qq.com', null, '1111', null, '3', '0', 'wangbo', 'bee', '2020-08-20 14:21:28', '2020-09-06 02:33:12');
INSERT INTO `tb_user` VALUES ('22', '9281a21f-f2a5-4c79-a76f-b1c4a9e2b4d9', 'wangbo1', '96e79218965eb72c92a549dd5a330112', '13876566544', '1123@qq.com', null, '1111', null, '4', '1', 'wangbo1', 'wangbo1', '2020-08-20 14:25:50', '2020-08-20 14:25:50');
INSERT INTO `tb_user` VALUES ('23', '5bd2198d-a44b-42d4-8a73-82845be3f4a0', 'BEE', 'e10adc3949ba59abbe56e057f20f883e', '15938917805', '123456789@qq.com', null, '1111', null, '4', '0', 'BEE', 'BEE', '2020-08-31 11:04:47', '2020-08-31 11:04:47');
INSERT INTO `tb_user` VALUES ('24', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', 'wangbo-1', '96e79218965eb72c92a549dd5a330112', '17638176273', '123@qq.com', null, '1111', null, '5', '0', 'wangbo-1', 'wangbo-1', '2020-09-06 02:34:19', '2020-09-06 02:34:19');
INSERT INTO `tb_user` VALUES ('25', '974d725c-daba-4555-bad2-c07375600862', 'ZHH', 'e10adc3949ba59abbe56e057f20f883e', '15809712345', '476612551@qq.com', null, '1113', null, '6', '1', 'ZHH', 'ZHH', '2020-09-06 03:19:27', '2020-09-06 03:19:27');
INSERT INTO `tb_user` VALUES ('26', '4435baee-1346-4744-8c00-16ef4fc2be77', 'YWJYS', 'e10adc3949ba59abbe56e057f20f883e', '13912345678', '123456@qq.com', null, '1111', null, '7', '0', 'YWJYS', 'YWJYS', '2020-10-09 05:33:13', '2020-10-09 05:33:13');
INSERT INTO `tb_user` VALUES ('27', '5c8a1c0f-a37c-4186-9c9a-c44b69f29086', 'YWJ2', 'e10adc3949ba59abbe56e057f20f883e', '15809712344', '247636225@yy.com', null, '1111', null, '7', '1', 'YWJ2', 'YWJ2', '2020-10-28 05:20:32', '2020-10-28 05:20:32');
