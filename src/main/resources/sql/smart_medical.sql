/*
Navicat MySQL Data Transfer

Source Server         : 39.98.147.216
Source Server Version : 50705
Source Host           : 39.98.147.216:3306
Source Database       : smart_medical

Target Server Type    : MYSQL
Target Server Version : 50705
File Encoding         : 65001

Date: 2020-10-29 14:02:27
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='组织机构、组、账户的自定义扩展属性定义';

-- ----------------------------
-- Records of idaas_extend_attr
-- ----------------------------
INSERT INTO `idaas_extend_attr` VALUES ('28', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', 'temp', '0', '年龄', 'age', 'single-selection', '1', '1', '0', '1', '', '8', null, '0', '2020-09-06 01:53:43', 'bee', '2020-09-09 05:42:34', 'bee', 'id001');
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
                                                    `foreign_id` varchar(255) DEFAULT NULL,
                                                    PRIMARY KEY (`id`),
                                                    KEY `idx_attr_id_delete` (`attr_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of idaas_extend_attr_config_selection
-- ----------------------------
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('24', '96e5845f-b3c0-4838-8fe4-a29f2de0d3b5', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '1', '年轻', '0', '1', null, '0', '2020-09-06 01:53:43', 'bee', '2020-09-06 13:45:31', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('25', '7cbcbecf-ba55-4bbf-9666-846360274c99', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '2', '中年', '0', '2', null, '0', '2020-09-06 01:53:43', 'bee', '2020-09-06 13:45:31', 'bee', null);
INSERT INTO `idaas_extend_attr_config_selection` VALUES ('26', '4fa62a65-e792-47f3-8e8b-816d65061c8e', 'c6e8e525-389d-47de-89c4-0ebe35ae0302', '3', '老年', '0', '3', null, '0', '2020-09-06 01:53:43', 'bee', '2020-09-06 13:45:31', 'bee', null);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES ('6', '1111', '咽喉科', null, '1', '0', 'bee', 'bee', '2020-07-06 11:12:45', '2020-07-06 11:12:48');
INSERT INTO `tb_department` VALUES ('7', '1112', '消化内科', null, '2', '0', 'bee', 'bee', '2020-07-06 11:13:41', '2020-07-08 11:13:45');
INSERT INTO `tb_department` VALUES ('8', '1113', '肛肠科', '备注', '3', '0', 'bee', 'bee', '2020-07-06 11:14:27', '2020-07-23 11:14:30');
INSERT INTO `tb_department` VALUES ('10', '6c773526-5e9f-48e6-b480-079bf59d48ab', '啊', '安生点', '4', '1', 'YWJ', 'YWJ', '2020-10-28 13:37:47', '2020-10-28 13:37:49');
INSERT INTO `tb_department` VALUES ('11', '026cf727-7b31-4216-a418-796a3963ab59', '谁的风格', '谁的风格', '4', '1', 'YWJ', 'YWJ', '2020-10-28 13:38:04', '2020-10-28 13:38:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_disease
-- ----------------------------
INSERT INTO `tb_disease` VALUES ('21', '5fb62003-4ed7-4508-888e-a655f91ae01e', '高血压', 'effbc3b2-f95e-49c1-a009-d71eca0ec432', null, null, '备注', '1', '0', 'bee', 'bee', '2020-08-16 10:56:50', '2020-08-16 10:56:50', null);
INSERT INTO `tb_disease` VALUES ('24', 'ea35c93e-0032-4242-b4d3-381532c19841', '修改为消化科', '1112', '11', '费都是发大水发阿斯蒂芬大奥德赛范德萨阿斯顿发', '发送到啊阿斯顿发', '0', '1', 'bee', 'YWJ', '2020-08-29 13:49:03', '2020-10-28 13:35:55', null);
INSERT INTO `tb_disease` VALUES ('30', 'd3a0bfeb-bfae-404f-b79c-b9f029469037', '慢性鼻炎', '1111', '鼻腔用药： 激素类：毕诺、伯可纳 、辅舒良、内舒拿、雷诺考特等', '阵发性喷嚏发作，大量清水样鼻涕，鼻塞', 'asd', '0', '0', 'bee', 'YWJ', '2020-09-06 03:30:01', '2020-10-28 13:19:31', null);
INSERT INTO `tb_disease` VALUES ('31', 'adfe9dbd-22e8-49cb-9e6c-0ca8fe2b5759', '慢性扁桃体炎', '1111', '扁桃体切除术', '咽痛或反复急性发作，咽部不适、异物感、口臭、刺激性咳嗽', '', '2', '0', 'bee', 'bee', '2020-09-06 03:30:21', '2020-09-06 08:55:43', null);
INSERT INTO `tb_disease` VALUES ('32', '16820b5f-ed1e-4cbd-9869-7f1b610970c3', '鼻咽癌', '1111', '手术疗法适于对放疗不敏感或放疗后颈淋巴转移未消退者', '易出血，吸鼻后痰中带血或擤出血性鼻涕。耳鸣、耳闷塞感及听力减退，或伴有鼓室积液', '', '3', '0', 'bee', 'bee', '2020-09-06 08:56:34', '2020-09-06 08:56:34', null);
INSERT INTO `tb_disease` VALUES ('33', '41000eb6-edfa-4da1-b7c7-def9e4d724cf', '喉癌', '1111', '1、全喉切除术：适用于T3～T4期喉癌病变，术后喉癌患者会失去喉功能，但经过食管发音训练后获得咽食管音，是很好的喉癌的治疗方法。　　2、水平部分喉切除术：这种喉癌的治疗方法适用于声门上型喉癌，指喉癌的病变累及会厌、室带、杓会厌襞等，但声带未受侵犯。喉癌患者在手术后可基本保留喉功能。　　3、化疗：治疗喉癌，对于晚期喉癌不能手术者，可采用化疗或放疗加化疗的综合疗法，同样是很好的一种喉癌的治疗方法。　　', '喉是人体的发音器官，由声门、声门上和声门下三部分构成。声带属声门区，会厌属声门上区，会厌负责关闭喉，防止食物掉进气管里。喉癌是发生在喉部的恶性肿瘤。\n\n长在声带上的喉癌症状明显，早期就有声音嘶哑。肿瘤长在声门上或声门下，早期症状不明显，或表现为声音嘶哑、异物感、咳嗽等，肿瘤长大后可出现呼吸困难、过度咳嗽、吞咽食物困难、脖子疼或者肿大等。晚期可经淋巴结转移。治疗主要是手术治疗，也可以放疗。', '', '4', '0', 'YWJ', 'YWJ', '2020-10-27 06:17:49', '2020-10-27 06:17:49', 'sk001');
INSERT INTO `tb_disease` VALUES ('34', '4849bea3-a7d8-4ff8-b249-79d5219b16ee', '声带白斑', '1111', '测试啊时代发生的', '测试', '', '5', '0', 'YWJ', 'YWJ', '2020-10-27 06:18:37', '2020-10-27 06:18:37', 'sk002');
INSERT INTO `tb_disease` VALUES ('35', 'eb3b951e-e564-4dc1-920b-759872a9d98b', '声带息肉', '1111', '测试阿斯顿发', '测试', '', '6', '0', 'YWJ', 'YWJ', '2020-10-27 06:19:32', '2020-10-27 06:19:32', 'sk003');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3663 DEFAULT CHARSET=utf8;

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
                                        `active_rule_json` varchar(2048) DEFAULT NULL,
                                        `reason` varchar(255) DEFAULT NULL,
                                        `is_delete` int(2) NOT NULL DEFAULT '0',
                                        `create_user` varchar(255) NOT NULL,
                                        `update_user` varchar(255) NOT NULL,
                                        `create_time` datetime NOT NULL,
                                        `update_time` datetime NOT NULL,
                                        `treatment_plan` varchar(1024) DEFAULT NULL,
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_treatment_objection
-- ----------------------------
INSERT INTO `tb_treatment_objection` VALUES ('27', 'd69c1c58-e7f6-489b-a330-77fe94b6735b', '高血压', 'd69c1c58-e7f6-489b-a330-77fe94b6735b', '[\r\n    {\r\n        \"fidOut\": \"sk001\",\r\n        \"fidOutName\": \"喉癌\",\r\n        \"value\": \"34.94%\"\r\n    },\r\n    {\r\n        \"fidOut\": \"sk002\",\r\n        \"fidOutName\": \"声带白斑\",\r\n        \"value\": \"23.81%\"\r\n    },\r\n    {\r\n        \"fidOut\": \"sk003\",\r\n        \"fidOutName\": \"声带息肉\",\r\n        \"value\": \"41.25%\"\r\n    }\r\n]', '[\r\n    {\r\n        \"rid\": \"R1\",\r\n        \"weight\": \"0.04939892178351416\"\r\n    },\r\n    {\r\n        \"rid\": \"R2\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R3\",\r\n        \"weight\": \"0.06586522904468554\"\r\n    },\r\n    {\r\n        \"rid\": \"R4\",\r\n        \"weight\": \"0.06037645995762842\"\r\n    },\r\n    {\r\n        \"rid\": \"R5\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R6\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R7\",\r\n        \"weight\": \"0.04391015269645703\"\r\n    },\r\n    {\r\n        \"rid\": \"R8\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R9\",\r\n        \"weight\": \"0.0384213836093999\"\r\n    },\r\n    {\r\n        \"rid\": \"R10\",\r\n        \"weight\": \"0.06037645995762842\"\r\n    },\r\n    {\r\n        \"rid\": \"R11\",\r\n        \"weight\": \"0.07394269456434804\"\r\n    },\r\n    {\r\n        \"rid\": \"R12\",\r\n        \"weight\": \"0.06037645995762842\"\r\n    },\r\n    {\r\n        \"rid\": \"R13\",\r\n        \"weight\": \"0.054887690870571285\"\r\n    },\r\n    {\r\n        \"rid\": \"R14\",\r\n        \"weight\": \"0.04939892178351416\"\r\n    },\r\n    {\r\n        \"rid\": \"R15\",\r\n        \"weight\": \"0.0806647577065615\"\r\n    },\r\n    {\r\n        \"rid\": \"R16\",\r\n        \"weight\": \"0.054887690870571285\"\r\n    },\r\n    {\r\n        \"rid\": \"R17\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R18\",\r\n        \"weight\": \"0.0\"\r\n    },\r\n    {\r\n        \"rid\": \"R19\",\r\n        \"weight\": \"0.04939892178351416\"\r\n    },\r\n    {\r\n        \"rid\": \"R20\",\r\n        \"weight\": \"0.04391015269645703\"\r\n    },\r\n    {\r\n        \"rid\": \"R21\",\r\n        \"weight\": \"0.060498568279921124\"\r\n    },\r\n    {\r\n        \"rid\": \"R22\",\r\n        \"weight\": \"0.054887690870571285\"\r\n    },\r\n    {\r\n        \"rid\": \"R23\",\r\n        \"weight\": \"0.04391015269645703\"\r\n    },\r\n    {\r\n        \"rid\": \"R24\",\r\n        \"weight\": \"0.054887690870571285\"\r\n    }\r\n]', 'asdfasdfasdfasd', '0', 'wangbo', 'wangbo', '2020-10-27 09:32:24', '2020-10-27 09:32:24', '123456');

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
                                     `treatment_plan` varchar(255) DEFAULT NULL,
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_treatment_result
-- ----------------------------
INSERT INTO `tb_treatment_result` VALUES ('27', '431c608c-bdc5-4e84-910a-00d701d737f7', '高血压', '11', '12312', '123', '1', '0', 'wangbo', 'wangbo', '2020-10-27 09:02:25', '2020-10-27 09:02:25', '123456');

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
