/*
Navicat MySQL Data Transfer

Source Server         : 39.98.147.216
Source Server Version : 50715
Source Host           : 39.98.147.216:3306
Source Database       : smart_medical

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2020-10-27 17:47:40
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
                            `foreign_id` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_disease
-- ----------------------------
INSERT INTO `tb_disease` VALUES ('21', '5fb62003-4ed7-4508-888e-a655f91ae01e', '高血压', 'effbc3b2-f95e-49c1-a009-d71eca0ec432', null, null, '备注', '1', '0', 'bee', 'bee', '2020-08-16 10:56:50', '2020-08-16 10:56:50', null);
INSERT INTO `tb_disease` VALUES ('24', 'ea35c93e-0032-4242-b4d3-381532c19841', '修改为消化科', '1112', '11', '费都是发大水发阿斯蒂芬大奥德赛范德萨阿斯顿发', '发送到啊阿斯顿发', '0', '0', 'bee', 'bee', '2020-08-29 13:49:03', '2020-08-31 08:13:30', null);
INSERT INTO `tb_disease` VALUES ('30', 'd3a0bfeb-bfae-404f-b79c-b9f029469037', '慢性鼻炎', '1111', '鼻腔用药： 激素类：毕诺、伯可纳 、辅舒良、内舒拿、雷诺考特等', '阵发性喷嚏发作，大量清水样鼻涕，鼻塞', '', '0', '0', 'bee', 'bee', '2020-09-06 03:30:01', '2020-10-15 02:34:54', null);
INSERT INTO `tb_disease` VALUES ('31', 'adfe9dbd-22e8-49cb-9e6c-0ca8fe2b5759', '慢性扁桃体炎', '1111', '扁桃体切除术', '咽痛或反复急性发作，咽部不适、异物感、口臭、刺激性咳嗽', '', '2', '0', 'bee', 'bee', '2020-09-06 03:30:21', '2020-09-06 08:55:43', null);
INSERT INTO `tb_disease` VALUES ('32', '16820b5f-ed1e-4cbd-9869-7f1b610970c3', '鼻咽癌', '1111', '手术疗法适于对放疗不敏感或放疗后颈淋巴转移未消退者', '易出血，吸鼻后痰中带血或擤出血性鼻涕。耳鸣、耳闷塞感及听力减退，或伴有鼓室积液', '', '3', '0', 'bee', 'bee', '2020-09-06 08:56:34', '2020-09-06 08:56:34', null);
INSERT INTO `tb_disease` VALUES ('33', '41000eb6-edfa-4da1-b7c7-def9e4d724cf', '喉癌', '1111', '1、全喉切除术：适用于T3～T4期喉癌病变，术后喉癌患者会失去喉功能，但经过食管发音训练后获得咽食管音，是很好的喉癌的治疗方法。　　2、水平部分喉切除术：这种喉癌的治疗方法适用于声门上型喉癌，指喉癌的病变累及会厌、室带、杓会厌襞等，但声带未受侵犯。喉癌患者在手术后可基本保留喉功能。　　3、化疗：治疗喉癌，对于晚期喉癌不能手术者，可采用化疗或放疗加化疗的综合疗法，同样是很好的一种喉癌的治疗方法。　　', '喉是人体的发音器官，由声门、声门上和声门下三部分构成。声带属声门区，会厌属声门上区，会厌负责关闭喉，防止食物掉进气管里。喉癌是发生在喉部的恶性肿瘤。\n\n长在声带上的喉癌症状明显，早期就有声音嘶哑。肿瘤长在声门上或声门下，早期症状不明显，或表现为声音嘶哑、异物感、咳嗽等，肿瘤长大后可出现呼吸困难、过度咳嗽、吞咽食物困难、脖子疼或者肿大等。晚期可经淋巴结转移。治疗主要是手术治疗，也可以放疗。', '', '4', '0', 'YWJ', 'YWJ', '2020-10-27 06:17:49', '2020-10-27 06:17:49', 'sk001');
INSERT INTO `tb_disease` VALUES ('34', '4849bea3-a7d8-4ff8-b249-79d5219b16ee', '声带白斑', '1111', '测试', '测试', '', '5', '0', 'YWJ', 'YWJ', '2020-10-27 06:18:37', '2020-10-27 06:18:37', 'sk002');
INSERT INTO `tb_disease` VALUES ('35', 'eb3b951e-e564-4dc1-920b-759872a9d98b', '声带息肉', '1111', '测试', '测试', '', '6', '0', 'YWJ', 'YWJ', '2020-10-27 06:19:32', '2020-10-27 06:19:32', 'sk003');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

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
INSERT INTO `tb_medical_records` VALUES ('29', 'f3ea368a-3c08-473d-8ca7-0ac0d1b2abf7', 'c5a736e7-05d8-44c5-a01d-a3ce148bf41e', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '26', '0', 'bee', 'bee', '2020-10-17 07:02:31', '2020-10-17 07:02:31');
INSERT INTO `tb_medical_records` VALUES ('30', '4862b998-7f86-4d92-995a-40aaa94b789a', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '27', '0', 'bee', 'bee', '2020-10-25 01:44:42', '2020-10-25 01:44:42');
INSERT INTO `tb_medical_records` VALUES ('31', '86ef1512-9188-4116-a86c-0e4b9bdeefb7', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '28', '0', 'bee', 'bee', '2020-10-25 01:45:49', '2020-10-25 01:45:49');
INSERT INTO `tb_medical_records` VALUES ('32', 'f9def5cf-b2f6-4c46-9992-3b08d83cba4a', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '29', '0', 'bee', 'bee', '2020-10-25 01:51:00', '2020-10-25 01:51:00');
INSERT INTO `tb_medical_records` VALUES ('33', 'fa769aa3-11ae-47d8-ad20-fcd6af93d61d', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '30', '0', 'bee', 'bee', '2020-10-25 01:58:51', '2020-10-25 01:58:51');
INSERT INTO `tb_medical_records` VALUES ('34', '96f46675-6ef9-480d-854d-63ad0bed267b', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '31', '0', 'bee', 'bee', '2020-10-25 02:01:19', '2020-10-25 02:01:19');
INSERT INTO `tb_medical_records` VALUES ('35', 'b3f0cf31-e632-45ea-9d4d-98174a676687', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '32', '0', 'bee', 'bee', '2020-10-25 02:06:10', '2020-10-25 02:06:10');
INSERT INTO `tb_medical_records` VALUES ('36', '842ceae7-a5df-443a-b33f-b76a52f6edb9', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '33', '0', 'bee', 'bee', '2020-10-25 12:03:07', '2020-10-25 12:03:07');
INSERT INTO `tb_medical_records` VALUES ('37', '5ceaa34c-3ea6-4e0c-a888-6830148aee90', '47d94971-412b-43ae-a03c-7f31f2df1b81', '4435baee-1346-4744-8c00-16ef4fc2be77', '', '', '34', '0', 'bee', 'bee', '2020-10-25 12:09:20', '2020-10-25 12:09:20');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_patient_info
-- ----------------------------
INSERT INTO `tb_patient_info` VALUES ('2', '018666ed-c957-4b40-a4a9-1a652d6cc54f', '毕洋强', '410822199108111511', '1', '无病史', '1', '0', 'bee', 'bee', '2020-07-05 10:51:20', '2020-10-17 06:04:47');
INSERT INTO `tb_patient_info` VALUES ('3', '03e6a22d-7233-44b3-a199-18abfdc0d7c9', '王大雷', '410822199108111512', '1', '无病史', '1', '0', 'bee', 'bee', '2020-07-05 11:09:19', '2020-09-06 03:05:15');
INSERT INTO `tb_patient_info` VALUES ('4', '3b1b6c4a-cc39-4b77-bbcb-1ecf7cfd1877', '病人111', '41082219910811151', '1', '病史', '1', '0', 'bee', 'bee', '2020-07-15 13:25:07', '2020-07-15 13:26:27');
INSERT INTO `tb_patient_info` VALUES ('5', '47d94971-412b-43ae-a03c-7f31f2df1b81', '张三', '410822199105161234', '1', '有病', '1', '0', 'bee', 'bee', '2020-08-02 07:37:48', '2020-08-02 07:37:48');
INSERT INTO `tb_patient_info` VALUES ('6', 'c01eaf59-67e2-4aa5-8a0e-b4ed2797b776', '11', '22', '1', '333', '1', '0', 'bee', 'bee', '2020-08-04 13:33:41', '2020-09-06 11:17:04');
INSERT INTO `tb_patient_info` VALUES ('7', 'c5a736e7-05d8-44c5-a01d-a3ce148bf41e', '王大雷2', '412888199402021236', '1', '阿迪', '1', '0', 'bee', 'bee', '2020-08-31 03:32:13', '2020-09-06 13:14:40');
INSERT INTO `tb_patient_info` VALUES ('8', '62d34cc0-6a1e-4f14-a2f4-0499992c4cb4', '测试员haha', '410822199108111514', '0', 'test', '1', '0', 'bee', 'bee', '2020-10-25 01:44:12', '2020-10-25 01:44:12');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

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
INSERT INTO `tb_role_menu` VALUES ('36', '1', '3', '0', 'YWJ', 'YWJ', '2020-10-26 15:05:36', '2020-10-26 15:05:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3565 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sys_log
-- ----------------------------
INSERT INTO `tb_sys_log` VALUES ('3235', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.158.214.185', '2020-10-17 07:07:09');
INSERT INTO `tb_sys_log` VALUES ('3236', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '117.158.214.185', '2020-10-17 07:07:19');
INSERT INTO `tb_sys_log` VALUES ('3237', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.158.214.185', '2020-10-17 07:11:24');
INSERT INTO `tb_sys_log` VALUES ('3238', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.158.214.185', '2020-10-17 07:11:25');
INSERT INTO `tb_sys_log` VALUES ('3239', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-17 07:11:25');
INSERT INTO `tb_sys_log` VALUES ('3240', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '117.158.214.185', '2020-10-17 07:11:24');
INSERT INTO `tb_sys_log` VALUES ('3241', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '117.158.214.185', '2020-10-17 07:11:24');
INSERT INTO `tb_sys_log` VALUES ('3242', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.158.214.185', '2020-10-17 07:11:24');
INSERT INTO `tb_sys_log` VALUES ('3243', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"\",\"\",1]', '117.158.214.185', '2020-10-17 07:12:05');
INSERT INTO `tb_sys_log` VALUES ('3244', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.158.214.185', '2020-10-17 07:11:03');
INSERT INTO `tb_sys_log` VALUES ('3245', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"\",\"\",1]', '117.158.214.185', '2020-10-17 07:12:15');
INSERT INTO `tb_sys_log` VALUES ('3246', 'bee', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.158.214.185', '2020-10-17 07:52:43');
INSERT INTO `tb_sys_log` VALUES ('3247', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-21 04:58:25');
INSERT INTO `tb_sys_log` VALUES ('3248', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-21 04:58:25');
INSERT INTO `tb_sys_log` VALUES ('3249', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-21 04:58:25');
INSERT INTO `tb_sys_log` VALUES ('3250', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-21 04:58:25');
INSERT INTO `tb_sys_log` VALUES ('3251', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-21 05:28:32');
INSERT INTO `tb_sys_log` VALUES ('3252', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-21 05:28:32');
INSERT INTO `tb_sys_log` VALUES ('3253', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.147.5.214', '2020-10-25 01:24:00');
INSERT INTO `tb_sys_log` VALUES ('3254', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '117.147.5.214', '2020-10-25 01:26:07');
INSERT INTO `tb_sys_log` VALUES ('3255', 'YWJYS', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"1\"]', '117.147.5.214', '2020-10-25 01:26:07');
INSERT INTO `tb_sys_log` VALUES ('3256', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '117.147.5.214', '2020-10-25 01:26:12');
INSERT INTO `tb_sys_log` VALUES ('3257', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '117.147.5.214', '2020-10-25 01:26:24');
INSERT INTO `tb_sys_log` VALUES ('3258', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '117.147.5.214', '2020-10-25 01:28:05');
INSERT INTO `tb_sys_log` VALUES ('3259', 'YWJYS', '新增病人信息', 'doPostNewPatientInfo', '[\"{\\\"name\\\":\\\"测试员haha\\\",\\\"postId\\\":\\\"410822199108111514\\\",\\\"sex\\\":\\\"0\\\",\\\"medicalHistory\\\":\\\"test\\\"}\"]', '117.147.5.214', '2020-10-25 01:44:12');
INSERT INTO `tb_sys_log` VALUES ('3260', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '117.147.5.214', '2020-10-25 01:44:13');
INSERT INTO `tb_sys_log` VALUES ('3261', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '117.147.5.214', '2020-10-25 01:44:32');
INSERT INTO `tb_sys_log` VALUES ('3262', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111514\",\"\",1]', '117.147.5.214', '2020-10-25 01:44:37');
INSERT INTO `tb_sys_log` VALUES ('3263', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"62d34cc0-6a1e-4f14-a2f4-0499992c4cb4\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.147.5.214', '2020-10-25 01:44:42');
INSERT INTO `tb_sys_log` VALUES ('3264', 'YWJYS', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '117.147.5.214', '2020-10-25 01:44:42');
INSERT INTO `tb_sys_log` VALUES ('3265', 'YWJYS', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '117.147.5.214', '2020-10-25 01:44:43');
INSERT INTO `tb_sys_log` VALUES ('3266', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111514\",\"\",1]', '117.147.5.214', '2020-10-25 01:45:42');
INSERT INTO `tb_sys_log` VALUES ('3267', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"62d34cc0-6a1e-4f14-a2f4-0499992c4cb4\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.147.5.214', '2020-10-25 01:45:49');
INSERT INTO `tb_sys_log` VALUES ('3268', 'YWJYS', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '117.147.5.214', '2020-10-25 01:45:49');
INSERT INTO `tb_sys_log` VALUES ('3269', 'YWJYS', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '117.147.5.214', '2020-10-25 01:45:49');
INSERT INTO `tb_sys_log` VALUES ('3270', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111514\",\"\",1]', '117.147.5.214', '2020-10-25 01:50:03');
INSERT INTO `tb_sys_log` VALUES ('3271', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"412888199402021236\",\"\",1]', '117.147.5.214', '2020-10-25 01:50:14');
INSERT INTO `tb_sys_log` VALUES ('3272', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111514\",\"\",1]', '117.147.5.214', '2020-10-25 01:50:17');
INSERT INTO `tb_sys_log` VALUES ('3273', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111514\",\"\",1]', '117.147.5.214', '2020-10-25 01:50:59');
INSERT INTO `tb_sys_log` VALUES ('3274', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"62d34cc0-6a1e-4f14-a2f4-0499992c4cb4\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.147.5.214', '2020-10-25 01:51:00');
INSERT INTO `tb_sys_log` VALUES ('3275', 'YWJYS', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '117.147.5.214', '2020-10-25 01:51:00');
INSERT INTO `tb_sys_log` VALUES ('3276', 'YWJYS', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '117.147.5.214', '2020-10-25 01:51:00');
INSERT INTO `tb_sys_log` VALUES ('3277', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.147.5.214', '2020-10-25 01:52:17');
INSERT INTO `tb_sys_log` VALUES ('3278', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '117.147.5.214', '2020-10-25 01:58:33');
INSERT INTO `tb_sys_log` VALUES ('3279', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111514\",\"\",1]', '117.147.5.214', '2020-10-25 01:58:39');
INSERT INTO `tb_sys_log` VALUES ('3280', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"62d34cc0-6a1e-4f14-a2f4-0499992c4cb4\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.147.5.214', '2020-10-25 01:58:51');
INSERT INTO `tb_sys_log` VALUES ('3281', 'YWJYS', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '117.147.5.214', '2020-10-25 01:58:52');
INSERT INTO `tb_sys_log` VALUES ('3282', 'YWJYS', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '117.147.5.214', '2020-10-25 01:58:52');
INSERT INTO `tb_sys_log` VALUES ('3283', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111514\",\"\",1]', '117.147.5.214', '2020-10-25 02:01:16');
INSERT INTO `tb_sys_log` VALUES ('3284', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"62d34cc0-6a1e-4f14-a2f4-0499992c4cb4\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.147.5.214', '2020-10-25 02:01:19');
INSERT INTO `tb_sys_log` VALUES ('3285', 'YWJYS', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '117.147.5.214', '2020-10-25 02:01:19');
INSERT INTO `tb_sys_log` VALUES ('3286', 'YWJYS', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '117.147.5.214', '2020-10-25 02:01:19');
INSERT INTO `tb_sys_log` VALUES ('3287', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111514\",\"\",1]', '117.147.5.214', '2020-10-25 02:06:09');
INSERT INTO `tb_sys_log` VALUES ('3288', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"62d34cc0-6a1e-4f14-a2f4-0499992c4cb4\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '117.147.5.214', '2020-10-25 02:06:10');
INSERT INTO `tb_sys_log` VALUES ('3289', 'YWJYS', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '117.147.5.214', '2020-10-25 02:06:10');
INSERT INTO `tb_sys_log` VALUES ('3290', 'YWJYS', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '117.147.5.214', '2020-10-25 02:06:10');
INSERT INTO `tb_sys_log` VALUES ('3291', 'YWJYS', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.147.5.214', '2020-10-25 02:06:29');
INSERT INTO `tb_sys_log` VALUES ('3292', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.147.5.214', '2020-10-25 03:51:13');
INSERT INTO `tb_sys_log` VALUES ('3293', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.147.5.214', '2020-10-25 03:51:20');
INSERT INTO `tb_sys_log` VALUES ('3294', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '117.147.5.214', '2020-10-25 03:51:20');
INSERT INTO `tb_sys_log` VALUES ('3295', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '117.147.5.214', '2020-10-25 03:51:24');
INSERT INTO `tb_sys_log` VALUES ('3296', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.147.5.214', '2020-10-25 03:51:37');
INSERT INTO `tb_sys_log` VALUES ('3297', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '117.147.5.214', '2020-10-25 03:51:38');
INSERT INTO `tb_sys_log` VALUES ('3298', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '117.147.5.214', '2020-10-25 03:51:51');
INSERT INTO `tb_sys_log` VALUES ('3299', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '117.147.5.214', '2020-10-25 03:51:53');
INSERT INTO `tb_sys_log` VALUES ('3300', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[2,\"\",0,10]', '117.147.5.214', '2020-10-25 03:51:55');
INSERT INTO `tb_sys_log` VALUES ('3301', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.147.5.214', '2020-10-25 03:52:01');
INSERT INTO `tb_sys_log` VALUES ('3302', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '117.147.5.214', '2020-10-25 03:52:40');
INSERT INTO `tb_sys_log` VALUES ('3303', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 03:53:05');
INSERT INTO `tb_sys_log` VALUES ('3304', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '117.147.5.214', '2020-10-25 03:53:05');
INSERT INTO `tb_sys_log` VALUES ('3305', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 03:53:14');
INSERT INTO `tb_sys_log` VALUES ('3306', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '117.147.5.214', '2020-10-25 03:53:23');
INSERT INTO `tb_sys_log` VALUES ('3307', 'YWJ', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '117.147.5.214', '2020-10-25 03:53:26');
INSERT INTO `tb_sys_log` VALUES ('3308', 'YWJ', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '117.147.5.214', '2020-10-25 03:53:40');
INSERT INTO `tb_sys_log` VALUES ('3309', 'YWJ', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '117.147.5.214', '2020-10-25 03:53:49');
INSERT INTO `tb_sys_log` VALUES ('3310', 'YWJ', '查询单个菜单信息', 'doGetAccount', '[\"2\"]', '117.147.5.214', '2020-10-25 03:53:49');
INSERT INTO `tb_sys_log` VALUES ('3311', 'YWJ', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"1\"]', '117.147.5.214', '2020-10-25 03:54:07');
INSERT INTO `tb_sys_log` VALUES ('3312', 'YWJ', '查询单个角色信息', 'doGetRole', '[\"1\"]', '117.147.5.214', '2020-10-25 03:54:12');
INSERT INTO `tb_sys_log` VALUES ('3313', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '117.147.5.214', '2020-10-25 03:54:14');
INSERT INTO `tb_sys_log` VALUES ('3314', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.147.5.214', '2020-10-25 03:54:17');
INSERT INTO `tb_sys_log` VALUES ('3315', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 03:54:21');
INSERT INTO `tb_sys_log` VALUES ('3316', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 03:54:31');
INSERT INTO `tb_sys_log` VALUES ('3317', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 03:54:42');
INSERT INTO `tb_sys_log` VALUES ('3318', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '117.147.5.214', '2020-10-25 03:54:56');
INSERT INTO `tb_sys_log` VALUES ('3319', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.147.5.214', '2020-10-25 03:54:58');
INSERT INTO `tb_sys_log` VALUES ('3320', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '117.147.5.214', '2020-10-25 03:55:07');
INSERT INTO `tb_sys_log` VALUES ('3321', 'YWJ', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"1\"]', '117.147.5.214', '2020-10-25 03:55:11');
INSERT INTO `tb_sys_log` VALUES ('3322', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.147.5.214', '2020-10-25 03:55:16');
INSERT INTO `tb_sys_log` VALUES ('3323', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 03:55:19');
INSERT INTO `tb_sys_log` VALUES ('3324', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 03:55:24');
INSERT INTO `tb_sys_log` VALUES ('3325', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 03:55:32');
INSERT INTO `tb_sys_log` VALUES ('3326', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '117.147.5.214', '2020-10-25 03:55:41');
INSERT INTO `tb_sys_log` VALUES ('3327', 'YWJ', '查询单个账户信息', 'doGetAccount', '[\"1111\"]', '117.147.5.214', '2020-10-25 03:55:46');
INSERT INTO `tb_sys_log` VALUES ('3328', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 07:21:44');
INSERT INTO `tb_sys_log` VALUES ('3329', 'bee', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '117.147.5.214', '2020-10-25 07:21:44');
INSERT INTO `tb_sys_log` VALUES ('3330', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 07:21:51');
INSERT INTO `tb_sys_log` VALUES ('3331', 'bee', '查询单个账户信息', 'doGetAccount', '[\"d3a0bfeb-bfae-404f-b79c-b9f029469037\"]', '117.147.5.214', '2020-10-25 07:21:51');
INSERT INTO `tb_sys_log` VALUES ('3332', 'bee', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '117.147.5.214', '2020-10-25 07:22:14');
INSERT INTO `tb_sys_log` VALUES ('3333', 'bee', '查询单个账户信息', 'doGetAccount', '[\"1111\"]', '117.147.5.214', '2020-10-25 07:22:17');
INSERT INTO `tb_sys_log` VALUES ('3334', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.147.5.214', '2020-10-25 07:22:21');
INSERT INTO `tb_sys_log` VALUES ('3335', 'bee', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '117.147.5.214', '2020-10-25 07:22:21');
INSERT INTO `tb_sys_log` VALUES ('3336', 'bee', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.147.5.214', '2020-10-25 07:22:23');
INSERT INTO `tb_sys_log` VALUES ('3337', 'bee', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '117.147.5.214', '2020-10-25 07:22:41');
INSERT INTO `tb_sys_log` VALUES ('3338', 'bee', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '117.147.5.214', '2020-10-25 07:23:38');
INSERT INTO `tb_sys_log` VALUES ('3339', 'bee', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.147.5.214', '2020-10-25 07:23:42');
INSERT INTO `tb_sys_log` VALUES ('3340', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 07:23:44');
INSERT INTO `tb_sys_log` VALUES ('3341', 'bee', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '117.147.5.214', '2020-10-25 07:23:54');
INSERT INTO `tb_sys_log` VALUES ('3342', 'bee', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.147.5.214', '2020-10-25 07:24:00');
INSERT INTO `tb_sys_log` VALUES ('3343', 'bee', '分页获取病人列表', 'doQueryPatientPageList', '[1,null]', '223.88.82.124', '2020-10-25 11:58:42');
INSERT INTO `tb_sys_log` VALUES ('3344', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.124', '2020-10-25 12:01:20');
INSERT INTO `tb_sys_log` VALUES ('3345', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-25 12:01:34');
INSERT INTO `tb_sys_log` VALUES ('3346', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.124', '2020-10-25 12:01:34');
INSERT INTO `tb_sys_log` VALUES ('3347', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-25 12:01:39');
INSERT INTO `tb_sys_log` VALUES ('3348', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-25 12:01:41');
INSERT INTO `tb_sys_log` VALUES ('3349', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.124', '2020-10-25 12:01:41');
INSERT INTO `tb_sys_log` VALUES ('3350', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.124', '2020-10-25 12:01:46');
INSERT INTO `tb_sys_log` VALUES ('3351', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-25 12:02:14');
INSERT INTO `tb_sys_log` VALUES ('3352', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-25 12:02:21');
INSERT INTO `tb_sys_log` VALUES ('3353', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.124', '2020-10-25 12:02:25');
INSERT INTO `tb_sys_log` VALUES ('3354', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '223.88.82.124', '2020-10-25 12:02:25');
INSERT INTO `tb_sys_log` VALUES ('3355', 'YWJ', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-25 12:02:30');
INSERT INTO `tb_sys_log` VALUES ('3356', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.124', '2020-10-25 12:02:31');
INSERT INTO `tb_sys_log` VALUES ('3357', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '223.88.82.124', '2020-10-25 12:02:50');
INSERT INTO `tb_sys_log` VALUES ('3358', 'YWJYS', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"1\"]', '223.88.82.124', '2020-10-25 12:02:51');
INSERT INTO `tb_sys_log` VALUES ('3359', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-25 12:02:54');
INSERT INTO `tb_sys_log` VALUES ('3360', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111514\",\"\",1]', '223.88.82.124', '2020-10-25 12:03:01');
INSERT INTO `tb_sys_log` VALUES ('3361', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"62d34cc0-6a1e-4f14-a2f4-0499992c4cb4\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-25 12:03:07');
INSERT INTO `tb_sys_log` VALUES ('3362', 'YWJYS', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '223.88.82.124', '2020-10-25 12:03:07');
INSERT INTO `tb_sys_log` VALUES ('3363', 'YWJYS', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '223.88.82.124', '2020-10-25 12:03:07');
INSERT INTO `tb_sys_log` VALUES ('3364', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-25 12:04:05');
INSERT INTO `tb_sys_log` VALUES ('3365', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '223.88.82.124', '2020-10-25 12:04:10');
INSERT INTO `tb_sys_log` VALUES ('3366', 'YWJYS', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.124', '2020-10-25 12:04:30');
INSERT INTO `tb_sys_log` VALUES ('3367', 'YWJYS', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '223.88.82.124', '2020-10-25 12:04:30');
INSERT INTO `tb_sys_log` VALUES ('3368', 'YWJYS', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-25 12:04:42');
INSERT INTO `tb_sys_log` VALUES ('3369', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-25 12:08:13');
INSERT INTO `tb_sys_log` VALUES ('3370', 'YWJYS', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199105161234\",\"\",1]', '223.88.82.124', '2020-10-25 12:09:17');
INSERT INTO `tb_sys_log` VALUES ('3371', 'YWJYS', '新增就诊记录信息', 'doPostNewMedicalRecordInfo', '[\"{\\\"patientId\\\":\\\"47d94971-412b-43ae-a03c-7f31f2df1b81\\\",\\\"doctorId\\\":\\\"4435baee-1346-4744-8c00-16ef4fc2be77\\\",\\\"record\\\":\\\"\\\",\\\"treatmentPlan\\\":\\\"\\\"}\"]', '223.88.82.124', '2020-10-25 12:09:20');
INSERT INTO `tb_sys_log` VALUES ('3372', 'YWJYS', '查询所有的疾病', 'doQueryDiseaseList', '[\"1111\"]', '223.88.82.124', '2020-10-25 12:09:20');
INSERT INTO `tb_sys_log` VALUES ('3373', 'YWJYS', '查询分页科室特征', 'doQueryDepartmentFeaturePageList', '[\"1111\",null]', '223.88.82.124', '2020-10-25 12:09:20');
INSERT INTO `tb_sys_log` VALUES ('3374', 'bee', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-25 13:41:06');
INSERT INTO `tb_sys_log` VALUES ('3375', 'bee', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-25 13:41:13');
INSERT INTO `tb_sys_log` VALUES ('3376', 'bee', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '223.88.82.124', '2020-10-25 13:43:25');
INSERT INTO `tb_sys_log` VALUES ('3377', 'bee', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-25 13:44:02');
INSERT INTO `tb_sys_log` VALUES ('3378', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '223.88.82.124', '2020-10-25 13:50:40');
INSERT INTO `tb_sys_log` VALUES ('3379', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 13:55:20');
INSERT INTO `tb_sys_log` VALUES ('3380', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 13:55:38');
INSERT INTO `tb_sys_log` VALUES ('3381', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 13:55:45');
INSERT INTO `tb_sys_log` VALUES ('3382', 'bee', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.147.5.214', '2020-10-25 13:56:31');
INSERT INTO `tb_sys_log` VALUES ('3383', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.147.5.214', '2020-10-25 14:03:28');
INSERT INTO `tb_sys_log` VALUES ('3384', 'bee', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '117.147.5.214', '2020-10-25 14:03:28');
INSERT INTO `tb_sys_log` VALUES ('3385', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-26 04:03:12');
INSERT INTO `tb_sys_log` VALUES ('3386', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-26 04:36:57');
INSERT INTO `tb_sys_log` VALUES ('3387', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-26 09:01:55');
INSERT INTO `tb_sys_log` VALUES ('3388', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.124', '2020-10-26 13:10:43');
INSERT INTO `tb_sys_log` VALUES ('3389', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '223.88.82.124', '2020-10-26 13:10:51');
INSERT INTO `tb_sys_log` VALUES ('3390', 'YWJYS', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"1\"]', '223.88.82.124', '2020-10-26 13:10:51');
INSERT INTO `tb_sys_log` VALUES ('3391', 'YWJYS', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-26 13:28:07');
INSERT INTO `tb_sys_log` VALUES ('3392', 'bee', '分页获取病人列表', 'doQueryPatientPageList', '[1,null]', '127.0.0.1', '2020-10-26 13:38:23');
INSERT INTO `tb_sys_log` VALUES ('3393', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 13:38:24');
INSERT INTO `tb_sys_log` VALUES ('3394', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 13:38:24');
INSERT INTO `tb_sys_log` VALUES ('3395', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 13:38:24');
INSERT INTO `tb_sys_log` VALUES ('3396', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 13:38:24');
INSERT INTO `tb_sys_log` VALUES ('3397', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 13:53:42');
INSERT INTO `tb_sys_log` VALUES ('3398', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:08:29');
INSERT INTO `tb_sys_log` VALUES ('3399', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:10:15');
INSERT INTO `tb_sys_log` VALUES ('3400', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:11:04');
INSERT INTO `tb_sys_log` VALUES ('3401', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:13:16');
INSERT INTO `tb_sys_log` VALUES ('3402', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:14:44');
INSERT INTO `tb_sys_log` VALUES ('3403', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:21:24');
INSERT INTO `tb_sys_log` VALUES ('3404', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:24:08');
INSERT INTO `tb_sys_log` VALUES ('3405', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:25:07');
INSERT INTO `tb_sys_log` VALUES ('3406', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:27:02');
INSERT INTO `tb_sys_log` VALUES ('3407', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:27:38');
INSERT INTO `tb_sys_log` VALUES ('3408', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:35:07');
INSERT INTO `tb_sys_log` VALUES ('3409', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:37:13');
INSERT INTO `tb_sys_log` VALUES ('3410', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:37:30');
INSERT INTO `tb_sys_log` VALUES ('3411', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:39:21');
INSERT INTO `tb_sys_log` VALUES ('3412', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:48:09');
INSERT INTO `tb_sys_log` VALUES ('3413', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:48:55');
INSERT INTO `tb_sys_log` VALUES ('3414', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-26 14:49:26');
INSERT INTO `tb_sys_log` VALUES ('3415', 'bee', '分页获取病人列表', 'doQueryPatientPageList', '[1,null]', '223.88.82.124', '2020-10-26 15:02:39');
INSERT INTO `tb_sys_log` VALUES ('3416', 'bee', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-26 15:02:47');
INSERT INTO `tb_sys_log` VALUES ('3417', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.124', '2020-10-26 15:02:52');
INSERT INTO `tb_sys_log` VALUES ('3418', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-26 15:03:10');
INSERT INTO `tb_sys_log` VALUES ('3419', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.124', '2020-10-26 15:03:10');
INSERT INTO `tb_sys_log` VALUES ('3420', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-26 15:03:13');
INSERT INTO `tb_sys_log` VALUES ('3421', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:03:20');
INSERT INTO `tb_sys_log` VALUES ('3422', 'YWJ', '删除单个账户信息', 'doDeleteAccount', '[\"974d725c-daba-4555-bad2-c07375600862\"]', '223.88.82.124', '2020-10-26 15:03:32');
INSERT INTO `tb_sys_log` VALUES ('3423', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:03:32');
INSERT INTO `tb_sys_log` VALUES ('3424', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:03:44');
INSERT INTO `tb_sys_log` VALUES ('3425', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:03:48');
INSERT INTO `tb_sys_log` VALUES ('3426', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.124', '2020-10-26 15:03:55');
INSERT INTO `tb_sys_log` VALUES ('3427', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '223.88.82.124', '2020-10-26 15:03:55');
INSERT INTO `tb_sys_log` VALUES ('3428', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:03:57');
INSERT INTO `tb_sys_log` VALUES ('3429', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-26 15:04:00');
INSERT INTO `tb_sys_log` VALUES ('3430', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-26 15:04:14');
INSERT INTO `tb_sys_log` VALUES ('3431', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.124', '2020-10-26 15:04:14');
INSERT INTO `tb_sys_log` VALUES ('3432', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:04:17');
INSERT INTO `tb_sys_log` VALUES ('3433', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:04:19');
INSERT INTO `tb_sys_log` VALUES ('3434', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-26 15:04:23');
INSERT INTO `tb_sys_log` VALUES ('3435', 'YWJ', '查询分页就诊记录', 'doQueryMedicalRecordPageList', '[\"410822199108111511\",\"\",1]', '223.88.82.124', '2020-10-26 15:04:27');
INSERT INTO `tb_sys_log` VALUES ('3436', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:04:35');
INSERT INTO `tb_sys_log` VALUES ('3437', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:04:36');
INSERT INTO `tb_sys_log` VALUES ('3438', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:04:38');
INSERT INTO `tb_sys_log` VALUES ('3439', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-26 15:04:56');
INSERT INTO `tb_sys_log` VALUES ('3440', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:05:02');
INSERT INTO `tb_sys_log` VALUES ('3441', 'YWJ', '查询单个角色信息', 'doGetRole', '[\"1\"]', '223.88.82.124', '2020-10-26 15:05:04');
INSERT INTO `tb_sys_log` VALUES ('3442', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:05:08');
INSERT INTO `tb_sys_log` VALUES ('3443', 'YWJ', '查询单个角色信息', 'doGetRole', '[\"2\"]', '223.88.82.124', '2020-10-26 15:05:09');
INSERT INTO `tb_sys_log` VALUES ('3444', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:05:13');
INSERT INTO `tb_sys_log` VALUES ('3445', 'YWJ', '查询单个角色信息', 'doGetRole', '[\"1\"]', '223.88.82.124', '2020-10-26 15:05:17');
INSERT INTO `tb_sys_log` VALUES ('3446', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:05:22');
INSERT INTO `tb_sys_log` VALUES ('3447', 'YWJ', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"2\"]', '223.88.82.124', '2020-10-26 15:05:24');
INSERT INTO `tb_sys_log` VALUES ('3448', 'YWJ', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"1\"]', '223.88.82.124', '2020-10-26 15:05:27');
INSERT INTO `tb_sys_log` VALUES ('3449', 'YWJ', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"1\",\"3,5\"]', '223.88.82.124', '2020-10-26 15:05:36');
INSERT INTO `tb_sys_log` VALUES ('3450', 'YWJ', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-26 15:05:40');
INSERT INTO `tb_sys_log` VALUES ('3451', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.124', '2020-10-26 15:05:41');
INSERT INTO `tb_sys_log` VALUES ('3452', 'YWJYS', '登录平台', 'doPostNewApplicationResource', '[\"YWJYS\",\"1\",\"123456\"]', '223.88.82.124', '2020-10-26 15:05:58');
INSERT INTO `tb_sys_log` VALUES ('3453', 'YWJYS', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"1\"]', '223.88.82.124', '2020-10-26 15:05:58');
INSERT INTO `tb_sys_log` VALUES ('3454', 'YWJYS', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:06:01');
INSERT INTO `tb_sys_log` VALUES ('3455', 'YWJYS', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-26 15:06:04');
INSERT INTO `tb_sys_log` VALUES ('3456', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.124', '2020-10-26 15:06:04');
INSERT INTO `tb_sys_log` VALUES ('3457', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '223.88.82.124', '2020-10-26 15:06:12');
INSERT INTO `tb_sys_log` VALUES ('3458', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.124', '2020-10-26 15:06:12');
INSERT INTO `tb_sys_log` VALUES ('3459', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:06:15');
INSERT INTO `tb_sys_log` VALUES ('3460', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:06:18');
INSERT INTO `tb_sys_log` VALUES ('3461', 'YWJ', '查询角色对应的有选择状态的菜单', 'doQueryRoleMenuStatusTreeList', '[\"1\"]', '223.88.82.124', '2020-10-26 15:06:21');
INSERT INTO `tb_sys_log` VALUES ('3462', 'YWJ', '保存角色和菜单关系', 'doPostApplicationRoleResource', '[\"1\",\"3\"]', '223.88.82.124', '2020-10-26 15:06:24');
INSERT INTO `tb_sys_log` VALUES ('3463', 'YWJ', '查询所有的菜单(树形)', 'doQueryMenuTreeList', '[]', '223.88.82.124', '2020-10-26 15:06:31');
INSERT INTO `tb_sys_log` VALUES ('3464', 'YWJ', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '223.88.82.124', '2020-10-26 15:06:35');
INSERT INTO `tb_sys_log` VALUES ('3465', 'YWJ', '查询所有的菜单（列表）', 'doQueryMenuList', '[]', '223.88.82.124', '2020-10-26 15:06:39');
INSERT INTO `tb_sys_log` VALUES ('3466', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.124', '2020-10-26 15:06:47');
INSERT INTO `tb_sys_log` VALUES ('3467', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '223.88.82.124', '2020-10-26 15:06:47');
INSERT INTO `tb_sys_log` VALUES ('3468', 'YWJ', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-26 15:06:52');
INSERT INTO `tb_sys_log` VALUES ('3469', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:07:02');
INSERT INTO `tb_sys_log` VALUES ('3470', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:07:04');
INSERT INTO `tb_sys_log` VALUES ('3471', 'YWJ', '查询单个角色信息', 'doGetRole', '[\"1\"]', '223.88.82.124', '2020-10-26 15:07:09');
INSERT INTO `tb_sys_log` VALUES ('3472', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:07:16');
INSERT INTO `tb_sys_log` VALUES ('3473', 'YWJ', '查询单个角色信息', 'doGetRole', '[\"1\"]', '223.88.82.124', '2020-10-26 15:07:20');
INSERT INTO `tb_sys_log` VALUES ('3474', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:07:21');
INSERT INTO `tb_sys_log` VALUES ('3475', 'YWJ', '查询单个角色信息', 'doGetRole', '[\"1\"]', '223.88.82.124', '2020-10-26 15:07:23');
INSERT INTO `tb_sys_log` VALUES ('3476', 'YWJ', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:08:39');
INSERT INTO `tb_sys_log` VALUES ('3477', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:08:44');
INSERT INTO `tb_sys_log` VALUES ('3478', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '223.88.82.124', '2020-10-26 15:08:45');
INSERT INTO `tb_sys_log` VALUES ('3479', 'YWJ', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:11:25');
INSERT INTO `tb_sys_log` VALUES ('3480', 'YWJ', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-26 15:11:53');
INSERT INTO `tb_sys_log` VALUES ('3481', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.124', '2020-10-26 15:11:53');
INSERT INTO `tb_sys_log` VALUES ('3482', 'admin', '登录平台', 'doPostNewApplicationResource', '[\"admin\",\"1\",\"admin\"]', '223.88.82.124', '2020-10-26 15:12:01');
INSERT INTO `tb_sys_log` VALUES ('3483', 'admin', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"1\"]', '223.88.82.124', '2020-10-26 15:12:01');
INSERT INTO `tb_sys_log` VALUES ('3484', 'admin', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-26 15:12:06');
INSERT INTO `tb_sys_log` VALUES ('3485', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.124', '2020-10-26 15:12:06');
INSERT INTO `tb_sys_log` VALUES ('3486', 'admin', '登录平台', 'doPostNewApplicationResource', '[\"admin\",\"2\",\"admin\"]', '223.88.82.124', '2020-10-26 15:12:14');
INSERT INTO `tb_sys_log` VALUES ('3487', 'admin', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '223.88.82.124', '2020-10-26 15:12:14');
INSERT INTO `tb_sys_log` VALUES ('3488', 'admin', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-26 15:12:25');
INSERT INTO `tb_sys_log` VALUES ('3489', 'admin', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-26 15:13:40');
INSERT INTO `tb_sys_log` VALUES ('3490', 'admin', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '223.88.82.124', '2020-10-26 15:13:41');
INSERT INTO `tb_sys_log` VALUES ('3491', 'admin', '查询特征列表', 'doQueryExtendAttributeList', '[0,\"\",0,10]', '223.88.82.124', '2020-10-26 15:13:44');
INSERT INTO `tb_sys_log` VALUES ('3492', 'admin', '查询特征列表', 'doQueryExtendAttributeList', '[1,\"\",0,10]', '223.88.82.124', '2020-10-26 15:13:46');
INSERT INTO `tb_sys_log` VALUES ('3493', 'admin', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:13:59');
INSERT INTO `tb_sys_log` VALUES ('3494', 'admin', '查询单个账户信息', 'doGetAccount', '[\"1113\"]', '223.88.82.124', '2020-10-26 15:14:03');
INSERT INTO `tb_sys_log` VALUES ('3495', 'admin', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:15:50');
INSERT INTO `tb_sys_log` VALUES ('3496', 'admin', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:29:58');
INSERT INTO `tb_sys_log` VALUES ('3497', 'admin', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-26 15:30:43');
INSERT INTO `tb_sys_log` VALUES ('3498', 'admin', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:36:40');
INSERT INTO `tb_sys_log` VALUES ('3499', 'admin', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:36:46');
INSERT INTO `tb_sys_log` VALUES ('3500', 'admin', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:36:46');
INSERT INTO `tb_sys_log` VALUES ('3501', 'admin', '退出平台', 'loginOut', '[]', '223.88.82.124', '2020-10-26 15:31:56');
INSERT INTO `tb_sys_log` VALUES ('3502', 'admin', '获取所有的角色', 'doQueryRoleList', '[]', '223.88.82.124', '2020-10-26 15:36:47');
INSERT INTO `tb_sys_log` VALUES ('3503', 'admin', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '223.88.82.124', '2020-10-26 15:32:59');
INSERT INTO `tb_sys_log` VALUES ('3504', 'admin', '分页获取病人列表', 'doQueryPatientPageList', '[1,\"\"]', '223.88.82.124', '2020-10-26 15:32:59');
INSERT INTO `tb_sys_log` VALUES ('3505', 'admin', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '223.88.82.124', '2020-10-26 15:30:43');
INSERT INTO `tb_sys_log` VALUES ('3506', 'admin', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:36:47');
INSERT INTO `tb_sys_log` VALUES ('3507', 'admin', '获取分页角色', 'doQueryRolePageList', '[\"\",1]', '223.88.82.124', '2020-10-26 15:32:59');
INSERT INTO `tb_sys_log` VALUES ('3508', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-27 01:29:08');
INSERT INTO `tb_sys_log` VALUES ('3509', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-27 02:33:38');
INSERT INTO `tb_sys_log` VALUES ('3510', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-10-27 02:33:46');
INSERT INTO `tb_sys_log` VALUES ('3511', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '117.158.214.185', '2020-10-27 02:33:46');
INSERT INTO `tb_sys_log` VALUES ('3512', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-27 02:33:52');
INSERT INTO `tb_sys_log` VALUES ('3513', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '117.158.214.185', '2020-10-27 02:33:55');
INSERT INTO `tb_sys_log` VALUES ('3514', 'YWJ', '查询特征分类', 'doQueryMedicalRecordPageList', '[]', '117.158.214.185', '2020-10-27 02:33:57');
INSERT INTO `tb_sys_log` VALUES ('3515', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '117.158.214.185', '2020-10-27 02:33:57');
INSERT INTO `tb_sys_log` VALUES ('3516', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",0,10]', '117.158.214.185', '2020-10-27 02:33:57');
INSERT INTO `tb_sys_log` VALUES ('3517', 'YWJ', '查询特征列表', 'doQueryExtendAttributeList', '[-1,\"\",10,10]', '117.158.214.185', '2020-10-27 02:34:00');
INSERT INTO `tb_sys_log` VALUES ('3518', 'YWJ', '退出平台', 'loginOut', '[]', '117.158.214.185', '2020-10-27 02:39:08');
INSERT INTO `tb_sys_log` VALUES ('3519', 'bee', '分页获取账户列表', 'doQueryAccountPageList', '[null,\"\",1]', '117.158.214.185', '2020-10-27 02:43:40');
INSERT INTO `tb_sys_log` VALUES ('3520', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-27 02:43:40');
INSERT INTO `tb_sys_log` VALUES ('3521', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-27 02:44:21');
INSERT INTO `tb_sys_log` VALUES ('3522', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-27 02:53:23');
INSERT INTO `tb_sys_log` VALUES ('3523', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-27 03:12:48');
INSERT INTO `tb_sys_log` VALUES ('3524', 'bee', '分页获取病人列表', 'doQueryPatientPageList', '[1,null]', '117.158.214.185', '2020-10-27 06:02:30');
INSERT INTO `tb_sys_log` VALUES ('3525', 'bee', '获取所有的角色', 'doQueryRoleList', '[]', '117.158.214.185', '2020-10-27 06:13:23');
INSERT INTO `tb_sys_log` VALUES ('3526', 'YWJ', '登录平台', 'doPostNewApplicationResource', '[\"YWJ\",\"2\",\"123456\"]', '117.158.214.185', '2020-10-27 06:13:27');
INSERT INTO `tb_sys_log` VALUES ('3527', 'YWJ', '查询角色对应的菜单', 'doQueryRoleMenuTreeList', '[\"2\"]', '117.158.214.185', '2020-10-27 06:13:27');
INSERT INTO `tb_sys_log` VALUES ('3528', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-27 06:13:30');
INSERT INTO `tb_sys_log` VALUES ('3529', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '117.158.214.185', '2020-10-27 06:13:30');
INSERT INTO `tb_sys_log` VALUES ('3530', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-27 06:13:45');
INSERT INTO `tb_sys_log` VALUES ('3531', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-27 06:14:26');
INSERT INTO `tb_sys_log` VALUES ('3532', 'YWJ', '新增疾病疾病信息', 'doPostNewDiseaseInfo', null, '117.158.214.185', '2020-10-27 06:17:49');
INSERT INTO `tb_sys_log` VALUES ('3533', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '117.158.214.185', '2020-10-27 06:17:49');
INSERT INTO `tb_sys_log` VALUES ('3534', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-27 06:18:00');
INSERT INTO `tb_sys_log` VALUES ('3535', 'YWJ', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"声带白斑\\\",\\\"treatment\\\":\\\"测试\\\",\\\"introduction\\\":\\\"测试\\\",\\\"departmentId\\\":\\\"1111\\\",\\\"sort\\\":5,\\\"remark\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-27 06:18:37');
INSERT INTO `tb_sys_log` VALUES ('3536', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '117.158.214.185', '2020-10-27 06:18:37');
INSERT INTO `tb_sys_log` VALUES ('3537', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-27 06:19:09');
INSERT INTO `tb_sys_log` VALUES ('3538', 'YWJ', '新增疾病疾病信息', 'doPostNewDiseaseInfo', '[\"{\\\"name\\\":\\\"声带息肉\\\",\\\"treatment\\\":\\\"测试\\\",\\\"introduction\\\":\\\"测试\\\",\\\"departmentId\\\":\\\"1111\\\",\\\"sort\\\":6,\\\"remark\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-27 06:19:32');
INSERT INTO `tb_sys_log` VALUES ('3539', 'YWJ', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '117.158.214.185', '2020-10-27 06:19:32');
INSERT INTO `tb_sys_log` VALUES ('3540', 'YWJ', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '117.158.214.185', '2020-10-27 06:25:33');
INSERT INTO `tb_sys_log` VALUES ('3541', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-27 06:35:02');
INSERT INTO `tb_sys_log` VALUES ('3542', 'YWJ', '查询单个账户信息', 'doGetAccount', '[\"eb3b951e-e564-4dc1-920b-759872a9d98b\"]', '117.158.214.185', '2020-10-27 06:35:02');
INSERT INTO `tb_sys_log` VALUES ('3543', 'YWJ', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-27 06:36:31');
INSERT INTO `tb_sys_log` VALUES ('3544', 'YWJ', '查询单个账户信息', 'doGetAccount', '[\"d3a0bfeb-bfae-404f-b79c-b9f029469037\"]', '117.158.214.185', '2020-10-27 06:36:31');
INSERT INTO `tb_sys_log` VALUES ('3545', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '117.158.214.185', '2020-10-27 06:54:46');
INSERT INTO `tb_sys_log` VALUES ('3546', 'YWJ', '新增科室信息', 'doPostNewDepartmentInfo', '[\"{\\\"name\\\":\\\"啊\\\",\\\"sort\\\":4,\\\"remark\\\":\\\"\\\"}\"]', '117.158.214.185', '2020-10-27 06:54:54');
INSERT INTO `tb_sys_log` VALUES ('3547', 'YWJ', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '117.158.214.185', '2020-10-27 06:54:54');
INSERT INTO `tb_sys_log` VALUES ('3548', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-27 07:43:25');
INSERT INTO `tb_sys_log` VALUES ('3549', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-27 07:44:05');
INSERT INTO `tb_sys_log` VALUES ('3550', 'bee', '获取诊断结果', 'doQueryDiagnosticFeatureList', null, '127.0.0.1', '2020-10-27 07:44:24');
INSERT INTO `tb_sys_log` VALUES ('3551', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-10-27 08:10:12');
INSERT INTO `tb_sys_log` VALUES ('3552', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-10-27 08:12:38');
INSERT INTO `tb_sys_log` VALUES ('3553', 'bee', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '117.158.214.185', '2020-10-27 08:13:39');
INSERT INTO `tb_sys_log` VALUES ('3554', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-27 08:13:55');
INSERT INTO `tb_sys_log` VALUES ('3555', 'bee', '查询分页疾病', 'doQueryDiseasePageList', '[\"1111\",\"\",1]', '117.158.214.185', '2020-10-27 08:13:55');
INSERT INTO `tb_sys_log` VALUES ('3556', 'bee', '查询所有的科室', 'doQueryDepartmentList', '[]', '117.158.214.185', '2020-10-27 08:14:01');
INSERT INTO `tb_sys_log` VALUES ('3557', 'bee', '查询分页科室', 'doQueryDepartmentPageList', '[\"\",1]', '117.158.214.185', '2020-10-27 08:17:16');
INSERT INTO `tb_sys_log` VALUES ('3558', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-10-27 08:57:42');
INSERT INTO `tb_sys_log` VALUES ('3559', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-10-27 09:00:51');
INSERT INTO `tb_sys_log` VALUES ('3560', 'wangbo', '认可自动诊断记录', 'doPostSureMedicalInfo', '[\"11\",\"{     \\\"activeRuleJson\\\": \\\"123\\\",     \\\"diagnosisResult\\\": \\\"高血压\\\",     \\\"outFeatureJson\\\": \\\"12312\\\" }\"]', '127.0.0.1', '2020-10-27 09:02:25');
INSERT INTO `tb_sys_log` VALUES ('3561', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-10-27 09:26:52');
INSERT INTO `tb_sys_log` VALUES ('3562', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-10-27 09:30:57');
INSERT INTO `tb_sys_log` VALUES ('3563', 'wangbo', '登录平台', 'doPostNewApplicationResource', '[\"wangbo\",\"1\",\"123456\"]', '127.0.0.1', '2020-10-27 09:32:21');
INSERT INTO `tb_sys_log` VALUES ('3564', 'wangbo', '否定诊断记录', 'doPostNegativeMedicalInfo', '[\"123\",\"{     \\\"activeRuleJson\\\": \\\"123\\\",     \\\"diagnosisResult\\\": \\\"高血压\\\",     \\\"outFeatureJson\\\": \\\"12312\\\",     \\\"reason\\\": \\\"asdfasdfasdfasd\\\" }\"]', '127.0.0.1', '2020-10-27 09:32:24');

-- ----------------------------
-- Table structure for tb_treatment_objection
-- ----------------------------
DROP TABLE IF EXISTS `tb_treatment_objection`;
CREATE TABLE `tb_treatment_objection` (
                                        `id` int(11) NOT NULL AUTO_INCREMENT,
                                        `uuid` varchar(255) NOT NULL,
                                        `diagnosis_result` varchar(255) NOT NULL,
                                        `treatment_id` varchar(255) NOT NULL,
                                        `out_feature_json` varchar(1024) DEFAULT NULL,
                                        `active_rule_json` varchar(1024) DEFAULT NULL,
                                        `reason` varchar(255) DEFAULT NULL,
                                        `is_delete` int(2) NOT NULL DEFAULT '0',
                                        `create_user` varchar(255) NOT NULL,
                                        `update_user` varchar(255) NOT NULL,
                                        `create_time` datetime NOT NULL,
                                        `update_time` datetime NOT NULL,
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_treatment_objection
-- ----------------------------
INSERT INTO `tb_treatment_objection` VALUES ('27', 'a55479a8-2206-41f2-b1ba-c3ec84458f11', '高血压', '123', '12312', '123', 'asdfasdfasdfasd', '0', 'wangbo', 'wangbo', '2020-10-27 09:32:24', '2020-10-27 09:32:24');

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
                                     `is_delete` int(2) NOT NULL DEFAULT '0',
                                     `create_user` varchar(255) NOT NULL,
                                     `update_user` varchar(255) NOT NULL,
                                     `create_time` datetime NOT NULL,
                                     `update_time` datetime NOT NULL,
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_treatment_result
-- ----------------------------
INSERT INTO `tb_treatment_result` VALUES ('27', '431c608c-bdc5-4e84-910a-00d701d737f7', '高血压', '11', '12312', '123', '1', '0', 'wangbo', 'wangbo', '2020-10-27 09:02:25', '2020-10-27 09:02:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

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
