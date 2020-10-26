/*
Navicat MySQL Data Transfer

Source Server         : 39.98.147.216
Source Server Version : 50715
Source Host           : 39.98.147.216:3306
Source Database       : smart_medical

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2020-09-14 14:13:29
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`),
  KEY `idx_category_delete_valid` (`category`,`is_delete`,`is_valid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='组织机构、组、账户的自定义扩展属性定义';

-- ----------------------------
-- Records of idaas_extend_attr
-- ----------------------------
INSERT INTO `idaas_extend_attr` VALUES ('17', '6a02ce74-530a-4f94-8849-fbe402b3ba6c', 'temp', '1', '你是否有咳嗽的症状？', 'asdfa', 'single-line-text', '0', '1', '0', '1', '好发', '1', null, '1', '2020-08-31 08:47:04', 'bee', '2020-09-06 01:48:08', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('18', '3036b13e-2522-4240-ac48-75d2ff51c2ad', 'temp', '1', '测dfd试名称11', 'asdfadafsd', 'single-line-text', '0', '1', '0', '1', 'asdfads', '1', null, '1', '2020-08-31 08:48:15', 'bee', '2020-09-02 13:53:26', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('19', '70dadc49-8e12-4eec-b897-fc52ebed337a', 'temp', '1', '测dfd试名称11', 'tb_sdb', 'dropdown-single-selection', '0', '1', '0', '1', 'asdfadsasdf', '1', null, '1', '2020-08-31 08:49:38', 'bee', '2020-09-02 13:53:30', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('20', '1eee4a27-9f05-48ae-a101-c333250a0a6b', 'temp', '0', '你是否有眼黑的状况？', 'a', 'single-line-text', '0', '1', '0', '1', '', '2', null, '1', '2020-09-02 13:25:09', 'bee', '2020-09-06 01:48:04', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('21', '6f13c60c-b28a-4068-8e7f-81ccf306aa44', 'temp', '0', '你是否感到胸闷？', 'aaa', 'single-line-text', '0', '1', '0', '1', '', '2', null, '1', '2020-09-02 13:25:41', 'bee', '2020-09-06 01:48:06', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('22', '425c8e9f-c594-4658-8564-fdb0ce668bbe', 'temp', '0', '单选特征', 'radio-sex', 'single-selection', '0', '1', '0', '1', '', '3', null, '1', '2020-09-02 15:17:39', 'bee', '2020-09-02 15:19:54', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('23', 'd892c432-38d0-440c-b26b-63f26aa386ff', 'temp', '0', '单选特征', 'radio-sexx', 'single-selection', '0', '1', '0', '1', '', '3', null, '1', '2020-09-02 15:18:04', 'bee', '2020-09-02 15:38:57', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('24', 'a665cd65-cbdb-4948-bf97-51767f85a711', 'temp', '1', '你的性别？', 'radio-sex', 'single-selection', '0', '1', '0', '1', '', '4', null, '1', '2020-09-02 15:20:38', 'bee', '2020-09-06 01:48:01', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('25', '797e2d2a-6897-486b-9123-8ff78cce6b5e', 'temp', '0', '你当前的状态？', 'check', 'multiple-selection', '0', '1', '0', '1', '', '5', null, '1', '2020-09-02 15:39:50', 'bee', '2020-09-06 01:47:59', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('26', 'e08c9c92-1931-450e-aae2-797520905dfa', 'temp', '0', '发烧', 'aa', 'single-line-text', '0', '1', '0', '1', '', '6', null, '1', '2020-09-06 01:27:36', 'bee', '2020-09-06 01:37:22', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('27', '83e43295-af0d-4882-b15b-4e34c3c95303', 'temp', '0', '单选', 'radio', 'single-selection', '0', '1', '0', '1', '', '7', null, '1', '2020-09-06 01:39:27', 'bee', '2020-09-06 01:47:57', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('28', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', 'temp', '0', '年龄', 'age', 'single-selection', '1', '1', '0', '1', '', '8', null, '0', '2020-09-06 01:53:43', 'bee', '2020-09-09 05:42:34', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('29', '4e5f8081-f673-42ab-8b55-e0098bf8b2f2', 'temp', '0', '性别', 'sex', 'single-selection', '1', '1', '0', '1', '', '9', null, '0', '2020-09-06 01:55:23', 'bee', '2020-09-06 04:09:08', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('30', 'dfef97bf-3646-4b5a-bce5-c9ca385b8eed', 'temp', '0', '吸烟', 'smoke', 'single-selection', '1', '1', '0', '1', '', '10', null, '0', '2020-09-06 01:56:09', 'bee', '2020-09-06 05:37:45', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('31', '8cf70fa8-a3de-471f-8560-8dd6a4e7843f', 'temp', '0', '喝酒', 'drink', 'single-selection', '1', '1', '0', '1', '', '11', null, '0', '2020-09-06 01:59:10', 'bee', '2020-09-06 05:37:41', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('32', '2ff273e5-05de-44f3-9a0b-3605b9649e64', 'temp', '0', '声嘶', 'hoarseness', 'single-selection', '0', '1', '0', '1', '', '12', null, '1', '2020-09-06 02:00:05', 'bee', '2020-09-06 02:02:06', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('33', '58d67d37-80c7-4754-a19d-38b2cd63fe33', 'temp', '0', '咽/喉痛', 'sore-throat', 'single-selection', '0', '1', '0', '1', '', '13', null, '1', '2020-09-06 02:00:58', 'bee', '2020-09-06 02:02:11', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('34', '9685daba-4ea1-4ffc-a1c6-901618503b79', 'temp', '0', '咽/喉部异物感', 'larynx', 'single-selection', '0', '1', '0', '1', '', '14', null, '1', '2020-09-06 02:01:46', 'bee', '2020-09-06 02:02:09', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('35', '2fbefa39-8c30-4146-9da6-43c6afe93278', 'temp', '1', '声嘶', 'hoarseness', 'single-selection', '1', '1', '0', '1', '', '15', null, '0', '2020-09-06 02:03:25', 'bee', '2020-09-06 05:37:38', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('36', 'e293cd4f-df01-4419-8f3b-cb370e58c1a3', 'temp', '1', '咽/喉痛', 'sore-throat', 'single-selection', '1', '1', '0', '1', '', '16', null, '0', '2020-09-06 02:04:20', 'bee', '2020-09-06 05:37:34', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('37', 'f57c8d03-5233-4fa5-949b-ffc38967072a', 'temp', '2', '肿物形态', 'tumor', 'single-selection', '1', '1', '0', '1', '', '17', null, '0', '2020-09-06 02:05:36', 'bee', '2020-09-06 05:37:30', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('38', '806800f4-5e51-4da5-b0d4-6bcfe7edd3f1', 'temp', '2', '肿物色泽', 'tumor-color', 'single-selection', '1', '1', '0', '1', '', '18', null, '0', '2020-09-06 02:06:36', 'bee', '2020-09-06 05:37:25', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('39', '4396079c-cb6f-4f69-8e32-68dc71b77605', 'temp', '1', '咽/喉部异物感', 'aa', 'single-selection', '1', '1', '0', '1', '', '19', null, '0', '2020-09-06 09:00:18', 'bee', '2020-09-06 09:00:18', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('40', 'ff1d81d9-d3cd-421a-9338-cdebbe9b806c', 'temp', '1', '痰中带血', 'ae', 'single-selection', '1', '1', '0', '1', '', '20', null, '0', '2020-09-06 09:01:05', 'bee', '2020-09-06 09:01:05', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('41', '77507fa2-c78a-46ca-ad8a-8a0f3a0883f1', 'temp', '1', '呼吸困难', 'aq', 'single-selection', '1', '1', '0', '1', '', '21', null, '0', '2020-09-06 09:01:48', 'bee', '2020-09-06 09:01:48', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('42', '6f4891ef-16de-4ad8-804a-d3aa7d351ca3', 'temp', '1', '咳嗽', 'eq', 'single-selection', '1', '1', '0', '1', '', '22', null, '0', '2020-09-06 09:02:26', 'bee', '2020-09-06 09:02:26', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('43', 'fd3e22af-bb96-4ce9-a34b-bbd5872b8958', 'temp', '1', '咳痰', 'r', 'single-selection', '1', '1', '0', '1', '', '23', null, '0', '2020-09-06 09:03:04', 'bee', '2020-09-06 09:03:04', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('44', '1bf425d5-6992-423e-a01d-0411dd8ca928', 'temp', '1', '吞咽困难', 'y', 'single-selection', '1', '1', '0', '1', '', '24', null, '0', '2020-09-06 09:03:51', 'bee', '2020-09-06 09:03:51', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('45', '9cec4a5d-6bc1-4910-8dee-b3898a1abab4', 'temp', '2', '声带活动', 'rt', 'single-selection', '1', '1', '0', '1', '', '25', null, '0', '2020-09-06 09:04:34', 'bee', '2020-09-06 09:04:34', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('46', 'fe432dc4-0a79-4173-984c-8f0c5f6706ad', 'temp', '2', '累计范围：累及多个他部位包括声带、前联合、后联合、会厌，杓状软骨、室带、声门下、舌会厌襞、环后区、梨状窝、咽后壁等', 'yt', 'single-selection', '1', '1', '0', '1', '', '26', null, '0', '2020-09-06 09:05:38', 'bee', '2020-09-06 09:05:38', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('47', '8bb27cd0-c45c-4e5f-8525-c832c92233fa', 'temp', '0', '测试', 'aadsfads', 'single-line-text', '1', '1', '0', '1', 'sdfg ', '27', null, '1', '2020-09-06 10:47:12', 'bee', '2020-09-06 12:36:05', 'bee');
INSERT INTO `idaas_extend_attr` VALUES ('48', '2222', 'temp', '0', '测试属性', 'ar', 'single-line-text', '1', '1', '0', '1', '', '28', null, '0', '2020-09-06 13:02:15', 'bee', '2020-09-06 13:02:15', 'bee');

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
  PRIMARY KEY (`id`),
  KEY `idx_attr_id_delete` (`attr_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of idaas_extend_attr_config_number
-- ----------------------------

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
  PRIMARY KEY (`id`),
  KEY `idx_attr_id_delete` (`attr_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of idaas_extend_attr_config_selection
-- ----------------------------
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('11', 'af688ff9-ebbb-407c-8950-c0126ee66dd9', '70dadc49-8e12-4eec-b897-fc52ebed337a', null, '男', '0', '1', null, '1', '2020-08-31 08:49:38', 'bee', '2020-09-02 13:53:30', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('12', '0a4e471d-1531-45c6-a1e0-172239af6f3d', '70dadc49-8e12-4eec-b897-fc52ebed337a', null, '女', '0', '2', null, '1', '2020-08-31 08:49:38', 'bee', '2020-09-02 13:53:30', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('13', 'a1a3d501-2a58-4515-9881-344e0b870205', '425c8e9f-c594-4658-8564-fdb0ce668bbe', null, '男', '0', '1', null, '1', '2020-09-02 15:17:39', 'bee', '2020-09-02 15:19:54', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('14', 'e71e75e2-dbd1-45a4-ada6-73c80684eaba', '425c8e9f-c594-4658-8564-fdb0ce668bbe', null, '女', '0', '2', null, '1', '2020-09-02 15:17:39', 'bee', '2020-09-02 15:19:54', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('15', '612446c4-72bf-4d84-a30a-0d104384c92d', 'd892c432-38d0-440c-b26b-63f26aa386ff', null, '男', '0', '1', null, '1', '2020-09-02 15:18:04', 'bee', '2020-09-02 15:38:57', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('16', '47f26f86-c739-479a-9147-bdced0e2e47d', 'd892c432-38d0-440c-b26b-63f26aa386ff', null, '女', '0', '2', null, '1', '2020-09-02 15:18:04', 'bee', '2020-09-02 15:38:57', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('17', '48b72e28-7dee-4512-abda-3177e7bc4ef6', 'a665cd65-cbdb-4948-bf97-51767f85a711', null, '男', '0', '1', null, '1', '2020-09-02 15:20:38', 'bee', '2020-09-06 01:48:01', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('18', 'bf5aa2b6-cae7-4784-8b3b-96337d376733', 'a665cd65-cbdb-4948-bf97-51767f85a711', null, '女', '0', '2', null, '1', '2020-09-02 15:20:38', 'bee', '2020-09-06 01:48:01', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('19', 'efaf08ff-aa75-4208-87a2-9f177df51bde', '797e2d2a-6897-486b-9123-8ff78cce6b5e', null, '很好', '0', '1', null, '1', '2020-09-02 15:39:50', 'bee', '2020-09-06 01:47:59', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('20', 'c0b2bc96-def4-4e83-91db-bc72b8e2be74', '797e2d2a-6897-486b-9123-8ff78cce6b5e', null, '一般', '0', '2', null, '1', '2020-09-02 15:39:50', 'bee', '2020-09-06 01:47:59', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('21', 'a90432c1-cfcc-47ea-9d15-c03c0d2cdf52', '797e2d2a-6897-486b-9123-8ff78cce6b5e', null, '非常好', '0', '3', null, '1', '2020-09-02 15:39:50', 'bee', '2020-09-06 01:47:59', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('22', '356fcecf-de6d-4a65-9539-6a2b278e270d', '83e43295-af0d-4882-b15b-4e34c3c95303', '11222', '1', '0', '1', null, '1', '2020-09-06 01:39:27', 'bee', '2020-09-06 01:47:57', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('23', 'bcbfa35f-1595-44c7-8b38-835fa82a78e1', '83e43295-af0d-4882-b15b-4e34c3c95303', '22', '2', '0', '2', null, '1', '2020-09-06 01:39:27', 'bee', '2020-09-06 01:47:57', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('24', '96e5845f-b3c0-4838-8fe4-a29f2de0d3b5', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '1', '年轻', '0', '1', null, '0', '2020-09-06 01:53:43', 'bee', '2020-09-06 13:45:31', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('25', '7cbcbecf-ba55-4bbf-9666-846360274c99', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '2', '中年', '0', '2', null, '0', '2020-09-06 01:53:43', 'bee', '2020-09-06 13:45:31', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('26', '4fa62a65-e792-47f3-8e8b-816d65061c8e', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '3', '老年', '0', '3', null, '0', '2020-09-06 01:53:43', 'bee', '2020-09-06 13:45:31', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('27', '9f20fe82-c398-4b6e-95af-468101398ce3', '4e5f8081-f673-42ab-8b55-e0098bf8b2f2', '1', '男', '0', '1', null, '0', '2020-09-06 01:55:23', 'bee', '2020-09-06 04:09:08', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('28', '10789533-07d7-4be5-b170-0ea42c7f6c10', '4e5f8081-f673-42ab-8b55-e0098bf8b2f2', '2', '女', '0', '2', null, '0', '2020-09-06 01:55:23', 'bee', '2020-09-06 04:09:08', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('29', '90532938-f9c6-4285-a79e-411d9b0eebdd', 'dfef97bf-3646-4b5a-bce5-c9ca385b8eed', '1', '吸烟', '0', '1', null, '0', '2020-09-06 01:56:09', 'bee', '2020-09-06 05:37:45', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('30', 'da5d30fa-a2dd-4a0d-98ca-d96503f08bdb', 'dfef97bf-3646-4b5a-bce5-c9ca385b8eed', '0', '不吸烟', '0', '2', null, '0', '2020-09-06 01:56:09', 'bee', '2020-09-06 05:37:45', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('31', 'd20c5cf4-40ed-4cdc-9549-5c34e700953a', '8cf70fa8-a3de-471f-8560-8dd6a4e7843f', '1', '喝酒', '0', '1', null, '0', '2020-09-06 01:59:10', 'bee', '2020-09-06 05:37:41', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('32', 'd32d04d6-3380-4592-9f8e-5aa25b50d28e', '8cf70fa8-a3de-471f-8560-8dd6a4e7843f', '0', '不喝酒', '0', '2', null, '0', '2020-09-06 01:59:10', 'bee', '2020-09-06 05:37:42', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('33', '0f5e4884-2d1f-4385-9eb5-cd596fc08143', '2ff273e5-05de-44f3-9a0b-3605b9649e64', '1', '声嘶', '0', '1', null, '1', '2020-09-06 02:00:05', 'bee', '2020-09-06 02:02:06', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('34', 'ade3782d-ce62-4205-8305-0d40e64c209a', '2ff273e5-05de-44f3-9a0b-3605b9649e64', '0', '无声嘶', '0', '2', null, '1', '2020-09-06 02:00:05', 'bee', '2020-09-06 02:02:06', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('35', '5ff340ed-19fb-433e-a357-f1360f7c1dc3', '58d67d37-80c7-4754-a19d-38b2cd63fe33', '1', '痛', '0', '1', null, '1', '2020-09-06 02:00:58', 'bee', '2020-09-06 02:02:11', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('36', '7da6b782-1acc-4892-9bc0-3b7b2eae5b02', '58d67d37-80c7-4754-a19d-38b2cd63fe33', '0', '无痛', '0', '2', null, '1', '2020-09-06 02:00:58', 'bee', '2020-09-06 02:02:11', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('37', '2ebe8b3b-96d0-409a-9d9d-910326fefe4d', '9685daba-4ea1-4ffc-a1c6-901618503b79', '1', '有异物感', '0', '1', null, '1', '2020-09-06 02:01:46', 'bee', '2020-09-06 02:02:09', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('38', '4b6e3748-ee1f-4c2d-b3e4-7cd7bfe8bcee', '9685daba-4ea1-4ffc-a1c6-901618503b79', '0', '无异物感', '0', '2', null, '1', '2020-09-06 02:01:46', 'bee', '2020-09-06 02:02:09', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('39', '3e73e89e-b02e-455c-ae2b-5e82f273e02e', '2fbefa39-8c30-4146-9da6-43c6afe93278', '1', '声嘶', '0', '1', null, '0', '2020-09-06 02:03:25', 'bee', '2020-09-06 05:37:38', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('40', '3cb00ec6-596f-4bca-a9e3-3de63aeca849', '2fbefa39-8c30-4146-9da6-43c6afe93278', '0', '无声嘶', '0', '2', null, '0', '2020-09-06 02:03:25', 'bee', '2020-09-06 05:37:38', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('41', '699c8e0f-a8d4-48ab-b5ca-36316bf62ae5', 'e293cd4f-df01-4419-8f3b-cb370e58c1a3', '1', '痛', '0', '1', null, '0', '2020-09-06 02:04:20', 'bee', '2020-09-06 05:37:34', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('42', 'e617d840-0e41-4571-b76d-957137e33ae9', 'e293cd4f-df01-4419-8f3b-cb370e58c1a3', '0', '无痛', '0', '2', null, '0', '2020-09-06 02:04:20', 'bee', '2020-09-06 05:37:34', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('43', '9af6d4c1-4593-44f7-95d6-10621052bfcc', 'f57c8d03-5233-4fa5-949b-ffc38967072a', '1', '粗糙', '0', '1', null, '0', '2020-09-06 02:05:36', 'bee', '2020-09-06 05:37:30', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('44', '39b183b1-e307-41fd-97c2-93eb8dafb500', 'f57c8d03-5233-4fa5-949b-ffc38967072a', '0', '光滑', '0', '2', null, '0', '2020-09-06 02:05:36', 'bee', '2020-09-06 05:37:30', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('45', 'c8baa280-a0a8-4880-ab37-2432b6c43261', '806800f4-5e51-4da5-b0d4-6bcfe7edd3f1', '1', '白色', '0', '1', null, '0', '2020-09-06 02:06:36', 'bee', '2020-09-06 05:37:25', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('46', '61e2d824-4d81-4849-99f8-eb15642d634e', '806800f4-5e51-4da5-b0d4-6bcfe7edd3f1', '0', '粉色', '0', '2', null, '0', '2020-09-06 02:06:36', 'bee', '2020-09-06 05:37:25', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('47', '723ddf8f-f6eb-47df-8478-e1f62f6b7b20', '4396079c-cb6f-4f69-8e32-68dc71b77605', '1', '有异物感', '0', '1', null, '0', '2020-09-06 09:00:18', 'bee', '2020-09-06 09:00:18', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('48', '870e01c6-56d1-4f64-b579-bb624c6ff705', '4396079c-cb6f-4f69-8e32-68dc71b77605', '0', '无异物感', '0', '2', null, '0', '2020-09-06 09:00:18', 'bee', '2020-09-06 09:00:18', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('49', 'fd6251e1-c284-4b2e-a7e9-226bebffc3ec', 'ff1d81d9-d3cd-421a-9338-cdebbe9b806c', '1', '带血', '0', '1', null, '0', '2020-09-06 09:01:05', 'bee', '2020-09-06 09:01:05', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('50', '83dc806e-bfe5-43a6-b2bc-38fa17d5e7d0', 'ff1d81d9-d3cd-421a-9338-cdebbe9b806c', '0', '无血', '0', '2', null, '0', '2020-09-06 09:01:05', 'bee', '2020-09-06 09:01:05', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('51', '793f1a83-2cf9-43f8-a716-e79df16a04d6', '77507fa2-c78a-46ca-ad8a-8a0f3a0883f1', '1', '困难', '0', '1', null, '0', '2020-09-06 09:01:48', 'bee', '2020-09-06 09:01:48', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('52', 'f08a0033-336a-4544-b2a3-c17bf315fa9c', '77507fa2-c78a-46ca-ad8a-8a0f3a0883f1', '0', '不困难', '0', '2', null, '0', '2020-09-06 09:01:48', 'bee', '2020-09-06 09:01:48', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('53', '05a46fa7-efe2-4458-9857-9a8cb9f8364f', '6f4891ef-16de-4ad8-804a-d3aa7d351ca3', '1', '咳嗽', '0', '1', null, '0', '2020-09-06 09:02:26', 'bee', '2020-09-06 09:02:26', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('54', '0250f5aa-f4c6-4557-864d-a6d5b3244e00', '6f4891ef-16de-4ad8-804a-d3aa7d351ca3', '0', '不咳', '0', '2', null, '0', '2020-09-06 09:02:26', 'bee', '2020-09-06 09:02:26', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('55', '8c9d3aa0-870a-4a9d-9931-ab4f315dea4e', 'fd3e22af-bb96-4ce9-a34b-bbd5872b8958', '1', '咳痰', '0', '1', null, '0', '2020-09-06 09:03:04', 'bee', '2020-09-06 09:03:04', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('56', '40f02d0f-e74c-43e9-9acf-73db2b99372e', 'fd3e22af-bb96-4ce9-a34b-bbd5872b8958', '0', '不咳', '0', '2', null, '0', '2020-09-06 09:03:04', 'bee', '2020-09-06 09:03:04', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('57', '3138930e-f921-45ea-805c-ee45b9aa0bc3', '1bf425d5-6992-423e-a01d-0411dd8ca928', '1', '困难', '0', '1', null, '0', '2020-09-06 09:03:51', 'bee', '2020-09-06 09:03:51', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('58', 'c709a4b0-ed79-4078-8c51-599aeca9815e', '1bf425d5-6992-423e-a01d-0411dd8ca928', '0', '不困难', '0', '2', null, '0', '2020-09-06 09:03:51', 'bee', '2020-09-06 09:03:51', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('59', '7d893adc-5707-4801-b23f-483bc9044afd', '9cec4a5d-6bc1-4910-8dee-b3898a1abab4', '1', '受限', '0', '1', null, '0', '2020-09-06 09:04:34', 'bee', '2020-09-06 09:04:34', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('60', '943f770d-65dc-4935-9443-1e545d7388a8', '9cec4a5d-6bc1-4910-8dee-b3898a1abab4', '0', '活动良好', '0', '2', null, '0', '2020-09-06 09:04:34', 'bee', '2020-09-06 09:04:34', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('61', '97f74302-e33b-473d-a9f2-ccefd5db69b6', 'fe432dc4-0a79-4173-984c-8f0c5f6706ad', '1', '累及多个范围', '0', '1', null, '0', '2020-09-06 09:05:38', 'bee', '2020-09-06 09:05:38', 'bee');
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('62', 'dafb439f-595a-4c53-a453-056cc395522a', 'fe432dc4-0a79-4173-984c-8f0c5f6706ad', '0', '无累及', '0', '2', null, '0', '2020-09-06 09:05:38', 'bee', '2020-09-06 09:05:38', 'bee');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES ('6', '1111', '咽喉科', null, '1', '0', 'bee', 'bee', '2020-07-06 11:12:45', '2020-07-06 11:12:48');
INSERT INTO `tb_department` VALUES ('7', '1112', '消化内科', null, '2', '0', 'bee', 'bee', '2020-07-06 11:13:41', '2020-07-08 11:13:45');
INSERT INTO `tb_department` VALUES ('8', '1113', '肛肠科', '备注', '3', '0', 'bee', 'bee', '2020-07-06 11:14:27', '2020-07-23 11:14:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_disease
-- ----------------------------
INSERT INTO `tb_disease` VALUES ('21', '5fb62003-4ed7-4508-888e-a655f91ae01e', '高血压', 'effbc3b2-f95e-49c1-a009-d71eca0ec432', null, null, '备注', '1', '0', 'bee', 'bee', '2020-08-16 10:56:50', '2020-08-16 10:56:50');
INSERT INTO `tb_disease` VALUES ('22', '9ab6eb59-1787-4d5d-ba1a-42acb4aea1bd', '高血压2', 'effbc3b2-f95e-49c1-a009-d71eca0ec432', '治疗方4案', '简介', '备是否注', '14', '1', 'bee', 'bee', '2020-08-16 13:56:02', '2020-08-16 14:21:40');
INSERT INTO `tb_disease` VALUES ('23', 'a2d8bd7f-5433-412a-91e0-f8325031f9bb', '11', '1111', '22', '33', '', '0', '1', 'bee', 'bee', '2020-08-29 13:44:31', '2020-08-29 13:56:48');
INSERT INTO `tb_disease` VALUES ('24', 'ea35c93e-0032-4242-b4d3-381532c19841', '修改为消化科', '1112', '11', '费都是发大水发阿斯蒂芬大奥德赛范德萨阿斯顿发', '发送到啊阿斯顿发', '0', '0', 'bee', 'bee', '2020-08-29 13:49:03', '2020-08-31 08:13:30');
INSERT INTO `tb_disease` VALUES ('25', '95eac896-b561-42f8-87b3-df2d279b1ee2', '咽喉疾病3', '1111', '11', '22', '22', '3', '1', 'bee', 'bee', '2020-08-29 13:50:39', '2020-08-31 03:25:14');
INSERT INTO `tb_disease` VALUES ('26', '5ec55edb-266e-48be-a674-636b2e96458b', '1', '1111', '1', '1', '', '2', '1', 'bee', 'bee', '2020-08-29 13:57:23', '2020-08-29 13:57:29');
INSERT INTO `tb_disease` VALUES ('27', '360a56dc-d82f-4094-8b4c-c533c9c6bd55', '测试疾病2', '1111', '222', '111', '', '2', '1', 'bee', 'bee', '2020-08-29 13:59:54', '2020-08-31 03:21:07');
INSERT INTO `tb_disease` VALUES ('28', '346f2176-10f7-4410-93b8-d52f34819e2c', '疾病没名次', '1111', '阿斯顿发', '阿斯顿发', '安生点', '2', '1', 'bee', 'bee', '2020-08-31 03:21:52', '2020-08-31 03:23:38');
INSERT INTO `tb_disease` VALUES ('29', 'f5a6b727-378a-4da9-930d-4e468fac97d4', '山东分公司', '1111', '山东分公司', '水电工', '稍等', '0', '1', 'bee', 'bee', '2020-08-31 03:25:56', '2020-08-31 03:26:01');
INSERT INTO `tb_disease` VALUES ('30', 'd3a0bfeb-bfae-404f-b79c-b9f029469037', '慢性鼻炎', '1111', '鼻腔用药： 激素类：毕诺、伯可纳 、辅舒良、内舒拿、雷诺考特等', '阵发性喷嚏发作，大量清水样鼻涕，鼻塞', '111', '0', '0', 'bee', 'bee', '2020-09-06 03:30:01', '2020-09-06 09:51:46');
INSERT INTO `tb_disease` VALUES ('31', 'adfe9dbd-22e8-49cb-9e6c-0ca8fe2b5759', '慢性扁桃体炎', '1111', '扁桃体切除术', '咽痛或反复急性发作，咽部不适、异物感、口臭、刺激性咳嗽', '', '2', '0', 'bee', 'bee', '2020-09-06 03:30:21', '2020-09-06 08:55:43');
INSERT INTO `tb_disease` VALUES ('32', '16820b5f-ed1e-4cbd-9869-7f1b610970c3', '鼻咽癌', '1111', '手术疗法适于对放疗不敏感或放疗后颈淋巴转移未消退者', '易出血，吸鼻后痰中带血或擤出血性鼻涕。耳鸣、耳闷塞感及听力减退，或伴有鼓室积液', '', '3', '0', 'bee', 'bee', '2020-09-06 08:56:34', '2020-09-06 08:56:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medical_records
-- ----------------------------
INSERT INTO `tb_medical_records` VALUES ('2', '123', '410822199108111511', '123456', 'asdfasd', 'sdfasdfasd', '0', '0', 'sdfasd', 'asdfasd', '2020-07-08 21:39:14', '2020-07-08 21:39:17');
INSERT INTO `tb_medical_records` VALUES ('3', '0aa791a7-2af5-4acc-afc1-cd95857d6fde', '123454446', '456444', '简22介', '34324', '2', '0', 'bee', 'bee', '2020-08-21 13:10:57', '2020-08-21 13:12:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_patient_info
-- ----------------------------
INSERT INTO `tb_patient_info` VALUES ('2', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '毕洋强', '410822199108111511', '1', '无病史', '1', '0', 'bee', 'bee', '2020-07-05 10:51:20', '2020-07-05 10:51:20');
INSERT INTO `tb_patient_info` VALUES ('3', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '王大雷', '410822199108111512', '1', '无病史', '1', '0', 'bee', 'bee', '2020-07-05 11:09:19', '2020-09-06 03:05:15');
INSERT INTO `tb_patient_info` VALUES ('4', '3b1b6c4a-cc39-4b77-bbcb-1ecf7cfd1877', '病人111', '41082219910811151', '1', '病史', '1', '0', 'bee', 'bee', '2020-07-15 13:25:07', '2020-07-15 13:26:27');
INSERT INTO `tb_patient_info` VALUES ('5', '47d94971-412b-43ae-a03c-7f31f2df1b81', '张三', '410822199105161234', '1', '有病', '1', '0', 'bee', 'bee', '2020-08-02 07:37:48', '2020-08-02 07:37:48');
INSERT INTO `tb_patient_info` VALUES ('6', 'c01eaf59-67e2-4aa5-8a0e-b4ed2797b776', '11', '22', '1', '333', '1', '0', 'bee', 'bee', '2020-08-04 13:33:41', '2020-09-06 11:17:04');
INSERT INTO `tb_patient_info` VALUES ('7', 'c5a736e7-05d8-44c5-a01d-a3ce148bf41e', '王大雷2', '412888199402021236', '1', '阿迪', '1', '0', 'bee', 'bee', '2020-08-31 03:32:13', '2020-09-06 13:14:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES ('2', '1', '5', '0', 'bee', 'bee', '2020-07-06 12:13:01', '2020-07-06 12:13:05');
INSERT INTO `tb_role_menu` VALUES ('3', '2', '1', '0', 'bee', 'bee', '2020-07-06 12:14:29', '2020-07-06 12:14:31');
INSERT INTO `tb_role_menu` VALUES ('4', '2', '2', '0', 'bee', 'bee', '2020-07-06 12:14:49', '2020-07-06 12:14:52');
INSERT INTO `tb_role_menu` VALUES ('5', '2', '3', '0', 'bee', 'bee', '2020-07-06 12:15:07', '2020-07-06 12:15:10');
INSERT INTO `tb_role_menu` VALUES ('6', '2', '4', '0', 'bee', 'bee', '2020-07-06 12:15:22', '2020-07-06 12:15:25');
INSERT INTO `tb_role_menu` VALUES ('7', '2', '5', '0', 'bee', 'bee', '2020-07-06 12:15:45', '2020-07-06 12:15:48');
INSERT INTO `tb_role_menu` VALUES ('23', '1', '5', '0', 'bee', 'bee', '2020-08-30 08:56:11', '2020-08-30 08:56:11');
INSERT INTO `tb_role_menu` VALUES ('27', '2', '8', '0', 'bee', 'bee', '2020-08-31 08:34:10', '2020-08-31 08:34:10');
INSERT INTO `tb_role_menu` VALUES ('35', '2', 'd35f9d02-8829-4899-8e60-efca57bc7b5e', '0', 'bee', 'bee', '2020-09-06 12:29:33', '2020-09-06 12:29:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3037 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sys_log
-- ----------------------------
INSERT INTO `tb_sys_log` VALUES ('22', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,null]', '127.0.0.1', '2020-08-15 11:23:24');
INSERT INTO `tb_sys_log` VALUES ('23', '223.88.82.99', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.99', '2020-08-15 13:12:23');
INSERT INTO `tb_sys_log` VALUES ('24', '223.88.82.99', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.99', '2020-08-15 13:21:34');
INSERT INTO `tb_sys_log` VALUES ('25', '127.0.0.1', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{     \\\"name\\\": \\\"名称\\\",     \\\"remark\\\": \\\"备注\\\",     \\\"sort\\\": \\\"3\\\" }\"]', '127.0.0.1', '2020-08-15 13:52:08');
INSERT INTO `tb_sys_log` VALUES ('26', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-15 13:52:29');
INSERT INTO `tb_sys_log` VALUES ('27', '127.0.0.1', '编辑科室', 'doPutAccountAllInfo', '[\"effbc3b2-f95e-49c1-a009-d71eca0ec432\",\"{     \\\"name\\\": \\\"内科\\\",     \\\"remark\\\": \\\"备的注\\\",     \\\"sort\\\": \\\"13\\\" }\"]', '127.0.0.1', '2020-08-15 14:15:47');
INSERT INTO `tb_sys_log` VALUES ('28', '127.0.0.1', '编辑科室', 'doPutAccountAllInfo', '[\"effbc3b2-f95e-49c1-a009-d71eca0ec432\",\"{     \\\"name\\\": \\\"内科\\\",     \\\"remark\\\": \\\"备的注\\\",     \\\"sort\\\": \\\"13\\\" }\"]', '127.0.0.1', '2020-08-15 14:17:05');
INSERT INTO `tb_sys_log` VALUES ('29', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[\"1111\",null,1]', '127.0.0.1', '2020-08-15 14:39:25');
INSERT INTO `tb_sys_log` VALUES ('30', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-15 14:39:59');
INSERT INTO `tb_sys_log` VALUES ('31', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[\"1111\",null,1]', '127.0.0.1', '2020-08-15 14:40:40');
INSERT INTO `tb_sys_log` VALUES ('32', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-15 14:40:58');
INSERT INTO `tb_sys_log` VALUES ('33', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"13291812767\",1]', '127.0.0.1', '2020-08-15 14:41:08');
INSERT INTO `tb_sys_log` VALUES ('34', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[\"1111\",\"13291812767\",1]', '127.0.0.1', '2020-08-15 14:41:19');
INSERT INTO `tb_sys_log` VALUES ('35', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[\"1111\",null,1]', '127.0.0.1', '2020-08-15 14:41:29');
INSERT INTO `tb_sys_log` VALUES ('36', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"top\"]', '127.0.0.1', '2020-08-15 14:53:06');
INSERT INTO `tb_sys_log` VALUES ('37', '127.0.0.1', '获取所有的角色', 'doQueryRoleList', '[]', '127.0.0.1', '2020-08-15 15:04:19');
INSERT INTO `tb_sys_log` VALUES ('38', '127.0.0.1', '查询单个角色信息', 'doGetRole', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '127.0.0.1', '2020-08-15 15:04:42');
INSERT INTO `tb_sys_log` VALUES ('39', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[null,1]', '127.0.0.1', '2020-08-15 15:05:45');
INSERT INTO `tb_sys_log` VALUES ('40', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[null,1]', '127.0.0.1', '2020-08-15 15:06:40');
INSERT INTO `tb_sys_log` VALUES ('41', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[null,1]', '127.0.0.1', '2020-08-15 15:08:21');
INSERT INTO `tb_sys_log` VALUES ('42', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[null,1]', '127.0.0.1', '2020-08-15 15:08:44');
INSERT INTO `tb_sys_log` VALUES ('43', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"工\",1]', '127.0.0.1', '2020-08-15 15:09:44');
INSERT INTO `tb_sys_log` VALUES ('44', '127.0.0.1', '查询所有的菜单', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-15 15:17:20');
INSERT INTO `tb_sys_log` VALUES ('45', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-15 15:17:31');
INSERT INTO `tb_sys_log` VALUES ('46', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"f3b92c2a-d852-402a-ae09-8aa1ff240378\"]', '127.0.0.1', '2020-08-15 15:17:59');
INSERT INTO `tb_sys_log` VALUES ('47', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[null,1]', '127.0.0.1', '2020-08-15 15:45:44');
INSERT INTO `tb_sys_log` VALUES ('48', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"咽喉\",1]', '127.0.0.1', '2020-08-15 15:45:52');
INSERT INTO `tb_sys_log` VALUES ('49', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"{departmentId}\"]', '127.0.0.1', '2020-08-15 15:46:12');
INSERT INTO `tb_sys_log` VALUES ('50', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"{departmentId}\"]', '127.0.0.1', '2020-08-15 15:46:42');
INSERT INTO `tb_sys_log` VALUES ('51', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"effbc3b2-f95e-49c1-a009-d71eca0ec432\"]', '127.0.0.1', '2020-08-15 15:49:00');
INSERT INTO `tb_sys_log` VALUES ('52', '127.0.0.1', '查询账户对应的菜单', 'doQueryUserMenuTreeList', '[\"1dd45d94-edc3-4b42-9691-a4e6409a2328\"]', '127.0.0.1', '2020-08-16 03:43:33');
INSERT INTO `tb_sys_log` VALUES ('53', '127.0.0.1', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"1\"]', '127.0.0.1', '2020-08-16 03:44:18');
INSERT INTO `tb_sys_log` VALUES ('54', '127.0.0.1', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '127.0.0.1', '2020-08-16 03:44:27');
INSERT INTO `tb_sys_log` VALUES ('55', '127.0.0.1', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"1\"]', '127.0.0.1', '2020-08-16 03:44:44');
INSERT INTO `tb_sys_log` VALUES ('56', '127.0.0.1', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '127.0.0.1', '2020-08-16 03:45:01');
INSERT INTO `tb_sys_log` VALUES ('57', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"1\",\"5,6,8,4\"]', '127.0.0.1', '2020-08-16 03:52:31');
INSERT INTO `tb_sys_log` VALUES ('58', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"1\",\"5,6,8,4\"]', '127.0.0.1', '2020-08-16 03:53:23');
INSERT INTO `tb_sys_log` VALUES ('59', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"1\",\"5,6,8,4\"]', '127.0.0.1', '2020-08-16 03:54:36');
INSERT INTO `tb_sys_log` VALUES ('60', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"1\",\"5,6,8,4,1\"]', '127.0.0.1', '2020-08-16 04:06:39');
INSERT INTO `tb_sys_log` VALUES ('61', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"5,6,8,4\"]', '127.0.0.1', '2020-08-16 04:10:21');
INSERT INTO `tb_sys_log` VALUES ('62', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"5,6,8,4,1\"]', '127.0.0.1', '2020-08-16 04:10:28');
INSERT INTO `tb_sys_log` VALUES ('63', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"5,6,8,4,1\"]', '127.0.0.1', '2020-08-16 04:10:46');
INSERT INTO `tb_sys_log` VALUES ('64', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"1\",\"5,8\"]', '127.0.0.1', '2020-08-16 04:55:40');
INSERT INTO `tb_sys_log` VALUES ('65', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"5,8\"]', '127.0.0.1', '2020-08-16 04:57:46');
INSERT INTO `tb_sys_log` VALUES ('66', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"5,6,1\"]', '127.0.0.1', '2020-08-16 04:58:46');
INSERT INTO `tb_sys_log` VALUES ('67', '127.0.0.1', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"2\"]', '127.0.0.1', '2020-08-16 05:02:22');
INSERT INTO `tb_sys_log` VALUES ('68', '223.88.82.99', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.99', '2020-08-16 09:43:28');
INSERT INTO `tb_sys_log` VALUES ('69', '127.0.0.1', '新增科室疾病信息', 'doPostNewDiseaseInfo', '[\"{     \\\"departmentId\\\": \\\"effbc3b2-f95e-49c1-a009-d71eca0ec432\\\",     \\\"name\\\": \\\"高血压\\\",     \\\"remark\\\": \\\"备注\\\",     \\\"sort\\\": \\\"12\\\" }\"]', '127.0.0.1', '2020-08-16 10:56:50');
INSERT INTO `tb_sys_log` VALUES ('70', '221.14.197.125', '获取诊断结果', 'doQueryDiagnosticFeatureList', '[]', '221.14.197.125', '2020-08-16 10:59:53');
INSERT INTO `tb_sys_log` VALUES ('71', '223.88.82.99', '查询操作日志', 'doQuerySysLogList', '[null,null,null,1]', '223.88.82.99', '2020-08-16 11:47:56');
INSERT INTO `tb_sys_log` VALUES ('72', '127.0.0.1', '新增科室疾病信息', 'doPostNewDiseaseInfo', '[\"{     \\\"departmentId\\\": \\\"effbc3b2-f95e-49c1-a009-d71eca0ec432\\\",     \\\"introduction\\\": \\\"简介\\\",     \\\"name\\\": \\\"高血压\\\",     \\\"remark\\\": \\\"备注\\\",     \\\"sort\\\": \\\"15\\\",     \\\"treatment\\\": \\\"治疗方案\\\" }\"]', '127.0.0.1', '2020-08-16 13:56:02');
INSERT INTO `tb_sys_log` VALUES ('73', '127.0.0.1', '编辑疾病', 'doPutAccountAllInfo', '[\"9ab6eb59-1787-4d5d-ba1a-42acb4aea1bd\",\"{     \\\"departmentId\\\": \\\"effbc3b2-f95e-49c1-a009-d71eca0ec432\\\",     \\\"introduction\\\": \\\"简介\\\",     \\\"name\\\": \\\"高血压2\\\",     \\\"remark\\\": \\\"备是否注\\\",     \\\"sort\\\": \\\"14\\\",     \\\"treatment\\\": \\\"治疗方4案\\\" }\"]', '127.0.0.1', '2020-08-16 13:57:15');
INSERT INTO `tb_sys_log` VALUES ('74', '127.0.0.1', '查询所有的疾病', 'doQueryDiseaseList', '[\"effbc3b2-f95e-49c1-a009-d71eca0ec432\"]', '127.0.0.1', '2020-08-16 14:17:44');
INSERT INTO `tb_sys_log` VALUES ('75', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"effbc3b2-f95e-49c1-a009-d71eca0ec432\",null,1]', '127.0.0.1', '2020-08-16 14:18:05');
INSERT INTO `tb_sys_log` VALUES ('76', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"9ab6eb59-1787-4d5d-ba1a-42acb4aea1bd\"]', '127.0.0.1', '2020-08-16 14:19:52');
INSERT INTO `tb_sys_log` VALUES ('77', '127.0.0.1', '删除疾病信息', 'doDeleteDisease', '[\"9ab6eb59-1787-4d5d-ba1a-42acb4aea1bd\"]', '127.0.0.1', '2020-08-16 14:21:54');
INSERT INTO `tb_sys_log` VALUES ('78', '221.14.197.125', '获取所有的角色', 'doQueryRoleList', '[]', '221.14.197.125', '2020-08-18 14:02:54');
INSERT INTO `tb_sys_log` VALUES ('79', '221.14.197.125', '获取所有的角色', 'doQueryRoleList', '[]', '221.14.197.125', '2020-08-18 14:05:30');
INSERT INTO `tb_sys_log` VALUES ('80', '221.14.197.125', '获取所有的角色', 'doQueryRoleList', '[]', '221.14.197.125', '2020-08-18 14:34:01');
INSERT INTO `tb_sys_log` VALUES ('81', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:34:18');
INSERT INTO `tb_sys_log` VALUES ('82', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:34:24');
INSERT INTO `tb_sys_log` VALUES ('83', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"admin\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:34:36');
INSERT INTO `tb_sys_log` VALUES ('84', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"admin\",\"2\",\"111111\"]', '221.14.197.125', '2020-08-18 14:34:40');
INSERT INTO `tb_sys_log` VALUES ('85', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"admin\",\"2\",\"111111\"]', '221.14.197.125', '2020-08-18 14:34:44');
INSERT INTO `tb_sys_log` VALUES ('86', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo123\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:35:27');
INSERT INTO `tb_sys_log` VALUES ('87', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"wb120641\"]', '221.14.197.125', '2020-08-18 14:35:48');
INSERT INTO `tb_sys_log` VALUES ('88', '221.14.197.125', '获取所有的角色', 'doQueryRoleList', '[]', '221.14.197.125', '2020-08-18 14:36:19');
INSERT INTO `tb_sys_log` VALUES ('89', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"test1\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:36:39');
INSERT INTO `tb_sys_log` VALUES ('90', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:36:54');
INSERT INTO `tb_sys_log` VALUES ('91', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"wb120641\"]', '221.14.197.125', '2020-08-18 14:37:01');
INSERT INTO `tb_sys_log` VALUES ('92', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"123456\"]', '221.14.197.125', '2020-08-18 14:37:06');
INSERT INTO `tb_sys_log` VALUES ('93', '221.14.197.125', '获取所有的角色', 'doQueryRoleList', '[]', '221.14.197.125', '2020-08-18 14:37:08');
INSERT INTO `tb_sys_log` VALUES ('94', '221.14.197.125', '获取所有的角色', 'doQueryRoleList', '[]', '221.14.197.125', '2020-08-18 14:37:54');
INSERT INTO `tb_sys_log` VALUES ('95', '221.14.197.125', '获取所有的角色', 'doQueryRoleList', '[]', '221.14.197.125', '2020-08-18 14:38:01');
INSERT INTO `tb_sys_log` VALUES ('96', '221.14.197.125', '获取所有的角色', 'doQueryRoleList', '[]', '221.14.197.125', '2020-08-18 14:38:26');
INSERT INTO `tb_sys_log` VALUES ('97', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:38:46');
INSERT INTO `tb_sys_log` VALUES ('98', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo1\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:38:49');
INSERT INTO `tb_sys_log` VALUES ('99', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo12\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:38:52');
INSERT INTO `tb_sys_log` VALUES ('100', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo12\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:38:53');
INSERT INTO `tb_sys_log` VALUES ('101', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo12\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:38:53');
INSERT INTO `tb_sys_log` VALUES ('102', '221.14.197.125', '登录平台', 'doPostNewApplicationResource', '[\"wangbo12\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '221.14.197.125', '2020-08-18 14:39:02');
INSERT INTO `tb_sys_log` VALUES ('103', '221.14.197.125', '获取所有的角色', 'doQueryRoleList', '[]', '221.14.197.125', '2020-08-18 14:39:12');
INSERT INTO `tb_sys_log` VALUES ('104', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[\"effbc3b2-f95e-49c1-a009-d71eca0ec432\",1,null,0,20]', '127.0.0.1', '2020-08-19 13:38:21');
INSERT INTO `tb_sys_log` VALUES ('105', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 13:42:03');
INSERT INTO `tb_sys_log` VALUES ('106', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 13:47:45');
INSERT INTO `tb_sys_log` VALUES ('107', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:04:37');
INSERT INTO `tb_sys_log` VALUES ('108', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:06:55');
INSERT INTO `tb_sys_log` VALUES ('109', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 14:11:19');
INSERT INTO `tb_sys_log` VALUES ('110', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:14:41');
INSERT INTO `tb_sys_log` VALUES ('111', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 14:14:49');
INSERT INTO `tb_sys_log` VALUES ('112', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:20:02');
INSERT INTO `tb_sys_log` VALUES ('113', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 14:20:04');
INSERT INTO `tb_sys_log` VALUES ('114', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:21:05');
INSERT INTO `tb_sys_log` VALUES ('115', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 14:21:07');
INSERT INTO `tb_sys_log` VALUES ('116', '61.52.133.200', '注册账户', 'doPostNewUserInfo', '[\"{\\\"userName\\\":\\\"wangbo\\\",\\\"password\\\":\\\"111111\\\",\\\"email\\\":\\\"12343@qq.com\\\",\\\"phone\\\":\\\"17638171723\\\",\\\"departmentId\\\":\\\"1111\\\"}\"]', '61.52.133.200', '2020-08-20 14:21:28');
INSERT INTO `tb_sys_log` VALUES ('117', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:21:53');
INSERT INTO `tb_sys_log` VALUES ('118', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 14:21:54');
INSERT INTO `tb_sys_log` VALUES ('119', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 14:22:03');
INSERT INTO `tb_sys_log` VALUES ('120', '61.52.133.200', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '61.52.133.200', '2020-08-20 14:23:26');
INSERT INTO `tb_sys_log` VALUES ('121', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 14:23:29');
INSERT INTO `tb_sys_log` VALUES ('122', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:24:03');
INSERT INTO `tb_sys_log` VALUES ('123', '61.52.133.200', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '61.52.133.200', '2020-08-20 14:24:14');
INSERT INTO `tb_sys_log` VALUES ('124', '61.52.133.200', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"2\",\"111111\"]', '61.52.133.200', '2020-08-20 14:24:16');
INSERT INTO `tb_sys_log` VALUES ('125', '61.52.133.200', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\",\"111111\"]', '61.52.133.200', '2020-08-20 14:24:18');
INSERT INTO `tb_sys_log` VALUES ('126', '61.52.133.200', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\",\"111111\"]', '61.52.133.200', '2020-08-20 14:24:31');
INSERT INTO `tb_sys_log` VALUES ('127', '61.52.133.200', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '61.52.133.200', '2020-08-20 14:24:33');
INSERT INTO `tb_sys_log` VALUES ('128', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:25:11');
INSERT INTO `tb_sys_log` VALUES ('129', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 14:25:12');
INSERT INTO `tb_sys_log` VALUES ('130', '61.52.133.200', '注册账户', 'doPostNewUserInfo', '[\"{\\\"userName\\\":\\\"wangbo1\\\",\\\"password\\\":\\\"111111\\\",\\\"email\\\":\\\"1123@qq.com\\\",\\\"phone\\\":\\\"13876566544\\\",\\\"departmentId\\\":\\\"1111\\\"}\"]', '61.52.133.200', '2020-08-20 14:25:50');
INSERT INTO `tb_sys_log` VALUES ('131', '61.52.133.200', '登录平台', 'doPostNewApplicationResource', '[\"wangbo1\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '61.52.133.200', '2020-08-20 14:26:20');
INSERT INTO `tb_sys_log` VALUES ('132', '61.52.133.200', '登录平台', 'doPostNewApplicationResource', '[\"wangbo1\",\"2\",\"111111\"]', '61.52.133.200', '2020-08-20 14:26:23');
INSERT INTO `tb_sys_log` VALUES ('133', '61.52.133.200', '登录平台', 'doPostNewApplicationResource', '[\"wangbo1\",\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\",\"111111\"]', '61.52.133.200', '2020-08-20 14:26:25');
INSERT INTO `tb_sys_log` VALUES ('134', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 14:26:27');
INSERT INTO `tb_sys_log` VALUES ('135', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:28:52');
INSERT INTO `tb_sys_log` VALUES ('136', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:29:13');
INSERT INTO `tb_sys_log` VALUES ('137', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:29:39');
INSERT INTO `tb_sys_log` VALUES ('138', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:30:05');
INSERT INTO `tb_sys_log` VALUES ('139', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:30:13');
INSERT INTO `tb_sys_log` VALUES ('140', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:30:19');
INSERT INTO `tb_sys_log` VALUES ('141', '61.52.133.200', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '61.52.133.200', '2020-08-20 14:30:34');
INSERT INTO `tb_sys_log` VALUES ('142', '61.52.133.200', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '61.52.133.200', '2020-08-20 14:30:35');
INSERT INTO `tb_sys_log` VALUES ('143', '61.52.133.200', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '61.52.133.200', '2020-08-20 14:30:38');
INSERT INTO `tb_sys_log` VALUES ('144', '61.52.133.200', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '61.52.133.200', '2020-08-20 14:30:51');
INSERT INTO `tb_sys_log` VALUES ('145', '61.52.133.200', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '61.52.133.200', '2020-08-20 14:30:52');
INSERT INTO `tb_sys_log` VALUES ('146', '61.52.133.200', '退出平台', 'loginout', '[]', '61.52.133.200', '2020-08-20 14:33:44');
INSERT INTO `tb_sys_log` VALUES ('147', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 14:33:45');
INSERT INTO `tb_sys_log` VALUES ('148', '61.52.133.200', '查询操作日志', 'doQuerySysLogList', '[null,null,null,1]', '61.52.133.200', '2020-08-20 14:57:41');
INSERT INTO `tb_sys_log` VALUES ('149', '61.52.133.200', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.133.200', '2020-08-20 15:01:27');
INSERT INTO `tb_sys_log` VALUES ('150', '61.52.133.200', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '61.52.133.200', '2020-08-20 15:01:40');
INSERT INTO `tb_sys_log` VALUES ('151', '61.52.133.200', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '61.52.133.200', '2020-08-20 15:01:41');
INSERT INTO `tb_sys_log` VALUES ('152', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 15:03:41');
INSERT INTO `tb_sys_log` VALUES ('153', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 15:05:07');
INSERT INTO `tb_sys_log` VALUES ('154', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 15:05:41');
INSERT INTO `tb_sys_log` VALUES ('155', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 15:06:40');
INSERT INTO `tb_sys_log` VALUES ('156', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 15:09:24');
INSERT INTO `tb_sys_log` VALUES ('157', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 15:12:10');
INSERT INTO `tb_sys_log` VALUES ('158', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 15:15:50');
INSERT INTO `tb_sys_log` VALUES ('159', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 15:19:09');
INSERT INTO `tb_sys_log` VALUES ('160', '61.52.133.200', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.133.200', '2020-08-20 15:20:22');
INSERT INTO `tb_sys_log` VALUES ('161', '127.0.0.1', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{     \\\"doctorId\\\": \\\"456\\\",     \\\"patientId\\\": \\\"123456\\\",     \\\"record\\\": \\\"简介\\\",     \\\"sort\\\": \\\"1\\\",     \\\"treatmentPlan\\\": \\\"部门编号\\\" }\"]', '127.0.0.1', '2020-08-21 13:10:59');
INSERT INTO `tb_sys_log` VALUES ('162', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"0aa791a7-2af5-4acc-afc1-cd95857d6fde\"]', '127.0.0.1', '2020-08-21 13:12:14');
INSERT INTO `tb_sys_log` VALUES ('163', '127.0.0.1', '编辑就诊记录', 'doPutAccountAllInfo', '[\"0aa791a7-2af5-4acc-afc1-cd95857d6fde\",\"{     \\\"doctorId\\\": \\\"456444\\\",     \\\"patientId\\\": \\\"123454446\\\",     \\\"record\\\": \\\"简22介\\\",     \\\"sort\\\": \\\"2\\\",     \\\"treatmentPlan\\\": \\\"34324\\\" }\"]', '127.0.0.1', '2020-08-21 13:12:47');
INSERT INTO `tb_sys_log` VALUES ('164', '127.0.0.1', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",null,1]', '127.0.0.1', '2020-08-21 14:47:51');
INSERT INTO `tb_sys_log` VALUES ('165', '127.0.0.1', '新增特征信息', 'doPostNewExtendAttribute', null, '127.0.0.1', '2020-08-21 14:56:52');
INSERT INTO `tb_sys_log` VALUES ('166', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[\"1\",-1,null,0,20]', '127.0.0.1', '2020-08-21 14:59:31');
INSERT INTO `tb_sys_log` VALUES ('167', '127.0.0.1', '启用/禁用特征', 'doPutExtendAttributeState', '[\"c1ea25e2-d381-4c7f-9d44-dedff3f3e396\",1]', '127.0.0.1', '2020-08-21 15:01:44');
INSERT INTO `tb_sys_log` VALUES ('168', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-21 15:12:06');
INSERT INTO `tb_sys_log` VALUES ('169', '125.41.112.193', '获取所有的角色', 'doQueryRoleList', '[]', '125.41.112.193', '2020-08-24 13:30:57');
INSERT INTO `tb_sys_log` VALUES ('170', '125.41.112.193', '获取所有的角色', 'doQueryRoleList', '[]', '125.41.112.193', '2020-08-24 13:29:42');
INSERT INTO `tb_sys_log` VALUES ('171', '125.41.112.193', '获取所有的角色', 'doQueryRoleList', '[]', '125.41.112.193', '2020-08-24 13:29:16');
INSERT INTO `tb_sys_log` VALUES ('172', '125.41.112.193', '获取所有的角色', 'doQueryRoleList', '[]', '125.41.112.193', '2020-08-24 13:32:02');
INSERT INTO `tb_sys_log` VALUES ('173', '125.41.112.193', '获取所有的角色', 'doQueryRoleList', '[]', '125.41.112.193', '2020-08-24 13:30:54');
INSERT INTO `tb_sys_log` VALUES ('174', '125.41.112.193', '获取所有的角色', 'doQueryRoleList', '[]', '125.41.112.193', '2020-08-24 13:32:18');
INSERT INTO `tb_sys_log` VALUES ('175', '125.41.112.193', '获取所有的角色', 'doQueryRoleList', '[]', '125.41.112.193', '2020-08-24 13:32:30');
INSERT INTO `tb_sys_log` VALUES ('176', '125.41.112.193', '获取所有的角色', 'doQueryRoleList', '[]', '125.41.112.193', '2020-08-24 13:32:36');
INSERT INTO `tb_sys_log` VALUES ('177', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 13:55:50');
INSERT INTO `tb_sys_log` VALUES ('178', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 14:03:10');
INSERT INTO `tb_sys_log` VALUES ('179', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 14:03:26');
INSERT INTO `tb_sys_log` VALUES ('180', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 14:04:16');
INSERT INTO `tb_sys_log` VALUES ('181', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 14:04:53');
INSERT INTO `tb_sys_log` VALUES ('182', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 14:05:25');
INSERT INTO `tb_sys_log` VALUES ('183', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[\"1\",-1,null,0,20]', '127.0.0.1', '2020-08-24 14:07:15');
INSERT INTO `tb_sys_log` VALUES ('184', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[\"1\",-1,null,0,20]', '127.0.0.1', '2020-08-24 14:08:18');
INSERT INTO `tb_sys_log` VALUES ('185', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[\"1\",-1,null,0,20]', '127.0.0.1', '2020-08-24 14:55:22');
INSERT INTO `tb_sys_log` VALUES ('186', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[\"1113\",-1,null,0,20]', '127.0.0.1', '2020-08-24 14:55:43');
INSERT INTO `tb_sys_log` VALUES ('187', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 15:00:44');
INSERT INTO `tb_sys_log` VALUES ('188', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 15:01:24');
INSERT INTO `tb_sys_log` VALUES ('189', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"11\\\",\\\"sort\\\":5,\\\"remark\\\":\\\"2\\\"}\"]', '125.41.112.193', '2020-08-24 15:01:36');
INSERT INTO `tb_sys_log` VALUES ('190', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 15:03:35');
INSERT INTO `tb_sys_log` VALUES ('191', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 15:06:09');
INSERT INTO `tb_sys_log` VALUES ('192', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 15:06:14');
INSERT INTO `tb_sys_log` VALUES ('193', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 15:07:11');
INSERT INTO `tb_sys_log` VALUES ('194', '125.41.112.193', '查询所有的科室', 'doQueryDepartmentList', '[]', '125.41.112.193', '2020-08-24 15:07:18');
INSERT INTO `tb_sys_log` VALUES ('195', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:11:42');
INSERT INTO `tb_sys_log` VALUES ('196', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:11:46');
INSERT INTO `tb_sys_log` VALUES ('197', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:12:20');
INSERT INTO `tb_sys_log` VALUES ('198', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:12:30');
INSERT INTO `tb_sys_log` VALUES ('199', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:17:20');
INSERT INTO `tb_sys_log` VALUES ('200', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[\"1113\",-1,null,0,20]', '127.0.0.1', '2020-08-24 15:18:01');
INSERT INTO `tb_sys_log` VALUES ('201', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:18:12');
INSERT INTO `tb_sys_log` VALUES ('202', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[\"1113\",-1,null,0,20]', '127.0.0.1', '2020-08-24 15:19:12');
INSERT INTO `tb_sys_log` VALUES ('203', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[null,-1,null,0,20]', '127.0.0.1', '2020-08-24 15:19:20');
INSERT INTO `tb_sys_log` VALUES ('204', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:22:10');
INSERT INTO `tb_sys_log` VALUES ('205', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:22:18');
INSERT INTO `tb_sys_log` VALUES ('206', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:23:03');
INSERT INTO `tb_sys_log` VALUES ('207', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"1111\"]', '125.41.112.193', '2020-08-24 15:23:25');
INSERT INTO `tb_sys_log` VALUES ('208', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"1113\"]', '125.41.112.193', '2020-08-24 15:28:15');
INSERT INTO `tb_sys_log` VALUES ('209', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:33:03');
INSERT INTO `tb_sys_log` VALUES ('210', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:33:05');
INSERT INTO `tb_sys_log` VALUES ('211', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:33:25');
INSERT INTO `tb_sys_log` VALUES ('212', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:33:31');
INSERT INTO `tb_sys_log` VALUES ('213', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:33:36');
INSERT INTO `tb_sys_log` VALUES ('214', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:33:36');
INSERT INTO `tb_sys_log` VALUES ('215', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:34:18');
INSERT INTO `tb_sys_log` VALUES ('216', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:34:27');
INSERT INTO `tb_sys_log` VALUES ('217', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:34:42');
INSERT INTO `tb_sys_log` VALUES ('218', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:34:42');
INSERT INTO `tb_sys_log` VALUES ('219', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:35:15');
INSERT INTO `tb_sys_log` VALUES ('220', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:35:21');
INSERT INTO `tb_sys_log` VALUES ('221', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:35:43');
INSERT INTO `tb_sys_log` VALUES ('222', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:35:44');
INSERT INTO `tb_sys_log` VALUES ('223', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:36:14');
INSERT INTO `tb_sys_log` VALUES ('224', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:36:19');
INSERT INTO `tb_sys_log` VALUES ('225', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:36:23');
INSERT INTO `tb_sys_log` VALUES ('226', '125.41.112.193', '编辑科室', 'doPutAccountAllInfo', null, '125.41.112.193', '2020-08-24 15:36:35');
INSERT INTO `tb_sys_log` VALUES ('227', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:36:35');
INSERT INTO `tb_sys_log` VALUES ('228', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:40:00');
INSERT INTO `tb_sys_log` VALUES ('229', '125.41.112.193', '编辑科室', 'doPutAccountAllInfo', null, '125.41.112.193', '2020-08-24 15:40:04');
INSERT INTO `tb_sys_log` VALUES ('230', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:40:04');
INSERT INTO `tb_sys_log` VALUES ('231', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:40:52');
INSERT INTO `tb_sys_log` VALUES ('232', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"1\\\",\\\"sort\\\":6,\\\"remark\\\":\\\"1\\\"}\"]', '125.41.112.193', '2020-08-24 15:40:57');
INSERT INTO `tb_sys_log` VALUES ('233', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:40:57');
INSERT INTO `tb_sys_log` VALUES ('234', '125.41.112.193', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '125.41.112.193', '2020-08-24 15:40:59');
INSERT INTO `tb_sys_log` VALUES ('235', '125.41.112.193', '编辑科室', 'doPutAccountAllInfo', null, '125.41.112.193', '2020-08-24 15:41:02');
INSERT INTO `tb_sys_log` VALUES ('236', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:02');
INSERT INTO `tb_sys_log` VALUES ('237', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"3\\\",\\\"sort\\\":7,\\\"remark\\\":\\\"3\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:06');
INSERT INTO `tb_sys_log` VALUES ('238', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:06');
INSERT INTO `tb_sys_log` VALUES ('239', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"4\\\",\\\"sort\\\":8,\\\"remark\\\":\\\"4\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:10');
INSERT INTO `tb_sys_log` VALUES ('240', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:10');
INSERT INTO `tb_sys_log` VALUES ('241', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"5\\\",\\\"sort\\\":9,\\\"remark\\\":\\\"5\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:14');
INSERT INTO `tb_sys_log` VALUES ('242', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:14');
INSERT INTO `tb_sys_log` VALUES ('243', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"6\\\",\\\"sort\\\":10,\\\"remark\\\":\\\"6\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:21');
INSERT INTO `tb_sys_log` VALUES ('244', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:21');
INSERT INTO `tb_sys_log` VALUES ('245', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"11\\\",\\\"sort\\\":11,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:25');
INSERT INTO `tb_sys_log` VALUES ('246', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:25');
INSERT INTO `tb_sys_log` VALUES ('247', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"1\\\",\\\"sort\\\":12,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:30');
INSERT INTO `tb_sys_log` VALUES ('248', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:30');
INSERT INTO `tb_sys_log` VALUES ('249', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"2\\\",\\\"sort\\\":13,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:32');
INSERT INTO `tb_sys_log` VALUES ('250', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:32');
INSERT INTO `tb_sys_log` VALUES ('251', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"3\\\",\\\"sort\\\":14,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:35');
INSERT INTO `tb_sys_log` VALUES ('252', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:36');
INSERT INTO `tb_sys_log` VALUES ('253', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"4\\\",\\\"sort\\\":15,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:38');
INSERT INTO `tb_sys_log` VALUES ('254', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:38');
INSERT INTO `tb_sys_log` VALUES ('255', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"5\\\",\\\"sort\\\":16,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:42');
INSERT INTO `tb_sys_log` VALUES ('256', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:42');
INSERT INTO `tb_sys_log` VALUES ('257', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"44\\\",\\\"sort\\\":17,\\\"remark\\\":\\\"3\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:49');
INSERT INTO `tb_sys_log` VALUES ('258', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:49');
INSERT INTO `tb_sys_log` VALUES ('259', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"1\\\",\\\"sort\\\":18,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:54');
INSERT INTO `tb_sys_log` VALUES ('260', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:54');
INSERT INTO `tb_sys_log` VALUES ('261', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"3\\\",\\\"sort\\\":19,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:41:57');
INSERT INTO `tb_sys_log` VALUES ('262', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:41:57');
INSERT INTO `tb_sys_log` VALUES ('263', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"4\\\",\\\"sort\\\":20,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:42:01');
INSERT INTO `tb_sys_log` VALUES ('264', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:42:01');
INSERT INTO `tb_sys_log` VALUES ('265', '125.41.112.193', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"5\\\",\\\"sort\\\":21,\\\"remark\\\":\\\"\\\"}\"]', '125.41.112.193', '2020-08-24 15:42:04');
INSERT INTO `tb_sys_log` VALUES ('266', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:42:04');
INSERT INTO `tb_sys_log` VALUES ('267', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:42:17');
INSERT INTO `tb_sys_log` VALUES ('268', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:42:58');
INSERT INTO `tb_sys_log` VALUES ('269', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:43:13');
INSERT INTO `tb_sys_log` VALUES ('270', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:43:15');
INSERT INTO `tb_sys_log` VALUES ('271', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:43:22');
INSERT INTO `tb_sys_log` VALUES ('272', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:43:32');
INSERT INTO `tb_sys_log` VALUES ('273', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:44:07');
INSERT INTO `tb_sys_log` VALUES ('274', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:44:27');
INSERT INTO `tb_sys_log` VALUES ('275', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:45:52');
INSERT INTO `tb_sys_log` VALUES ('276', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '125.41.112.193', '2020-08-24 15:46:02');
INSERT INTO `tb_sys_log` VALUES ('277', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:46:05');
INSERT INTO `tb_sys_log` VALUES ('278', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '125.41.112.193', '2020-08-24 15:46:07');
INSERT INTO `tb_sys_log` VALUES ('279', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:46:09');
INSERT INTO `tb_sys_log` VALUES ('280', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:46:48');
INSERT INTO `tb_sys_log` VALUES ('281', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '125.41.112.193', '2020-08-24 15:47:01');
INSERT INTO `tb_sys_log` VALUES ('282', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:47:06');
INSERT INTO `tb_sys_log` VALUES ('283', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:47:18');
INSERT INTO `tb_sys_log` VALUES ('284', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:47:23');
INSERT INTO `tb_sys_log` VALUES ('285', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '125.41.112.193', '2020-08-24 15:47:27');
INSERT INTO `tb_sys_log` VALUES ('286', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",3]', '125.41.112.193', '2020-08-24 15:47:34');
INSERT INTO `tb_sys_log` VALUES ('287', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:47:37');
INSERT INTO `tb_sys_log` VALUES ('288', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:49:39');
INSERT INTO `tb_sys_log` VALUES ('289', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '125.41.112.193', '2020-08-24 15:49:45');
INSERT INTO `tb_sys_log` VALUES ('290', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",3]', '125.41.112.193', '2020-08-24 15:49:48');
INSERT INTO `tb_sys_log` VALUES ('291', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '125.41.112.193', '2020-08-24 15:49:49');
INSERT INTO `tb_sys_log` VALUES ('292', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:49:51');
INSERT INTO `tb_sys_log` VALUES ('293', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:53:31');
INSERT INTO `tb_sys_log` VALUES ('294', '125.41.112.193', '删除科室信息', 'doDeleteDepartment', '[\"e23d7611-d0ae-4a2e-8702-6637464d2076\"]', '125.41.112.193', '2020-08-24 15:53:45');
INSERT INTO `tb_sys_log` VALUES ('295', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:53:59');
INSERT INTO `tb_sys_log` VALUES ('296', '125.41.112.193', '删除科室信息', 'doDeleteDepartment', '[\"8394a7e0-6e58-4330-b17b-372fc0ea53f6\"]', '125.41.112.193', '2020-08-24 15:54:07');
INSERT INTO `tb_sys_log` VALUES ('297', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:54:52');
INSERT INTO `tb_sys_log` VALUES ('298', '125.41.112.193', '删除科室信息', 'doDeleteDepartment', '[\"a502f2cd-f840-4ec0-806a-48e110e17217\"]', '125.41.112.193', '2020-08-24 15:54:57');
INSERT INTO `tb_sys_log` VALUES ('299', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:54:57');
INSERT INTO `tb_sys_log` VALUES ('300', '125.41.112.193', '删除科室信息', 'doDeleteDepartment', '[\"9d1da57f-9124-45d8-813a-679d8cad7323\"]', '125.41.112.193', '2020-08-24 15:55:00');
INSERT INTO `tb_sys_log` VALUES ('301', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:55:00');
INSERT INTO `tb_sys_log` VALUES ('302', '125.41.112.193', '删除科室信息', 'doDeleteDepartment', '[\"1deb58b3-57b7-42eb-96c8-4d5927d87b42\"]', '125.41.112.193', '2020-08-24 15:55:03');
INSERT INTO `tb_sys_log` VALUES ('303', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:55:03');
INSERT INTO `tb_sys_log` VALUES ('304', '125.41.112.193', '删除科室信息', 'doDeleteDepartment', '[\"efebde7e-cc14-4876-8bec-1a50417cf177\"]', '125.41.112.193', '2020-08-24 15:55:06');
INSERT INTO `tb_sys_log` VALUES ('305', '125.41.112.193', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '125.41.112.193', '2020-08-24 15:55:06');
INSERT INTO `tb_sys_log` VALUES ('306', '127.0.0.1', '新增科室下的输入特征', 'doPostNewDepartmentFeatureInfo', '[\"1111\",\"11,22\"]', '127.0.0.1', '2020-08-27 14:58:10');
INSERT INTO `tb_sys_log` VALUES ('307', '127.0.0.1', '删除科室特征信息', 'doDeleteDepartmentFeature2', '[\"11\",\"1111\"]', '127.0.0.1', '2020-08-27 15:02:35');
INSERT INTO `tb_sys_log` VALUES ('308', '127.0.0.1', '删除科室特征信息', 'doDeleteDepartmentFeature', '[\"1111\",\"22\"]', '127.0.0.1', '2020-08-27 15:02:51');
INSERT INTO `tb_sys_log` VALUES ('309', '127.0.0.1', '新增科室下的输入特征', 'doPostNewDepartmentFeatureInfo', '[\"1111\",\"11,22\"]', '127.0.0.1', '2020-08-27 15:03:17');
INSERT INTO `tb_sys_log` VALUES ('310', '127.0.0.1', '查询单个科室特征信息', 'doGetAccount', '[\"{departmentId}\",\"11\"]', '127.0.0.1', '2020-08-27 15:03:41');
INSERT INTO `tb_sys_log` VALUES ('311', '127.0.0.1', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",1,null,1]', '127.0.0.1', '2020-08-27 15:03:57');
INSERT INTO `tb_sys_log` VALUES ('312', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-27 15:05:26');
INSERT INTO `tb_sys_log` VALUES ('313', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-08-27 15:06:38');
INSERT INTO `tb_sys_log` VALUES ('314', '127.0.0.1', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",-1,null,1]', '127.0.0.1', '2020-08-27 15:08:16');
INSERT INTO `tb_sys_log` VALUES ('315', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-27 15:09:22');
INSERT INTO `tb_sys_log` VALUES ('316', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-27 15:10:10');
INSERT INTO `tb_sys_log` VALUES ('317', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-27 15:10:42');
INSERT INTO `tb_sys_log` VALUES ('318', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-27 15:11:07');
INSERT INTO `tb_sys_log` VALUES ('319', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-27 15:12:04');
INSERT INTO `tb_sys_log` VALUES ('320', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-27 15:12:23');
INSERT INTO `tb_sys_log` VALUES ('321', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-27 15:12:35');
INSERT INTO `tb_sys_log` VALUES ('322', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-27 15:13:36');
INSERT INTO `tb_sys_log` VALUES ('323', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-27 15:13:41');
INSERT INTO `tb_sys_log` VALUES ('324', '61.52.173.244', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.173.244', '2020-08-29 12:31:11');
INSERT INTO `tb_sys_log` VALUES ('325', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:31:31');
INSERT INTO `tb_sys_log` VALUES ('326', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '61.52.173.244', '2020-08-29 12:31:35');
INSERT INTO `tb_sys_log` VALUES ('327', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:31:37');
INSERT INTO `tb_sys_log` VALUES ('328', '61.52.173.244', '删除科室信息', 'doDeleteDepartment', '[\"eff8285e-f144-4646-a7d7-0e293484d6c3\"]', '61.52.173.244', '2020-08-29 12:31:41');
INSERT INTO `tb_sys_log` VALUES ('329', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:31:41');
INSERT INTO `tb_sys_log` VALUES ('330', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '61.52.173.244', '2020-08-29 12:31:43');
INSERT INTO `tb_sys_log` VALUES ('331', '61.52.173.244', '编辑科室', 'doPutAccountAllInfo', null, '61.52.173.244', '2020-08-29 12:31:45');
INSERT INTO `tb_sys_log` VALUES ('332', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:31:46');
INSERT INTO `tb_sys_log` VALUES ('333', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:36:09');
INSERT INTO `tb_sys_log` VALUES ('334', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:39:24');
INSERT INTO `tb_sys_log` VALUES ('335', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:39:27');
INSERT INTO `tb_sys_log` VALUES ('336', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:39:39');
INSERT INTO `tb_sys_log` VALUES ('337', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:39:52');
INSERT INTO `tb_sys_log` VALUES ('338', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:40:17');
INSERT INTO `tb_sys_log` VALUES ('339', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:40:20');
INSERT INTO `tb_sys_log` VALUES ('340', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '61.52.173.244', '2020-08-29 12:40:25');
INSERT INTO `tb_sys_log` VALUES ('341', '61.52.173.244', '编辑科室', 'doPutAccountAllInfo', null, '61.52.173.244', '2020-08-29 12:40:27');
INSERT INTO `tb_sys_log` VALUES ('342', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:40:27');
INSERT INTO `tb_sys_log` VALUES ('343', '61.52.173.244', '删除科室信息', 'doDeleteDepartment', '[\"c1e6210a-6435-4127-99c0-51b244c852b8\"]', '61.52.173.244', '2020-08-29 12:40:30');
INSERT INTO `tb_sys_log` VALUES ('344', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:40:30');
INSERT INTO `tb_sys_log` VALUES ('345', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:42:38');
INSERT INTO `tb_sys_log` VALUES ('346', '61.52.173.244', '退出平台', 'loginout', '[]', '61.52.173.244', '2020-08-29 12:43:13');
INSERT INTO `tb_sys_log` VALUES ('347', '61.52.173.244', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.173.244', '2020-08-29 12:43:14');
INSERT INTO `tb_sys_log` VALUES ('348', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:43:19');
INSERT INTO `tb_sys_log` VALUES ('349', '61.52.173.244', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.173.244', '2020-08-29 12:48:25');
INSERT INTO `tb_sys_log` VALUES ('350', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 12:48:45');
INSERT INTO `tb_sys_log` VALUES ('351', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 12:57:30');
INSERT INTO `tb_sys_log` VALUES ('352', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"6\",\"\",1]', '61.52.173.244', '2020-08-29 12:57:30');
INSERT INTO `tb_sys_log` VALUES ('353', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 12:58:13');
INSERT INTO `tb_sys_log` VALUES ('354', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 12:58:13');
INSERT INTO `tb_sys_log` VALUES ('355', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:00:47');
INSERT INTO `tb_sys_log` VALUES ('356', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:00:47');
INSERT INTO `tb_sys_log` VALUES ('357', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:02:04');
INSERT INTO `tb_sys_log` VALUES ('358', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:02:05');
INSERT INTO `tb_sys_log` VALUES ('359', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:02:12');
INSERT INTO `tb_sys_log` VALUES ('360', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:02:13');
INSERT INTO `tb_sys_log` VALUES ('361', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:05:53');
INSERT INTO `tb_sys_log` VALUES ('362', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:05:54');
INSERT INTO `tb_sys_log` VALUES ('363', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:18:49');
INSERT INTO `tb_sys_log` VALUES ('364', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:18:49');
INSERT INTO `tb_sys_log` VALUES ('365', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:18:56');
INSERT INTO `tb_sys_log` VALUES ('366', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:20:38');
INSERT INTO `tb_sys_log` VALUES ('367', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:20:39');
INSERT INTO `tb_sys_log` VALUES ('368', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:20:43');
INSERT INTO `tb_sys_log` VALUES ('369', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:20:44');
INSERT INTO `tb_sys_log` VALUES ('370', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:21:21');
INSERT INTO `tb_sys_log` VALUES ('371', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:21:22');
INSERT INTO `tb_sys_log` VALUES ('372', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:21:23');
INSERT INTO `tb_sys_log` VALUES ('373', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:22:00');
INSERT INTO `tb_sys_log` VALUES ('374', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:22:00');
INSERT INTO `tb_sys_log` VALUES ('375', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:22:02');
INSERT INTO `tb_sys_log` VALUES ('376', '61.52.173.244', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"测试疾病1\\\",\\\"treatment\\\":\\\"111\\\",\\\"introduction\\\":\\\"222\\\",\\\"diseaseId\\\":\\\"effbc3b2-f95e-49c1-a009-d71eca0ec432\\\",\\\"sort\\\":14,\\\"remark\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-29 13:22:15');
INSERT INTO `tb_sys_log` VALUES ('377', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:22:15');
INSERT INTO `tb_sys_log` VALUES ('378', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '61.52.173.244', '2020-08-29 13:22:34');
INSERT INTO `tb_sys_log` VALUES ('379', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1113\",\"\",1]', '61.52.173.244', '2020-08-29 13:22:36');
INSERT INTO `tb_sys_log` VALUES ('380', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"effbc3b2-f95e-49c1-a009-d71eca0ec432\",\"\",1]', '61.52.173.244', '2020-08-29 13:22:38');
INSERT INTO `tb_sys_log` VALUES ('381', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:22:58');
INSERT INTO `tb_sys_log` VALUES ('382', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:22:59');
INSERT INTO `tb_sys_log` VALUES ('383', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:26:10');
INSERT INTO `tb_sys_log` VALUES ('384', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:26:10');
INSERT INTO `tb_sys_log` VALUES ('385', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:26:22');
INSERT INTO `tb_sys_log` VALUES ('386', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:27:22');
INSERT INTO `tb_sys_log` VALUES ('387', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:27:22');
INSERT INTO `tb_sys_log` VALUES ('388', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:27:37');
INSERT INTO `tb_sys_log` VALUES ('389', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:28:41');
INSERT INTO `tb_sys_log` VALUES ('390', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:28:42');
INSERT INTO `tb_sys_log` VALUES ('391', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:31:11');
INSERT INTO `tb_sys_log` VALUES ('392', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"new\"]', '61.52.173.244', '2020-08-29 13:31:31');
INSERT INTO `tb_sys_log` VALUES ('393', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:31:31');
INSERT INTO `tb_sys_log` VALUES ('394', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:31:39');
INSERT INTO `tb_sys_log` VALUES ('395', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"new\"]', '61.52.173.244', '2020-08-29 13:31:50');
INSERT INTO `tb_sys_log` VALUES ('396', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:31:50');
INSERT INTO `tb_sys_log` VALUES ('397', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:32:12');
INSERT INTO `tb_sys_log` VALUES ('398', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:32:13');
INSERT INTO `tb_sys_log` VALUES ('399', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:32:33');
INSERT INTO `tb_sys_log` VALUES ('400', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"new\"]', '61.52.173.244', '2020-08-29 13:32:44');
INSERT INTO `tb_sys_log` VALUES ('401', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:32:44');
INSERT INTO `tb_sys_log` VALUES ('402', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:32:46');
INSERT INTO `tb_sys_log` VALUES ('403', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"new\"]', '61.52.173.244', '2020-08-29 13:33:24');
INSERT INTO `tb_sys_log` VALUES ('404', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:24');
INSERT INTO `tb_sys_log` VALUES ('405', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:33:27');
INSERT INTO `tb_sys_log` VALUES ('406', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:27');
INSERT INTO `tb_sys_log` VALUES ('407', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:29');
INSERT INTO `tb_sys_log` VALUES ('408', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1113\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:32');
INSERT INTO `tb_sys_log` VALUES ('409', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"effbc3b2-f95e-49c1-a009-d71eca0ec432\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:33');
INSERT INTO `tb_sys_log` VALUES ('410', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"d87a48e9-e9f0-4e93-9ba8-f24575e86081\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:35');
INSERT INTO `tb_sys_log` VALUES ('411', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:37');
INSERT INTO `tb_sys_log` VALUES ('412', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"d87a48e9-e9f0-4e93-9ba8-f24575e86081\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:38');
INSERT INTO `tb_sys_log` VALUES ('413', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"c6b3102b-d9c0-4ed4-976b-0d59f39154f6\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:41');
INSERT INTO `tb_sys_log` VALUES ('414', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"d75b7772-4c8c-4afc-acb3-e83b4b070b5a\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:43');
INSERT INTO `tb_sys_log` VALUES ('415', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:33:45');
INSERT INTO `tb_sys_log` VALUES ('416', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:33:46');
INSERT INTO `tb_sys_log` VALUES ('417', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:33:59');
INSERT INTO `tb_sys_log` VALUES ('418', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"111\"]', '61.52.173.244', '2020-08-29 13:34:42');
INSERT INTO `tb_sys_log` VALUES ('419', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"222\"]', '61.52.173.244', '2020-08-29 13:34:52');
INSERT INTO `tb_sys_log` VALUES ('420', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:34:59');
INSERT INTO `tb_sys_log` VALUES ('421', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:35:00');
INSERT INTO `tb_sys_log` VALUES ('422', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"1\"]', '61.52.173.244', '2020-08-29 13:35:08');
INSERT INTO `tb_sys_log` VALUES ('423', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"1\"]', '61.52.173.244', '2020-08-29 13:35:10');
INSERT INTO `tb_sys_log` VALUES ('424', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"1\"]', '61.52.173.244', '2020-08-29 13:35:10');
INSERT INTO `tb_sys_log` VALUES ('425', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:29');
INSERT INTO `tb_sys_log` VALUES ('426', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:30');
INSERT INTO `tb_sys_log` VALUES ('427', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:31');
INSERT INTO `tb_sys_log` VALUES ('428', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:31');
INSERT INTO `tb_sys_log` VALUES ('429', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:31');
INSERT INTO `tb_sys_log` VALUES ('430', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:31');
INSERT INTO `tb_sys_log` VALUES ('431', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:31');
INSERT INTO `tb_sys_log` VALUES ('432', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:33');
INSERT INTO `tb_sys_log` VALUES ('433', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:34');
INSERT INTO `tb_sys_log` VALUES ('434', '61.52.173.244', '查询所有的疾病', 'doQueryDiseaseList', '[\"6\"]', '61.52.173.244', '2020-08-29 13:35:34');
INSERT INTO `tb_sys_log` VALUES ('435', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:35:40');
INSERT INTO `tb_sys_log` VALUES ('436', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:35:40');
INSERT INTO `tb_sys_log` VALUES ('437', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:40:28');
INSERT INTO `tb_sys_log` VALUES ('438', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:40:29');
INSERT INTO `tb_sys_log` VALUES ('439', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:40:30');
INSERT INTO `tb_sys_log` VALUES ('440', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"new\"]', '61.52.173.244', '2020-08-29 13:40:36');
INSERT INTO `tb_sys_log` VALUES ('441', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:40:36');
INSERT INTO `tb_sys_log` VALUES ('442', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1113\",\"\",1]', '61.52.173.244', '2020-08-29 13:40:39');
INSERT INTO `tb_sys_log` VALUES ('443', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '61.52.173.244', '2020-08-29 13:40:43');
INSERT INTO `tb_sys_log` VALUES ('444', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:40:44');
INSERT INTO `tb_sys_log` VALUES ('445', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:41:13');
INSERT INTO `tb_sys_log` VALUES ('446', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:41:13');
INSERT INTO `tb_sys_log` VALUES ('447', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:43:13');
INSERT INTO `tb_sys_log` VALUES ('448', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:43:13');
INSERT INTO `tb_sys_log` VALUES ('449', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:43:15');
INSERT INTO `tb_sys_log` VALUES ('450', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:43:16');
INSERT INTO `tb_sys_log` VALUES ('451', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:43:19');
INSERT INTO `tb_sys_log` VALUES ('452', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:44:22');
INSERT INTO `tb_sys_log` VALUES ('453', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:44:23');
INSERT INTO `tb_sys_log` VALUES ('454', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:44:23');
INSERT INTO `tb_sys_log` VALUES ('455', '61.52.173.244', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"11\\\",\\\"treatment\\\":\\\"22\\\",\\\"introduction\\\":\\\"33\\\",\\\"department_id\\\":\\\"1111\\\",\\\"sort\\\":0,\\\"remark\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-29 13:44:31');
INSERT INTO `tb_sys_log` VALUES ('456', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:44:31');
INSERT INTO `tb_sys_log` VALUES ('457', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:45:55');
INSERT INTO `tb_sys_log` VALUES ('458', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:45:55');
INSERT INTO `tb_sys_log` VALUES ('459', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:47:53');
INSERT INTO `tb_sys_log` VALUES ('460', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:47:54');
INSERT INTO `tb_sys_log` VALUES ('461', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:48:26');
INSERT INTO `tb_sys_log` VALUES ('462', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:48:27');
INSERT INTO `tb_sys_log` VALUES ('463', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:48:42');
INSERT INTO `tb_sys_log` VALUES ('464', '61.52.173.244', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"咽喉科2\\\",\\\"treatment\\\":\\\"发大水发大水发大水范德萨范德萨发ad发\\\",\\\"introduction\\\":\\\"方方达萨达水电费都是发大水发阿斯蒂芬大奥德赛范德萨\\\",\\\"department_id\\\":\\\"1111\\\",\\\"sort\\\":2,\\\"remark\\\":\\\"发送到\\\"}\"]', '61.52.173.244', '2020-08-29 13:49:03');
INSERT INTO `tb_sys_log` VALUES ('465', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:49:03');
INSERT INTO `tb_sys_log` VALUES ('466', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:49:35');
INSERT INTO `tb_sys_log` VALUES ('467', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '61.52.173.244', '2020-08-29 13:49:36');
INSERT INTO `tb_sys_log` VALUES ('468', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:50:12');
INSERT INTO `tb_sys_log` VALUES ('469', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:50:12');
INSERT INTO `tb_sys_log` VALUES ('470', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:50:26');
INSERT INTO `tb_sys_log` VALUES ('471', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:50:26');
INSERT INTO `tb_sys_log` VALUES ('472', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:50:29');
INSERT INTO `tb_sys_log` VALUES ('473', '61.52.173.244', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"咽喉疾病3\\\",\\\"treatment\\\":\\\"11\\\",\\\"introduction\\\":\\\"22\\\",\\\"departmentId\\\":\\\"1111\\\",\\\"sort\\\":3,\\\"remark\\\":\\\"22\\\"}\"]', '61.52.173.244', '2020-08-29 13:50:39');
INSERT INTO `tb_sys_log` VALUES ('474', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:50:39');
INSERT INTO `tb_sys_log` VALUES ('475', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:51:05');
INSERT INTO `tb_sys_log` VALUES ('476', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '61.52.173.244', '2020-08-29 13:51:05');
INSERT INTO `tb_sys_log` VALUES ('477', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:53:25');
INSERT INTO `tb_sys_log` VALUES ('478', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:53:26');
INSERT INTO `tb_sys_log` VALUES ('479', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:53:28');
INSERT INTO `tb_sys_log` VALUES ('480', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '61.52.173.244', '2020-08-29 13:53:29');
INSERT INTO `tb_sys_log` VALUES ('481', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:54:01');
INSERT INTO `tb_sys_log` VALUES ('482', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:54:01');
INSERT INTO `tb_sys_log` VALUES ('483', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:54:03');
INSERT INTO `tb_sys_log` VALUES ('484', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '61.52.173.244', '2020-08-29 13:54:03');
INSERT INTO `tb_sys_log` VALUES ('485', '61.52.173.244', '编辑疾病', 'doPutAccountAllInfo', null, '61.52.173.244', '2020-08-29 13:54:08');
INSERT INTO `tb_sys_log` VALUES ('486', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:54:08');
INSERT INTO `tb_sys_log` VALUES ('487', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:54:11');
INSERT INTO `tb_sys_log` VALUES ('488', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '61.52.173.244', '2020-08-29 13:54:11');
INSERT INTO `tb_sys_log` VALUES ('489', '61.52.173.244', '编辑疾病', 'doPutAccountAllInfo', null, '61.52.173.244', '2020-08-29 13:54:21');
INSERT INTO `tb_sys_log` VALUES ('490', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:54:21');
INSERT INTO `tb_sys_log` VALUES ('491', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '61.52.173.244', '2020-08-29 13:54:24');
INSERT INTO `tb_sys_log` VALUES ('492', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:55:52');
INSERT INTO `tb_sys_log` VALUES ('493', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:55:52');
INSERT INTO `tb_sys_log` VALUES ('494', '61.52.173.244', '删除科室信息', 'doDeleteDepartment', '[\"a2d8bd7f-5433-412a-91e0-f8325031f9bb\"]', '61.52.173.244', '2020-08-29 13:55:54');
INSERT INTO `tb_sys_log` VALUES ('495', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:56:33');
INSERT INTO `tb_sys_log` VALUES ('496', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:56:34');
INSERT INTO `tb_sys_log` VALUES ('497', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:56:38');
INSERT INTO `tb_sys_log` VALUES ('498', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:56:40');
INSERT INTO `tb_sys_log` VALUES ('499', '61.52.173.244', '查询单个账户信息', 'doGetAccount', '[\"a2d8bd7f-5433-412a-91e0-f8325031f9bb\"]', '61.52.173.244', '2020-08-29 13:56:40');
INSERT INTO `tb_sys_log` VALUES ('500', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:56:44');
INSERT INTO `tb_sys_log` VALUES ('501', '61.52.173.244', '删除疾病信息', 'doDeleteDisease', '[\"a2d8bd7f-5433-412a-91e0-f8325031f9bb\"]', '61.52.173.244', '2020-08-29 13:56:48');
INSERT INTO `tb_sys_log` VALUES ('502', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:57:00');
INSERT INTO `tb_sys_log` VALUES ('503', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:57:01');
INSERT INTO `tb_sys_log` VALUES ('504', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:57:16');
INSERT INTO `tb_sys_log` VALUES ('505', '61.52.173.244', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"1\\\",\\\"treatment\\\":\\\"1\\\",\\\"introduction\\\":\\\"1\\\",\\\"departmentId\\\":\\\"1111\\\",\\\"sort\\\":2,\\\"remark\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-29 13:57:23');
INSERT INTO `tb_sys_log` VALUES ('506', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:57:23');
INSERT INTO `tb_sys_log` VALUES ('507', '61.52.173.244', '删除疾病信息', 'doDeleteDisease', '[\"5ec55edb-266e-48be-a674-636b2e96458b\"]', '61.52.173.244', '2020-08-29 13:57:29');
INSERT INTO `tb_sys_log` VALUES ('508', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:57:38');
INSERT INTO `tb_sys_log` VALUES ('509', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:57:39');
INSERT INTO `tb_sys_log` VALUES ('510', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:58:20');
INSERT INTO `tb_sys_log` VALUES ('511', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:58:21');
INSERT INTO `tb_sys_log` VALUES ('512', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:58:21');
INSERT INTO `tb_sys_log` VALUES ('513', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:58:22');
INSERT INTO `tb_sys_log` VALUES ('514', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:58:35');
INSERT INTO `tb_sys_log` VALUES ('515', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:59:14');
INSERT INTO `tb_sys_log` VALUES ('516', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:59:15');
INSERT INTO `tb_sys_log` VALUES ('517', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:59:18');
INSERT INTO `tb_sys_log` VALUES ('518', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:59:19');
INSERT INTO `tb_sys_log` VALUES ('519', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"11\",1]', '61.52.173.244', '2020-08-29 13:59:22');
INSERT INTO `tb_sys_log` VALUES ('520', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:59:24');
INSERT INTO `tb_sys_log` VALUES ('521', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 13:59:29');
INSERT INTO `tb_sys_log` VALUES ('522', '61.52.173.244', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"测试疾病2\\\",\\\"treatment\\\":\\\"222\\\",\\\"introduction\\\":\\\"111\\\",\\\"departmentId\\\":\\\"1111\\\",\\\"sort\\\":2,\\\"remark\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-29 13:59:54');
INSERT INTO `tb_sys_log` VALUES ('523', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:59:54');
INSERT INTO `tb_sys_log` VALUES ('524', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"测试\",1]', '61.52.173.244', '2020-08-29 13:59:57');
INSERT INTO `tb_sys_log` VALUES ('525', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 13:59:58');
INSERT INTO `tb_sys_log` VALUES ('526', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"咽喉\",1]', '61.52.173.244', '2020-08-29 14:00:01');
INSERT INTO `tb_sys_log` VALUES ('527', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 14:00:02');
INSERT INTO `tb_sys_log` VALUES ('528', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 14:01:09');
INSERT INTO `tb_sys_log` VALUES ('529', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 14:01:10');
INSERT INTO `tb_sys_log` VALUES ('530', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-29 14:01:10');
INSERT INTO `tb_sys_log` VALUES ('531', '61.52.173.244', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '61.52.173.244', '2020-08-29 14:01:15');
INSERT INTO `tb_sys_log` VALUES ('532', '61.52.173.244', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '61.52.173.244', '2020-08-29 14:37:09');
INSERT INTO `tb_sys_log` VALUES ('533', '61.52.173.244', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '61.52.173.244', '2020-08-29 14:37:44');
INSERT INTO `tb_sys_log` VALUES ('534', '61.52.173.244', '退出平台', 'loginout', '[]', '61.52.173.244', '2020-08-29 14:38:32');
INSERT INTO `tb_sys_log` VALUES ('535', '61.52.173.244', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.173.244', '2020-08-29 14:38:32');
INSERT INTO `tb_sys_log` VALUES ('536', '61.52.173.244', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '61.52.173.244', '2020-08-29 14:44:56');
INSERT INTO `tb_sys_log` VALUES ('537', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 14:44:57');
INSERT INTO `tb_sys_log` VALUES ('538', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-29 14:45:01');
INSERT INTO `tb_sys_log` VALUES ('539', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 14:47:06');
INSERT INTO `tb_sys_log` VALUES ('540', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 15:57:03');
INSERT INTO `tb_sys_log` VALUES ('541', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 15:57:14');
INSERT INTO `tb_sys_log` VALUES ('542', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 15:57:32');
INSERT INTO `tb_sys_log` VALUES ('543', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 15:58:22');
INSERT INTO `tb_sys_log` VALUES ('544', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 15:59:17');
INSERT INTO `tb_sys_log` VALUES ('545', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:00:56');
INSERT INTO `tb_sys_log` VALUES ('546', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:03:05');
INSERT INTO `tb_sys_log` VALUES ('547', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:34:22');
INSERT INTO `tb_sys_log` VALUES ('548', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:34:31');
INSERT INTO `tb_sys_log` VALUES ('549', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:38:59');
INSERT INTO `tb_sys_log` VALUES ('550', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:39:55');
INSERT INTO `tb_sys_log` VALUES ('551', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:41:07');
INSERT INTO `tb_sys_log` VALUES ('552', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:42:00');
INSERT INTO `tb_sys_log` VALUES ('553', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:42:09');
INSERT INTO `tb_sys_log` VALUES ('554', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:42:43');
INSERT INTO `tb_sys_log` VALUES ('555', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:44:12');
INSERT INTO `tb_sys_log` VALUES ('556', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:45:11');
INSERT INTO `tb_sys_log` VALUES ('557', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:45:14');
INSERT INTO `tb_sys_log` VALUES ('558', '61.52.173.244', '新增角色信息', 'doPostNewApplicationRoleInfo', '[\"{\\\"roleName\\\":\\\"11\\\",\\\"roleCode\\\":\\\"22\\\",\\\"remark\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-29 16:45:18');
INSERT INTO `tb_sys_log` VALUES ('559', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:46:06');
INSERT INTO `tb_sys_log` VALUES ('560', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:46:11');
INSERT INTO `tb_sys_log` VALUES ('561', '61.52.173.244', '新增角色信息', 'doPostNewApplicationRoleInfo', '[\"{\\\"roleName\\\":\\\"2\\\",\\\"roleCode\\\":\\\"2\\\",\\\"remark\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-29 16:46:15');
INSERT INTO `tb_sys_log` VALUES ('562', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:46:15');
INSERT INTO `tb_sys_log` VALUES ('563', '61.52.173.244', '新增角色信息', 'doPostNewApplicationRoleInfo', '[\"{\\\"roleName\\\":\\\"113\\\",\\\"roleCode\\\":\\\"22\\\",\\\"remark\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-29 16:46:23');
INSERT INTO `tb_sys_log` VALUES ('564', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:46:23');
INSERT INTO `tb_sys_log` VALUES ('565', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:49:31');
INSERT INTO `tb_sys_log` VALUES ('566', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:50:07');
INSERT INTO `tb_sys_log` VALUES ('567', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:50:48');
INSERT INTO `tb_sys_log` VALUES ('568', '61.52.173.244', '查询单个角色信息', 'doGetRole', '[\"5c3c82c0-8dba-420a-9e2f-c75765cc3d2b\"]', '61.52.173.244', '2020-08-29 16:50:51');
INSERT INTO `tb_sys_log` VALUES ('569', '61.52.173.244', '编辑角色信息', 'doPostNewApplicationRoleInfo', null, '61.52.173.244', '2020-08-29 16:50:56');
INSERT INTO `tb_sys_log` VALUES ('570', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:51:14');
INSERT INTO `tb_sys_log` VALUES ('571', '61.52.173.244', '查询单个角色信息', 'doGetRole', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\"]', '61.52.173.244', '2020-08-29 16:51:31');
INSERT INTO `tb_sys_log` VALUES ('572', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:51:49');
INSERT INTO `tb_sys_log` VALUES ('573', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:51:52');
INSERT INTO `tb_sys_log` VALUES ('574', '61.52.173.244', '查询单个角色信息', 'doGetRole', '[\"5c3c82c0-8dba-420a-9e2f-c75765cc3d2b\"]', '61.52.173.244', '2020-08-29 16:52:46');
INSERT INTO `tb_sys_log` VALUES ('575', '61.52.173.244', '编辑角色信息', 'doPostNewApplicationRoleInfo', null, '61.52.173.244', '2020-08-29 16:52:49');
INSERT INTO `tb_sys_log` VALUES ('576', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:52:49');
INSERT INTO `tb_sys_log` VALUES ('577', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:53:04');
INSERT INTO `tb_sys_log` VALUES ('578', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:53:11');
INSERT INTO `tb_sys_log` VALUES ('579', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:54:01');
INSERT INTO `tb_sys_log` VALUES ('580', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:54:03');
INSERT INTO `tb_sys_log` VALUES ('581', '61.52.173.244', '删除角色', 'doDeleteApplicationRole', '[\"4f907319-615f-4da8-9e76-754fdc948ea9\"]', '61.52.173.244', '2020-08-29 16:54:08');
INSERT INTO `tb_sys_log` VALUES ('582', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:54:08');
INSERT INTO `tb_sys_log` VALUES ('583', '61.52.173.244', '删除角色', 'doDeleteApplicationRole', '[\"9e8ac77e-0171-4337-ab78-315821d582e7\"]', '61.52.173.244', '2020-08-29 16:54:11');
INSERT INTO `tb_sys_log` VALUES ('584', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:54:12');
INSERT INTO `tb_sys_log` VALUES ('585', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"医\",1]', '61.52.173.244', '2020-08-29 16:55:27');
INSERT INTO `tb_sys_log` VALUES ('586', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 16:55:28');
INSERT INTO `tb_sys_log` VALUES ('587', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-29 16:58:05');
INSERT INTO `tb_sys_log` VALUES ('588', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:04:24');
INSERT INTO `tb_sys_log` VALUES ('589', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:04:45');
INSERT INTO `tb_sys_log` VALUES ('590', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:05:02');
INSERT INTO `tb_sys_log` VALUES ('591', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:05:23');
INSERT INTO `tb_sys_log` VALUES ('592', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:05:27');
INSERT INTO `tb_sys_log` VALUES ('593', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:05:29');
INSERT INTO `tb_sys_log` VALUES ('594', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:06:37');
INSERT INTO `tb_sys_log` VALUES ('595', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:06:49');
INSERT INTO `tb_sys_log` VALUES ('596', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:07:22');
INSERT INTO `tb_sys_log` VALUES ('597', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:10:34');
INSERT INTO `tb_sys_log` VALUES ('598', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-29 17:10:46');
INSERT INTO `tb_sys_log` VALUES ('599', '61.52.173.244', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.173.244', '2020-08-30 01:43:58');
INSERT INTO `tb_sys_log` VALUES ('600', '61.52.173.244', '获取所有的角色', 'doQueryRoleList', '[]', '61.52.173.244', '2020-08-30 01:44:26');
INSERT INTO `tb_sys_log` VALUES ('601', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 01:44:48');
INSERT INTO `tb_sys_log` VALUES ('602', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:07:37');
INSERT INTO `tb_sys_log` VALUES ('603', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:09:00');
INSERT INTO `tb_sys_log` VALUES ('604', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:10:38');
INSERT INTO `tb_sys_log` VALUES ('605', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:11:01');
INSERT INTO `tb_sys_log` VALUES ('606', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:11:03');
INSERT INTO `tb_sys_log` VALUES ('607', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:13:39');
INSERT INTO `tb_sys_log` VALUES ('608', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:13:52');
INSERT INTO `tb_sys_log` VALUES ('609', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:17:14');
INSERT INTO `tb_sys_log` VALUES ('610', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:19:05');
INSERT INTO `tb_sys_log` VALUES ('611', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:19:12');
INSERT INTO `tb_sys_log` VALUES ('612', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:19:43');
INSERT INTO `tb_sys_log` VALUES ('613', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:20:37');
INSERT INTO `tb_sys_log` VALUES ('614', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:20:41');
INSERT INTO `tb_sys_log` VALUES ('615', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:20:42');
INSERT INTO `tb_sys_log` VALUES ('616', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:20:43');
INSERT INTO `tb_sys_log` VALUES ('617', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:21:46');
INSERT INTO `tb_sys_log` VALUES ('618', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:21:56');
INSERT INTO `tb_sys_log` VALUES ('619', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:22:07');
INSERT INTO `tb_sys_log` VALUES ('620', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:22:48');
INSERT INTO `tb_sys_log` VALUES ('621', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:22:57');
INSERT INTO `tb_sys_log` VALUES ('622', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:22:59');
INSERT INTO `tb_sys_log` VALUES ('623', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:23:00');
INSERT INTO `tb_sys_log` VALUES ('624', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:23:14');
INSERT INTO `tb_sys_log` VALUES ('625', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:23:48');
INSERT INTO `tb_sys_log` VALUES ('626', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:23:50');
INSERT INTO `tb_sys_log` VALUES ('627', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:24:08');
INSERT INTO `tb_sys_log` VALUES ('628', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:25:29');
INSERT INTO `tb_sys_log` VALUES ('629', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:25:31');
INSERT INTO `tb_sys_log` VALUES ('630', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:26:18');
INSERT INTO `tb_sys_log` VALUES ('631', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:26:19');
INSERT INTO `tb_sys_log` VALUES ('632', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:26:54');
INSERT INTO `tb_sys_log` VALUES ('633', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:26:55');
INSERT INTO `tb_sys_log` VALUES ('634', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:27:47');
INSERT INTO `tb_sys_log` VALUES ('635', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:27:49');
INSERT INTO `tb_sys_log` VALUES ('636', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:28:32');
INSERT INTO `tb_sys_log` VALUES ('637', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:28:34');
INSERT INTO `tb_sys_log` VALUES ('638', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:28:43');
INSERT INTO `tb_sys_log` VALUES ('639', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:28:48');
INSERT INTO `tb_sys_log` VALUES ('640', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:29:16');
INSERT INTO `tb_sys_log` VALUES ('641', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:29:21');
INSERT INTO `tb_sys_log` VALUES ('642', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:29:22');
INSERT INTO `tb_sys_log` VALUES ('643', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:29:24');
INSERT INTO `tb_sys_log` VALUES ('644', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:29:53');
INSERT INTO `tb_sys_log` VALUES ('645', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:31:25');
INSERT INTO `tb_sys_log` VALUES ('646', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:31:26');
INSERT INTO `tb_sys_log` VALUES ('647', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:31:29');
INSERT INTO `tb_sys_log` VALUES ('648', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:31:30');
INSERT INTO `tb_sys_log` VALUES ('649', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:31:40');
INSERT INTO `tb_sys_log` VALUES ('650', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-30 06:31:42');
INSERT INTO `tb_sys_log` VALUES ('651', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-30 06:31:42');
INSERT INTO `tb_sys_log` VALUES ('652', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:31:48');
INSERT INTO `tb_sys_log` VALUES ('653', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-30 06:31:53');
INSERT INTO `tb_sys_log` VALUES ('654', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-30 06:31:53');
INSERT INTO `tb_sys_log` VALUES ('655', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:32:01');
INSERT INTO `tb_sys_log` VALUES ('656', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:32:04');
INSERT INTO `tb_sys_log` VALUES ('657', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-30 06:32:40');
INSERT INTO `tb_sys_log` VALUES ('658', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-30 06:32:41');
INSERT INTO `tb_sys_log` VALUES ('659', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-30 06:33:52');
INSERT INTO `tb_sys_log` VALUES ('660', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-30 06:33:52');
INSERT INTO `tb_sys_log` VALUES ('661', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-30 06:34:43');
INSERT INTO `tb_sys_log` VALUES ('662', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-30 06:34:43');
INSERT INTO `tb_sys_log` VALUES ('663', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-30 06:35:17');
INSERT INTO `tb_sys_log` VALUES ('664', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-30 06:35:17');
INSERT INTO `tb_sys_log` VALUES ('665', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:35:20');
INSERT INTO `tb_sys_log` VALUES ('666', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:35:22');
INSERT INTO `tb_sys_log` VALUES ('667', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:36:56');
INSERT INTO `tb_sys_log` VALUES ('668', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:37:00');
INSERT INTO `tb_sys_log` VALUES ('669', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:37:03');
INSERT INTO `tb_sys_log` VALUES ('670', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 06:37:34');
INSERT INTO `tb_sys_log` VALUES ('671', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:37:38');
INSERT INTO `tb_sys_log` VALUES ('672', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:43:04');
INSERT INTO `tb_sys_log` VALUES ('673', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:43:28');
INSERT INTO `tb_sys_log` VALUES ('674', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:44:21');
INSERT INTO `tb_sys_log` VALUES ('675', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:44:36');
INSERT INTO `tb_sys_log` VALUES ('676', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:45:14');
INSERT INTO `tb_sys_log` VALUES ('677', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:45:33');
INSERT INTO `tb_sys_log` VALUES ('678', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:46:23');
INSERT INTO `tb_sys_log` VALUES ('679', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:46:40');
INSERT INTO `tb_sys_log` VALUES ('680', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:51:20');
INSERT INTO `tb_sys_log` VALUES ('681', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:51:24');
INSERT INTO `tb_sys_log` VALUES ('682', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:51:50');
INSERT INTO `tb_sys_log` VALUES ('683', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:51:54');
INSERT INTO `tb_sys_log` VALUES ('684', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:51:56');
INSERT INTO `tb_sys_log` VALUES ('685', '61.52.173.244', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"角色管理\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-30 06:52:41');
INSERT INTO `tb_sys_log` VALUES ('686', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:52:47');
INSERT INTO `tb_sys_log` VALUES ('687', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:53:07');
INSERT INTO `tb_sys_log` VALUES ('688', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:53:18');
INSERT INTO `tb_sys_log` VALUES ('689', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:53:20');
INSERT INTO `tb_sys_log` VALUES ('690', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:53:22');
INSERT INTO `tb_sys_log` VALUES ('691', '61.52.173.244', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"诊断管理1\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-30 06:53:37');
INSERT INTO `tb_sys_log` VALUES ('692', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:54:04');
INSERT INTO `tb_sys_log` VALUES ('693', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:54:05');
INSERT INTO `tb_sys_log` VALUES ('694', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:55:15');
INSERT INTO `tb_sys_log` VALUES ('695', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:55:16');
INSERT INTO `tb_sys_log` VALUES ('696', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:55:17');
INSERT INTO `tb_sys_log` VALUES ('697', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:55:54');
INSERT INTO `tb_sys_log` VALUES ('698', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:55:55');
INSERT INTO `tb_sys_log` VALUES ('699', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:55:56');
INSERT INTO `tb_sys_log` VALUES ('700', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:57:21');
INSERT INTO `tb_sys_log` VALUES ('701', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:57:22');
INSERT INTO `tb_sys_log` VALUES ('702', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:57:23');
INSERT INTO `tb_sys_log` VALUES ('703', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:57:44');
INSERT INTO `tb_sys_log` VALUES ('704', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 06:58:06');
INSERT INTO `tb_sys_log` VALUES ('705', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:58:08');
INSERT INTO `tb_sys_log` VALUES ('706', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 06:58:09');
INSERT INTO `tb_sys_log` VALUES ('707', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:00:16');
INSERT INTO `tb_sys_log` VALUES ('708', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:00:18');
INSERT INTO `tb_sys_log` VALUES ('709', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:00:19');
INSERT INTO `tb_sys_log` VALUES ('710', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:02:12');
INSERT INTO `tb_sys_log` VALUES ('711', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:02:13');
INSERT INTO `tb_sys_log` VALUES ('712', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:02:14');
INSERT INTO `tb_sys_log` VALUES ('713', '61.52.173.244', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"菜单2\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-30 07:02:44');
INSERT INTO `tb_sys_log` VALUES ('714', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:03:32');
INSERT INTO `tb_sys_log` VALUES ('715', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:03:33');
INSERT INTO `tb_sys_log` VALUES ('716', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:03:37');
INSERT INTO `tb_sys_log` VALUES ('717', '61.52.173.244', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"菜单1\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"8\\\"}\"]', '61.52.173.244', '2020-08-30 07:03:45');
INSERT INTO `tb_sys_log` VALUES ('718', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:03:49');
INSERT INTO `tb_sys_log` VALUES ('719', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:03:50');
INSERT INTO `tb_sys_log` VALUES ('720', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:03:58');
INSERT INTO `tb_sys_log` VALUES ('721', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:04:20');
INSERT INTO `tb_sys_log` VALUES ('722', '61.52.173.244', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"默认菜单\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-30 07:04:28');
INSERT INTO `tb_sys_log` VALUES ('723', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:04:30');
INSERT INTO `tb_sys_log` VALUES ('724', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:04:33');
INSERT INTO `tb_sys_log` VALUES ('725', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:04:36');
INSERT INTO `tb_sys_log` VALUES ('726', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:04:38');
INSERT INTO `tb_sys_log` VALUES ('727', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:04:40');
INSERT INTO `tb_sys_log` VALUES ('728', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:04:43');
INSERT INTO `tb_sys_log` VALUES ('729', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"f5e53c1d-b67e-47ef-94dd-419201a3a094\"]', '61.52.173.244', '2020-08-30 07:04:43');
INSERT INTO `tb_sys_log` VALUES ('730', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:04:53');
INSERT INTO `tb_sys_log` VALUES ('731', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:05:09');
INSERT INTO `tb_sys_log` VALUES ('732', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:06:20');
INSERT INTO `tb_sys_log` VALUES ('733', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:06:28');
INSERT INTO `tb_sys_log` VALUES ('734', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:06:31');
INSERT INTO `tb_sys_log` VALUES ('735', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:06:38');
INSERT INTO `tb_sys_log` VALUES ('736', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:06:42');
INSERT INTO `tb_sys_log` VALUES ('737', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:06:55');
INSERT INTO `tb_sys_log` VALUES ('738', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:07:36');
INSERT INTO `tb_sys_log` VALUES ('739', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:07:37');
INSERT INTO `tb_sys_log` VALUES ('740', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:07:42');
INSERT INTO `tb_sys_log` VALUES ('741', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:08:42');
INSERT INTO `tb_sys_log` VALUES ('742', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:08:44');
INSERT INTO `tb_sys_log` VALUES ('743', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:08:46');
INSERT INTO `tb_sys_log` VALUES ('744', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:09:34');
INSERT INTO `tb_sys_log` VALUES ('745', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:09:35');
INSERT INTO `tb_sys_log` VALUES ('746', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:09:38');
INSERT INTO `tb_sys_log` VALUES ('747', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:09:41');
INSERT INTO `tb_sys_log` VALUES ('748', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:09:44');
INSERT INTO `tb_sys_log` VALUES ('749', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:09:59');
INSERT INTO `tb_sys_log` VALUES ('750', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:10:00');
INSERT INTO `tb_sys_log` VALUES ('751', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:10:01');
INSERT INTO `tb_sys_log` VALUES ('752', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:10:09');
INSERT INTO `tb_sys_log` VALUES ('753', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:10:41');
INSERT INTO `tb_sys_log` VALUES ('754', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:10:42');
INSERT INTO `tb_sys_log` VALUES ('755', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:11:13');
INSERT INTO `tb_sys_log` VALUES ('756', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:11:21');
INSERT INTO `tb_sys_log` VALUES ('757', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:11:28');
INSERT INTO `tb_sys_log` VALUES ('758', '61.52.173.244', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"菜单2 \\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"8\\\"}\"]', '61.52.173.244', '2020-08-30 07:11:34');
INSERT INTO `tb_sys_log` VALUES ('759', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:11:37');
INSERT INTO `tb_sys_log` VALUES ('760', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:11:38');
INSERT INTO `tb_sys_log` VALUES ('761', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:11:45');
INSERT INTO `tb_sys_log` VALUES ('762', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"a2577a7b-391b-4248-b8d8-b64261922afa\"]', '61.52.173.244', '2020-08-30 07:11:45');
INSERT INTO `tb_sys_log` VALUES ('763', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:11:49');
INSERT INTO `tb_sys_log` VALUES ('764', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"cef1be59-a031-4222-a1dc-af994407e630\"]', '61.52.173.244', '2020-08-30 07:11:49');
INSERT INTO `tb_sys_log` VALUES ('765', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:11:55');
INSERT INTO `tb_sys_log` VALUES ('766', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"a2577a7b-391b-4248-b8d8-b64261922afa\"]', '61.52.173.244', '2020-08-30 07:11:55');
INSERT INTO `tb_sys_log` VALUES ('767', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:12:53');
INSERT INTO `tb_sys_log` VALUES ('768', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:12:57');
INSERT INTO `tb_sys_log` VALUES ('769', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:13:00');
INSERT INTO `tb_sys_log` VALUES ('770', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"8\"]', '61.52.173.244', '2020-08-30 07:13:01');
INSERT INTO `tb_sys_log` VALUES ('771', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:14:19');
INSERT INTO `tb_sys_log` VALUES ('772', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:14:20');
INSERT INTO `tb_sys_log` VALUES ('773', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:14:30');
INSERT INTO `tb_sys_log` VALUES ('774', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"8\"]', '61.52.173.244', '2020-08-30 07:14:30');
INSERT INTO `tb_sys_log` VALUES ('775', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:14:47');
INSERT INTO `tb_sys_log` VALUES ('776', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:14:49');
INSERT INTO `tb_sys_log` VALUES ('777', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:14:54');
INSERT INTO `tb_sys_log` VALUES ('778', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"8\"]', '61.52.173.244', '2020-08-30 07:14:54');
INSERT INTO `tb_sys_log` VALUES ('779', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:16:01');
INSERT INTO `tb_sys_log` VALUES ('780', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:16:04');
INSERT INTO `tb_sys_log` VALUES ('781', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:16:14');
INSERT INTO `tb_sys_log` VALUES ('782', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"8\"]', '61.52.173.244', '2020-08-30 07:16:14');
INSERT INTO `tb_sys_log` VALUES ('783', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:16:52');
INSERT INTO `tb_sys_log` VALUES ('784', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:16:53');
INSERT INTO `tb_sys_log` VALUES ('785', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:16:56');
INSERT INTO `tb_sys_log` VALUES ('786', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"8\"]', '61.52.173.244', '2020-08-30 07:16:56');
INSERT INTO `tb_sys_log` VALUES ('787', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:17:36');
INSERT INTO `tb_sys_log` VALUES ('788', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"8\"]', '61.52.173.244', '2020-08-30 07:17:36');
INSERT INTO `tb_sys_log` VALUES ('789', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:17:51');
INSERT INTO `tb_sys_log` VALUES ('790', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:17:54');
INSERT INTO `tb_sys_log` VALUES ('791', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:17:57');
INSERT INTO `tb_sys_log` VALUES ('792', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"4f7f150f-0d47-474e-962b-94160bbd2453\"]', '61.52.173.244', '2020-08-30 07:17:58');
INSERT INTO `tb_sys_log` VALUES ('793', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:18:01');
INSERT INTO `tb_sys_log` VALUES ('794', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"4f7f150f-0d47-474e-962b-94160bbd2453\"]', '61.52.173.244', '2020-08-30 07:18:01');
INSERT INTO `tb_sys_log` VALUES ('795', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:18:06');
INSERT INTO `tb_sys_log` VALUES ('796', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"4f7f150f-0d47-474e-962b-94160bbd2453\"]', '61.52.173.244', '2020-08-30 07:18:06');
INSERT INTO `tb_sys_log` VALUES ('797', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:18:11');
INSERT INTO `tb_sys_log` VALUES ('798', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"cef1be59-a031-4222-a1dc-af994407e630\"]', '61.52.173.244', '2020-08-30 07:18:11');
INSERT INTO `tb_sys_log` VALUES ('799', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:18:14');
INSERT INTO `tb_sys_log` VALUES ('800', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"cef1be59-a031-4222-a1dc-af994407e630\"]', '61.52.173.244', '2020-08-30 07:18:14');
INSERT INTO `tb_sys_log` VALUES ('801', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:19:24');
INSERT INTO `tb_sys_log` VALUES ('802', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:19:28');
INSERT INTO `tb_sys_log` VALUES ('803', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:19:31');
INSERT INTO `tb_sys_log` VALUES ('804', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"4f7f150f-0d47-474e-962b-94160bbd2453\"]', '61.52.173.244', '2020-08-30 07:19:32');
INSERT INTO `tb_sys_log` VALUES ('805', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:19:35');
INSERT INTO `tb_sys_log` VALUES ('806', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"4f7f150f-0d47-474e-962b-94160bbd2453\"]', '61.52.173.244', '2020-08-30 07:19:35');
INSERT INTO `tb_sys_log` VALUES ('807', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:19:38');
INSERT INTO `tb_sys_log` VALUES ('808', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"4f7f150f-0d47-474e-962b-94160bbd2453\"]', '61.52.173.244', '2020-08-30 07:19:38');
INSERT INTO `tb_sys_log` VALUES ('809', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:19:42');
INSERT INTO `tb_sys_log` VALUES ('810', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"cef1be59-a031-4222-a1dc-af994407e630\"]', '61.52.173.244', '2020-08-30 07:19:42');
INSERT INTO `tb_sys_log` VALUES ('811', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:19:47');
INSERT INTO `tb_sys_log` VALUES ('812', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"5\"]', '61.52.173.244', '2020-08-30 07:19:48');
INSERT INTO `tb_sys_log` VALUES ('813', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:19:53');
INSERT INTO `tb_sys_log` VALUES ('814', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"45fbf212-6806-4ae7-b76a-f7cc3c5fd636\"]', '61.52.173.244', '2020-08-30 07:19:53');
INSERT INTO `tb_sys_log` VALUES ('815', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:19:57');
INSERT INTO `tb_sys_log` VALUES ('816', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"45fbf212-6806-4ae7-b76a-f7cc3c5fd636\"]', '61.52.173.244', '2020-08-30 07:19:57');
INSERT INTO `tb_sys_log` VALUES ('817', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:20:00');
INSERT INTO `tb_sys_log` VALUES ('818', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"f3b92c2a-d852-402a-ae09-8aa1ff240378\"]', '61.52.173.244', '2020-08-30 07:20:00');
INSERT INTO `tb_sys_log` VALUES ('819', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:20:05');
INSERT INTO `tb_sys_log` VALUES ('820', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:20:07');
INSERT INTO `tb_sys_log` VALUES ('821', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"7\"]', '61.52.173.244', '2020-08-30 07:20:07');
INSERT INTO `tb_sys_log` VALUES ('822', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:20:10');
INSERT INTO `tb_sys_log` VALUES ('823', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"9be7e808-ad21-49c2-8554-9f482e17b821\"]', '61.52.173.244', '2020-08-30 07:20:10');
INSERT INTO `tb_sys_log` VALUES ('824', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:20:12');
INSERT INTO `tb_sys_log` VALUES ('825', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"f0aa5a84-25af-476d-b25c-635f4d73b715\"]', '61.52.173.244', '2020-08-30 07:20:12');
INSERT INTO `tb_sys_log` VALUES ('826', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:20:16');
INSERT INTO `tb_sys_log` VALUES ('827', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"1\"]', '61.52.173.244', '2020-08-30 07:20:16');
INSERT INTO `tb_sys_log` VALUES ('828', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:20:20');
INSERT INTO `tb_sys_log` VALUES ('829', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:20:24');
INSERT INTO `tb_sys_log` VALUES ('830', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:20:26');
INSERT INTO `tb_sys_log` VALUES ('831', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"f0aa5a84-25af-476d-b25c-635f4d73b715\"]', '61.52.173.244', '2020-08-30 07:20:26');
INSERT INTO `tb_sys_log` VALUES ('832', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:20:36');
INSERT INTO `tb_sys_log` VALUES ('833', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:20:37');
INSERT INTO `tb_sys_log` VALUES ('834', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:21:03');
INSERT INTO `tb_sys_log` VALUES ('835', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:21:05');
INSERT INTO `tb_sys_log` VALUES ('836', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:21:28');
INSERT INTO `tb_sys_log` VALUES ('837', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:21:30');
INSERT INTO `tb_sys_log` VALUES ('838', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:21:40');
INSERT INTO `tb_sys_log` VALUES ('839', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"cef1be59-a031-4222-a1dc-af994407e630\"]', '61.52.173.244', '2020-08-30 07:21:40');
INSERT INTO `tb_sys_log` VALUES ('840', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:22:11');
INSERT INTO `tb_sys_log` VALUES ('841', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:22:17');
INSERT INTO `tb_sys_log` VALUES ('842', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"f0aa5a84-25af-476d-b25c-635f4d73b715\"]', '61.52.173.244', '2020-08-30 07:22:18');
INSERT INTO `tb_sys_log` VALUES ('843', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:22:58');
INSERT INTO `tb_sys_log` VALUES ('844', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:23:05');
INSERT INTO `tb_sys_log` VALUES ('845', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"a2577a7b-391b-4248-b8d8-b64261922afa\"]', '61.52.173.244', '2020-08-30 07:23:05');
INSERT INTO `tb_sys_log` VALUES ('846', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:23:21');
INSERT INTO `tb_sys_log` VALUES ('847', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:23:23');
INSERT INTO `tb_sys_log` VALUES ('848', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"f0aa5a84-25af-476d-b25c-635f4d73b715\"]', '61.52.173.244', '2020-08-30 07:23:23');
INSERT INTO `tb_sys_log` VALUES ('849', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:26:17');
INSERT INTO `tb_sys_log` VALUES ('850', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:26:21');
INSERT INTO `tb_sys_log` VALUES ('851', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"cef1be59-a031-4222-a1dc-af994407e630\"]', '61.52.173.244', '2020-08-30 07:26:21');
INSERT INTO `tb_sys_log` VALUES ('852', '61.52.173.244', '编辑菜单信息', 'doPostNewApplicationRoleInfo', null, '61.52.173.244', '2020-08-30 07:26:23');
INSERT INTO `tb_sys_log` VALUES ('853', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:26:27');
INSERT INTO `tb_sys_log` VALUES ('854', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:26:28');
INSERT INTO `tb_sys_log` VALUES ('855', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:26:33');
INSERT INTO `tb_sys_log` VALUES ('856', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"cef1be59-a031-4222-a1dc-af994407e630\"]', '61.52.173.244', '2020-08-30 07:26:33');
INSERT INTO `tb_sys_log` VALUES ('857', '61.52.173.244', '编辑菜单信息', 'doPostNewApplicationRoleInfo', null, '61.52.173.244', '2020-08-30 07:26:39');
INSERT INTO `tb_sys_log` VALUES ('858', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:26:42');
INSERT INTO `tb_sys_log` VALUES ('859', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:26:45');
INSERT INTO `tb_sys_log` VALUES ('860', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:26:48');
INSERT INTO `tb_sys_log` VALUES ('861', '61.52.173.244', '查询单个菜单信息', 'doGetAccount', '[\"a2577a7b-391b-4248-b8d8-b64261922afa\"]', '61.52.173.244', '2020-08-30 07:26:48');
INSERT INTO `tb_sys_log` VALUES ('862', '61.52.173.244', '编辑菜单信息', 'doPostNewApplicationRoleInfo', null, '61.52.173.244', '2020-08-30 07:26:51');
INSERT INTO `tb_sys_log` VALUES ('863', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:26:53');
INSERT INTO `tb_sys_log` VALUES ('864', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:26:56');
INSERT INTO `tb_sys_log` VALUES ('865', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:26:59');
INSERT INTO `tb_sys_log` VALUES ('866', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:27:00');
INSERT INTO `tb_sys_log` VALUES ('867', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:27:02');
INSERT INTO `tb_sys_log` VALUES ('868', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:27:06');
INSERT INTO `tb_sys_log` VALUES ('869', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 07:27:24');
INSERT INTO `tb_sys_log` VALUES ('870', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:29:22');
INSERT INTO `tb_sys_log` VALUES ('871', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:29:43');
INSERT INTO `tb_sys_log` VALUES ('872', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:29:45');
INSERT INTO `tb_sys_log` VALUES ('873', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:30:04');
INSERT INTO `tb_sys_log` VALUES ('874', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:30:05');
INSERT INTO `tb_sys_log` VALUES ('875', '61.52.173.244', '删除疾病信息', 'doDeleteDisease', '[\"cef1be59-a031-4222-a1dc-af994407e630\"]', '61.52.173.244', '2020-08-30 07:30:14');
INSERT INTO `tb_sys_log` VALUES ('876', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:30:38');
INSERT INTO `tb_sys_log` VALUES ('877', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:30:39');
INSERT INTO `tb_sys_log` VALUES ('878', '61.52.173.244', '删除菜单', 'doDeleteMenu', '[\"cef1be59-a031-4222-a1dc-af994407e630\"]', '61.52.173.244', '2020-08-30 07:30:43');
INSERT INTO `tb_sys_log` VALUES ('879', '61.52.173.244', '删除菜单', 'doDeleteMenu', '[\"a2577a7b-391b-4248-b8d8-b64261922afa\"]', '61.52.173.244', '2020-08-30 07:30:50');
INSERT INTO `tb_sys_log` VALUES ('880', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 07:30:53');
INSERT INTO `tb_sys_log` VALUES ('881', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 07:30:55');
INSERT INTO `tb_sys_log` VALUES ('882', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:33:26');
INSERT INTO `tb_sys_log` VALUES ('883', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 08:33:28');
INSERT INTO `tb_sys_log` VALUES ('884', '61.52.173.244', '删除菜单', 'doDeleteMenu', '[\"f3b92c2a-d852-402a-ae09-8aa1ff240378\"]', '61.52.173.244', '2020-08-30 08:33:35');
INSERT INTO `tb_sys_log` VALUES ('885', '61.52.173.244', '删除菜单', 'doDeleteMenu', '[\"45fbf212-6806-4ae7-b76a-f7cc3c5fd636\"]', '61.52.173.244', '2020-08-30 08:33:39');
INSERT INTO `tb_sys_log` VALUES ('886', '61.52.173.244', '删除菜单', 'doDeleteMenu', '[\"4f7f150f-0d47-474e-962b-94160bbd2453\"]', '61.52.173.244', '2020-08-30 08:33:42');
INSERT INTO `tb_sys_log` VALUES ('887', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 08:33:43');
INSERT INTO `tb_sys_log` VALUES ('888', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 08:33:46');
INSERT INTO `tb_sys_log` VALUES ('889', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-30 08:38:19');
INSERT INTO `tb_sys_log` VALUES ('890', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 08:38:37');
INSERT INTO `tb_sys_log` VALUES ('891', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 08:38:38');
INSERT INTO `tb_sys_log` VALUES ('892', '61.52.173.244', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"科室管理\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"\\\"}\"]', '61.52.173.244', '2020-08-30 08:38:53');
INSERT INTO `tb_sys_log` VALUES ('893', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:38:56');
INSERT INTO `tb_sys_log` VALUES ('894', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 08:38:57');
INSERT INTO `tb_sys_log` VALUES ('895', '61.52.173.244', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '61.52.173.244', '2020-08-30 08:39:07');
INSERT INTO `tb_sys_log` VALUES ('896', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 08:39:11');
INSERT INTO `tb_sys_log` VALUES ('897', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:43:45');
INSERT INTO `tb_sys_log` VALUES ('898', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:44:37');
INSERT INTO `tb_sys_log` VALUES ('899', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:44:44');
INSERT INTO `tb_sys_log` VALUES ('900', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:45:17');
INSERT INTO `tb_sys_log` VALUES ('901', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:45:46');
INSERT INTO `tb_sys_log` VALUES ('902', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:48:15');
INSERT INTO `tb_sys_log` VALUES ('903', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:48:36');
INSERT INTO `tb_sys_log` VALUES ('904', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:49:49');
INSERT INTO `tb_sys_log` VALUES ('905', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-30 08:50:01');
INSERT INTO `tb_sys_log` VALUES ('906', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:51:55');
INSERT INTO `tb_sys_log` VALUES ('907', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:52:16');
INSERT INTO `tb_sys_log` VALUES ('908', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:53:12');
INSERT INTO `tb_sys_log` VALUES ('909', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-30 08:53:15');
INSERT INTO `tb_sys_log` VALUES ('910', '61.52.173.244', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"8,5\"]', '61.52.173.244', '2020-08-30 08:53:26');
INSERT INTO `tb_sys_log` VALUES ('911', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:53:44');
INSERT INTO `tb_sys_log` VALUES ('912', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-30 08:53:47');
INSERT INTO `tb_sys_log` VALUES ('913', '61.52.173.244', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"8\"]', '61.52.173.244', '2020-08-30 08:53:50');
INSERT INTO `tb_sys_log` VALUES ('914', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-30 08:54:22');
INSERT INTO `tb_sys_log` VALUES ('915', '61.52.173.244', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"8\"]', '61.52.173.244', '2020-08-30 08:54:32');
INSERT INTO `tb_sys_log` VALUES ('916', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-30 08:54:33');
INSERT INTO `tb_sys_log` VALUES ('917', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-30 08:55:32');
INSERT INTO `tb_sys_log` VALUES ('918', '61.52.173.244', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"8,5\"]', '61.52.173.244', '2020-08-30 08:56:11');
INSERT INTO `tb_sys_log` VALUES ('919', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-30 08:56:13');
INSERT INTO `tb_sys_log` VALUES ('920', '61.52.173.244', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"5\"]', '61.52.173.244', '2020-08-30 08:56:15');
INSERT INTO `tb_sys_log` VALUES ('921', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '61.52.173.244', '2020-08-30 08:56:16');
INSERT INTO `tb_sys_log` VALUES ('922', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"2\"]', '61.52.173.244', '2020-08-30 08:56:19');
INSERT INTO `tb_sys_log` VALUES ('923', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\"]', '61.52.173.244', '2020-08-30 08:56:22');
INSERT INTO `tb_sys_log` VALUES ('924', '61.52.173.244', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\",\"8,5\"]', '61.52.173.244', '2020-08-30 08:56:24');
INSERT INTO `tb_sys_log` VALUES ('925', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\"]', '61.52.173.244', '2020-08-30 08:56:26');
INSERT INTO `tb_sys_log` VALUES ('926', '61.52.173.244', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\",\"8,5\"]', '61.52.173.244', '2020-08-30 08:56:28');
INSERT INTO `tb_sys_log` VALUES ('927', '61.52.173.244', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"5c3c82c0-8dba-420a-9e2f-c75765cc3d2b\"]', '61.52.173.244', '2020-08-30 08:56:30');
INSERT INTO `tb_sys_log` VALUES ('928', '61.52.173.244', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '61.52.173.244', '2020-08-30 08:57:29');
INSERT INTO `tb_sys_log` VALUES ('929', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 08:57:38');
INSERT INTO `tb_sys_log` VALUES ('930', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-30 09:18:59');
INSERT INTO `tb_sys_log` VALUES ('931', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 09:19:01');
INSERT INTO `tb_sys_log` VALUES ('932', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-30 09:19:02');
INSERT INTO `tb_sys_log` VALUES ('933', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-30 09:19:03');
INSERT INTO `tb_sys_log` VALUES ('934', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-30 09:19:04');
INSERT INTO `tb_sys_log` VALUES ('935', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:19:47');
INSERT INTO `tb_sys_log` VALUES ('936', '61.52.173.244', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '61.52.173.244', '2020-08-30 09:37:58');
INSERT INTO `tb_sys_log` VALUES ('937', '61.52.173.244', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '61.52.173.244', '2020-08-30 09:38:00');
INSERT INTO `tb_sys_log` VALUES ('938', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-30 09:38:01');
INSERT INTO `tb_sys_log` VALUES ('939', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-30 09:38:01');
INSERT INTO `tb_sys_log` VALUES ('940', '61.52.173.244', '查询所有的科室', 'doQueryDepartmentList', '[]', '61.52.173.244', '2020-08-30 09:38:03');
INSERT INTO `tb_sys_log` VALUES ('941', '61.52.173.244', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '61.52.173.244', '2020-08-30 09:38:03');
INSERT INTO `tb_sys_log` VALUES ('942', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:40:46');
INSERT INTO `tb_sys_log` VALUES ('943', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:41:03');
INSERT INTO `tb_sys_log` VALUES ('944', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:42:09');
INSERT INTO `tb_sys_log` VALUES ('945', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:42:14');
INSERT INTO `tb_sys_log` VALUES ('946', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:44:25');
INSERT INTO `tb_sys_log` VALUES ('947', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:45:55');
INSERT INTO `tb_sys_log` VALUES ('948', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:46:05');
INSERT INTO `tb_sys_log` VALUES ('949', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:46:38');
INSERT INTO `tb_sys_log` VALUES ('950', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 09:46:38');
INSERT INTO `tb_sys_log` VALUES ('951', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '61.52.173.244', '2020-08-30 09:48:37');
INSERT INTO `tb_sys_log` VALUES ('952', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:49:25');
INSERT INTO `tb_sys_log` VALUES ('953', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 09:49:25');
INSERT INTO `tb_sys_log` VALUES ('954', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:51:45');
INSERT INTO `tb_sys_log` VALUES ('955', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 09:51:45');
INSERT INTO `tb_sys_log` VALUES ('956', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:51:48');
INSERT INTO `tb_sys_log` VALUES ('957', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:57:42');
INSERT INTO `tb_sys_log` VALUES ('958', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 09:57:42');
INSERT INTO `tb_sys_log` VALUES ('959', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:57:44');
INSERT INTO `tb_sys_log` VALUES ('960', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:59:26');
INSERT INTO `tb_sys_log` VALUES ('961', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 09:59:26');
INSERT INTO `tb_sys_log` VALUES ('962', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 09:59:28');
INSERT INTO `tb_sys_log` VALUES ('963', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:00:13');
INSERT INTO `tb_sys_log` VALUES ('964', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:00:13');
INSERT INTO `tb_sys_log` VALUES ('965', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:00:19');
INSERT INTO `tb_sys_log` VALUES ('966', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:00:19');
INSERT INTO `tb_sys_log` VALUES ('967', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:00:21');
INSERT INTO `tb_sys_log` VALUES ('968', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:03:27');
INSERT INTO `tb_sys_log` VALUES ('969', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:03:27');
INSERT INTO `tb_sys_log` VALUES ('970', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:03:28');
INSERT INTO `tb_sys_log` VALUES ('971', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:04:01');
INSERT INTO `tb_sys_log` VALUES ('972', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:04:02');
INSERT INTO `tb_sys_log` VALUES ('973', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:04:03');
INSERT INTO `tb_sys_log` VALUES ('974', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:06:48');
INSERT INTO `tb_sys_log` VALUES ('975', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:06:49');
INSERT INTO `tb_sys_log` VALUES ('976', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:06:56');
INSERT INTO `tb_sys_log` VALUES ('977', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:10:43');
INSERT INTO `tb_sys_log` VALUES ('978', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:10:43');
INSERT INTO `tb_sys_log` VALUES ('979', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:10:54');
INSERT INTO `tb_sys_log` VALUES ('980', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:11:14');
INSERT INTO `tb_sys_log` VALUES ('981', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:11:15');
INSERT INTO `tb_sys_log` VALUES ('982', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:11:17');
INSERT INTO `tb_sys_log` VALUES ('983', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:11:46');
INSERT INTO `tb_sys_log` VALUES ('984', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:11:46');
INSERT INTO `tb_sys_log` VALUES ('985', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:11:47');
INSERT INTO `tb_sys_log` VALUES ('986', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:12:23');
INSERT INTO `tb_sys_log` VALUES ('987', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:12:23');
INSERT INTO `tb_sys_log` VALUES ('988', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:12:25');
INSERT INTO `tb_sys_log` VALUES ('989', '61.52.173.244', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '61.52.173.244', '2020-08-30 10:12:26');
INSERT INTO `tb_sys_log` VALUES ('990', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 10:12:27');
INSERT INTO `tb_sys_log` VALUES ('991', '61.52.173.244', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '61.52.173.244', '2020-08-30 12:52:41');
INSERT INTO `tb_sys_log` VALUES ('992', '127.0.0.1', '获取所有的角色', 'doQueryRoleList', '[]', '127.0.0.1', '2020-08-31 02:49:44');
INSERT INTO `tb_sys_log` VALUES ('993', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 02:50:11');
INSERT INTO `tb_sys_log` VALUES ('994', '127.0.0.1', '删除角色', 'doDeleteApplicationRole', '[\"5c3c82c0-8dba-420a-9e2f-c75765cc3d2b\"]', '127.0.0.1', '2020-08-31 02:51:16');
INSERT INTO `tb_sys_log` VALUES ('995', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 02:51:16');
INSERT INTO `tb_sys_log` VALUES ('996', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 02:53:27');
INSERT INTO `tb_sys_log` VALUES ('997', '127.0.0.1', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\"]', '127.0.0.1', '2020-08-31 02:54:28');
INSERT INTO `tb_sys_log` VALUES ('998', '127.0.0.1', '查询单个角色信息', 'doGetRole', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\"]', '127.0.0.1', '2020-08-31 02:54:35');
INSERT INTO `tb_sys_log` VALUES ('999', '127.0.0.1', '编辑角色信息', 'doPostNewApplicationRoleInfo', null, '127.0.0.1', '2020-08-31 02:54:41');
INSERT INTO `tb_sys_log` VALUES ('1000', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 02:54:41');
INSERT INTO `tb_sys_log` VALUES ('1001', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:00:17');
INSERT INTO `tb_sys_log` VALUES ('1002', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:00:19');
INSERT INTO `tb_sys_log` VALUES ('1003', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:00:58');
INSERT INTO `tb_sys_log` VALUES ('1004', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:01:05');
INSERT INTO `tb_sys_log` VALUES ('1005', '127.0.0.1', '查询单个角色信息', 'doGetRole', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\"]', '127.0.0.1', '2020-08-31 03:01:06');
INSERT INTO `tb_sys_log` VALUES ('1006', '127.0.0.1', '编辑角色信息', 'doPostNewApplicationRoleInfo', null, '127.0.0.1', '2020-08-31 03:01:10');
INSERT INTO `tb_sys_log` VALUES ('1007', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:01:10');
INSERT INTO `tb_sys_log` VALUES ('1008', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:01:59');
INSERT INTO `tb_sys_log` VALUES ('1009', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:04:26');
INSERT INTO `tb_sys_log` VALUES ('1010', '127.0.0.1', '查询单个角色信息', 'doGetRole', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\"]', '127.0.0.1', '2020-08-31 03:04:30');
INSERT INTO `tb_sys_log` VALUES ('1011', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:04:32');
INSERT INTO `tb_sys_log` VALUES ('1012', '127.0.0.1', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\"]', '127.0.0.1', '2020-08-31 03:04:33');
INSERT INTO `tb_sys_log` VALUES ('1013', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\",\"\"]', '127.0.0.1', '2020-08-31 03:04:36');
INSERT INTO `tb_sys_log` VALUES ('1014', '127.0.0.1', '删除角色', 'doDeleteApplicationRole', '[\"0ab43ddb-a0dd-4624-815c-27b0b7e93bfb\"]', '127.0.0.1', '2020-08-31 03:04:41');
INSERT INTO `tb_sys_log` VALUES ('1015', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:04:41');
INSERT INTO `tb_sys_log` VALUES ('1016', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:05:41');
INSERT INTO `tb_sys_log` VALUES ('1017', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:05:49');
INSERT INTO `tb_sys_log` VALUES ('1018', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 03:05:53');
INSERT INTO `tb_sys_log` VALUES ('1019', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 03:06:39');
INSERT INTO `tb_sys_log` VALUES ('1020', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:06:40');
INSERT INTO `tb_sys_log` VALUES ('1021', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:06:43');
INSERT INTO `tb_sys_log` VALUES ('1022', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:06:58');
INSERT INTO `tb_sys_log` VALUES ('1023', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 03:07:00');
INSERT INTO `tb_sys_log` VALUES ('1024', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:08:33');
INSERT INTO `tb_sys_log` VALUES ('1025', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 03:08:34');
INSERT INTO `tb_sys_log` VALUES ('1026', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:10:31');
INSERT INTO `tb_sys_log` VALUES ('1027', '127.0.0.1', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"测试\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"\\\"}\"]', '127.0.0.1', '2020-08-31 03:10:44');
INSERT INTO `tb_sys_log` VALUES ('1028', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 03:10:50');
INSERT INTO `tb_sys_log` VALUES ('1029', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:10:55');
INSERT INTO `tb_sys_log` VALUES ('1030', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 03:10:55');
INSERT INTO `tb_sys_log` VALUES ('1031', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:13:58');
INSERT INTO `tb_sys_log` VALUES ('1032', '127.0.0.1', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"测试2\\\",\\\"sort\\\":1,\\\"parentId\\\":null}\"]', '127.0.0.1', '2020-08-31 03:14:03');
INSERT INTO `tb_sys_log` VALUES ('1033', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 03:14:25');
INSERT INTO `tb_sys_log` VALUES ('1034', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-08-31 03:15:54');
INSERT INTO `tb_sys_log` VALUES ('1035', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:15:58');
INSERT INTO `tb_sys_log` VALUES ('1036', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:16:03');
INSERT INTO `tb_sys_log` VALUES ('1037', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:16:07');
INSERT INTO `tb_sys_log` VALUES ('1038', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '127.0.0.1', '2020-08-31 03:16:10');
INSERT INTO `tb_sys_log` VALUES ('1039', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:16:11');
INSERT INTO `tb_sys_log` VALUES ('1040', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '127.0.0.1', '2020-08-31 03:16:13');
INSERT INTO `tb_sys_log` VALUES ('1041', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"c6b3102b-d9c0-4ed4-976b-0d59f39154f6\"]', '127.0.0.1', '2020-08-31 03:16:16');
INSERT INTO `tb_sys_log` VALUES ('1042', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '127.0.0.1', '2020-08-31 03:16:17');
INSERT INTO `tb_sys_log` VALUES ('1043', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:16:24');
INSERT INTO `tb_sys_log` VALUES ('1044', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:16:24');
INSERT INTO `tb_sys_log` VALUES ('1045', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:16:26');
INSERT INTO `tb_sys_log` VALUES ('1046', '127.0.0.1', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"科室名称\\\",\\\"sort\\\":14,\\\"remark\\\":\\\"asdf啊\\\"}\"]', '127.0.0.1', '2020-08-31 03:16:46');
INSERT INTO `tb_sys_log` VALUES ('1047', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:16:47');
INSERT INTO `tb_sys_log` VALUES ('1048', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '127.0.0.1', '2020-08-31 03:16:49');
INSERT INTO `tb_sys_log` VALUES ('1049', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"f915117a-e707-4be9-b7dd-81e7971f8770\"]', '127.0.0.1', '2020-08-31 03:16:53');
INSERT INTO `tb_sys_log` VALUES ('1050', '127.0.0.1', '编辑科室', 'doPutAccountAllInfo', null, '127.0.0.1', '2020-08-31 03:16:56');
INSERT INTO `tb_sys_log` VALUES ('1051', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '127.0.0.1', '2020-08-31 03:16:56');
INSERT INTO `tb_sys_log` VALUES ('1052', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"d75b7772-4c8c-4afc-acb3-e83b4b070b5a\"]', '127.0.0.1', '2020-08-31 03:17:02');
INSERT INTO `tb_sys_log` VALUES ('1053', '127.0.0.1', '编辑科室', 'doPutAccountAllInfo', null, '127.0.0.1', '2020-08-31 03:17:05');
INSERT INTO `tb_sys_log` VALUES ('1054', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '127.0.0.1', '2020-08-31 03:17:06');
INSERT INTO `tb_sys_log` VALUES ('1055', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:17:32');
INSERT INTO `tb_sys_log` VALUES ('1056', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '127.0.0.1', '2020-08-31 03:17:41');
INSERT INTO `tb_sys_log` VALUES ('1057', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"f915117a-e707-4be9-b7dd-81e7971f8770\"]', '127.0.0.1', '2020-08-31 03:19:10');
INSERT INTO `tb_sys_log` VALUES ('1058', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",2]', '127.0.0.1', '2020-08-31 03:19:10');
INSERT INTO `tb_sys_log` VALUES ('1059', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:19:28');
INSERT INTO `tb_sys_log` VALUES ('1060', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"e7b7e12c-0571-4112-84ab-df3539a76cc9\"]', '127.0.0.1', '2020-08-31 03:19:32');
INSERT INTO `tb_sys_log` VALUES ('1061', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:19:32');
INSERT INTO `tb_sys_log` VALUES ('1062', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"d9567d46-3b1b-44a4-b9f9-61da4ee5a76d\"]', '127.0.0.1', '2020-08-31 03:19:41');
INSERT INTO `tb_sys_log` VALUES ('1063', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:19:41');
INSERT INTO `tb_sys_log` VALUES ('1064', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"bca0c80e-82ac-42a0-aff0-eee0c6750f0f\"]', '127.0.0.1', '2020-08-31 03:19:53');
INSERT INTO `tb_sys_log` VALUES ('1065', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:19:53');
INSERT INTO `tb_sys_log` VALUES ('1066', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"d75b7772-4c8c-4afc-acb3-e83b4b070b5a\"]', '127.0.0.1', '2020-08-31 03:19:55');
INSERT INTO `tb_sys_log` VALUES ('1067', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:19:56');
INSERT INTO `tb_sys_log` VALUES ('1068', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"37e86a32-e277-4a60-a91e-e263e06abd4e\"]', '127.0.0.1', '2020-08-31 03:19:58');
INSERT INTO `tb_sys_log` VALUES ('1069', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:19:58');
INSERT INTO `tb_sys_log` VALUES ('1070', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"f3a1cd0c-2207-47b3-855d-d17e51285459\"]', '127.0.0.1', '2020-08-31 03:20:01');
INSERT INTO `tb_sys_log` VALUES ('1071', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:20:01');
INSERT INTO `tb_sys_log` VALUES ('1072', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"a7525fbf-cf21-4e03-9911-f2d3e0282c92\"]', '127.0.0.1', '2020-08-31 03:20:04');
INSERT INTO `tb_sys_log` VALUES ('1073', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:20:04');
INSERT INTO `tb_sys_log` VALUES ('1074', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"aaf931b3-fc1d-4713-b908-984f704aeb75\"]', '127.0.0.1', '2020-08-31 03:20:06');
INSERT INTO `tb_sys_log` VALUES ('1075', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:20:06');
INSERT INTO `tb_sys_log` VALUES ('1076', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"d87a48e9-e9f0-4e93-9ba8-f24575e86081\"]', '127.0.0.1', '2020-08-31 03:20:10');
INSERT INTO `tb_sys_log` VALUES ('1077', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:20:10');
INSERT INTO `tb_sys_log` VALUES ('1078', '127.0.0.1', '删除科室信息', 'doDeleteDepartment', '[\"effbc3b2-f95e-49c1-a009-d71eca0ec432\"]', '127.0.0.1', '2020-08-31 03:20:12');
INSERT INTO `tb_sys_log` VALUES ('1079', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:20:12');
INSERT INTO `tb_sys_log` VALUES ('1080', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"1113\"]', '127.0.0.1', '2020-08-31 03:20:19');
INSERT INTO `tb_sys_log` VALUES ('1081', '127.0.0.1', '编辑科室', 'doPutAccountAllInfo', null, '127.0.0.1', '2020-08-31 03:20:26');
INSERT INTO `tb_sys_log` VALUES ('1082', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:20:27');
INSERT INTO `tb_sys_log` VALUES ('1083', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"1113\"]', '127.0.0.1', '2020-08-31 03:20:28');
INSERT INTO `tb_sys_log` VALUES ('1084', '127.0.0.1', '编辑科室', 'doPutAccountAllInfo', null, '127.0.0.1', '2020-08-31 03:20:32');
INSERT INTO `tb_sys_log` VALUES ('1085', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:20:32');
INSERT INTO `tb_sys_log` VALUES ('1086', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"1113\"]', '127.0.0.1', '2020-08-31 03:20:34');
INSERT INTO `tb_sys_log` VALUES ('1087', '127.0.0.1', '编辑科室', 'doPutAccountAllInfo', null, '127.0.0.1', '2020-08-31 03:20:36');
INSERT INTO `tb_sys_log` VALUES ('1088', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 03:20:37');
INSERT INTO `tb_sys_log` VALUES ('1089', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:20:59');
INSERT INTO `tb_sys_log` VALUES ('1090', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:20:59');
INSERT INTO `tb_sys_log` VALUES ('1091', '127.0.0.1', '删除疾病信息', 'doDeleteDisease', '[\"360a56dc-d82f-4094-8b4c-c533c9c6bd55\"]', '127.0.0.1', '2020-08-31 03:21:07');
INSERT INTO `tb_sys_log` VALUES ('1092', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:21:11');
INSERT INTO `tb_sys_log` VALUES ('1093', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '127.0.0.1', '2020-08-31 03:21:20');
INSERT INTO `tb_sys_log` VALUES ('1094', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1113\",\"\",1]', '127.0.0.1', '2020-08-31 03:21:23');
INSERT INTO `tb_sys_log` VALUES ('1095', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:21:24');
INSERT INTO `tb_sys_log` VALUES ('1096', '127.0.0.1', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"疾病没名次\\\",\\\"treatment\\\":\\\"阿斯顿发\\\",\\\"introduction\\\":\\\"阿斯顿发\\\",\\\"departmentId\\\":\\\"1111\\\",\\\"sort\\\":2,\\\"remark\\\":\\\"安生点\\\"}\"]', '127.0.0.1', '2020-08-31 03:21:53');
INSERT INTO `tb_sys_log` VALUES ('1097', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1113\",\"\",1]', '127.0.0.1', '2020-08-31 03:21:53');
INSERT INTO `tb_sys_log` VALUES ('1098', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '127.0.0.1', '2020-08-31 03:21:56');
INSERT INTO `tb_sys_log` VALUES ('1099', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1113\",\"\",1]', '127.0.0.1', '2020-08-31 03:21:58');
INSERT INTO `tb_sys_log` VALUES ('1100', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:22:00');
INSERT INTO `tb_sys_log` VALUES ('1101', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:22:03');
INSERT INTO `tb_sys_log` VALUES ('1102', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"346f2176-10f7-4410-93b8-d52f34819e2c\"]', '127.0.0.1', '2020-08-31 03:22:04');
INSERT INTO `tb_sys_log` VALUES ('1103', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"疾病没名次\",1]', '127.0.0.1', '2020-08-31 03:22:18');
INSERT INTO `tb_sys_log` VALUES ('1104', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:22:22');
INSERT INTO `tb_sys_log` VALUES ('1105', '127.0.0.1', '删除疾病信息', 'doDeleteDisease', '[\"346f2176-10f7-4410-93b8-d52f34819e2c\"]', '127.0.0.1', '2020-08-31 03:23:38');
INSERT INTO `tb_sys_log` VALUES ('1106', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:25:11');
INSERT INTO `tb_sys_log` VALUES ('1107', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:25:12');
INSERT INTO `tb_sys_log` VALUES ('1108', '127.0.0.1', '删除疾病信息', 'doDeleteDisease', '[\"95eac896-b561-42f8-87b3-df2d279b1ee2\"]', '127.0.0.1', '2020-08-31 03:25:15');
INSERT INTO `tb_sys_log` VALUES ('1109', '127.0.0.1', '删除疾病信息', 'doDeleteDisease', '[\"95eac896-b561-42f8-87b3-df2d279b1ee2\"]', '127.0.0.1', '2020-08-31 03:25:23');
INSERT INTO `tb_sys_log` VALUES ('1110', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:25:35');
INSERT INTO `tb_sys_log` VALUES ('1111', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:25:37');
INSERT INTO `tb_sys_log` VALUES ('1112', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '127.0.0.1', '2020-08-31 03:25:39');
INSERT INTO `tb_sys_log` VALUES ('1113', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1113\",\"\",1]', '127.0.0.1', '2020-08-31 03:25:42');
INSERT INTO `tb_sys_log` VALUES ('1114', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '127.0.0.1', '2020-08-31 03:25:44');
INSERT INTO `tb_sys_log` VALUES ('1115', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:25:46');
INSERT INTO `tb_sys_log` VALUES ('1116', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:25:47');
INSERT INTO `tb_sys_log` VALUES ('1117', '127.0.0.1', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"山东分公司\\\",\\\"treatment\\\":\\\"山东分公司\\\",\\\"introduction\\\":\\\"水电工\\\",\\\"departmentId\\\":\\\"1111\\\",\\\"sort\\\":0,\\\"remark\\\":\\\"稍等\\\"}\"]', '127.0.0.1', '2020-08-31 03:25:56');
INSERT INTO `tb_sys_log` VALUES ('1118', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:25:56');
INSERT INTO `tb_sys_log` VALUES ('1119', '127.0.0.1', '删除疾病信息', 'doDeleteDisease', '[\"f5a6b727-378a-4da9-930d-4e468fac97d4\"]', '127.0.0.1', '2020-08-31 03:26:01');
INSERT INTO `tb_sys_log` VALUES ('1120', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 03:26:20');
INSERT INTO `tb_sys_log` VALUES ('1121', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '127.0.0.1', '2020-08-31 03:26:25');
INSERT INTO `tb_sys_log` VALUES ('1122', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:26:31');
INSERT INTO `tb_sys_log` VALUES ('1123', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '127.0.0.1', '2020-08-31 03:26:31');
INSERT INTO `tb_sys_log` VALUES ('1124', '127.0.0.1', '编辑疾病', 'doPutAccountAllInfo', null, '127.0.0.1', '2020-08-31 03:26:36');
INSERT INTO `tb_sys_log` VALUES ('1125', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '127.0.0.1', '2020-08-31 03:26:37');
INSERT INTO `tb_sys_log` VALUES ('1126', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"修改为消化科\",1]', '127.0.0.1', '2020-08-31 03:26:49');
INSERT INTO `tb_sys_log` VALUES ('1127', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:29:21');
INSERT INTO `tb_sys_log` VALUES ('1128', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '127.0.0.1', '2020-08-31 03:29:21');
INSERT INTO `tb_sys_log` VALUES ('1129', '127.0.0.1', '编辑疾病', 'doPutAccountAllInfo', null, '127.0.0.1', '2020-08-31 03:29:26');
INSERT INTO `tb_sys_log` VALUES ('1130', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"修改为消化科\",1]', '127.0.0.1', '2020-08-31 03:29:26');
INSERT INTO `tb_sys_log` VALUES ('1131', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:29:28');
INSERT INTO `tb_sys_log` VALUES ('1132', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '127.0.0.1', '2020-08-31 03:29:29');
INSERT INTO `tb_sys_log` VALUES ('1133', '127.0.0.1', '编辑疾病', 'doPutAccountAllInfo', null, '127.0.0.1', '2020-08-31 03:29:35');
INSERT INTO `tb_sys_log` VALUES ('1134', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"修改为消化科\",1]', '127.0.0.1', '2020-08-31 03:29:36');
INSERT INTO `tb_sys_log` VALUES ('1135', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-08-31 03:29:50');
INSERT INTO `tb_sys_log` VALUES ('1136', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"毕洋强\"]', '127.0.0.1', '2020-08-31 03:31:35');
INSERT INTO `tb_sys_log` VALUES ('1137', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-08-31 03:31:42');
INSERT INTO `tb_sys_log` VALUES ('1138', '127.0.0.1', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"王大雷2\\\",\\\"postId\\\":\\\"412888199402021236\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"阿迪\\\"}\"]', '127.0.0.1', '2020-08-31 03:32:13');
INSERT INTO `tb_sys_log` VALUES ('1139', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-08-31 03:32:13');
INSERT INTO `tb_sys_log` VALUES ('1140', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 03:33:10');
INSERT INTO `tb_sys_log` VALUES ('1141', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:36:05');
INSERT INTO `tb_sys_log` VALUES ('1142', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:41:29');
INSERT INTO `tb_sys_log` VALUES ('1143', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:41:38');
INSERT INTO `tb_sys_log` VALUES ('1144', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 03:41:45');
INSERT INTO `tb_sys_log` VALUES ('1145', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-08-31 03:41:50');
INSERT INTO `tb_sys_log` VALUES ('1146', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 03:41:54');
INSERT INTO `tb_sys_log` VALUES ('1147', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 03:42:01');
INSERT INTO `tb_sys_log` VALUES ('1148', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 03:42:16');
INSERT INTO `tb_sys_log` VALUES ('1149', '127.0.0.1', '删除单个账户信息', 'doDeleteAccount', '[\"9281a21f-f2a5-4c79-a76f-b1c4a9e2b4d9\"]', '127.0.0.1', '2020-08-31 03:43:02');
INSERT INTO `tb_sys_log` VALUES ('1150', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 03:43:02');
INSERT INTO `tb_sys_log` VALUES ('1151', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 07:48:15');
INSERT INTO `tb_sys_log` VALUES ('1152', '127.0.0.1', '重置密码', 'doPutAccountAllInfo', '[\"6be54dc7-3ee8-4bba-803a-e0bd3a8ea381\"]', '127.0.0.1', '2020-08-31 07:57:59');
INSERT INTO `tb_sys_log` VALUES ('1153', '127.0.0.1', '重置密码', 'doPutAccountAllInfo', '[\"6be54dc7-3ee8-4bba-803a-e0bd3a8ea381\"]', '127.0.0.1', '2020-08-31 07:58:21');
INSERT INTO `tb_sys_log` VALUES ('1154', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 07:59:37');
INSERT INTO `tb_sys_log` VALUES ('1155', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 07:59:46');
INSERT INTO `tb_sys_log` VALUES ('1156', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 07:59:58');
INSERT INTO `tb_sys_log` VALUES ('1157', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:01:28');
INSERT INTO `tb_sys_log` VALUES ('1158', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:01:43');
INSERT INTO `tb_sys_log` VALUES ('1159', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:01:47');
INSERT INTO `tb_sys_log` VALUES ('1160', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:02:46');
INSERT INTO `tb_sys_log` VALUES ('1161', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:05:09');
INSERT INTO `tb_sys_log` VALUES ('1162', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:05:10');
INSERT INTO `tb_sys_log` VALUES ('1163', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:05:11');
INSERT INTO `tb_sys_log` VALUES ('1164', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:05:11');
INSERT INTO `tb_sys_log` VALUES ('1165', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:08:18');
INSERT INTO `tb_sys_log` VALUES ('1166', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 08:12:03');
INSERT INTO `tb_sys_log` VALUES ('1167', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 08:13:10');
INSERT INTO `tb_sys_log` VALUES ('1168', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 08:13:10');
INSERT INTO `tb_sys_log` VALUES ('1169', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '127.0.0.1', '2020-08-31 08:13:14');
INSERT INTO `tb_sys_log` VALUES ('1170', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1113\",\"\",1]', '127.0.0.1', '2020-08-31 08:13:16');
INSERT INTO `tb_sys_log` VALUES ('1171', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '127.0.0.1', '2020-08-31 08:13:21');
INSERT INTO `tb_sys_log` VALUES ('1172', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 08:13:23');
INSERT INTO `tb_sys_log` VALUES ('1173', '127.0.0.1', '查询单个账户信息', 'doGetAccount', '[\"ea35c93e-0032-4242-b4d3-381532c19841\"]', '127.0.0.1', '2020-08-31 08:13:23');
INSERT INTO `tb_sys_log` VALUES ('1174', '127.0.0.1', '编辑疾病', 'doPutAccountAllInfo', null, '127.0.0.1', '2020-08-31 08:13:30');
INSERT INTO `tb_sys_log` VALUES ('1175', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1112\",\"\",1]', '127.0.0.1', '2020-08-31 08:13:31');
INSERT INTO `tb_sys_log` VALUES ('1176', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:13:35');
INSERT INTO `tb_sys_log` VALUES ('1177', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 08:13:40');
INSERT INTO `tb_sys_log` VALUES ('1178', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 08:13:40');
INSERT INTO `tb_sys_log` VALUES ('1179', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:13:43');
INSERT INTO `tb_sys_log` VALUES ('1180', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:13:45');
INSERT INTO `tb_sys_log` VALUES ('1181', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:13:48');
INSERT INTO `tb_sys_log` VALUES ('1182', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:15:43');
INSERT INTO `tb_sys_log` VALUES ('1183', '127.0.0.1', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"sdfasd\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"\\\"}\"]', '127.0.0.1', '2020-08-31 08:16:44');
INSERT INTO `tb_sys_log` VALUES ('1184', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:17:20');
INSERT INTO `tb_sys_log` VALUES ('1185', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:17:23');
INSERT INTO `tb_sys_log` VALUES ('1186', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 08:17:26');
INSERT INTO `tb_sys_log` VALUES ('1187', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 08:17:26');
INSERT INTO `tb_sys_log` VALUES ('1188', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:17:27');
INSERT INTO `tb_sys_log` VALUES ('1189', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:17:28');
INSERT INTO `tb_sys_log` VALUES ('1190', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:17:31');
INSERT INTO `tb_sys_log` VALUES ('1191', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:17:37');
INSERT INTO `tb_sys_log` VALUES ('1192', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:17:44');
INSERT INTO `tb_sys_log` VALUES ('1193', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"90bd8474-0e10-4f61-9084-df37f441278f\"]', '127.0.0.1', '2020-08-31 08:17:44');
INSERT INTO `tb_sys_log` VALUES ('1194', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:17:47');
INSERT INTO `tb_sys_log` VALUES ('1195', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:17:50');
INSERT INTO `tb_sys_log` VALUES ('1196', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"1\"]', '127.0.0.1', '2020-08-31 08:17:50');
INSERT INTO `tb_sys_log` VALUES ('1197', '127.0.0.1', '编辑菜单信息', 'doPostNewApplicationRoleInfo', null, '127.0.0.1', '2020-08-31 08:17:54');
INSERT INTO `tb_sys_log` VALUES ('1198', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-08-31 08:22:03');
INSERT INTO `tb_sys_log` VALUES ('1199', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:22:08');
INSERT INTO `tb_sys_log` VALUES ('1200', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:22:10');
INSERT INTO `tb_sys_log` VALUES ('1201', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 08:22:11');
INSERT INTO `tb_sys_log` VALUES ('1202', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 08:22:12');
INSERT INTO `tb_sys_log` VALUES ('1203', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-31 08:22:13');
INSERT INTO `tb_sys_log` VALUES ('1204', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-08-31 08:22:14');
INSERT INTO `tb_sys_log` VALUES ('1205', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:22:15');
INSERT INTO `tb_sys_log` VALUES ('1206', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-08-31 08:22:16');
INSERT INTO `tb_sys_log` VALUES ('1207', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:25:39');
INSERT INTO `tb_sys_log` VALUES ('1208', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:25:41');
INSERT INTO `tb_sys_log` VALUES ('1209', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:25:49');
INSERT INTO `tb_sys_log` VALUES ('1210', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:26:41');
INSERT INTO `tb_sys_log` VALUES ('1211', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:26:46');
INSERT INTO `tb_sys_log` VALUES ('1212', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:26:47');
INSERT INTO `tb_sys_log` VALUES ('1213', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:26:48');
INSERT INTO `tb_sys_log` VALUES ('1214', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:26:49');
INSERT INTO `tb_sys_log` VALUES ('1215', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:26:50');
INSERT INTO `tb_sys_log` VALUES ('1216', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:26:52');
INSERT INTO `tb_sys_log` VALUES ('1217', '127.0.0.1', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"新增用户\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"1\\\"}\"]', '127.0.0.1', '2020-08-31 08:27:08');
INSERT INTO `tb_sys_log` VALUES ('1218', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:27:19');
INSERT INTO `tb_sys_log` VALUES ('1219', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:27:24');
INSERT INTO `tb_sys_log` VALUES ('1220', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:27:25');
INSERT INTO `tb_sys_log` VALUES ('1221', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:27:41');
INSERT INTO `tb_sys_log` VALUES ('1222', '127.0.0.1', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"测试诊断\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"8\\\"}\"]', '127.0.0.1', '2020-08-31 08:27:52');
INSERT INTO `tb_sys_log` VALUES ('1223', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:29:09');
INSERT INTO `tb_sys_log` VALUES ('1224', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:29:17');
INSERT INTO `tb_sys_log` VALUES ('1225', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:29:18');
INSERT INTO `tb_sys_log` VALUES ('1226', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"097f2572-3d03-4cf3-b06f-4f356a9da69d\"]', '127.0.0.1', '2020-08-31 08:29:19');
INSERT INTO `tb_sys_log` VALUES ('1227', '127.0.0.1', '编辑菜单信息', 'doPostNewApplicationRoleInfo', null, '127.0.0.1', '2020-08-31 08:29:26');
INSERT INTO `tb_sys_log` VALUES ('1228', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:29:30');
INSERT INTO `tb_sys_log` VALUES ('1229', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:29:37');
INSERT INTO `tb_sys_log` VALUES ('1230', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:29:42');
INSERT INTO `tb_sys_log` VALUES ('1231', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:29:50');
INSERT INTO `tb_sys_log` VALUES ('1232', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:29:52');
INSERT INTO `tb_sys_log` VALUES ('1233', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:29:55');
INSERT INTO `tb_sys_log` VALUES ('1234', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:29:59');
INSERT INTO `tb_sys_log` VALUES ('1235', '127.0.0.1', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"测asdfasdf\\\",\\\"sort\\\":1,\\\"parentId\\\":\\\"097f2572-3d03-4cf3-b06f-4f356a9da69d\\\"}\"]', '127.0.0.1', '2020-08-31 08:30:04');
INSERT INTO `tb_sys_log` VALUES ('1236', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:30:08');
INSERT INTO `tb_sys_log` VALUES ('1237', '127.0.0.1', '删除菜单', 'doDeleteMenu', '[\"c4774b95-bbe7-4f3f-8d87-4e31ee6d7fb9\"]', '127.0.0.1', '2020-08-31 08:30:18');
INSERT INTO `tb_sys_log` VALUES ('1238', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:31:08');
INSERT INTO `tb_sys_log` VALUES ('1239', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:31:15');
INSERT INTO `tb_sys_log` VALUES ('1240', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:31:23');
INSERT INTO `tb_sys_log` VALUES ('1241', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"2\"]', '127.0.0.1', '2020-08-31 08:31:23');
INSERT INTO `tb_sys_log` VALUES ('1242', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:31:27');
INSERT INTO `tb_sys_log` VALUES ('1243', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"4\"]', '127.0.0.1', '2020-08-31 08:31:27');
INSERT INTO `tb_sys_log` VALUES ('1244', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:31:34');
INSERT INTO `tb_sys_log` VALUES ('1245', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"7\"]', '127.0.0.1', '2020-08-31 08:31:34');
INSERT INTO `tb_sys_log` VALUES ('1246', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:31:37');
INSERT INTO `tb_sys_log` VALUES ('1247', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"097f2572-3d03-4cf3-b06f-4f356a9da69d\"]', '127.0.0.1', '2020-08-31 08:31:37');
INSERT INTO `tb_sys_log` VALUES ('1248', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:31:40');
INSERT INTO `tb_sys_log` VALUES ('1249', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"5\"]', '127.0.0.1', '2020-08-31 08:31:40');
INSERT INTO `tb_sys_log` VALUES ('1250', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:31:48');
INSERT INTO `tb_sys_log` VALUES ('1251', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:31:50');
INSERT INTO `tb_sys_log` VALUES ('1252', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:31:55');
INSERT INTO `tb_sys_log` VALUES ('1253', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:31:57');
INSERT INTO `tb_sys_log` VALUES ('1254', '127.0.0.1', '查询单个菜单信息', 'doGetAccount', '[\"3\"]', '127.0.0.1', '2020-08-31 08:31:57');
INSERT INTO `tb_sys_log` VALUES ('1255', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:32:09');
INSERT INTO `tb_sys_log` VALUES ('1256', '127.0.0.1', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"asdf\\\",\\\"sort\\\":2,\\\"parentId\\\":\\\"\\\"}\"]', '127.0.0.1', '2020-08-31 08:32:13');
INSERT INTO `tb_sys_log` VALUES ('1257', '127.0.0.1', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '127.0.0.1', '2020-08-31 08:33:55');
INSERT INTO `tb_sys_log` VALUES ('1258', '127.0.0.1', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"2\"]', '127.0.0.1', '2020-08-31 08:34:04');
INSERT INTO `tb_sys_log` VALUES ('1259', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"2\",\"2,3,4,5,097f2572-3d03-4cf3-b06f-4f356a9da69d,8,8a1fb2d7-dafe-43d2-b063-6103a9599e88,1\"]', '127.0.0.1', '2020-08-31 08:34:11');
INSERT INTO `tb_sys_log` VALUES ('1260', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:34:43');
INSERT INTO `tb_sys_log` VALUES ('1261', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-08-31 08:34:45');
INSERT INTO `tb_sys_log` VALUES ('1262', '127.0.0.1', '新增菜单信息', 'doPostNewApplicationResource', '[\"{\\\"name\\\":\\\"asdf阿斯顿发\\\",\\\"sort\\\":1,\\\"parentId\\\":null}\"]', '127.0.0.1', '2020-08-31 08:34:49');
INSERT INTO `tb_sys_log` VALUES ('1263', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:36:40');
INSERT INTO `tb_sys_log` VALUES ('1264', '127.0.0.1', '删除菜单', 'doDeleteMenu', '[\"8d936d5c-ce84-4938-9e59-92e8971be1f7\"]', '127.0.0.1', '2020-08-31 08:36:44');
INSERT INTO `tb_sys_log` VALUES ('1265', '127.0.0.1', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '127.0.0.1', '2020-08-31 08:36:52');
INSERT INTO `tb_sys_log` VALUES ('1266', '127.0.0.1', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"5,097f2572-3d03-4cf3-b06f-4f356a9da69d,8,8a1fb2d7-dafe-43d2-b063-6103a9599e88\"]', '127.0.0.1', '2020-08-31 08:37:08');
INSERT INTO `tb_sys_log` VALUES ('1267', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:37:11');
INSERT INTO `tb_sys_log` VALUES ('1268', '127.0.0.1', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '127.0.0.1', '2020-08-31 08:37:12');
INSERT INTO `tb_sys_log` VALUES ('1269', '127.0.0.1', '删除菜单', 'doDeleteMenu', '[\"097f2572-3d03-4cf3-b06f-4f356a9da69d\"]', '127.0.0.1', '2020-08-31 08:37:16');
INSERT INTO `tb_sys_log` VALUES ('1270', '127.0.0.1', '删除菜单', 'doDeleteMenu', '[\"8a1fb2d7-dafe-43d2-b063-6103a9599e88\"]', '127.0.0.1', '2020-08-31 08:37:19');
INSERT INTO `tb_sys_log` VALUES ('1271', '127.0.0.1', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\"]', '127.0.0.1', '2020-08-31 08:37:25');
INSERT INTO `tb_sys_log` VALUES ('1272', '127.0.0.1', '退出平台', 'loginout', '[]', '127.0.0.1', '2020-08-31 08:38:21');
INSERT INTO `tb_sys_log` VALUES ('1273', '127.0.0.1', '获取所有的角色', 'doQueryRoleList', '[]', '127.0.0.1', '2020-08-31 08:38:21');
INSERT INTO `tb_sys_log` VALUES ('1274', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-08-31 08:38:40');
INSERT INTO `tb_sys_log` VALUES ('1275', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-08-31 08:38:41');
INSERT INTO `tb_sys_log` VALUES ('1276', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:38:46');
INSERT INTO `tb_sys_log` VALUES ('1277', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-08-31 08:38:48');
INSERT INTO `tb_sys_log` VALUES ('1278', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 08:38:50');
INSERT INTO `tb_sys_log` VALUES ('1279', '127.0.0.1', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '127.0.0.1', '2020-08-31 08:38:50');
INSERT INTO `tb_sys_log` VALUES ('1280', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-31 08:38:53');
INSERT INTO `tb_sys_log` VALUES ('1281', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-08-31 08:38:53');
INSERT INTO `tb_sys_log` VALUES ('1282', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-31 08:39:00');
INSERT INTO `tb_sys_log` VALUES ('1283', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-08-31 08:39:00');
INSERT INTO `tb_sys_log` VALUES ('1284', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '127.0.0.1', '2020-08-31 08:39:03');
INSERT INTO `tb_sys_log` VALUES ('1285', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[2,\"\",0,10]', '127.0.0.1', '2020-08-31 08:39:05');
INSERT INTO `tb_sys_log` VALUES ('1286', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-08-31 08:39:07');
INSERT INTO `tb_sys_log` VALUES ('1287', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-31 08:39:08');
INSERT INTO `tb_sys_log` VALUES ('1288', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-31 08:39:21');
INSERT INTO `tb_sys_log` VALUES ('1289', '127.0.0.1', '新增特征信息', 'doPostNewExtendAttribute', null, '127.0.0.1', '2020-08-31 08:45:10');
INSERT INTO `tb_sys_log` VALUES ('1290', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-08-31 08:45:47');
INSERT INTO `tb_sys_log` VALUES ('1291', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-08-31 08:45:52');
INSERT INTO `tb_sys_log` VALUES ('1292', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-31 08:46:38');
INSERT INTO `tb_sys_log` VALUES ('1293', '127.0.0.1', '新增特征信息', 'doPostNewExtendAttribute', null, '127.0.0.1', '2020-08-31 08:47:04');
INSERT INTO `tb_sys_log` VALUES ('1294', '127.0.0.1', '新增特征信息', 'doPostNewExtendAttribute', null, '127.0.0.1', '2020-08-31 08:48:16');
INSERT INTO `tb_sys_log` VALUES ('1295', '127.0.0.1', '新增特征信息', 'doPostNewExtendAttribute', null, '127.0.0.1', '2020-08-31 08:49:39');
INSERT INTO `tb_sys_log` VALUES ('1296', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-08-31 08:50:13');
INSERT INTO `tb_sys_log` VALUES ('1297', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '127.0.0.1', '2020-08-31 08:50:22');
INSERT INTO `tb_sys_log` VALUES ('1298', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[2,\"\",0,10]', '127.0.0.1', '2020-08-31 08:50:24');
INSERT INTO `tb_sys_log` VALUES ('1299', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-08-31 08:52:36');
INSERT INTO `tb_sys_log` VALUES ('1300', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-31 08:54:58');
INSERT INTO `tb_sys_log` VALUES ('1301', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '127.0.0.1', '2020-08-31 08:54:59');
INSERT INTO `tb_sys_log` VALUES ('1302', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-08-31 08:55:00');
INSERT INTO `tb_sys_log` VALUES ('1303', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '127.0.0.1', '2020-08-31 08:55:02');
INSERT INTO `tb_sys_log` VALUES ('1304', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[2,\"\",0,10]', '127.0.0.1', '2020-08-31 08:55:04');
INSERT INTO `tb_sys_log` VALUES ('1305', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '127.0.0.1', '2020-08-31 08:55:07');
INSERT INTO `tb_sys_log` VALUES ('1306', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"测试名称\",0,20]', '127.0.0.1', '2020-08-31 08:55:44');
INSERT INTO `tb_sys_log` VALUES ('1307', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"测试\",0,20]', '127.0.0.1', '2020-08-31 08:55:51');
INSERT INTO `tb_sys_log` VALUES ('1308', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-08-31 08:55:57');
INSERT INTO `tb_sys_log` VALUES ('1309', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-08-31 08:56:02');
INSERT INTO `tb_sys_log` VALUES ('1310', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-08-31 08:56:25');
INSERT INTO `tb_sys_log` VALUES ('1311', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-08-31 08:56:29');
INSERT INTO `tb_sys_log` VALUES ('1312', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-08-31 08:56:30');
INSERT INTO `tb_sys_log` VALUES ('1313', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-08-31 08:56:36');
INSERT INTO `tb_sys_log` VALUES ('1314', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[1,null,0,20]', '127.0.0.1', '2020-08-31 08:57:27');
INSERT INTO `tb_sys_log` VALUES ('1315', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-08-31 08:57:46');
INSERT INTO `tb_sys_log` VALUES ('1316', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-08-31 08:57:59');
INSERT INTO `tb_sys_log` VALUES ('1317', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '127.0.0.1', '2020-08-31 08:58:06');
INSERT INTO `tb_sys_log` VALUES ('1318', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[2,\"\",0,10]', '127.0.0.1', '2020-08-31 08:58:08');
INSERT INTO `tb_sys_log` VALUES ('1319', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-08-31 09:00:31');
INSERT INTO `tb_sys_log` VALUES ('1320', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"测dfd试\",0,20]', '127.0.0.1', '2020-08-31 09:00:45');
INSERT INTO `tb_sys_log` VALUES ('1321', '127.0.0.1', '启用/禁用特征', 'doPutExtendAttributeState', '[\"3036b13e-2522-4240-ac48-75d2ff51c2ad\",0]', '127.0.0.1', '2020-08-31 09:03:36');
INSERT INTO `tb_sys_log` VALUES ('1322', '127.0.0.1', '启用/禁用特征', 'doPutExtendAttributeState', '[\"3036b13e-2522-4240-ac48-75d2ff51c2ad\",1]', '127.0.0.1', '2020-08-31 09:04:15');
INSERT INTO `tb_sys_log` VALUES ('1323', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-31 11:03:22');
INSERT INTO `tb_sys_log` VALUES ('1324', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"0\",\"123456\"]', '127.0.0.1', '2020-08-31 11:03:38');
INSERT INTO `tb_sys_log` VALUES ('1325', '127.0.0.1', '退出平台', 'loginout', '[]', '127.0.0.1', '2020-08-31 11:04:06');
INSERT INTO `tb_sys_log` VALUES ('1326', '127.0.0.1', '获取所有的角色', 'doQueryRoleList', '[]', '127.0.0.1', '2020-08-31 11:04:07');
INSERT INTO `tb_sys_log` VALUES ('1327', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-08-31 11:04:08');
INSERT INTO `tb_sys_log` VALUES ('1328', '127.0.0.1', '注册账户', 'doPostNewUserInfo', '[\"{\\\"userName\\\":\\\"BEE\\\",\\\"password\\\":\\\"123456\\\",\\\"email\\\":\\\"123456789@qq.com\\\",\\\"phone\\\":\\\"15938917805\\\",\\\"departmentId\\\":\\\"1111\\\"}\"]', '127.0.0.1', '2020-08-31 11:04:47');
INSERT INTO `tb_sys_log` VALUES ('1329', 'BEE', '登录平台', 'doPostNewApplicationResource', '[\"BEE\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-31 11:05:10');
INSERT INTO `tb_sys_log` VALUES ('1330', 'BEE', '登录平台', 'doPostNewApplicationResource', '[\"BEE\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-31 11:11:40');
INSERT INTO `tb_sys_log` VALUES ('1331', 'BEE', '登录平台', 'doPostNewApplicationResource', '[\"BEE\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-31 11:12:18');
INSERT INTO `tb_sys_log` VALUES ('1332', 'BEE', '登录平台', 'doPostNewApplicationResource', '[\"BEE\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-31 11:12:22');
INSERT INTO `tb_sys_log` VALUES ('1333', 'BEE', '登录平台', 'doPostNewApplicationResource', '[\"BEE\",\"1\",\"123456\"]', '127.0.0.1', '2020-08-31 11:12:34');
INSERT INTO `tb_sys_log` VALUES ('1334', '223.88.82.229', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.229', '2020-08-31 11:22:05');
INSERT INTO `tb_sys_log` VALUES ('1335', '223.88.82.229', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"123456\"]', '223.88.82.229', '2020-08-31 11:22:28');
INSERT INTO `tb_sys_log` VALUES ('1336', '223.88.82.229', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.229', '2020-08-31 11:22:35');
INSERT INTO `tb_sys_log` VALUES ('1337', '223.88.82.229', '登录平台', 'doPostNewApplicationResource', '[\"BEE\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"123456\"]', '223.88.82.229', '2020-08-31 11:23:24');
INSERT INTO `tb_sys_log` VALUES ('1338', '223.88.82.229', '登录平台', 'doPostNewApplicationResource', '[\"BEE\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"123456\"]', '223.88.82.229', '2020-08-31 11:23:25');
INSERT INTO `tb_sys_log` VALUES ('1339', '223.88.82.229', '登录平台', 'doPostNewApplicationResource', '[\"BEE\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"123456\"]', '223.88.82.229', '2020-08-31 11:23:25');
INSERT INTO `tb_sys_log` VALUES ('1340', '223.88.82.229', '登录平台', 'doPostNewApplicationResource', '[\"BEE\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"123456\"]', '223.88.82.229', '2020-08-31 11:23:26');
INSERT INTO `tb_sys_log` VALUES ('1341', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '223.88.82.229', '2020-08-31 11:24:46');
INSERT INTO `tb_sys_log` VALUES ('1342', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:13');
INSERT INTO `tb_sys_log` VALUES ('1343', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:17');
INSERT INTO `tb_sys_log` VALUES ('1344', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:17');
INSERT INTO `tb_sys_log` VALUES ('1345', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1346', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1347', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1348', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1349', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1350', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1351', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1352', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1353', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1354', 'YWJ', '获取账户列表', 'doQueryAccountList', '[]', '223.88.82.229', '2020-08-31 11:25:18');
INSERT INTO `tb_sys_log` VALUES ('1355', '89.248.168.138', '获取所有的角色', 'doQueryRoleList', '[]', '89.248.168.138', '2020-09-01 10:08:57');
INSERT INTO `tb_sys_log` VALUES ('1356', '219.155.33.248', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.33.248', '2020-09-02 13:22:54');
INSERT INTO `tb_sys_log` VALUES ('1357', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:24:52');
INSERT INTO `tb_sys_log` VALUES ('1358', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:24:52');
INSERT INTO `tb_sys_log` VALUES ('1359', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:24:54');
INSERT INTO `tb_sys_log` VALUES ('1360', '219.155.33.248', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.33.248', '2020-09-02 13:25:09');
INSERT INTO `tb_sys_log` VALUES ('1361', '219.155.33.248', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.33.248', '2020-09-02 13:25:41');
INSERT INTO `tb_sys_log` VALUES ('1362', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:26:00');
INSERT INTO `tb_sys_log` VALUES ('1363', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:26:00');
INSERT INTO `tb_sys_log` VALUES ('1364', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:28:15');
INSERT INTO `tb_sys_log` VALUES ('1365', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:28:15');
INSERT INTO `tb_sys_log` VALUES ('1366', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:28:44');
INSERT INTO `tb_sys_log` VALUES ('1367', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:28:44');
INSERT INTO `tb_sys_log` VALUES ('1368', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:29:15');
INSERT INTO `tb_sys_log` VALUES ('1369', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:29:15');
INSERT INTO `tb_sys_log` VALUES ('1370', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:29:39');
INSERT INTO `tb_sys_log` VALUES ('1371', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:29:39');
INSERT INTO `tb_sys_log` VALUES ('1372', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:30:10');
INSERT INTO `tb_sys_log` VALUES ('1373', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:30:10');
INSERT INTO `tb_sys_log` VALUES ('1374', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:30:19');
INSERT INTO `tb_sys_log` VALUES ('1375', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:30:19');
INSERT INTO `tb_sys_log` VALUES ('1376', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:30:28');
INSERT INTO `tb_sys_log` VALUES ('1377', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:30:28');
INSERT INTO `tb_sys_log` VALUES ('1378', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:33:30');
INSERT INTO `tb_sys_log` VALUES ('1379', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:33:30');
INSERT INTO `tb_sys_log` VALUES ('1380', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:34:30');
INSERT INTO `tb_sys_log` VALUES ('1381', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:34:30');
INSERT INTO `tb_sys_log` VALUES ('1382', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:34:36');
INSERT INTO `tb_sys_log` VALUES ('1383', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:34:36');
INSERT INTO `tb_sys_log` VALUES ('1384', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:35:13');
INSERT INTO `tb_sys_log` VALUES ('1385', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:35:13');
INSERT INTO `tb_sys_log` VALUES ('1386', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:35:59');
INSERT INTO `tb_sys_log` VALUES ('1387', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:36:00');
INSERT INTO `tb_sys_log` VALUES ('1388', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:38:01');
INSERT INTO `tb_sys_log` VALUES ('1389', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:38:01');
INSERT INTO `tb_sys_log` VALUES ('1390', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:38:14');
INSERT INTO `tb_sys_log` VALUES ('1391', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[2,\"\",0,10]', '219.155.33.248', '2020-09-02 13:38:18');
INSERT INTO `tb_sys_log` VALUES ('1392', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.33.248', '2020-09-02 13:38:20');
INSERT INTO `tb_sys_log` VALUES ('1393', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:40:06');
INSERT INTO `tb_sys_log` VALUES ('1394', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:40:07');
INSERT INTO `tb_sys_log` VALUES ('1395', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:40:10');
INSERT INTO `tb_sys_log` VALUES ('1396', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:40:11');
INSERT INTO `tb_sys_log` VALUES ('1397', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:40:40');
INSERT INTO `tb_sys_log` VALUES ('1398', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:40:41');
INSERT INTO `tb_sys_log` VALUES ('1399', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:40:48');
INSERT INTO `tb_sys_log` VALUES ('1400', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:40:48');
INSERT INTO `tb_sys_log` VALUES ('1401', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"名称\",0,10]', '219.155.33.248', '2020-09-02 13:43:22');
INSERT INTO `tb_sys_log` VALUES ('1402', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:43:24');
INSERT INTO `tb_sys_log` VALUES ('1403', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:47:52');
INSERT INTO `tb_sys_log` VALUES ('1404', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:47:52');
INSERT INTO `tb_sys_log` VALUES ('1405', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:48:33');
INSERT INTO `tb_sys_log` VALUES ('1406', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:48:33');
INSERT INTO `tb_sys_log` VALUES ('1407', '219.155.33.248', '启用/禁用特征', 'doPutExtendAttributeState', '[\"70dadc49-8e12-4eec-b897-fc52ebed337a\",0]', '219.155.33.248', '2020-09-02 13:48:35');
INSERT INTO `tb_sys_log` VALUES ('1408', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:48:57');
INSERT INTO `tb_sys_log` VALUES ('1409', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:48:57');
INSERT INTO `tb_sys_log` VALUES ('1410', '219.155.33.248', '启用/禁用特征', 'doPutExtendAttributeState', '[\"70dadc49-8e12-4eec-b897-fc52ebed337a\",1]', '219.155.33.248', '2020-09-02 13:48:59');
INSERT INTO `tb_sys_log` VALUES ('1411', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:49:08');
INSERT INTO `tb_sys_log` VALUES ('1412', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:50:15');
INSERT INTO `tb_sys_log` VALUES ('1413', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:50:16');
INSERT INTO `tb_sys_log` VALUES ('1414', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:53:21');
INSERT INTO `tb_sys_log` VALUES ('1415', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:53:21');
INSERT INTO `tb_sys_log` VALUES ('1416', '219.155.33.248', '删除特征属性', 'doDeleteExtendAttribute', '[\"3036b13e-2522-4240-ac48-75d2ff51c2ad\"]', '219.155.33.248', '2020-09-02 13:53:26');
INSERT INTO `tb_sys_log` VALUES ('1417', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:53:26');
INSERT INTO `tb_sys_log` VALUES ('1418', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:53:26');
INSERT INTO `tb_sys_log` VALUES ('1419', '219.155.33.248', '删除特征属性', 'doDeleteExtendAttribute', '[\"70dadc49-8e12-4eec-b897-fc52ebed337a\"]', '219.155.33.248', '2020-09-02 13:53:30');
INSERT INTO `tb_sys_log` VALUES ('1420', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:53:30');
INSERT INTO `tb_sys_log` VALUES ('1421', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:53:30');
INSERT INTO `tb_sys_log` VALUES ('1422', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:57:23');
INSERT INTO `tb_sys_log` VALUES ('1423', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:57:23');
INSERT INTO `tb_sys_log` VALUES ('1424', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:57:26');
INSERT INTO `tb_sys_log` VALUES ('1425', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:57:27');
INSERT INTO `tb_sys_log` VALUES ('1426', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:58:01');
INSERT INTO `tb_sys_log` VALUES ('1427', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:58:26');
INSERT INTO `tb_sys_log` VALUES ('1428', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 13:58:27');
INSERT INTO `tb_sys_log` VALUES ('1429', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 13:58:40');
INSERT INTO `tb_sys_log` VALUES ('1430', '219.155.33.248', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.33.248', '2020-09-02 13:58:49');
INSERT INTO `tb_sys_log` VALUES ('1431', '219.155.33.248', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.33.248', '2020-09-02 14:41:11');
INSERT INTO `tb_sys_log` VALUES ('1432', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:41:35');
INSERT INTO `tb_sys_log` VALUES ('1433', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 14:41:36');
INSERT INTO `tb_sys_log` VALUES ('1434', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:41:39');
INSERT INTO `tb_sys_log` VALUES ('1435', '219.155.33.248', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.33.248', '2020-09-02 14:41:43');
INSERT INTO `tb_sys_log` VALUES ('1436', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:42:18');
INSERT INTO `tb_sys_log` VALUES ('1437', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 14:42:19');
INSERT INTO `tb_sys_log` VALUES ('1438', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:42:23');
INSERT INTO `tb_sys_log` VALUES ('1439', '219.155.33.248', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.33.248', '2020-09-02 14:42:27');
INSERT INTO `tb_sys_log` VALUES ('1440', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:42:36');
INSERT INTO `tb_sys_log` VALUES ('1441', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 14:42:37');
INSERT INTO `tb_sys_log` VALUES ('1442', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:43:16');
INSERT INTO `tb_sys_log` VALUES ('1443', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 14:43:17');
INSERT INTO `tb_sys_log` VALUES ('1444', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:43:19');
INSERT INTO `tb_sys_log` VALUES ('1445', '219.155.33.248', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.33.248', '2020-09-02 14:43:24');
INSERT INTO `tb_sys_log` VALUES ('1446', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 14:43:24');
INSERT INTO `tb_sys_log` VALUES ('1447', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:46:18');
INSERT INTO `tb_sys_log` VALUES ('1448', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 14:46:18');
INSERT INTO `tb_sys_log` VALUES ('1449', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:46:21');
INSERT INTO `tb_sys_log` VALUES ('1450', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:47:20');
INSERT INTO `tb_sys_log` VALUES ('1451', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 14:47:21');
INSERT INTO `tb_sys_log` VALUES ('1452', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:47:22');
INSERT INTO `tb_sys_log` VALUES ('1453', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:54:42');
INSERT INTO `tb_sys_log` VALUES ('1454', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 14:54:43');
INSERT INTO `tb_sys_log` VALUES ('1455', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:54:47');
INSERT INTO `tb_sys_log` VALUES ('1456', '219.155.33.248', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.33.248', '2020-09-02 14:55:01');
INSERT INTO `tb_sys_log` VALUES ('1457', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:57:39');
INSERT INTO `tb_sys_log` VALUES ('1458', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 14:57:39');
INSERT INTO `tb_sys_log` VALUES ('1459', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 14:57:40');
INSERT INTO `tb_sys_log` VALUES ('1460', '219.155.33.248', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.33.248', '2020-09-02 14:57:43');
INSERT INTO `tb_sys_log` VALUES ('1461', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:00:21');
INSERT INTO `tb_sys_log` VALUES ('1462', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:01:37');
INSERT INTO `tb_sys_log` VALUES ('1463', '219.155.33.248', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.33.248', '2020-09-02 15:01:39');
INSERT INTO `tb_sys_log` VALUES ('1464', '219.155.33.248', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.33.248', '2020-09-02 15:04:20');
INSERT INTO `tb_sys_log` VALUES ('1465', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:04:23');
INSERT INTO `tb_sys_log` VALUES ('1466', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:04:23');
INSERT INTO `tb_sys_log` VALUES ('1467', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:08:41');
INSERT INTO `tb_sys_log` VALUES ('1468', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:08:41');
INSERT INTO `tb_sys_log` VALUES ('1469', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:08:44');
INSERT INTO `tb_sys_log` VALUES ('1470', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:08:45');
INSERT INTO `tb_sys_log` VALUES ('1471', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:09:17');
INSERT INTO `tb_sys_log` VALUES ('1472', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:09:18');
INSERT INTO `tb_sys_log` VALUES ('1473', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:09:22');
INSERT INTO `tb_sys_log` VALUES ('1474', '219.155.33.248', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.33.248', '2020-09-02 15:09:24');
INSERT INTO `tb_sys_log` VALUES ('1475', '219.155.33.248', '新增科室下的输入特征', 'doPostNewDepartmentFeatureInfo', '[\"1111\",\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\"]', '219.155.33.248', '2020-09-02 15:09:29');
INSERT INTO `tb_sys_log` VALUES ('1476', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:09:40');
INSERT INTO `tb_sys_log` VALUES ('1477', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:09:42');
INSERT INTO `tb_sys_log` VALUES ('1478', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:09:59');
INSERT INTO `tb_sys_log` VALUES ('1479', '219.155.33.248', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.33.248', '2020-09-02 15:10:13');
INSERT INTO `tb_sys_log` VALUES ('1480', '219.155.33.248', '新增科室下的输入特征', 'doPostNewDepartmentFeatureInfo', '[\"1111\",\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\"]', '219.155.33.248', '2020-09-02 15:10:18');
INSERT INTO `tb_sys_log` VALUES ('1481', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:10:46');
INSERT INTO `tb_sys_log` VALUES ('1482', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:15:40');
INSERT INTO `tb_sys_log` VALUES ('1483', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:15:41');
INSERT INTO `tb_sys_log` VALUES ('1484', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:15:56');
INSERT INTO `tb_sys_log` VALUES ('1485', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:15:56');
INSERT INTO `tb_sys_log` VALUES ('1486', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:16:49');
INSERT INTO `tb_sys_log` VALUES ('1487', '219.155.33.248', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.33.248', '2020-09-02 15:17:39');
INSERT INTO `tb_sys_log` VALUES ('1488', '219.155.33.248', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.33.248', '2020-09-02 15:18:04');
INSERT INTO `tb_sys_log` VALUES ('1489', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:18:43');
INSERT INTO `tb_sys_log` VALUES ('1490', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:18:44');
INSERT INTO `tb_sys_log` VALUES ('1491', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:18:52');
INSERT INTO `tb_sys_log` VALUES ('1492', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:18:52');
INSERT INTO `tb_sys_log` VALUES ('1493', '219.155.33.248', '删除特征属性', 'doDeleteExtendAttribute', '[\"425c8e9f-c594-4658-8564-fdb0ce668bbe\"]', '219.155.33.248', '2020-09-02 15:19:54');
INSERT INTO `tb_sys_log` VALUES ('1494', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:19:54');
INSERT INTO `tb_sys_log` VALUES ('1495', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:19:55');
INSERT INTO `tb_sys_log` VALUES ('1496', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:20:02');
INSERT INTO `tb_sys_log` VALUES ('1497', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:20:02');
INSERT INTO `tb_sys_log` VALUES ('1498', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:20:04');
INSERT INTO `tb_sys_log` VALUES ('1499', '219.155.33.248', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.33.248', '2020-09-02 15:20:38');
INSERT INTO `tb_sys_log` VALUES ('1500', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:20:38');
INSERT INTO `tb_sys_log` VALUES ('1501', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:20:53');
INSERT INTO `tb_sys_log` VALUES ('1502', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:21:46');
INSERT INTO `tb_sys_log` VALUES ('1503', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:21:46');
INSERT INTO `tb_sys_log` VALUES ('1504', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:22:00');
INSERT INTO `tb_sys_log` VALUES ('1505', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:22:01');
INSERT INTO `tb_sys_log` VALUES ('1506', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:22:17');
INSERT INTO `tb_sys_log` VALUES ('1507', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:22:23');
INSERT INTO `tb_sys_log` VALUES ('1508', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:22:25');
INSERT INTO `tb_sys_log` VALUES ('1509', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:23:01');
INSERT INTO `tb_sys_log` VALUES ('1510', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:23:02');
INSERT INTO `tb_sys_log` VALUES ('1511', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:23:06');
INSERT INTO `tb_sys_log` VALUES ('1512', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:23:21');
INSERT INTO `tb_sys_log` VALUES ('1513', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:24:11');
INSERT INTO `tb_sys_log` VALUES ('1514', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:24:12');
INSERT INTO `tb_sys_log` VALUES ('1515', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:24:13');
INSERT INTO `tb_sys_log` VALUES ('1516', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:24:25');
INSERT INTO `tb_sys_log` VALUES ('1517', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:24:57');
INSERT INTO `tb_sys_log` VALUES ('1518', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:24:58');
INSERT INTO `tb_sys_log` VALUES ('1519', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:24:59');
INSERT INTO `tb_sys_log` VALUES ('1520', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:25:45');
INSERT INTO `tb_sys_log` VALUES ('1521', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:26:11');
INSERT INTO `tb_sys_log` VALUES ('1522', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:26:11');
INSERT INTO `tb_sys_log` VALUES ('1523', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:26:18');
INSERT INTO `tb_sys_log` VALUES ('1524', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:26:18');
INSERT INTO `tb_sys_log` VALUES ('1525', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:27:20');
INSERT INTO `tb_sys_log` VALUES ('1526', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:27:21');
INSERT INTO `tb_sys_log` VALUES ('1527', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:27:30');
INSERT INTO `tb_sys_log` VALUES ('1528', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:28:31');
INSERT INTO `tb_sys_log` VALUES ('1529', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:30:59');
INSERT INTO `tb_sys_log` VALUES ('1530', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:30:59');
INSERT INTO `tb_sys_log` VALUES ('1531', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:33:01');
INSERT INTO `tb_sys_log` VALUES ('1532', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:33:01');
INSERT INTO `tb_sys_log` VALUES ('1533', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:34:06');
INSERT INTO `tb_sys_log` VALUES ('1534', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:34:07');
INSERT INTO `tb_sys_log` VALUES ('1535', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:34:20');
INSERT INTO `tb_sys_log` VALUES ('1536', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:34:21');
INSERT INTO `tb_sys_log` VALUES ('1537', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:34:51');
INSERT INTO `tb_sys_log` VALUES ('1538', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:34:51');
INSERT INTO `tb_sys_log` VALUES ('1539', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:36:00');
INSERT INTO `tb_sys_log` VALUES ('1540', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:36:01');
INSERT INTO `tb_sys_log` VALUES ('1541', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:37:25');
INSERT INTO `tb_sys_log` VALUES ('1542', '219.155.33.248', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.33.248', '2020-09-02 15:37:55');
INSERT INTO `tb_sys_log` VALUES ('1543', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:37:55');
INSERT INTO `tb_sys_log` VALUES ('1544', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:37:57');
INSERT INTO `tb_sys_log` VALUES ('1545', '219.155.33.248', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.33.248', '2020-09-02 15:38:13');
INSERT INTO `tb_sys_log` VALUES ('1546', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:38:13');
INSERT INTO `tb_sys_log` VALUES ('1547', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:38:14');
INSERT INTO `tb_sys_log` VALUES ('1548', '219.155.33.248', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.33.248', '2020-09-02 15:38:38');
INSERT INTO `tb_sys_log` VALUES ('1549', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:38:39');
INSERT INTO `tb_sys_log` VALUES ('1550', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:38:41');
INSERT INTO `tb_sys_log` VALUES ('1551', '219.155.33.248', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.33.248', '2020-09-02 15:38:48');
INSERT INTO `tb_sys_log` VALUES ('1552', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:38:48');
INSERT INTO `tb_sys_log` VALUES ('1553', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:38:51');
INSERT INTO `tb_sys_log` VALUES ('1554', '219.155.33.248', '删除特征属性', 'doDeleteExtendAttribute', '[\"d892c432-38d0-440c-b26b-63f26aa386ff\"]', '219.155.33.248', '2020-09-02 15:38:57');
INSERT INTO `tb_sys_log` VALUES ('1555', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:38:57');
INSERT INTO `tb_sys_log` VALUES ('1556', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:38:57');
INSERT INTO `tb_sys_log` VALUES ('1557', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:39:15');
INSERT INTO `tb_sys_log` VALUES ('1558', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:39:16');
INSERT INTO `tb_sys_log` VALUES ('1559', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:39:17');
INSERT INTO `tb_sys_log` VALUES ('1560', '219.155.33.248', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.33.248', '2020-09-02 15:39:50');
INSERT INTO `tb_sys_log` VALUES ('1561', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:39:50');
INSERT INTO `tb_sys_log` VALUES ('1562', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:40:02');
INSERT INTO `tb_sys_log` VALUES ('1563', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:40:03');
INSERT INTO `tb_sys_log` VALUES ('1564', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:40:19');
INSERT INTO `tb_sys_log` VALUES ('1565', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:40:20');
INSERT INTO `tb_sys_log` VALUES ('1566', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:43:53');
INSERT INTO `tb_sys_log` VALUES ('1567', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:43:54');
INSERT INTO `tb_sys_log` VALUES ('1568', '219.155.33.248', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.33.248', '2020-09-02 15:52:28');
INSERT INTO `tb_sys_log` VALUES ('1569', '219.155.33.248', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.33.248', '2020-09-02 15:52:38');
INSERT INTO `tb_sys_log` VALUES ('1570', '219.155.33.248', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.33.248', '2020-09-02 15:52:39');
INSERT INTO `tb_sys_log` VALUES ('1571', '219.155.33.248', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.33.248', '2020-09-02 15:52:39');
INSERT INTO `tb_sys_log` VALUES ('1572', '117.158.214.185', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '117.158.214.185', '2020-09-03 08:47:21');
INSERT INTO `tb_sys_log` VALUES ('1573', '117.158.214.185', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"212\",\"121,1221\"]', '117.158.214.185', '2020-09-03 08:48:05');
INSERT INTO `tb_sys_log` VALUES ('1574', '117.158.214.185', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '117.158.214.185', '2020-09-03 09:04:46');
INSERT INTO `tb_sys_log` VALUES ('1575', '127.0.0.1', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"c1ea25e2-d381-4c7f-9d44-dedff3f3e396\",\"1,2,3\"]', '127.0.0.1', '2020-09-03 13:52:34');
INSERT INTO `tb_sys_log` VALUES ('1576', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-09-03 13:53:54');
INSERT INTO `tb_sys_log` VALUES ('1577', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-09-03 13:59:15');
INSERT INTO `tb_sys_log` VALUES ('1578', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,null,0,20]', '127.0.0.1', '2020-09-03 13:59:49');
INSERT INTO `tb_sys_log` VALUES ('1579', '117.158.214.185', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-09-04 05:52:20');
INSERT INTO `tb_sys_log` VALUES ('1580', '223.88.82.222', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.222', '2020-09-05 05:40:16');
INSERT INTO `tb_sys_log` VALUES ('1581', '223.88.82.222', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.222', '2020-09-05 05:41:01');
INSERT INTO `tb_sys_log` VALUES ('1582', '127.0.0.1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-09-05 12:58:24');
INSERT INTO `tb_sys_log` VALUES ('1583', '127.0.0.1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-09-05 13:03:05');
INSERT INTO `tb_sys_log` VALUES ('1584', '127.0.0.1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-09-05 13:04:44');
INSERT INTO `tb_sys_log` VALUES ('1585', '127.0.0.1', '查询单个科室特征信息', 'doGetAccount', '[\"{departmentId}\",\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\"]', '127.0.0.1', '2020-09-05 13:07:58');
INSERT INTO `tb_sys_log` VALUES ('1586', '127.0.0.1', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '127.0.0.1', '2020-09-05 13:09:36');
INSERT INTO `tb_sys_log` VALUES ('1587', '127.0.0.1', '查询单个科室特征信息', 'doGetAccount', '[\"{departmentId}\",\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\"]', '127.0.0.1', '2020-09-05 13:33:11');
INSERT INTO `tb_sys_log` VALUES ('1588', '127.0.0.1', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '127.0.0.1', '2020-09-05 13:33:35');
INSERT INTO `tb_sys_log` VALUES ('1589', '127.0.0.1', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '127.0.0.1', '2020-09-05 14:36:34');
INSERT INTO `tb_sys_log` VALUES ('1590', '127.0.0.1', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-09-05 14:36:42');
INSERT INTO `tb_sys_log` VALUES ('1591', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-05 14:34:53');
INSERT INTO `tb_sys_log` VALUES ('1592', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-05 14:36:51');
INSERT INTO `tb_sys_log` VALUES ('1593', '223.88.82.222', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '223.88.82.222', '2020-09-05 14:34:50');
INSERT INTO `tb_sys_log` VALUES ('1594', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-05 14:34:46');
INSERT INTO `tb_sys_log` VALUES ('1595', '219.155.36.2', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '219.155.36.2', '2020-09-05 14:33:57');
INSERT INTO `tb_sys_log` VALUES ('1596', '219.155.36.2', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '219.155.36.2', '2020-09-05 14:35:03');
INSERT INTO `tb_sys_log` VALUES ('1597', '223.88.82.222', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.222', '2020-09-05 14:34:01');
INSERT INTO `tb_sys_log` VALUES ('1598', '223.88.82.222', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.222', '2020-09-05 14:35:47');
INSERT INTO `tb_sys_log` VALUES ('1599', '223.88.82.222', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '223.88.82.222', '2020-09-05 14:37:06');
INSERT INTO `tb_sys_log` VALUES ('1600', '223.88.82.222', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '223.88.82.222', '2020-09-05 14:39:10');
INSERT INTO `tb_sys_log` VALUES ('1601', '223.88.82.222', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '223.88.82.222', '2020-09-05 14:40:24');
INSERT INTO `tb_sys_log` VALUES ('1602', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-05 14:40:56');
INSERT INTO `tb_sys_log` VALUES ('1603', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-05 14:41:05');
INSERT INTO `tb_sys_log` VALUES ('1604', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-05 14:45:45');
INSERT INTO `tb_sys_log` VALUES ('1605', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-05 14:45:45');
INSERT INTO `tb_sys_log` VALUES ('1606', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-05 14:45:55');
INSERT INTO `tb_sys_log` VALUES ('1607', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-05 14:45:55');
INSERT INTO `tb_sys_log` VALUES ('1608', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-05 14:51:46');
INSERT INTO `tb_sys_log` VALUES ('1609', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-05 14:51:48');
INSERT INTO `tb_sys_log` VALUES ('1610', '219.155.36.2', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '219.155.36.2', '2020-09-05 14:51:48');
INSERT INTO `tb_sys_log` VALUES ('1611', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-05 14:52:04');
INSERT INTO `tb_sys_log` VALUES ('1612', '219.155.36.2', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '219.155.36.2', '2020-09-05 14:52:06');
INSERT INTO `tb_sys_log` VALUES ('1613', '219.155.36.2', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '219.155.36.2', '2020-09-05 14:52:09');
INSERT INTO `tb_sys_log` VALUES ('1614', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-05 14:52:20');
INSERT INTO `tb_sys_log` VALUES ('1615', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-05 14:52:21');
INSERT INTO `tb_sys_log` VALUES ('1616', '219.155.36.2', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '219.155.36.2', '2020-09-05 14:52:21');
INSERT INTO `tb_sys_log` VALUES ('1617', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-05 14:52:22');
INSERT INTO `tb_sys_log` VALUES ('1618', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-05 14:52:22');
INSERT INTO `tb_sys_log` VALUES ('1619', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-05 14:52:59');
INSERT INTO `tb_sys_log` VALUES ('1620', '223.88.82.222', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '223.88.82.222', '2020-09-05 14:57:28');
INSERT INTO `tb_sys_log` VALUES ('1621', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-05 14:57:33');
INSERT INTO `tb_sys_log` VALUES ('1622', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-05 14:57:36');
INSERT INTO `tb_sys_log` VALUES ('1623', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-05 14:57:36');
INSERT INTO `tb_sys_log` VALUES ('1624', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-05 14:57:38');
INSERT INTO `tb_sys_log` VALUES ('1625', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-05 14:57:40');
INSERT INTO `tb_sys_log` VALUES ('1626', '219.155.36.2', '新增科室下的输入特征', 'doPostNewDepartmentFeatureInfo', '[\"1111\",\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\"]', '219.155.36.2', '2020-09-05 14:57:43');
INSERT INTO `tb_sys_log` VALUES ('1627', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-05 14:57:48');
INSERT INTO `tb_sys_log` VALUES ('1628', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-05 14:57:48');
INSERT INTO `tb_sys_log` VALUES ('1629', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-05 14:57:53');
INSERT INTO `tb_sys_log` VALUES ('1630', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-05 14:58:45');
INSERT INTO `tb_sys_log` VALUES ('1631', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-05 14:58:45');
INSERT INTO `tb_sys_log` VALUES ('1632', '223.88.82.222', '查询单个科室特征信息', 'doGetAccount', '[\"{departmentId}\",\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\"]', '223.88.82.222', '2020-09-05 14:59:26');
INSERT INTO `tb_sys_log` VALUES ('1633', '127.0.0.1', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '127.0.0.1', '2020-09-05 14:59:57');
INSERT INTO `tb_sys_log` VALUES ('1634', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-05 15:00:29');
INSERT INTO `tb_sys_log` VALUES ('1635', '127.0.0.1', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '127.0.0.1', '2020-09-05 15:02:02');
INSERT INTO `tb_sys_log` VALUES ('1636', '223.88.82.222', '查询单个科室特征信息', 'doGetAccount', '[\"{departmentId}\",\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\"]', '223.88.82.222', '2020-09-05 15:08:50');
INSERT INTO `tb_sys_log` VALUES ('1637', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:09:32');
INSERT INTO `tb_sys_log` VALUES ('1638', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 01:09:28');
INSERT INTO `tb_sys_log` VALUES ('1639', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 01:09:38');
INSERT INTO `tb_sys_log` VALUES ('1640', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 01:10:35');
INSERT INTO `tb_sys_log` VALUES ('1641', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 01:09:14');
INSERT INTO `tb_sys_log` VALUES ('1642', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:10:23');
INSERT INTO `tb_sys_log` VALUES ('1643', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 01:17:08');
INSERT INTO `tb_sys_log` VALUES ('1644', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 01:17:16');
INSERT INTO `tb_sys_log` VALUES ('1645', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 01:17:43');
INSERT INTO `tb_sys_log` VALUES ('1646', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 01:17:44');
INSERT INTO `tb_sys_log` VALUES ('1647', '219.155.36.2', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '219.155.36.2', '2020-09-06 01:17:45');
INSERT INTO `tb_sys_log` VALUES ('1648', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 01:17:45');
INSERT INTO `tb_sys_log` VALUES ('1649', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:17:46');
INSERT INTO `tb_sys_log` VALUES ('1650', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:17:47');
INSERT INTO `tb_sys_log` VALUES ('1651', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:19:08');
INSERT INTO `tb_sys_log` VALUES ('1652', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:19:49');
INSERT INTO `tb_sys_log` VALUES ('1653', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:19:49');
INSERT INTO `tb_sys_log` VALUES ('1654', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:19:49');
INSERT INTO `tb_sys_log` VALUES ('1655', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:25:09');
INSERT INTO `tb_sys_log` VALUES ('1656', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:25:10');
INSERT INTO `tb_sys_log` VALUES ('1657', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:25:22');
INSERT INTO `tb_sys_log` VALUES ('1658', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:27:12');
INSERT INTO `tb_sys_log` VALUES ('1659', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:27:13');
INSERT INTO `tb_sys_log` VALUES ('1660', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:27:14');
INSERT INTO `tb_sys_log` VALUES ('1661', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 01:27:36');
INSERT INTO `tb_sys_log` VALUES ('1662', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:27:36');
INSERT INTO `tb_sys_log` VALUES ('1663', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '219.155.36.2', '2020-09-06 01:30:27');
INSERT INTO `tb_sys_log` VALUES ('1664', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:30:47');
INSERT INTO `tb_sys_log` VALUES ('1665', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 01:30:50');
INSERT INTO `tb_sys_log` VALUES ('1666', '219.155.36.2', '新增科室下的输入特征', 'doPostNewDepartmentFeatureInfo', '[\"1111\",\"6f13c60c-b28a-4068-8e7f-81ccf306aa44\"]', '219.155.36.2', '2020-09-06 01:30:54');
INSERT INTO `tb_sys_log` VALUES ('1667', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:31:38');
INSERT INTO `tb_sys_log` VALUES ('1668', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:31:39');
INSERT INTO `tb_sys_log` VALUES ('1669', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:33:58');
INSERT INTO `tb_sys_log` VALUES ('1670', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:33:58');
INSERT INTO `tb_sys_log` VALUES ('1671', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:34:02');
INSERT INTO `tb_sys_log` VALUES ('1672', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:34:03');
INSERT INTO `tb_sys_log` VALUES ('1673', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:34:05');
INSERT INTO `tb_sys_log` VALUES ('1674', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 01:34:17');
INSERT INTO `tb_sys_log` VALUES ('1675', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\",\"1111\"]', '219.155.36.2', '2020-09-06 01:34:20');
INSERT INTO `tb_sys_log` VALUES ('1676', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 01:35:04');
INSERT INTO `tb_sys_log` VALUES ('1677', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\",\"1111\"]', '219.155.36.2', '2020-09-06 01:35:17');
INSERT INTO `tb_sys_log` VALUES ('1678', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 01:36:29');
INSERT INTO `tb_sys_log` VALUES ('1679', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:37:04');
INSERT INTO `tb_sys_log` VALUES ('1680', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:37:05');
INSERT INTO `tb_sys_log` VALUES ('1681', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"e08c9c92-1931-450e-aae2-797520905dfa\"]', '219.155.36.2', '2020-09-06 01:37:22');
INSERT INTO `tb_sys_log` VALUES ('1682', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:37:22');
INSERT INTO `tb_sys_log` VALUES ('1683', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:37:22');
INSERT INTO `tb_sys_log` VALUES ('1684', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:37:26');
INSERT INTO `tb_sys_log` VALUES ('1685', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:38:46');
INSERT INTO `tb_sys_log` VALUES ('1686', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:38:47');
INSERT INTO `tb_sys_log` VALUES ('1687', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:38:48');
INSERT INTO `tb_sys_log` VALUES ('1688', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 01:39:27');
INSERT INTO `tb_sys_log` VALUES ('1689', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:39:27');
INSERT INTO `tb_sys_log` VALUES ('1690', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:39:48');
INSERT INTO `tb_sys_log` VALUES ('1691', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:40:33');
INSERT INTO `tb_sys_log` VALUES ('1692', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:40:34');
INSERT INTO `tb_sys_log` VALUES ('1693', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:40:36');
INSERT INTO `tb_sys_log` VALUES ('1694', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:41:06');
INSERT INTO `tb_sys_log` VALUES ('1695', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:41:07');
INSERT INTO `tb_sys_log` VALUES ('1696', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:41:09');
INSERT INTO `tb_sys_log` VALUES ('1697', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:41:44');
INSERT INTO `tb_sys_log` VALUES ('1698', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:41:45');
INSERT INTO `tb_sys_log` VALUES ('1699', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:41:51');
INSERT INTO `tb_sys_log` VALUES ('1700', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:43:29');
INSERT INTO `tb_sys_log` VALUES ('1701', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:43:30');
INSERT INTO `tb_sys_log` VALUES ('1702', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:43:34');
INSERT INTO `tb_sys_log` VALUES ('1703', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:44:08');
INSERT INTO `tb_sys_log` VALUES ('1704', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:44:09');
INSERT INTO `tb_sys_log` VALUES ('1705', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:44:11');
INSERT INTO `tb_sys_log` VALUES ('1706', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 01:44:22');
INSERT INTO `tb_sys_log` VALUES ('1707', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:44:22');
INSERT INTO `tb_sys_log` VALUES ('1708', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:44:24');
INSERT INTO `tb_sys_log` VALUES ('1709', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:44:28');
INSERT INTO `tb_sys_log` VALUES ('1710', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 01:44:30');
INSERT INTO `tb_sys_log` VALUES ('1711', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 01:44:48');
INSERT INTO `tb_sys_log` VALUES ('1712', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"83e43295-af0d-4882-b15b-4e34c3c95303\",\"1111\"]', '219.155.36.2', '2020-09-06 01:44:52');
INSERT INTO `tb_sys_log` VALUES ('1713', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 01:45:21');
INSERT INTO `tb_sys_log` VALUES ('1714', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:45:48');
INSERT INTO `tb_sys_log` VALUES ('1715', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:45:48');
INSERT INTO `tb_sys_log` VALUES ('1716', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"83e43295-af0d-4882-b15b-4e34c3c95303\"]', '219.155.36.2', '2020-09-06 01:47:57');
INSERT INTO `tb_sys_log` VALUES ('1717', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:47:57');
INSERT INTO `tb_sys_log` VALUES ('1718', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:47:57');
INSERT INTO `tb_sys_log` VALUES ('1719', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"797e2d2a-6897-486b-9123-8ff78cce6b5e\"]', '219.155.36.2', '2020-09-06 01:47:59');
INSERT INTO `tb_sys_log` VALUES ('1720', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:48:00');
INSERT INTO `tb_sys_log` VALUES ('1721', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:48:00');
INSERT INTO `tb_sys_log` VALUES ('1722', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"a665cd65-cbdb-4948-bf97-51767f85a711\"]', '219.155.36.2', '2020-09-06 01:48:01');
INSERT INTO `tb_sys_log` VALUES ('1723', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:48:02');
INSERT INTO `tb_sys_log` VALUES ('1724', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:48:02');
INSERT INTO `tb_sys_log` VALUES ('1725', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"1eee4a27-9f05-48ae-a101-c333250a0a6b\"]', '219.155.36.2', '2020-09-06 01:48:04');
INSERT INTO `tb_sys_log` VALUES ('1726', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:48:04');
INSERT INTO `tb_sys_log` VALUES ('1727', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:48:04');
INSERT INTO `tb_sys_log` VALUES ('1728', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"6f13c60c-b28a-4068-8e7f-81ccf306aa44\"]', '219.155.36.2', '2020-09-06 01:48:06');
INSERT INTO `tb_sys_log` VALUES ('1729', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:48:06');
INSERT INTO `tb_sys_log` VALUES ('1730', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:48:06');
INSERT INTO `tb_sys_log` VALUES ('1731', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"6a02ce74-530a-4f94-8849-fbe402b3ba6c\"]', '219.155.36.2', '2020-09-06 01:48:08');
INSERT INTO `tb_sys_log` VALUES ('1732', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:48:08');
INSERT INTO `tb_sys_log` VALUES ('1733', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:48:08');
INSERT INTO `tb_sys_log` VALUES ('1734', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:48:11');
INSERT INTO `tb_sys_log` VALUES ('1735', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:48:12');
INSERT INTO `tb_sys_log` VALUES ('1736', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 01:48:15');
INSERT INTO `tb_sys_log` VALUES ('1737', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:48:24');
INSERT INTO `tb_sys_log` VALUES ('1738', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:51:24');
INSERT INTO `tb_sys_log` VALUES ('1739', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:51:25');
INSERT INTO `tb_sys_log` VALUES ('1740', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:51:27');
INSERT INTO `tb_sys_log` VALUES ('1741', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:52:56');
INSERT INTO `tb_sys_log` VALUES ('1742', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:52:56');
INSERT INTO `tb_sys_log` VALUES ('1743', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:52:58');
INSERT INTO `tb_sys_log` VALUES ('1744', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 01:53:43');
INSERT INTO `tb_sys_log` VALUES ('1745', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:53:43');
INSERT INTO `tb_sys_log` VALUES ('1746', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:53:57');
INSERT INTO `tb_sys_log` VALUES ('1747', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:54:00');
INSERT INTO `tb_sys_log` VALUES ('1748', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:54:05');
INSERT INTO `tb_sys_log` VALUES ('1749', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:54:26');
INSERT INTO `tb_sys_log` VALUES ('1750', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:54:27');
INSERT INTO `tb_sys_log` VALUES ('1751', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:54:31');
INSERT INTO `tb_sys_log` VALUES ('1752', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 01:55:23');
INSERT INTO `tb_sys_log` VALUES ('1753', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:55:23');
INSERT INTO `tb_sys_log` VALUES ('1754', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:55:32');
INSERT INTO `tb_sys_log` VALUES ('1755', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 01:56:09');
INSERT INTO `tb_sys_log` VALUES ('1756', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:56:09');
INSERT INTO `tb_sys_log` VALUES ('1757', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:56:12');
INSERT INTO `tb_sys_log` VALUES ('1758', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 01:56:17');
INSERT INTO `tb_sys_log` VALUES ('1759', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:56:17');
INSERT INTO `tb_sys_log` VALUES ('1760', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:56:26');
INSERT INTO `tb_sys_log` VALUES ('1761', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:58:04');
INSERT INTO `tb_sys_log` VALUES ('1762', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:58:05');
INSERT INTO `tb_sys_log` VALUES ('1763', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:58:08');
INSERT INTO `tb_sys_log` VALUES ('1764', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 01:59:10');
INSERT INTO `tb_sys_log` VALUES ('1765', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 01:59:10');
INSERT INTO `tb_sys_log` VALUES ('1766', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 01:59:12');
INSERT INTO `tb_sys_log` VALUES ('1767', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 02:00:05');
INSERT INTO `tb_sys_log` VALUES ('1768', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:00:05');
INSERT INTO `tb_sys_log` VALUES ('1769', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:00:07');
INSERT INTO `tb_sys_log` VALUES ('1770', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 02:00:58');
INSERT INTO `tb_sys_log` VALUES ('1771', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:00:58');
INSERT INTO `tb_sys_log` VALUES ('1772', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:01:08');
INSERT INTO `tb_sys_log` VALUES ('1773', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 02:01:46');
INSERT INTO `tb_sys_log` VALUES ('1774', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:01:46');
INSERT INTO `tb_sys_log` VALUES ('1775', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:01:59');
INSERT INTO `tb_sys_log` VALUES ('1776', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"2ff273e5-05de-44f3-9a0b-3605b9649e64\"]', '219.155.36.2', '2020-09-06 02:02:06');
INSERT INTO `tb_sys_log` VALUES ('1777', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:02:06');
INSERT INTO `tb_sys_log` VALUES ('1778', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:02:06');
INSERT INTO `tb_sys_log` VALUES ('1779', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"9685daba-4ea1-4ffc-a1c6-901618503b79\"]', '219.155.36.2', '2020-09-06 02:02:09');
INSERT INTO `tb_sys_log` VALUES ('1780', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:02:09');
INSERT INTO `tb_sys_log` VALUES ('1781', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:02:09');
INSERT INTO `tb_sys_log` VALUES ('1782', '219.155.36.2', '删除特征属性', 'doDeleteExtendAttribute', '[\"58d67d37-80c7-4754-a19d-38b2cd63fe33\"]', '219.155.36.2', '2020-09-06 02:02:11');
INSERT INTO `tb_sys_log` VALUES ('1783', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:02:11');
INSERT INTO `tb_sys_log` VALUES ('1784', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:02:11');
INSERT INTO `tb_sys_log` VALUES ('1785', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:02:19');
INSERT INTO `tb_sys_log` VALUES ('1786', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:02:20');
INSERT INTO `tb_sys_log` VALUES ('1787', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:02:32');
INSERT INTO `tb_sys_log` VALUES ('1788', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 02:03:25');
INSERT INTO `tb_sys_log` VALUES ('1789', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:03:25');
INSERT INTO `tb_sys_log` VALUES ('1790', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:03:28');
INSERT INTO `tb_sys_log` VALUES ('1791', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 02:04:20');
INSERT INTO `tb_sys_log` VALUES ('1792', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:04:20');
INSERT INTO `tb_sys_log` VALUES ('1793', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:04:40');
INSERT INTO `tb_sys_log` VALUES ('1794', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 02:05:36');
INSERT INTO `tb_sys_log` VALUES ('1795', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:05:36');
INSERT INTO `tb_sys_log` VALUES ('1796', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:05:43');
INSERT INTO `tb_sys_log` VALUES ('1797', '219.155.36.2', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 02:06:36');
INSERT INTO `tb_sys_log` VALUES ('1798', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:06:36');
INSERT INTO `tb_sys_log` VALUES ('1799', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:06:40');
INSERT INTO `tb_sys_log` VALUES ('1800', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:06:43');
INSERT INTO `tb_sys_log` VALUES ('1801', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"c6e8e525-389d-47de-89c4-0ebe35ae0302\",\"1111\"]', '219.155.36.2', '2020-09-06 02:06:46');
INSERT INTO `tb_sys_log` VALUES ('1802', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 02:06:47');
INSERT INTO `tb_sys_log` VALUES ('1803', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:06:48');
INSERT INTO `tb_sys_log` VALUES ('1804', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:06:51');
INSERT INTO `tb_sys_log` VALUES ('1805', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:06:53');
INSERT INTO `tb_sys_log` VALUES ('1806', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"4e5f8081-f673-42ab-8b55-e0098bf8b2f2\",\"1111\"]', '219.155.36.2', '2020-09-06 02:06:56');
INSERT INTO `tb_sys_log` VALUES ('1807', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 02:06:57');
INSERT INTO `tb_sys_log` VALUES ('1808', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:06:57');
INSERT INTO `tb_sys_log` VALUES ('1809', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:06:58');
INSERT INTO `tb_sys_log` VALUES ('1810', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:06:59');
INSERT INTO `tb_sys_log` VALUES ('1811', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"dfef97bf-3646-4b5a-bce5-c9ca385b8eed\",\"\"]', '219.155.36.2', '2020-09-06 02:07:02');
INSERT INTO `tb_sys_log` VALUES ('1812', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:07:03');
INSERT INTO `tb_sys_log` VALUES ('1813', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"dfef97bf-3646-4b5a-bce5-c9ca385b8eed\",\"1111\"]', '219.155.36.2', '2020-09-06 02:07:05');
INSERT INTO `tb_sys_log` VALUES ('1814', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 02:07:07');
INSERT INTO `tb_sys_log` VALUES ('1815', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:07:07');
INSERT INTO `tb_sys_log` VALUES ('1816', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:07:09');
INSERT INTO `tb_sys_log` VALUES ('1817', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:07:11');
INSERT INTO `tb_sys_log` VALUES ('1818', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"8cf70fa8-a3de-471f-8560-8dd6a4e7843f\",\"1111\"]', '219.155.36.2', '2020-09-06 02:07:13');
INSERT INTO `tb_sys_log` VALUES ('1819', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 02:07:14');
INSERT INTO `tb_sys_log` VALUES ('1820', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:07:14');
INSERT INTO `tb_sys_log` VALUES ('1821', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:07:16');
INSERT INTO `tb_sys_log` VALUES ('1822', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:07:18');
INSERT INTO `tb_sys_log` VALUES ('1823', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"2fbefa39-8c30-4146-9da6-43c6afe93278\",\"1111\"]', '219.155.36.2', '2020-09-06 02:07:20');
INSERT INTO `tb_sys_log` VALUES ('1824', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 02:07:21');
INSERT INTO `tb_sys_log` VALUES ('1825', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:07:21');
INSERT INTO `tb_sys_log` VALUES ('1826', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:07:25');
INSERT INTO `tb_sys_log` VALUES ('1827', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:07:26');
INSERT INTO `tb_sys_log` VALUES ('1828', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"e293cd4f-df01-4419-8f3b-cb370e58c1a3\",\"1111\"]', '219.155.36.2', '2020-09-06 02:07:28');
INSERT INTO `tb_sys_log` VALUES ('1829', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 02:07:29');
INSERT INTO `tb_sys_log` VALUES ('1830', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:07:29');
INSERT INTO `tb_sys_log` VALUES ('1831', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:07:32');
INSERT INTO `tb_sys_log` VALUES ('1832', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:07:33');
INSERT INTO `tb_sys_log` VALUES ('1833', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"f57c8d03-5233-4fa5-949b-ffc38967072a\",\"1111\"]', '219.155.36.2', '2020-09-06 02:07:35');
INSERT INTO `tb_sys_log` VALUES ('1834', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 02:07:36');
INSERT INTO `tb_sys_log` VALUES ('1835', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:07:36');
INSERT INTO `tb_sys_log` VALUES ('1836', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:07:37');
INSERT INTO `tb_sys_log` VALUES ('1837', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 02:07:42');
INSERT INTO `tb_sys_log` VALUES ('1838', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:07:44');
INSERT INTO `tb_sys_log` VALUES ('1839', '219.155.36.2', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"806800f4-5e51-4da5-b0d4-6bcfe7edd3f1\",\"1111\"]', '219.155.36.2', '2020-09-06 02:07:46');
INSERT INTO `tb_sys_log` VALUES ('1840', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 02:07:47');
INSERT INTO `tb_sys_log` VALUES ('1841', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 02:07:47');
INSERT INTO `tb_sys_log` VALUES ('1842', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 02:07:53');
INSERT INTO `tb_sys_log` VALUES ('1843', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:08:22');
INSERT INTO `tb_sys_log` VALUES ('1844', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:08:41');
INSERT INTO `tb_sys_log` VALUES ('1845', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:11:31');
INSERT INTO `tb_sys_log` VALUES ('1846', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:15:45');
INSERT INTO `tb_sys_log` VALUES ('1847', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:23:39');
INSERT INTO `tb_sys_log` VALUES ('1848', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:24:06');
INSERT INTO `tb_sys_log` VALUES ('1849', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:25:28');
INSERT INTO `tb_sys_log` VALUES ('1850', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 02:25:33');
INSERT INTO `tb_sys_log` VALUES ('1851', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:27:33');
INSERT INTO `tb_sys_log` VALUES ('1852', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 02:27:58');
INSERT INTO `tb_sys_log` VALUES ('1853', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 02:29:57');
INSERT INTO `tb_sys_log` VALUES ('1854', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 02:30:10');
INSERT INTO `tb_sys_log` VALUES ('1855', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 02:30:54');
INSERT INTO `tb_sys_log` VALUES ('1856', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:31:01');
INSERT INTO `tb_sys_log` VALUES ('1857', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 02:31:03');
INSERT INTO `tb_sys_log` VALUES ('1858', '219.155.36.2', '退出平台', 'loginout', '[]', '219.155.36.2', '2020-09-06 02:32:12');
INSERT INTO `tb_sys_log` VALUES ('1859', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 02:32:13');
INSERT INTO `tb_sys_log` VALUES ('1860', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 02:32:16');
INSERT INTO `tb_sys_log` VALUES ('1861', '219.155.36.2', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"123456\"]', '219.155.36.2', '2020-09-06 02:32:24');
INSERT INTO `tb_sys_log` VALUES ('1862', '219.155.36.2', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"wb120641\"]', '219.155.36.2', '2020-09-06 02:32:31');
INSERT INTO `tb_sys_log` VALUES ('1863', '219.155.36.2', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '219.155.36.2', '2020-09-06 02:32:35');
INSERT INTO `tb_sys_log` VALUES ('1864', '219.155.36.2', '登录平台', 'doPostNewApplicationResource', '[\"wangbo1\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '219.155.36.2', '2020-09-06 02:32:36');
INSERT INTO `tb_sys_log` VALUES ('1865', '219.155.36.2', '登录平台', 'doPostNewApplicationResource', '[\"wangbo123\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '219.155.36.2', '2020-09-06 02:32:38');
INSERT INTO `tb_sys_log` VALUES ('1866', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 02:32:44');
INSERT INTO `tb_sys_log` VALUES ('1867', '219.155.36.2', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '219.155.36.2', '2020-09-06 02:32:47');
INSERT INTO `tb_sys_log` VALUES ('1868', '219.155.36.2', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '219.155.36.2', '2020-09-06 02:32:51');
INSERT INTO `tb_sys_log` VALUES ('1869', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 02:33:00');
INSERT INTO `tb_sys_log` VALUES ('1870', '219.155.36.2', '重置密码', 'doPutAccountAllInfo', '[\"6be54dc7-3ee8-4bba-803a-e0bd3a8ea381\"]', '219.155.36.2', '2020-09-06 02:33:12');
INSERT INTO `tb_sys_log` VALUES ('1871', '219.155.36.2', '退出平台', 'loginout', '[]', '219.155.36.2', '2020-09-06 02:33:15');
INSERT INTO `tb_sys_log` VALUES ('1872', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 02:33:15');
INSERT INTO `tb_sys_log` VALUES ('1873', '219.155.36.2', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '219.155.36.2', '2020-09-06 02:33:22');
INSERT INTO `tb_sys_log` VALUES ('1874', '219.155.36.2', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"171723\"]', '219.155.36.2', '2020-09-06 02:33:33');
INSERT INTO `tb_sys_log` VALUES ('1875', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 02:33:41');
INSERT INTO `tb_sys_log` VALUES ('1876', '219.155.36.2', '注册账户', 'doPostNewUserInfo', '[\"{\\\"userName\\\":\\\"wangbo-1\\\",\\\"password\\\":\\\"111111\\\",\\\"email\\\":\\\"123@qq.com\\\",\\\"phone\\\":\\\"17638176273\\\",\\\"departmentId\\\":\\\"1111\\\"}\"]', '219.155.36.2', '2020-09-06 02:34:19');
INSERT INTO `tb_sys_log` VALUES ('1877', '219.155.36.2', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '219.155.36.2', '2020-09-06 02:34:24');
INSERT INTO `tb_sys_log` VALUES ('1878', '219.155.36.2', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"4b451c75-119c-4f6b-80b7-6e3dbd3e35f4\",\"111111\"]', '219.155.36.2', '2020-09-06 02:34:32');
INSERT INTO `tb_sys_log` VALUES ('1879', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 03:00:22');
INSERT INTO `tb_sys_log` VALUES ('1880', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 03:00:25');
INSERT INTO `tb_sys_log` VALUES ('1881', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:00:31');
INSERT INTO `tb_sys_log` VALUES ('1882', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 03:00:36');
INSERT INTO `tb_sys_log` VALUES ('1883', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 03:02:17');
INSERT INTO `tb_sys_log` VALUES ('1884', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 03:02:33');
INSERT INTO `tb_sys_log` VALUES ('1885', '219.155.36.2', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '219.155.36.2', '2020-09-06 03:02:33');
INSERT INTO `tb_sys_log` VALUES ('1886', '219.155.36.2', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 03:02:34');
INSERT INTO `tb_sys_log` VALUES ('1887', '219.155.36.2', '退出平台', 'loginout', '[]', '219.155.36.2', '2020-09-06 03:04:48');
INSERT INTO `tb_sys_log` VALUES ('1888', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 03:04:48');
INSERT INTO `tb_sys_log` VALUES ('1889', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:04:59');
INSERT INTO `tb_sys_log` VALUES ('1890', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 03:05:00');
INSERT INTO `tb_sys_log` VALUES ('1891', '219.155.36.2', '编辑病人信息', 'doPutPatientInfo', '[\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\",\"{\\\"name\\\":\\\"王大雷\\\",\\\"postId\\\":\\\"410822199108111512\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"无病史\\\"}\"]', '219.155.36.2', '2020-09-06 03:05:15');
INSERT INTO `tb_sys_log` VALUES ('1892', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:05:15');
INSERT INTO `tb_sys_log` VALUES ('1893', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '219.155.36.2', '2020-09-06 03:05:17');
INSERT INTO `tb_sys_log` VALUES ('1894', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:06:56');
INSERT INTO `tb_sys_log` VALUES ('1895', '127.0.0.1', '获取所有的角色', 'doQueryRoleList', '[]', '127.0.0.1', '2020-09-06 03:18:25');
INSERT INTO `tb_sys_log` VALUES ('1896', '127.0.0.1', '退出平台', 'loginout', '[]', '127.0.0.1', '2020-09-06 03:18:38');
INSERT INTO `tb_sys_log` VALUES ('1897', '127.0.0.1', '获取所有的角色', 'doQueryRoleList', '[]', '127.0.0.1', '2020-09-06 03:18:38');
INSERT INTO `tb_sys_log` VALUES ('1898', '127.0.0.1', '查询所有的科室', 'doQueryDepartmentList', '[]', '127.0.0.1', '2020-09-06 03:18:39');
INSERT INTO `tb_sys_log` VALUES ('1899', '127.0.0.1', '注册账户', 'doPostNewUserInfo', '[\"{\\\"userName\\\":\\\"ZHH\\\",\\\"password\\\":\\\"123456\\\",\\\"email\\\":\\\"476612551@qq.com\\\",\\\"phone\\\":\\\"15809712345\\\",\\\"departmentId\\\":\\\"1113\\\"}\"]', '127.0.0.1', '2020-09-06 03:19:28');
INSERT INTO `tb_sys_log` VALUES ('1900', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-09-06 03:19:52');
INSERT INTO `tb_sys_log` VALUES ('1901', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-09-06 03:19:53');
INSERT INTO `tb_sys_log` VALUES ('1902', 'ZHH', '登录平台', 'doPostNewApplicationResource', '[\"ZHH\",\"1\",\"123456\"]', '223.88.82.222', '2020-09-06 03:20:48');
INSERT INTO `tb_sys_log` VALUES ('1903', '127.0.0.1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '127.0.0.1', '2020-09-06 03:21:35');
INSERT INTO `tb_sys_log` VALUES ('1904', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '127.0.0.1', '2020-09-06 03:21:36');
INSERT INTO `tb_sys_log` VALUES ('1905', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '127.0.0.1', '2020-09-06 03:21:38');
INSERT INTO `tb_sys_log` VALUES ('1906', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[2,\"\",0,10]', '127.0.0.1', '2020-09-06 03:21:40');
INSERT INTO `tb_sys_log` VALUES ('1907', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[2,\"\",0,10]', '127.0.0.1', '2020-09-06 03:21:44');
INSERT INTO `tb_sys_log` VALUES ('1908', '127.0.0.1', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '127.0.0.1', '2020-09-06 03:21:46');
INSERT INTO `tb_sys_log` VALUES ('1909', '127.0.0.1', '退出平台', 'loginout', '[]', '127.0.0.1', '2020-09-06 03:22:01');
INSERT INTO `tb_sys_log` VALUES ('1910', '127.0.0.1', '获取所有的角色', 'doQueryRoleList', '[]', '127.0.0.1', '2020-09-06 03:22:01');
INSERT INTO `tb_sys_log` VALUES ('1911', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-09-06 03:22:16');
INSERT INTO `tb_sys_log` VALUES ('1912', '127.0.0.1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '127.0.0.1', '2020-09-06 03:22:20');
INSERT INTO `tb_sys_log` VALUES ('1913', '127.0.0.1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '127.0.0.1', '2020-09-06 03:22:26');
INSERT INTO `tb_sys_log` VALUES ('1914', '127.0.0.1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '127.0.0.1', '2020-09-06 03:22:29');
INSERT INTO `tb_sys_log` VALUES ('1915', '127.0.0.1', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '127.0.0.1', '2020-09-06 03:22:30');
INSERT INTO `tb_sys_log` VALUES ('1916', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"1\",\"111111\"]', '127.0.0.1', '2020-09-06 03:23:14');
INSERT INTO `tb_sys_log` VALUES ('1917', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 03:23:59');
INSERT INTO `tb_sys_log` VALUES ('1918', 'ZHH', '登录平台', 'doPostNewApplicationResource', '[\"ZHH\",\"1\",\"123456\"]', '223.88.82.222', '2020-09-06 03:24:09');
INSERT INTO `tb_sys_log` VALUES ('1919', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"1\",\"111111\"]', '223.88.82.222', '2020-09-06 03:24:18');
INSERT INTO `tb_sys_log` VALUES ('1920', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:27:43');
INSERT INTO `tb_sys_log` VALUES ('1921', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:27:49');
INSERT INTO `tb_sys_log` VALUES ('1922', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 03:28:02');
INSERT INTO `tb_sys_log` VALUES ('1923', '219.155.36.2', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '219.155.36.2', '2020-09-06 03:28:02');
INSERT INTO `tb_sys_log` VALUES ('1924', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 03:28:07');
INSERT INTO `tb_sys_log` VALUES ('1925', '219.155.36.2', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"咽喉疼\\\",\\\"treatment\\\":\\\"建议多喝热水\\\",\\\"introduction\\\":\\\"咽喉疼\\\",\\\"departmentId\\\":\\\"1111\\\",\\\"sort\\\":0,\\\"remark\\\":\\\"\\\"}\"]', '219.155.36.2', '2020-09-06 03:30:01');
INSERT INTO `tb_sys_log` VALUES ('1926', '219.155.36.2', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '219.155.36.2', '2020-09-06 03:30:02');
INSERT INTO `tb_sys_log` VALUES ('1927', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 03:30:03');
INSERT INTO `tb_sys_log` VALUES ('1928', '219.155.36.2', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"嗓子疼\\\",\\\"treatment\\\":\\\"喝热水\\\",\\\"introduction\\\":\\\"嗓子疼\\\",\\\"departmentId\\\":\\\"1111\\\",\\\"sort\\\":2,\\\"remark\\\":\\\"\\\"}\"]', '219.155.36.2', '2020-09-06 03:30:21');
INSERT INTO `tb_sys_log` VALUES ('1929', '219.155.36.2', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '219.155.36.2', '2020-09-06 03:30:22');
INSERT INTO `tb_sys_log` VALUES ('1930', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:30:24');
INSERT INTO `tb_sys_log` VALUES ('1931', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:30:26');
INSERT INTO `tb_sys_log` VALUES ('1932', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:30:36');
INSERT INTO `tb_sys_log` VALUES ('1933', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:33:34');
INSERT INTO `tb_sys_log` VALUES ('1934', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:33:41');
INSERT INTO `tb_sys_log` VALUES ('1935', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:34:11');
INSERT INTO `tb_sys_log` VALUES ('1936', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:34:15');
INSERT INTO `tb_sys_log` VALUES ('1937', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:37:04');
INSERT INTO `tb_sys_log` VALUES ('1938', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:37:07');
INSERT INTO `tb_sys_log` VALUES ('1939', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:38:17');
INSERT INTO `tb_sys_log` VALUES ('1940', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:38:22');
INSERT INTO `tb_sys_log` VALUES ('1941', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:39:20');
INSERT INTO `tb_sys_log` VALUES ('1942', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:39:27');
INSERT INTO `tb_sys_log` VALUES ('1943', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 03:40:26');
INSERT INTO `tb_sys_log` VALUES ('1944', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 03:40:26');
INSERT INTO `tb_sys_log` VALUES ('1945', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 03:40:27');
INSERT INTO `tb_sys_log` VALUES ('1946', '219.155.36.2', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '219.155.36.2', '2020-09-06 03:40:27');
INSERT INTO `tb_sys_log` VALUES ('1947', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 03:40:28');
INSERT INTO `tb_sys_log` VALUES ('1948', '219.155.36.2', '查询所有的科室', 'doQueryDepartmentList', '[]', '219.155.36.2', '2020-09-06 03:46:16');
INSERT INTO `tb_sys_log` VALUES ('1949', '219.155.36.2', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '219.155.36.2', '2020-09-06 03:46:18');
INSERT INTO `tb_sys_log` VALUES ('1950', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:46:28');
INSERT INTO `tb_sys_log` VALUES ('1951', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:46:33');
INSERT INTO `tb_sys_log` VALUES ('1952', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:47:41');
INSERT INTO `tb_sys_log` VALUES ('1953', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:47:46');
INSERT INTO `tb_sys_log` VALUES ('1954', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 03:55:50');
INSERT INTO `tb_sys_log` VALUES ('1955', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 03:56:12');
INSERT INTO `tb_sys_log` VALUES ('1956', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 03:56:12');
INSERT INTO `tb_sys_log` VALUES ('1957', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:04:07');
INSERT INTO `tb_sys_log` VALUES ('1958', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:04:32');
INSERT INTO `tb_sys_log` VALUES ('1959', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:04:32');
INSERT INTO `tb_sys_log` VALUES ('1960', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:07:07');
INSERT INTO `tb_sys_log` VALUES ('1961', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:07:10');
INSERT INTO `tb_sys_log` VALUES ('1962', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:07:10');
INSERT INTO `tb_sys_log` VALUES ('1963', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 04:08:57');
INSERT INTO `tb_sys_log` VALUES ('1964', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 04:08:58');
INSERT INTO `tb_sys_log` VALUES ('1965', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 04:09:00');
INSERT INTO `tb_sys_log` VALUES ('1966', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 04:09:04');
INSERT INTO `tb_sys_log` VALUES ('1967', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 04:09:04');
INSERT INTO `tb_sys_log` VALUES ('1968', '219.155.36.2', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 04:09:05');
INSERT INTO `tb_sys_log` VALUES ('1969', '219.155.36.2', '编辑单个特征的信息', 'doPutExtendAttribute', null, '219.155.36.2', '2020-09-06 04:09:08');
INSERT INTO `tb_sys_log` VALUES ('1970', '219.155.36.2', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 04:09:08');
INSERT INTO `tb_sys_log` VALUES ('1971', '219.155.36.2', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '219.155.36.2', '2020-09-06 04:09:10');
INSERT INTO `tb_sys_log` VALUES ('1972', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:09:11');
INSERT INTO `tb_sys_log` VALUES ('1973', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:09:14');
INSERT INTO `tb_sys_log` VALUES ('1974', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:09:14');
INSERT INTO `tb_sys_log` VALUES ('1975', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:09:19');
INSERT INTO `tb_sys_log` VALUES ('1976', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:09:19');
INSERT INTO `tb_sys_log` VALUES ('1977', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:15:25');
INSERT INTO `tb_sys_log` VALUES ('1978', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:16:45');
INSERT INTO `tb_sys_log` VALUES ('1979', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:16:45');
INSERT INTO `tb_sys_log` VALUES ('1980', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:17:27');
INSERT INTO `tb_sys_log` VALUES ('1981', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:17:30');
INSERT INTO `tb_sys_log` VALUES ('1982', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:17:30');
INSERT INTO `tb_sys_log` VALUES ('1983', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:17:47');
INSERT INTO `tb_sys_log` VALUES ('1984', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:17:49');
INSERT INTO `tb_sys_log` VALUES ('1985', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:17:49');
INSERT INTO `tb_sys_log` VALUES ('1986', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:19:03');
INSERT INTO `tb_sys_log` VALUES ('1987', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:19:12');
INSERT INTO `tb_sys_log` VALUES ('1988', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:19:12');
INSERT INTO `tb_sys_log` VALUES ('1989', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:21:20');
INSERT INTO `tb_sys_log` VALUES ('1990', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:21:24');
INSERT INTO `tb_sys_log` VALUES ('1991', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:21:24');
INSERT INTO `tb_sys_log` VALUES ('1992', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:26:01');
INSERT INTO `tb_sys_log` VALUES ('1993', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:26:30');
INSERT INTO `tb_sys_log` VALUES ('1994', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:26:30');
INSERT INTO `tb_sys_log` VALUES ('1995', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:28:10');
INSERT INTO `tb_sys_log` VALUES ('1996', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:28:20');
INSERT INTO `tb_sys_log` VALUES ('1997', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:28:28');
INSERT INTO `tb_sys_log` VALUES ('1998', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:28:28');
INSERT INTO `tb_sys_log` VALUES ('1999', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:30:16');
INSERT INTO `tb_sys_log` VALUES ('2000', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:42:21');
INSERT INTO `tb_sys_log` VALUES ('2001', '219.155.36.2', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '219.155.36.2', '2020-09-06 04:42:23');
INSERT INTO `tb_sys_log` VALUES ('2002', '219.155.36.2', '分页获取账户列表', 'doQueryAccountPageList', '[null,null,1]', '219.155.36.2', '2020-09-06 04:43:16');
INSERT INTO `tb_sys_log` VALUES ('2003', '219.155.36.2', '退出平台', 'loginout', '[]', '219.155.36.2', '2020-09-06 04:44:02');
INSERT INTO `tb_sys_log` VALUES ('2004', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 04:44:02');
INSERT INTO `tb_sys_log` VALUES ('2005', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:44:13');
INSERT INTO `tb_sys_log` VALUES ('2006', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:45:24');
INSERT INTO `tb_sys_log` VALUES ('2007', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 04:45:42');
INSERT INTO `tb_sys_log` VALUES ('2008', '219.155.36.2', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\",\\\"doctorId\\\":\\\"6be54dc7-3ee8-4bba-803a-e0bd3a8ea381\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '219.155.36.2', '2020-09-06 04:45:56');
INSERT INTO `tb_sys_log` VALUES ('2009', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:46:15');
INSERT INTO `tb_sys_log` VALUES ('2010', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 04:46:32');
INSERT INTO `tb_sys_log` VALUES ('2011', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 04:47:46');
INSERT INTO `tb_sys_log` VALUES ('2012', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 04:47:50');
INSERT INTO `tb_sys_log` VALUES ('2013', '219.155.36.2', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\",\\\"doctorId\\\":\\\"6be54dc7-3ee8-4bba-803a-e0bd3a8ea381\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '219.155.36.2', '2020-09-06 04:48:06');
INSERT INTO `tb_sys_log` VALUES ('2014', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 04:48:06');
INSERT INTO `tb_sys_log` VALUES ('2015', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 04:48:06');
INSERT INTO `tb_sys_log` VALUES ('2016', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 05:07:23');
INSERT INTO `tb_sys_log` VALUES ('2017', '219.155.36.2', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 05:07:28');
INSERT INTO `tb_sys_log` VALUES ('2018', '219.155.36.2', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 05:07:32');
INSERT INTO `tb_sys_log` VALUES ('2019', '219.155.36.2', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\",\\\"doctorId\\\":\\\"6be54dc7-3ee8-4bba-803a-e0bd3a8ea381\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '219.155.36.2', '2020-09-06 05:07:51');
INSERT INTO `tb_sys_log` VALUES ('2020', '219.155.36.2', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '219.155.36.2', '2020-09-06 05:07:51');
INSERT INTO `tb_sys_log` VALUES ('2021', '219.155.36.2', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '219.155.36.2', '2020-09-06 05:07:51');
INSERT INTO `tb_sys_log` VALUES ('2598', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '219.155.36.2', '2020-09-06 12:55:39');
INSERT INTO `tb_sys_log` VALUES ('2599', 'wangbo-1', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '219.155.36.2', '2020-09-06 12:55:39');
INSERT INTO `tb_sys_log` VALUES ('2600', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:57:56');
INSERT INTO `tb_sys_log` VALUES ('2601', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 12:57:56');
INSERT INTO `tb_sys_log` VALUES ('2602', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:58:06');
INSERT INTO `tb_sys_log` VALUES ('2603', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:58:47');
INSERT INTO `tb_sys_log` VALUES ('2604', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 12:58:47');
INSERT INTO `tb_sys_log` VALUES ('2605', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:58:50');
INSERT INTO `tb_sys_log` VALUES ('2606', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:59:06');
INSERT INTO `tb_sys_log` VALUES ('2607', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 12:59:06');
INSERT INTO `tb_sys_log` VALUES ('2608', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:59:12');
INSERT INTO `tb_sys_log` VALUES ('2609', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:59:18');
INSERT INTO `tb_sys_log` VALUES ('2610', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:59:27');
INSERT INTO `tb_sys_log` VALUES ('2611', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 12:59:27');
INSERT INTO `tb_sys_log` VALUES ('2612', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:59:30');
INSERT INTO `tb_sys_log` VALUES ('2613', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 12:59:33');
INSERT INTO `tb_sys_log` VALUES ('2614', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:00:10');
INSERT INTO `tb_sys_log` VALUES ('2615', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:00:10');
INSERT INTO `tb_sys_log` VALUES ('2616', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:00:12');
INSERT INTO `tb_sys_log` VALUES ('2617', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:00:16');
INSERT INTO `tb_sys_log` VALUES ('2618', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:00:21');
INSERT INTO `tb_sys_log` VALUES ('2619', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:00:32');
INSERT INTO `tb_sys_log` VALUES ('2620', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:01:10');
INSERT INTO `tb_sys_log` VALUES ('2621', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:01:10');
INSERT INTO `tb_sys_log` VALUES ('2622', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:01:12');
INSERT INTO `tb_sys_log` VALUES ('2623', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:01:14');
INSERT INTO `tb_sys_log` VALUES ('2624', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:01:16');
INSERT INTO `tb_sys_log` VALUES ('2625', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:01:46');
INSERT INTO `tb_sys_log` VALUES ('2626', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:01:46');
INSERT INTO `tb_sys_log` VALUES ('2627', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:01:52');
INSERT INTO `tb_sys_log` VALUES ('2628', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:01:55');
INSERT INTO `tb_sys_log` VALUES ('2629', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:01:56');
INSERT INTO `tb_sys_log` VALUES ('2630', 'wangbo-1', '新增特征信息', 'doPostNewExtendAttribute', null, '219.155.36.2', '2020-09-06 13:02:15');
INSERT INTO `tb_sys_log` VALUES ('2631', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:02:15');
INSERT INTO `tb_sys_log` VALUES ('2632', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '219.155.36.2', '2020-09-06 13:02:23');
INSERT INTO `tb_sys_log` VALUES ('2633', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:02:25');
INSERT INTO `tb_sys_log` VALUES ('2634', 'wangbo-1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 13:02:31');
INSERT INTO `tb_sys_log` VALUES ('2635', 'wangbo-1', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"2222\",\"1111\"]', '219.155.36.2', '2020-09-06 13:02:34');
INSERT INTO `tb_sys_log` VALUES ('2636', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:03:54');
INSERT INTO `tb_sys_log` VALUES ('2637', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:03:55');
INSERT INTO `tb_sys_log` VALUES ('2638', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '219.155.36.2', '2020-09-06 13:03:57');
INSERT INTO `tb_sys_log` VALUES ('2639', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:04:02');
INSERT INTO `tb_sys_log` VALUES ('2640', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:05:43');
INSERT INTO `tb_sys_log` VALUES ('2641', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:05:44');
INSERT INTO `tb_sys_log` VALUES ('2642', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '219.155.36.2', '2020-09-06 13:05:46');
INSERT INTO `tb_sys_log` VALUES ('2643', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:05:48');
INSERT INTO `tb_sys_log` VALUES ('2644', '127.0.0.1', '获取所有的角色', 'doQueryRoleList', '[]', '127.0.0.1', '2020-09-06 13:07:04');
INSERT INTO `tb_sys_log` VALUES ('2645', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:07:18');
INSERT INTO `tb_sys_log` VALUES ('2646', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:07:19');
INSERT INTO `tb_sys_log` VALUES ('2647', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:07:22');
INSERT INTO `tb_sys_log` VALUES ('2648', '127.0.0.1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '127.0.0.1', '2020-09-06 13:07:22');
INSERT INTO `tb_sys_log` VALUES ('2649', 'wangbo-1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 13:07:24');
INSERT INTO `tb_sys_log` VALUES ('2650', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '219.155.36.2', '2020-09-06 13:07:31');
INSERT INTO `tb_sys_log` VALUES ('2651', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:07:37');
INSERT INTO `tb_sys_log` VALUES ('2652', '223.88.82.222', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.222', '2020-09-06 13:07:38');
INSERT INTO `tb_sys_log` VALUES ('2653', '223.88.82.222', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '223.88.82.222', '2020-09-06 13:07:38');
INSERT INTO `tb_sys_log` VALUES ('2654', '223.88.82.222', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:07:40');
INSERT INTO `tb_sys_log` VALUES ('2655', '223.88.82.222', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.222', '2020-09-06 13:07:40');
INSERT INTO `tb_sys_log` VALUES ('2656', '223.88.82.222', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:07:45');
INSERT INTO `tb_sys_log` VALUES ('2657', 'wangbo-1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 13:07:48');
INSERT INTO `tb_sys_log` VALUES ('2658', '223.88.82.222', '查询单个角色信息', 'doGetRole', '[\"2\"]', '223.88.82.222', '2020-09-06 13:08:00');
INSERT INTO `tb_sys_log` VALUES ('2659', '223.88.82.222', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:08:02');
INSERT INTO `tb_sys_log` VALUES ('2660', 'wangbo-1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 13:08:39');
INSERT INTO `tb_sys_log` VALUES ('2661', 'wangbo-1', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"2222\",\"1112\"]', '219.155.36.2', '2020-09-06 13:09:18');
INSERT INTO `tb_sys_log` VALUES ('2662', 'wangbo-1', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '219.155.36.2', '2020-09-06 13:09:36');
INSERT INTO `tb_sys_log` VALUES ('2663', '223.88.82.222', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '223.88.82.222', '2020-09-06 13:09:39');
INSERT INTO `tb_sys_log` VALUES ('2664', 'wangbo-1', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"2222\",\"1113\"]', '219.155.36.2', '2020-09-06 13:09:39');
INSERT INTO `tb_sys_log` VALUES ('2665', '223.88.82.222', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '223.88.82.222', '2020-09-06 13:09:51');
INSERT INTO `tb_sys_log` VALUES ('2666', '223.88.82.222', '退出平台', 'loginout', '[]', '223.88.82.222', '2020-09-06 13:10:03');
INSERT INTO `tb_sys_log` VALUES ('2667', '223.88.82.222', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.222', '2020-09-06 13:10:03');
INSERT INTO `tb_sys_log` VALUES ('2668', '223.88.82.222', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '223.88.82.222', '2020-09-06 13:10:16');
INSERT INTO `tb_sys_log` VALUES ('2669', '223.88.82.222', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '223.88.82.222', '2020-09-06 13:10:17');
INSERT INTO `tb_sys_log` VALUES ('2670', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.222', '2020-09-06 13:10:21');
INSERT INTO `tb_sys_log` VALUES ('2671', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.222', '2020-09-06 13:10:21');
INSERT INTO `tb_sys_log` VALUES ('2672', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:10:23');
INSERT INTO `tb_sys_log` VALUES ('2673', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:10:25');
INSERT INTO `tb_sys_log` VALUES ('2674', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.222', '2020-09-06 13:10:26');
INSERT INTO `tb_sys_log` VALUES ('2675', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '223.88.82.222', '2020-09-06 13:10:26');
INSERT INTO `tb_sys_log` VALUES ('2676', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:10:28');
INSERT INTO `tb_sys_log` VALUES ('2677', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.222', '2020-09-06 13:10:28');
INSERT INTO `tb_sys_log` VALUES ('2678', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:10:31');
INSERT INTO `tb_sys_log` VALUES ('2679', 'YWJ', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"2\"]', '223.88.82.222', '2020-09-06 13:10:35');
INSERT INTO `tb_sys_log` VALUES ('2680', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:10:49');
INSERT INTO `tb_sys_log` VALUES ('2681', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:10:49');
INSERT INTO `tb_sys_log` VALUES ('2682', 'YWJ', '查询单个角色信息', 'doGetRole', '[\"1\"]', '223.88.82.222', '2020-09-06 13:10:52');
INSERT INTO `tb_sys_log` VALUES ('2683', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:10:54');
INSERT INTO `tb_sys_log` VALUES ('2684', 'YWJ', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"1\"]', '223.88.82.222', '2020-09-06 13:10:55');
INSERT INTO `tb_sys_log` VALUES ('2685', 'YWJ', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '223.88.82.222', '2020-09-06 13:11:03');
INSERT INTO `tb_sys_log` VALUES ('2686', 'YWJ', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '223.88.82.222', '2020-09-06 13:11:09');
INSERT INTO `tb_sys_log` VALUES ('2687', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:11:15');
INSERT INTO `tb_sys_log` VALUES ('2688', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.222', '2020-09-06 13:11:15');
INSERT INTO `tb_sys_log` VALUES ('2689', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"年龄\",0,10]', '223.88.82.222', '2020-09-06 13:11:24');
INSERT INTO `tb_sys_log` VALUES ('2690', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.222', '2020-09-06 13:11:28');
INSERT INTO `tb_sys_log` VALUES ('2691', '223.88.82.222', '退出平台', 'loginout', '[]', '223.88.82.222', '2020-09-06 13:11:36');
INSERT INTO `tb_sys_log` VALUES ('2692', '223.88.82.222', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.222', '2020-09-06 13:11:36');
INSERT INTO `tb_sys_log` VALUES ('2693', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.222', '2020-09-06 13:12:13');
INSERT INTO `tb_sys_log` VALUES ('2694', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.222', '2020-09-06 13:12:14');
INSERT INTO `tb_sys_log` VALUES ('2695', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.222', '2020-09-06 13:12:16');
INSERT INTO `tb_sys_log` VALUES ('2696', 'YWJ', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '223.88.82.222', '2020-09-06 13:12:18');
INSERT INTO `tb_sys_log` VALUES ('2697', 'YWJ', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"a3978911-bb70-46f9-a45a-95508aa9d9e1\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.222', '2020-09-06 13:12:21');
INSERT INTO `tb_sys_log` VALUES ('2698', 'YWJ', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '223.88.82.222', '2020-09-06 13:12:21');
INSERT INTO `tb_sys_log` VALUES ('2699', 'YWJ', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '223.88.82.222', '2020-09-06 13:12:21');
INSERT INTO `tb_sys_log` VALUES ('2700', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.88.82.222', '2020-09-06 13:13:18');
INSERT INTO `tb_sys_log` VALUES ('2701', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.222', '2020-09-06 13:13:34');
INSERT INTO `tb_sys_log` VALUES ('2702', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.222', '2020-09-06 13:13:37');
INSERT INTO `tb_sys_log` VALUES ('2703', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '223.88.82.222', '2020-09-06 13:13:37');
INSERT INTO `tb_sys_log` VALUES ('2704', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:13:38');
INSERT INTO `tb_sys_log` VALUES ('2705', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:13:39');
INSERT INTO `tb_sys_log` VALUES ('2706', '223.88.82.222', '退出平台', 'loginout', '[]', '223.88.82.222', '2020-09-06 13:13:42');
INSERT INTO `tb_sys_log` VALUES ('2707', '223.88.82.222', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.222', '2020-09-06 13:13:42');
INSERT INTO `tb_sys_log` VALUES ('2708', '223.88.82.222', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.222', '2020-09-06 13:13:44');
INSERT INTO `tb_sys_log` VALUES ('2709', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:14:13');
INSERT INTO `tb_sys_log` VALUES ('2710', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:14:13');
INSERT INTO `tb_sys_log` VALUES ('2711', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '219.155.36.2', '2020-09-06 13:14:18');
INSERT INTO `tb_sys_log` VALUES ('2712', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:14:22');
INSERT INTO `tb_sys_log` VALUES ('2713', '223.88.82.222', '登录平台', 'doPostNewApplicationResource', '[\"ZHH\",\"2\",\"123456\"]', '223.88.82.222', '2020-09-06 13:14:26');
INSERT INTO `tb_sys_log` VALUES ('2714', 'ZHH', '登录平台', 'doPostNewApplicationResource', '[\"ZHH\",\"1\",\"123456\"]', '223.88.82.222', '2020-09-06 13:14:29');
INSERT INTO `tb_sys_log` VALUES ('2715', 'ZHH', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"1\"]', '223.88.82.222', '2020-09-06 13:14:29');
INSERT INTO `tb_sys_log` VALUES ('2716', 'ZHH', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.222', '2020-09-06 13:14:33');
INSERT INTO `tb_sys_log` VALUES ('2717', 'ZHH', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"412888199402021236\",\"\",1]', '223.88.82.222', '2020-09-06 13:14:37');
INSERT INTO `tb_sys_log` VALUES ('2718', 'ZHH', '编辑病人信息', 'doPutPatientInfo', '[\"c5a736e7-05d8-44c5-a01d-a3ce148bf41e\",\"{\\\"name\\\":\\\"王大雷2\\\",\\\"postId\\\":\\\"412888199402021236\\\",\\\"sex\\\":\\\"1\\\",\\\"medicalHistory\\\":\\\"阿迪\\\",\\\"uuid\\\":\\\"c5a736e7-05d8-44c5-a01d-a3ce148bf41e\\\"}\"]', '223.88.82.222', '2020-09-06 13:14:40');
INSERT INTO `tb_sys_log` VALUES ('2719', 'ZHH', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.222', '2020-09-06 13:14:41');
INSERT INTO `tb_sys_log` VALUES ('2720', 'ZHH', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"412888199402021236\",\"\",1]', '223.88.82.222', '2020-09-06 13:14:42');
INSERT INTO `tb_sys_log` VALUES ('2721', 'ZHH', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"c5a736e7-05d8-44c5-a01d-a3ce148bf41e\\\",\\\"doctorId\\\":\\\"974d725c-daba-4555-bad2-c07375600862\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.222', '2020-09-06 13:14:43');
INSERT INTO `tb_sys_log` VALUES ('2722', 'ZHH', '查询所有的疾病', 'doQueryDiseaseList', '[\"1113\"]', '223.88.82.222', '2020-09-06 13:14:43');
INSERT INTO `tb_sys_log` VALUES ('2723', 'ZHH', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1113\",null]', '223.88.82.222', '2020-09-06 13:14:43');
INSERT INTO `tb_sys_log` VALUES ('2724', 'ZHH', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"412888199402021236\",\"\",1]', '223.88.82.222', '2020-09-06 13:14:57');
INSERT INTO `tb_sys_log` VALUES ('2725', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:14:57');
INSERT INTO `tb_sys_log` VALUES ('2726', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:14:58');
INSERT INTO `tb_sys_log` VALUES ('2727', 'ZHH', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"c5a736e7-05d8-44c5-a01d-a3ce148bf41e\\\",\\\"doctorId\\\":\\\"974d725c-daba-4555-bad2-c07375600862\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.222', '2020-09-06 13:14:59');
INSERT INTO `tb_sys_log` VALUES ('2728', 'ZHH', '查询所有的疾病', 'doQueryDiseaseList', '[\"1113\"]', '223.88.82.222', '2020-09-06 13:15:00');
INSERT INTO `tb_sys_log` VALUES ('2729', 'ZHH', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1113\",null]', '223.88.82.222', '2020-09-06 13:15:00');
INSERT INTO `tb_sys_log` VALUES ('2730', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '219.155.36.2', '2020-09-06 13:15:04');
INSERT INTO `tb_sys_log` VALUES ('2731', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:15:06');
INSERT INTO `tb_sys_log` VALUES ('2732', 'ZHH', '获取诊断结果', 'doQueryDiagnosticFeatureList', '[\"675bd040-5f07-439a-8434-5ebc1b7ac52b\",\"1113\",\"[{\\\"FidIn\\\":\\\"2222\\\",\\\"Value\\\":\\\"2123123123\\\"}]\"]', '223.88.82.222', '2020-09-06 13:15:27');
INSERT INTO `tb_sys_log` VALUES ('2733', 'ZHH', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:15:37');
INSERT INTO `tb_sys_log` VALUES ('2734', 'ZHH', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.222', '2020-09-06 13:15:41');
INSERT INTO `tb_sys_log` VALUES ('2735', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:15:46');
INSERT INTO `tb_sys_log` VALUES ('2736', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:15:46');
INSERT INTO `tb_sys_log` VALUES ('2737', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '219.155.36.2', '2020-09-06 13:15:49');
INSERT INTO `tb_sys_log` VALUES ('2738', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:15:51');
INSERT INTO `tb_sys_log` VALUES ('2739', 'wangbo-1', '删除科室特征信息', 'doDeleteDepartmentFeature2', '[\"2222\",\"1113\"]', '219.155.36.2', '2020-09-06 13:15:53');
INSERT INTO `tb_sys_log` VALUES ('2740', 'ZHH', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.222', '2020-09-06 13:16:04');
INSERT INTO `tb_sys_log` VALUES ('2741', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:16:10');
INSERT INTO `tb_sys_log` VALUES ('2742', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '219.155.36.2', '2020-09-06 13:16:11');
INSERT INTO `tb_sys_log` VALUES ('2743', 'wangbo-1', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '219.155.36.2', '2020-09-06 13:16:13');
INSERT INTO `tb_sys_log` VALUES ('2744', 'wangbo-1', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '219.155.36.2', '2020-09-06 13:16:15');
INSERT INTO `tb_sys_log` VALUES ('2745', 'wangbo-1', '删除科室特征信息', 'doDeleteDepartmentFeature2', '[\"2222\",\"1112\"]', '219.155.36.2', '2020-09-06 13:16:17');
INSERT INTO `tb_sys_log` VALUES ('2746', 'ZHH', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '223.88.82.222', '2020-09-06 13:16:17');
INSERT INTO `tb_sys_log` VALUES ('2747', 'wangbo-1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 13:16:21');
INSERT INTO `tb_sys_log` VALUES ('2748', 'ZHH', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"018666ed-c957-4b40-a4a9-1a652d6cc54f\\\",\\\"doctorId\\\":\\\"974d725c-daba-4555-bad2-c07375600862\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.222', '2020-09-06 13:16:23');
INSERT INTO `tb_sys_log` VALUES ('2749', 'ZHH', '查询所有的疾病', 'doQueryDiseaseList', '[\"1113\"]', '223.88.82.222', '2020-09-06 13:16:23');
INSERT INTO `tb_sys_log` VALUES ('2750', 'ZHH', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '223.88.82.222', '2020-09-06 13:16:30');
INSERT INTO `tb_sys_log` VALUES ('2751', 'ZHH', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"03e6a22d-7233-44b3-a199-18abfdc0d7c9\\\",\\\"doctorId\\\":\\\"974d725c-daba-4555-bad2-c07375600862\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.222', '2020-09-06 13:16:31');
INSERT INTO `tb_sys_log` VALUES ('2752', 'ZHH', '查询所有的疾病', 'doQueryDiseaseList', '[\"1113\"]', '223.88.82.222', '2020-09-06 13:16:31');
INSERT INTO `tb_sys_log` VALUES ('2753', 'wangbo-1', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 13:16:33');
INSERT INTO `tb_sys_log` VALUES ('2754', 'ZHH', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '223.88.82.222', '2020-09-06 13:16:40');
INSERT INTO `tb_sys_log` VALUES ('2755', 'wangbo-1', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",2]', '219.155.36.2', '2020-09-06 13:17:20');
INSERT INTO `tb_sys_log` VALUES ('2756', 'wangbo-1', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",1]', '219.155.36.2', '2020-09-06 13:17:22');
INSERT INTO `tb_sys_log` VALUES ('2757', 'wangbo-1', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111512\",\"\",2]', '219.155.36.2', '2020-09-06 13:17:23');
INSERT INTO `tb_sys_log` VALUES ('2758', 'wangbo-1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 13:20:12');
INSERT INTO `tb_sys_log` VALUES ('2759', 'wangbo-1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 13:21:44');
INSERT INTO `tb_sys_log` VALUES ('2760', 'wangbo-1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 13:22:18');
INSERT INTO `tb_sys_log` VALUES ('2761', 'wangbo-1', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '219.155.36.2', '2020-09-06 13:22:54');
INSERT INTO `tb_sys_log` VALUES ('2762', 'wangbo-1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '219.155.36.2', '2020-09-06 13:23:16');
INSERT INTO `tb_sys_log` VALUES ('2763', 'wangbo-1', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '219.155.36.2', '2020-09-06 13:23:42');
INSERT INTO `tb_sys_log` VALUES ('2764', 'wangbo-1', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"2\"]', '219.155.36.2', '2020-09-06 13:23:59');
INSERT INTO `tb_sys_log` VALUES ('2765', '219.155.36.2', '退出平台', 'loginout', '[]', '219.155.36.2', '2020-09-06 13:24:05');
INSERT INTO `tb_sys_log` VALUES ('2766', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-06 13:24:05');
INSERT INTO `tb_sys_log` VALUES ('2767', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '219.155.36.2', '2020-09-06 13:24:15');
INSERT INTO `tb_sys_log` VALUES ('2768', 'wangbo-1', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '219.155.36.2', '2020-09-06 13:24:15');
INSERT INTO `tb_sys_log` VALUES ('2769', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:24:17');
INSERT INTO `tb_sys_log` VALUES ('2770', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:25:31');
INSERT INTO `tb_sys_log` VALUES ('2771', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:26:09');
INSERT INTO `tb_sys_log` VALUES ('2772', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:26:49');
INSERT INTO `tb_sys_log` VALUES ('2773', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:27:12');
INSERT INTO `tb_sys_log` VALUES ('2774', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:30:59');
INSERT INTO `tb_sys_log` VALUES ('2775', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:31:02');
INSERT INTO `tb_sys_log` VALUES ('2776', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:31:07');
INSERT INTO `tb_sys_log` VALUES ('2777', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:31:38');
INSERT INTO `tb_sys_log` VALUES ('2778', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:32:13');
INSERT INTO `tb_sys_log` VALUES ('2779', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:32:32');
INSERT INTO `tb_sys_log` VALUES ('2780', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:33:03');
INSERT INTO `tb_sys_log` VALUES ('2781', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:33:28');
INSERT INTO `tb_sys_log` VALUES ('2782', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:33:36');
INSERT INTO `tb_sys_log` VALUES ('2783', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[null,null,\"\",1]', '219.155.36.2', '2020-09-06 13:34:22');
INSERT INTO `tb_sys_log` VALUES ('2784', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"0\",\"\",\"\",1]', '219.155.36.2', '2020-09-06 13:35:00');
INSERT INTO `tb_sys_log` VALUES ('2785', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '219.155.36.2', '2020-09-06 13:35:05');
INSERT INTO `tb_sys_log` VALUES ('2786', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '219.155.36.2', '2020-09-06 13:35:37');
INSERT INTO `tb_sys_log` VALUES ('2787', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"2020-09-01 00:00:00\",\"2020-09-10 00:00:00\",\"\",1]', '219.155.36.2', '2020-09-06 13:35:49');
INSERT INTO `tb_sys_log` VALUES ('2788', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '219.155.36.2', '2020-09-06 13:37:20');
INSERT INTO `tb_sys_log` VALUES ('2789', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '219.155.36.2', '2020-09-06 13:37:45');
INSERT INTO `tb_sys_log` VALUES ('2790', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",2]', '219.155.36.2', '2020-09-06 13:37:58');
INSERT INTO `tb_sys_log` VALUES ('2791', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",3]', '219.155.36.2', '2020-09-06 13:38:01');
INSERT INTO `tb_sys_log` VALUES ('2792', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",4]', '219.155.36.2', '2020-09-06 13:38:08');
INSERT INTO `tb_sys_log` VALUES ('2793', 'wangbo-1', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '219.155.36.2', '2020-09-06 13:38:14');
INSERT INTO `tb_sys_log` VALUES ('2794', 'wangbo-1', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '219.155.36.2', '2020-09-06 13:38:15');
INSERT INTO `tb_sys_log` VALUES ('2795', '223.88.82.222', '退出平台', 'loginout', '[]', '223.88.82.222', '2020-09-06 13:43:58');
INSERT INTO `tb_sys_log` VALUES ('2796', '223.88.82.222', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.222', '2020-09-06 13:43:58');
INSERT INTO `tb_sys_log` VALUES ('2797', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.222', '2020-09-06 13:44:14');
INSERT INTO `tb_sys_log` VALUES ('2798', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.222', '2020-09-06 13:44:14');
INSERT INTO `tb_sys_log` VALUES ('2799', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:44:17');
INSERT INTO `tb_sys_log` VALUES ('2800', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:44:24');
INSERT INTO `tb_sys_log` VALUES ('2801', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.222', '2020-09-06 13:44:26');
INSERT INTO `tb_sys_log` VALUES ('2802', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '223.88.82.222', '2020-09-06 13:44:27');
INSERT INTO `tb_sys_log` VALUES ('2803', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:44:29');
INSERT INTO `tb_sys_log` VALUES ('2804', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.222', '2020-09-06 13:44:29');
INSERT INTO `tb_sys_log` VALUES ('2805', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:44:56');
INSERT INTO `tb_sys_log` VALUES ('2806', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.222', '2020-09-06 13:44:56');
INSERT INTO `tb_sys_log` VALUES ('2807', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:45:00');
INSERT INTO `tb_sys_log` VALUES ('2808', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:45:06');
INSERT INTO `tb_sys_log` VALUES ('2809', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:45:11');
INSERT INTO `tb_sys_log` VALUES ('2810', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:45:15');
INSERT INTO `tb_sys_log` VALUES ('2811', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:45:21');
INSERT INTO `tb_sys_log` VALUES ('2812', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:45:23');
INSERT INTO `tb_sys_log` VALUES ('2813', 'YWJ', '新增输入特征下的科室', 'doPostNewDepartmentFeatureInfo2', '[\"c6e8e525-389d-47de-89c4-0ebe35ae0302\",\"1112,1113\"]', '223.88.82.222', '2020-09-06 13:45:30');
INSERT INTO `tb_sys_log` VALUES ('2814', 'YWJ', '编辑单个特征的信息', 'doPutExtendAttribute', null, '223.88.82.222', '2020-09-06 13:45:31');
INSERT INTO `tb_sys_log` VALUES ('2815', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.222', '2020-09-06 13:45:32');
INSERT INTO `tb_sys_log` VALUES ('2816', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:45:48');
INSERT INTO `tb_sys_log` VALUES ('2817', 'YWJ', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"2\"]', '223.88.82.222', '2020-09-06 13:45:51');
INSERT INTO `tb_sys_log` VALUES ('2818', 'YWJ', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '223.88.82.222', '2020-09-06 13:46:30');
INSERT INTO `tb_sys_log` VALUES ('2819', '223.88.82.222', '退出平台', 'loginout', '[]', '223.88.82.222', '2020-09-06 13:48:18');
INSERT INTO `tb_sys_log` VALUES ('2820', '223.88.82.222', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.222', '2020-09-06 13:48:18');
INSERT INTO `tb_sys_log` VALUES ('2821', 'admin', '登录平台', 'doPostNewApplicationResource', '[\"admin\",\"1\",\"admin\"]', '223.88.82.222', '2020-09-06 13:48:29');
INSERT INTO `tb_sys_log` VALUES ('2822', 'admin', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"1\"]', '223.88.82.222', '2020-09-06 13:48:30');
INSERT INTO `tb_sys_log` VALUES ('2823', '223.88.82.222', '退出平台', 'loginout', '[]', '223.88.82.222', '2020-09-06 13:48:33');
INSERT INTO `tb_sys_log` VALUES ('2824', '223.88.82.222', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.222', '2020-09-06 13:48:33');
INSERT INTO `tb_sys_log` VALUES ('2825', 'admin', '登录平台', 'doPostNewApplicationResource', '[\"admin\",\"2\",\"admin\"]', '223.88.82.222', '2020-09-06 13:48:40');
INSERT INTO `tb_sys_log` VALUES ('2826', 'admin', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.222', '2020-09-06 13:48:41');
INSERT INTO `tb_sys_log` VALUES ('2827', 'admin', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '223.88.82.222', '2020-09-06 13:48:45');
INSERT INTO `tb_sys_log` VALUES ('2828', 'admin', '查询操作日志', 'doQuerySysLogList', '[\"2020-09-01 00:00:00\",\"2020-10-01 00:00:00\",\"\",1]', '223.88.82.222', '2020-09-06 13:49:19');
INSERT INTO `tb_sys_log` VALUES ('2829', '223.88.82.222', '退出平台', 'loginout', '[]', '223.88.82.222', '2020-09-06 13:50:12');
INSERT INTO `tb_sys_log` VALUES ('2830', '223.88.82.222', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.222', '2020-09-06 13:50:13');
INSERT INTO `tb_sys_log` VALUES ('2831', '223.88.82.222', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '223.88.82.222', '2020-09-06 13:53:43');
INSERT INTO `tb_sys_log` VALUES ('2832', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.222', '2020-09-06 13:53:45');
INSERT INTO `tb_sys_log` VALUES ('2833', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.222', '2020-09-06 13:53:45');
INSERT INTO `tb_sys_log` VALUES ('2834', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '223.88.82.222', '2020-09-06 13:53:48');
INSERT INTO `tb_sys_log` VALUES ('2835', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",2]', '223.88.82.222', '2020-09-06 13:53:51');
INSERT INTO `tb_sys_log` VALUES ('2836', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",3]', '223.88.82.222', '2020-09-06 13:53:53');
INSERT INTO `tb_sys_log` VALUES ('2837', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",5]', '223.88.82.222', '2020-09-06 13:53:55');
INSERT INTO `tb_sys_log` VALUES ('2838', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",7]', '223.88.82.222', '2020-09-06 13:53:58');
INSERT INTO `tb_sys_log` VALUES ('2839', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '223.88.82.222', '2020-09-06 13:54:00');
INSERT INTO `tb_sys_log` VALUES ('2840', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",2]', '223.88.82.222', '2020-09-06 13:54:01');
INSERT INTO `tb_sys_log` VALUES ('2841', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",3]', '223.88.82.222', '2020-09-06 13:54:02');
INSERT INTO `tb_sys_log` VALUES ('2842', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",4]', '223.88.82.222', '2020-09-06 13:54:02');
INSERT INTO `tb_sys_log` VALUES ('2843', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",5]', '223.88.82.222', '2020-09-06 13:54:03');
INSERT INTO `tb_sys_log` VALUES ('2844', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",6]', '223.88.82.222', '2020-09-06 13:54:04');
INSERT INTO `tb_sys_log` VALUES ('2845', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",7]', '223.88.82.222', '2020-09-06 13:54:06');
INSERT INTO `tb_sys_log` VALUES ('2846', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",9]', '223.88.82.222', '2020-09-06 13:54:07');
INSERT INTO `tb_sys_log` VALUES ('2847', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",14]', '223.88.82.222', '2020-09-06 13:54:08');
INSERT INTO `tb_sys_log` VALUES ('2848', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '223.88.82.222', '2020-09-06 13:54:13');
INSERT INTO `tb_sys_log` VALUES ('2849', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",4]', '223.88.82.222', '2020-09-06 13:54:16');
INSERT INTO `tb_sys_log` VALUES ('2850', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",5]', '223.88.82.222', '2020-09-06 13:54:18');
INSERT INTO `tb_sys_log` VALUES ('2851', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",7]', '223.88.82.222', '2020-09-06 13:54:20');
INSERT INTO `tb_sys_log` VALUES ('2852', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:26');
INSERT INTO `tb_sys_log` VALUES ('2853', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:27');
INSERT INTO `tb_sys_log` VALUES ('2854', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:28');
INSERT INTO `tb_sys_log` VALUES ('2855', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:29');
INSERT INTO `tb_sys_log` VALUES ('2856', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:30');
INSERT INTO `tb_sys_log` VALUES ('2857', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:32');
INSERT INTO `tb_sys_log` VALUES ('2858', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:33');
INSERT INTO `tb_sys_log` VALUES ('2859', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:33');
INSERT INTO `tb_sys_log` VALUES ('2860', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:33');
INSERT INTO `tb_sys_log` VALUES ('2861', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:33');
INSERT INTO `tb_sys_log` VALUES ('2862', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:33');
INSERT INTO `tb_sys_log` VALUES ('2863', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:34');
INSERT INTO `tb_sys_log` VALUES ('2864', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:34');
INSERT INTO `tb_sys_log` VALUES ('2865', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:34');
INSERT INTO `tb_sys_log` VALUES ('2866', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:35');
INSERT INTO `tb_sys_log` VALUES ('2867', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录平台\",1]', '223.88.82.222', '2020-09-06 13:54:35');
INSERT INTO `tb_sys_log` VALUES ('2868', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.222', '2020-09-06 13:54:37');
INSERT INTO `tb_sys_log` VALUES ('2869', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '223.88.82.222', '2020-09-06 13:54:40');
INSERT INTO `tb_sys_log` VALUES ('2870', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\\t 编辑科室\",1]', '223.88.82.222', '2020-09-06 13:54:45');
INSERT INTO `tb_sys_log` VALUES ('2871', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"编辑科室\",1]', '223.88.82.222', '2020-09-06 13:54:49');
INSERT INTO `tb_sys_log` VALUES ('2872', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"编辑科室\",2]', '223.88.82.222', '2020-09-06 13:54:51');
INSERT INTO `tb_sys_log` VALUES ('2873', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录\",1]', '223.88.82.222', '2020-09-06 13:55:09');
INSERT INTO `tb_sys_log` VALUES ('2874', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录\",8]', '223.88.82.222', '2020-09-06 13:55:11');
INSERT INTO `tb_sys_log` VALUES ('2875', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录\",1]', '223.88.82.222', '2020-09-06 13:55:13');
INSERT INTO `tb_sys_log` VALUES ('2876', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录\",2]', '223.88.82.222', '2020-09-06 13:55:15');
INSERT INTO `tb_sys_log` VALUES ('2877', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录\",3]', '223.88.82.222', '2020-09-06 13:55:16');
INSERT INTO `tb_sys_log` VALUES ('2878', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"登录\",4]', '223.88.82.222', '2020-09-06 13:55:17');
INSERT INTO `tb_sys_log` VALUES ('2879', '223.88.82.222', '退出平台', 'loginout', '[]', '223.88.82.222', '2020-09-06 13:55:33');
INSERT INTO `tb_sys_log` VALUES ('2880', '223.88.82.222', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.222', '2020-09-06 13:55:33');
INSERT INTO `tb_sys_log` VALUES ('2881', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.222', '2020-09-06 13:57:35');
INSERT INTO `tb_sys_log` VALUES ('2882', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.222', '2020-09-06 13:57:35');
INSERT INTO `tb_sys_log` VALUES ('2883', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.222', '2020-09-06 13:57:38');
INSERT INTO `tb_sys_log` VALUES ('2884', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.222', '2020-09-06 13:57:39');
INSERT INTO `tb_sys_log` VALUES ('2885', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.222', '2020-09-06 13:57:39');
INSERT INTO `tb_sys_log` VALUES ('2886', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:57:41');
INSERT INTO `tb_sys_log` VALUES ('2887', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.222', '2020-09-06 13:57:42');
INSERT INTO `tb_sys_log` VALUES ('2888', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '223.88.82.222', '2020-09-06 13:57:42');
INSERT INTO `tb_sys_log` VALUES ('2889', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.222', '2020-09-06 13:57:44');
INSERT INTO `tb_sys_log` VALUES ('2890', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.222', '2020-09-06 13:57:45');
INSERT INTO `tb_sys_log` VALUES ('2891', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '223.88.82.222', '2020-09-06 13:57:46');
INSERT INTO `tb_sys_log` VALUES ('2892', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",2]', '223.88.82.222', '2020-09-06 13:57:49');
INSERT INTO `tb_sys_log` VALUES ('2893', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",3]', '223.88.82.222', '2020-09-06 13:57:50');
INSERT INTO `tb_sys_log` VALUES ('2894', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",4]', '223.88.82.222', '2020-09-06 13:57:51');
INSERT INTO `tb_sys_log` VALUES ('2895', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",5]', '223.88.82.222', '2020-09-06 13:57:52');
INSERT INTO `tb_sys_log` VALUES ('2896', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",6]', '223.88.82.222', '2020-09-06 13:57:52');
INSERT INTO `tb_sys_log` VALUES ('2897', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",8]', '223.88.82.222', '2020-09-06 13:57:53');
INSERT INTO `tb_sys_log` VALUES ('2898', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",9]', '223.88.82.222', '2020-09-06 13:57:53');
INSERT INTO `tb_sys_log` VALUES ('2899', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '223.88.82.222', '2020-09-06 13:57:55');
INSERT INTO `tb_sys_log` VALUES ('2900', '60.191.32.71', '获取所有的角色', 'doQueryRoleList', '[]', '60.191.32.71', '2020-09-07 01:01:47');
INSERT INTO `tb_sys_log` VALUES ('2901', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '60.191.32.71', '2020-09-07 01:02:05');
INSERT INTO `tb_sys_log` VALUES ('2902', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '60.191.32.71', '2020-09-07 01:02:05');
INSERT INTO `tb_sys_log` VALUES ('2903', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '60.191.32.71', '2020-09-07 01:02:11');
INSERT INTO `tb_sys_log` VALUES ('2904', 'YWJ', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '60.191.32.71', '2020-09-07 01:02:19');
INSERT INTO `tb_sys_log` VALUES ('2905', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-07 01:02:33');
INSERT INTO `tb_sys_log` VALUES ('2906', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-07 01:02:33');
INSERT INTO `tb_sys_log` VALUES ('2907', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '60.191.32.71', '2020-09-07 01:02:40');
INSERT INTO `tb_sys_log` VALUES ('2908', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '60.191.32.71', '2020-09-07 01:02:45');
INSERT INTO `tb_sys_log` VALUES ('2909', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '60.191.32.71', '2020-09-07 01:02:45');
INSERT INTO `tb_sys_log` VALUES ('2910', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '60.191.32.71', '2020-09-07 01:02:53');
INSERT INTO `tb_sys_log` VALUES ('2911', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '60.191.32.71', '2020-09-07 01:02:55');
INSERT INTO `tb_sys_log` VALUES ('2912', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '60.191.32.71', '2020-09-07 01:02:59');
INSERT INTO `tb_sys_log` VALUES ('2913', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '60.191.32.71', '2020-09-07 01:03:03');
INSERT INTO `tb_sys_log` VALUES ('2914', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-07 01:03:06');
INSERT INTO `tb_sys_log` VALUES ('2915', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-07 01:03:06');
INSERT INTO `tb_sys_log` VALUES ('2916', '60.191.32.71', '退出平台', 'loginout', '[]', '60.191.32.71', '2020-09-07 01:03:14');
INSERT INTO `tb_sys_log` VALUES ('2917', '60.191.32.71', '获取所有的角色', 'doQueryRoleList', '[]', '60.191.32.71', '2020-09-07 01:03:14');
INSERT INTO `tb_sys_log` VALUES ('2918', '60.191.32.71', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '60.191.32.71', '2020-09-07 01:03:22');
INSERT INTO `tb_sys_log` VALUES ('2919', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '60.191.32.71', '2020-09-07 01:03:27');
INSERT INTO `tb_sys_log` VALUES ('2920', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '60.191.32.71', '2020-09-07 01:03:27');
INSERT INTO `tb_sys_log` VALUES ('2921', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '60.191.32.71', '2020-09-07 01:03:30');
INSERT INTO `tb_sys_log` VALUES ('2922', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '60.191.32.71', '2020-09-07 01:03:33');
INSERT INTO `tb_sys_log` VALUES ('2923', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '60.191.32.71', '2020-09-07 01:03:39');
INSERT INTO `tb_sys_log` VALUES ('2924', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '60.191.32.71', '2020-09-07 01:03:51');
INSERT INTO `tb_sys_log` VALUES ('2925', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '60.191.32.71', '2020-09-07 01:04:08');
INSERT INTO `tb_sys_log` VALUES ('2926', 'YWJ', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"1\"]', '60.191.32.71', '2020-09-07 01:04:12');
INSERT INTO `tb_sys_log` VALUES ('2927', 'YWJ', '查询单个角色信息', 'doGetRole', '[\"1\"]', '60.191.32.71', '2020-09-07 01:04:15');
INSERT INTO `tb_sys_log` VALUES ('2928', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '60.191.32.71', '2020-09-07 01:04:18');
INSERT INTO `tb_sys_log` VALUES ('2929', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '60.191.32.71', '2020-09-07 01:04:21');
INSERT INTO `tb_sys_log` VALUES ('2930', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '60.191.32.71', '2020-09-07 01:04:25');
INSERT INTO `tb_sys_log` VALUES ('2931', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '60.191.32.71', '2020-09-07 01:04:32');
INSERT INTO `tb_sys_log` VALUES ('2932', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-07 01:04:40');
INSERT INTO `tb_sys_log` VALUES ('2933', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-07 01:04:40');
INSERT INTO `tb_sys_log` VALUES ('2934', '219.155.36.2', '获取所有的角色', 'doQueryRoleList', '[]', '219.155.36.2', '2020-09-07 12:55:03');
INSERT INTO `tb_sys_log` VALUES ('2935', 'wangbo-1', '登录平台', 'doPostNewApplicationResource', '[\"wangbo-1\",\"2\",\"111111\"]', '219.155.36.2', '2020-09-07 12:55:14');
INSERT INTO `tb_sys_log` VALUES ('2936', 'wangbo-1', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '219.155.36.2', '2020-09-07 12:55:14');
INSERT INTO `tb_sys_log` VALUES ('2937', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '219.155.36.2', '2020-09-07 12:55:16');
INSERT INTO `tb_sys_log` VALUES ('2938', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '219.155.36.2', '2020-09-07 12:56:41');
INSERT INTO `tb_sys_log` VALUES ('2939', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '219.155.36.2', '2020-09-07 12:58:52');
INSERT INTO `tb_sys_log` VALUES ('2940', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '219.155.36.2', '2020-09-07 12:59:23');
INSERT INTO `tb_sys_log` VALUES ('2941', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",235]', '219.155.36.2', '2020-09-07 12:59:29');
INSERT INTO `tb_sys_log` VALUES ('2942', 'wangbo-1', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",234]', '219.155.36.2', '2020-09-07 12:59:33');
INSERT INTO `tb_sys_log` VALUES ('2943', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-09-08 01:18:33');
INSERT INTO `tb_sys_log` VALUES ('2944', '117.158.214.185', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-09-08 01:23:19');
INSERT INTO `tb_sys_log` VALUES ('2945', '60.191.32.71', '获取所有的角色', 'doQueryRoleList', '[]', '60.191.32.71', '2020-09-09 03:30:05');
INSERT INTO `tb_sys_log` VALUES ('2946', '60.191.32.71', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"12345\"]', '60.191.32.71', '2020-09-09 03:30:18');
INSERT INTO `tb_sys_log` VALUES ('2947', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '60.191.32.71', '2020-09-09 03:30:21');
INSERT INTO `tb_sys_log` VALUES ('2948', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '60.191.32.71', '2020-09-09 03:30:21');
INSERT INTO `tb_sys_log` VALUES ('2949', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '60.191.32.71', '2020-09-09 03:30:24');
INSERT INTO `tb_sys_log` VALUES ('2950', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 03:30:27');
INSERT INTO `tb_sys_log` VALUES ('2951', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 03:30:27');
INSERT INTO `tb_sys_log` VALUES ('2952', 'YWJ', '启用/禁用特征', 'doPutExtendAttributeState', '[\"c6e8e525-389d-47de-89c4-0ebe35ae0302\",0]', '60.191.32.71', '2020-09-09 03:30:48');
INSERT INTO `tb_sys_log` VALUES ('2953', 'YWJ', '启用/禁用特征', 'doPutExtendAttributeState', '[\"c6e8e525-389d-47de-89c4-0ebe35ae0302\",1]', '60.191.32.71', '2020-09-09 03:30:49');
INSERT INTO `tb_sys_log` VALUES ('2954', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 03:30:50');
INSERT INTO `tb_sys_log` VALUES ('2955', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '60.191.32.71', '2020-09-09 03:31:05');
INSERT INTO `tb_sys_log` VALUES ('2956', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '60.191.32.71', '2020-09-09 03:31:15');
INSERT INTO `tb_sys_log` VALUES ('2957', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '60.191.32.71', '2020-09-09 03:31:15');
INSERT INTO `tb_sys_log` VALUES ('2958', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '60.191.32.71', '2020-09-09 03:31:22');
INSERT INTO `tb_sys_log` VALUES ('2959', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '60.191.32.71', '2020-09-09 03:31:23');
INSERT INTO `tb_sys_log` VALUES ('2960', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '60.191.32.71', '2020-09-09 03:31:23');
INSERT INTO `tb_sys_log` VALUES ('2961', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '60.191.32.71', '2020-09-09 03:31:39');
INSERT INTO `tb_sys_log` VALUES ('2962', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '60.191.32.71', '2020-09-09 03:31:40');
INSERT INTO `tb_sys_log` VALUES ('2963', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '60.191.32.71', '2020-09-09 03:31:41');
INSERT INTO `tb_sys_log` VALUES ('2964', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,null]', '60.191.32.71', '2020-09-09 03:33:57');
INSERT INTO `tb_sys_log` VALUES ('2965', '60.191.32.71', '分页获取病人列表', 'doQueryPatientPageList', '[1,null]', '60.191.32.71', '2020-09-09 03:34:54');
INSERT INTO `tb_sys_log` VALUES ('2966', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '60.191.32.71', '2020-09-09 03:35:31');
INSERT INTO `tb_sys_log` VALUES ('2967', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[2,null]', '60.191.32.71', '2020-09-09 03:36:19');
INSERT INTO `tb_sys_log` VALUES ('2968', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 03:38:13');
INSERT INTO `tb_sys_log` VALUES ('2969', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 03:38:13');
INSERT INTO `tb_sys_log` VALUES ('2970', 'YWJ', '获取所有的角色', 'doQueryRoleList', '[]', '60.191.32.71', '2020-09-09 03:39:54');
INSERT INTO `tb_sys_log` VALUES ('2971', 'YWJ', '获取所有的角色', 'doQueryRoleList', '[]', '60.191.32.71', '2020-09-09 03:40:48');
INSERT INTO `tb_sys_log` VALUES ('2972', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '60.191.32.71', '2020-09-09 03:40:56');
INSERT INTO `tb_sys_log` VALUES ('2973', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '60.191.32.71', '2020-09-09 03:40:56');
INSERT INTO `tb_sys_log` VALUES ('2974', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '60.191.32.71', '2020-09-09 03:40:58');
INSERT INTO `tb_sys_log` VALUES ('2975', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 03:40:58');
INSERT INTO `tb_sys_log` VALUES ('2976', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 03:40:58');
INSERT INTO `tb_sys_log` VALUES ('2977', '60.191.32.71', '获取所有的角色', 'doQueryRoleList', '[]', '60.191.32.71', '2020-09-09 05:41:26');
INSERT INTO `tb_sys_log` VALUES ('2978', '60.191.32.71', '获取所有的角色', 'doQueryRoleList', '[]', '60.191.32.71', '2020-09-09 05:41:44');
INSERT INTO `tb_sys_log` VALUES ('2979', '60.191.32.71', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"1\",\"123456\"]', '60.191.32.71', '2020-09-09 05:42:03');
INSERT INTO `tb_sys_log` VALUES ('2980', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '60.191.32.71', '2020-09-09 05:42:07');
INSERT INTO `tb_sys_log` VALUES ('2981', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '60.191.32.71', '2020-09-09 05:42:07');
INSERT INTO `tb_sys_log` VALUES ('2982', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '60.191.32.71', '2020-09-09 05:42:12');
INSERT INTO `tb_sys_log` VALUES ('2983', 'YWJ', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '60.191.32.71', '2020-09-09 05:42:16');
INSERT INTO `tb_sys_log` VALUES ('2984', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:42:23');
INSERT INTO `tb_sys_log` VALUES ('2985', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 05:42:24');
INSERT INTO `tb_sys_log` VALUES ('2986', 'YWJ', '启用/禁用特征', 'doPutExtendAttributeState', '[\"c6e8e525-389d-47de-89c4-0ebe35ae0302\",0]', '60.191.32.71', '2020-09-09 05:42:32');
INSERT INTO `tb_sys_log` VALUES ('2987', 'YWJ', '启用/禁用特征', 'doPutExtendAttributeState', '[\"c6e8e525-389d-47de-89c4-0ebe35ae0302\",1]', '60.191.32.71', '2020-09-09 05:42:34');
INSERT INTO `tb_sys_log` VALUES ('2988', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:42:40');
INSERT INTO `tb_sys_log` VALUES ('2989', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:43:01');
INSERT INTO `tb_sys_log` VALUES ('2990', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '60.191.32.71', '2020-09-09 05:43:14');
INSERT INTO `tb_sys_log` VALUES ('2991', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:43:24');
INSERT INTO `tb_sys_log` VALUES ('2992', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '60.191.32.71', '2020-09-09 05:43:30');
INSERT INTO `tb_sys_log` VALUES ('2993', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '60.191.32.71', '2020-09-09 05:43:37');
INSERT INTO `tb_sys_log` VALUES ('2994', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '60.191.32.71', '2020-09-09 05:43:37');
INSERT INTO `tb_sys_log` VALUES ('2995', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '60.191.32.71', '2020-09-09 05:43:49');
INSERT INTO `tb_sys_log` VALUES ('2996', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '60.191.32.71', '2020-09-09 05:43:52');
INSERT INTO `tb_sys_log` VALUES ('2997', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '60.191.32.71', '2020-09-09 05:43:57');
INSERT INTO `tb_sys_log` VALUES ('2998', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '60.191.32.71', '2020-09-09 05:44:00');
INSERT INTO `tb_sys_log` VALUES ('2999', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '60.191.32.71', '2020-09-09 05:44:05');
INSERT INTO `tb_sys_log` VALUES ('3000', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:44:07');
INSERT INTO `tb_sys_log` VALUES ('3001', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 05:44:07');
INSERT INTO `tb_sys_log` VALUES ('3002', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '60.191.32.71', '2020-09-09 05:44:11');
INSERT INTO `tb_sys_log` VALUES ('3003', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:44:14');
INSERT INTO `tb_sys_log` VALUES ('3004', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '60.191.32.71', '2020-09-09 05:44:27');
INSERT INTO `tb_sys_log` VALUES ('3005', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '60.191.32.71', '2020-09-09 05:44:27');
INSERT INTO `tb_sys_log` VALUES ('3006', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '60.191.32.71', '2020-09-09 05:44:28');
INSERT INTO `tb_sys_log` VALUES ('3007', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:44:32');
INSERT INTO `tb_sys_log` VALUES ('3008', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 05:44:32');
INSERT INTO `tb_sys_log` VALUES ('3009', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '60.191.32.71', '2020-09-09 05:44:40');
INSERT INTO `tb_sys_log` VALUES ('3010', 'YWJ', '查询单个账户信息', 'doGetAccount', '[\"1111\"]', '60.191.32.71', '2020-09-09 05:44:42');
INSERT INTO `tb_sys_log` VALUES ('3011', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:44:46');
INSERT INTO `tb_sys_log` VALUES ('3012', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 05:44:46');
INSERT INTO `tb_sys_log` VALUES ('3013', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '60.191.32.71', '2020-09-09 05:44:51');
INSERT INTO `tb_sys_log` VALUES ('3014', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '60.191.32.71', '2020-09-09 05:45:19');
INSERT INTO `tb_sys_log` VALUES ('3015', 'YWJ', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '60.191.32.71', '2020-09-09 05:45:24');
INSERT INTO `tb_sys_log` VALUES ('3016', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:45:30');
INSERT INTO `tb_sys_log` VALUES ('3017', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 05:45:30');
INSERT INTO `tb_sys_log` VALUES ('3018', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '60.191.32.71', '2020-09-09 05:45:48');
INSERT INTO `tb_sys_log` VALUES ('3019', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 05:45:54');
INSERT INTO `tb_sys_log` VALUES ('3020', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '60.191.32.71', '2020-09-09 05:46:01');
INSERT INTO `tb_sys_log` VALUES ('3021', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '60.191.32.71', '2020-09-09 05:46:07');
INSERT INTO `tb_sys_log` VALUES ('3022', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '60.191.32.71', '2020-09-09 05:46:19');
INSERT INTO `tb_sys_log` VALUES ('3023', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '60.191.32.71', '2020-09-09 05:46:19');
INSERT INTO `tb_sys_log` VALUES ('3024', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '60.191.32.71', '2020-09-09 05:46:41');
INSERT INTO `tb_sys_log` VALUES ('3025', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '60.191.32.71', '2020-09-09 05:46:49');
INSERT INTO `tb_sys_log` VALUES ('3026', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '60.191.32.71', '2020-09-09 05:46:53');
INSERT INTO `tb_sys_log` VALUES ('3027', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '60.191.32.71', '2020-09-09 05:46:57');
INSERT INTO `tb_sys_log` VALUES ('3028', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '60.191.32.71', '2020-09-09 05:46:57');
INSERT INTO `tb_sys_log` VALUES ('3029', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '60.191.32.71', '2020-09-09 05:47:01');
INSERT INTO `tb_sys_log` VALUES ('3030', '117.158.214.185', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-09-09 06:21:57');
INSERT INTO `tb_sys_log` VALUES ('3031', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-09-09 06:22:11');
INSERT INTO `tb_sys_log` VALUES ('3032', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '117.158.214.185', '2020-09-09 06:22:11');
INSERT INTO `tb_sys_log` VALUES ('3033', 'YWJ', '查询操作日志', 'doQuerySysLogList', '[\"\",\"\",\"\",1]', '117.158.214.185', '2020-09-09 06:22:14');
INSERT INTO `tb_sys_log` VALUES ('3034', '117.158.214.185', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.158.214.185', '2020-09-09 07:38:05');
INSERT INTO `tb_sys_log` VALUES ('3035', '60.191.32.71', '获取所有的角色', 'doQueryRoleList', '[]', '60.191.32.71', '2020-09-09 08:25:53');
INSERT INTO `tb_sys_log` VALUES ('3036', '117.158.214.185', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-09-14 06:12:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'top', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, null, null, '', null, '0', '0', 'bee', 'bee', '2020-07-04 22:41:39', '2020-07-04 22:41:42');
INSERT INTO `tb_user` VALUES ('5', 'a3978911-bb70-46f9-a45a-95508aa9d9e1', 'YWJ', 'e10adc3949ba59abbe56e057f20f883e', '13291812767', 'ywj\'123@123.com', null, '1111', null, '5', '0', 'YWJ', 'YWJ', '2020-07-05 10:17:30', '2020-07-05 10:17:30');
INSERT INTO `tb_user` VALUES ('20', '1dd45d94-edc3-4b42-9691-a4e6409a2328', 'WAXX', 'e10adc3949ba59abbe56e057f20f883e', '15903991236', '247636225@yy.com', null, '1111', null, '3', '1', 'WXX', 'bee', '2020-08-09 14:30:16', '2020-08-09 15:15:50');
INSERT INTO `tb_user` VALUES ('21', '6be54dc7-3ee8-4bba-803a-e0bd3a8ea381', 'wangbo', '3d9188577cc9bfe9291ac66b5cc872b7', '17638171723', '12343@qq.com', null, '1111', null, '3', '0', 'wangbo', 'bee', '2020-08-20 14:21:28', '2020-09-06 02:33:12');
INSERT INTO `tb_user` VALUES ('22', '9281a21f-f2a5-4c79-a76f-b1c4a9e2b4d9', 'wangbo1', '96e79218965eb72c92a549dd5a330112', '13876566544', '1123@qq.com', null, '1111', null, '4', '1', 'wangbo1', 'wangbo1', '2020-08-20 14:25:50', '2020-08-20 14:25:50');
INSERT INTO `tb_user` VALUES ('23', '5bd2198d-a44b-42d4-8a73-82845be3f4a0', 'BEE', 'e10adc3949ba59abbe56e057f20f883e', '15938917805', '123456789@qq.com', null, '1111', null, '4', '0', 'BEE', 'BEE', '2020-08-31 11:04:47', '2020-08-31 11:04:47');
INSERT INTO `tb_user` VALUES ('24', 'a908d8d8-f8c0-44ba-a803-b302077cd32c', 'wangbo-1', '96e79218965eb72c92a549dd5a330112', '17638176273', '123@qq.com', null, '1111', null, '5', '0', 'wangbo-1', 'wangbo-1', '2020-09-06 02:34:19', '2020-09-06 02:34:19');
INSERT INTO `tb_user` VALUES ('25', '974d725c-daba-4555-bad2-c07375600862', 'ZHH', 'e10adc3949ba59abbe56e057f20f883e', '15809712345', '476612551@qq.com', null, '1113', null, '6', '0', 'ZHH', 'ZHH', '2020-09-06 03:19:27', '2020-09-06 03:19:27');
