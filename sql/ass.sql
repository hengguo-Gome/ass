/*
Navicat MySQL Data Transfer

Source Server         : gome
Source Server Version : 50529
Source Host           : 10.128.11.129:3306
Source Database       : ass

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2014-10-21 17:38:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `crm_accessories`
-- ----------------------------
DROP TABLE IF EXISTS `crm_accessories`;
CREATE TABLE `crm_accessories` (
  `id` varchar(34) NOT NULL,
  `accessories_prod_code` varchar(54) DEFAULT NULL,
  `accessories_prod_name` varchar(40) DEFAULT NULL,
  `quantity` varchar(13) DEFAULT NULL,
  `unit_price` varchar(15) DEFAULT NULL,
  `amount` varchar(15) DEFAULT NULL,
  `accessories_brand` varchar(20) DEFAULT NULL,
  `accessories_category` varchar(20) DEFAULT NULL,
  `leg_no` varchar(10) DEFAULT NULL,
  `install_bill_id` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_accessories
-- ----------------------------
INSERT INTO `crm_accessories` VALUES ('02731b2e020e4f9eb445a05c1751dd29', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('155986d5eef14c02a2d9628be345292c', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('2c80d36c46bb4eebbe3bd1d9bdae3d07', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('2d046df7bc18481ca36b2e3846efa78c', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('46c389600afd4146be521e12386394a0', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('7ecff435fcf0416885e599dc74d828e4', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('801bc26dbcc94d28aa4e03273f887a15', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('931c4b83994a4de6b91fb02bb0051e2e', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('9724f7bc9a414656b253af1687665ceb', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('a157b6720ad44c679c9810684243f119', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('ae4cc642f231471da5d48370735d0fcc', '500000518', '步进电机(DQ04-25A)DG13B3-02TRU2811', '1.000', '40.02', '48.01', '01528', 'C0201001', '0200080383', '0200080383');
INSERT INTO `crm_accessories` VALUES ('b65218f1bc354f1f8f4c9b52cc16cb79', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('ce9e242b7c204d4bbec712d72f3c5d0b', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('d91fd12c96fe4eac9665bd13a7f81fc0', '500000518', '步进电机(DQ04-25A)DG13B3-02TRU2811', '1.000', '40.02', '48.01', '01528', 'C0201001', '0200080383', null);
INSERT INTO `crm_accessories` VALUES ('e785bd958eb641b19dd9bfebcd86780c', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);
INSERT INTO `crm_accessories` VALUES ('fda71733d5b84b0e9489422837bc8377', '1231', 'abcd', '1', '1', '2', '3', '4', '5', null);

-- ----------------------------
-- Table structure for `crm_company`
-- ----------------------------
DROP TABLE IF EXISTS `crm_company`;
CREATE TABLE `crm_company` (
  `id` varchar(32) NOT NULL,
  `company_code` varchar(4) NOT NULL,
  `company_name` varchar(25) DEFAULT NULL,
  `street` varchar(60) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  `remarks1` varchar(40) DEFAULT NULL,
  `remarks2` varchar(40) DEFAULT NULL,
  `remarks3` varchar(40) DEFAULT NULL,
  `remarks4` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index1` (`company_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_company
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_install_bill`
-- ----------------------------
DROP TABLE IF EXISTS `crm_install_bill`;
CREATE TABLE `crm_install_bill` (
  `bill_id` varchar(32) NOT NULL COMMENT '安装单ID，主键',
  `sales_org_short` varchar(12) DEFAULT NULL COMMENT '销售组织',
  `business_type` varchar(60) DEFAULT NULL COMMENT '业务类型',
  `po_number_sold` varchar(35) DEFAULT NULL COMMENT '提货单号',
  `bill_status` varchar(12) DEFAULT NULL COMMENT '单据状态',
  `appoint_date` date DEFAULT NULL COMMENT '预约时间天',
  `appoint_start_date` datetime DEFAULT NULL COMMENT '预约开始时间',
  `appoint_end_date` datetime DEFAULT NULL COMMENT '预约结束时间',
  `client_addr` varchar(60) DEFAULT NULL COMMENT '客户地址',
  `client_name` varchar(40) DEFAULT NULL,
  `client_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `client_other_contact` varchar(30) DEFAULT NULL COMMENT '其它联系方式',
  `goods_status_date` varchar(255) DEFAULT NULL COMMENT '货物状态时间',
  `gome_order_addr` varchar(10) DEFAULT NULL COMMENT '国美接单网点',
  `gome_exec_website` varchar(10) DEFAULT NULL COMMENT '执行网点',
  `order_worker_big` varchar(50) DEFAULT NULL COMMENT '接单工人（大工）',
  `order_worker_litter` varchar(50) DEFAULT NULL COMMENT '接单工人（小工）',
  `good_code` varchar(255) DEFAULT NULL COMMENT '商品编码',
  `good_name` varchar(255) DEFAULT NULL,
  `receipt_code` varchar(30) DEFAULT NULL COMMENT '回执工人代码',
  `receipt_name` varchar(50) DEFAULT NULL COMMENT '回执工人名称',
  `receipt_date` datetime DEFAULT NULL COMMENT '回执时间',
  `sender_name` varchar(40) DEFAULT NULL COMMENT '派工人员名称',
  `sender_date` datetime DEFAULT NULL COMMENT '派工时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `install_type` varchar(10) DEFAULT NULL COMMENT '安装类型',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件内容',
  `purchase_date` datetime DEFAULT NULL COMMENT '购货日期',
  `finish_status` varchar(30) DEFAULT NULL COMMENT '完成情况',
  `extend_po_num` varchar(35) DEFAULT NULL COMMENT '延保提单号',
  `invoice_num` varchar(40) DEFAULT NULL COMMENT '发票号码',
  `info_source` varchar(10) DEFAULT NULL COMMENT '信息来源',
  `sap_order_num` varchar(10) DEFAULT NULL COMMENT 'SAP订单号',
  `jl_order_num` varchar(35) DEFAULT NULL COMMENT '金力单号',
  `sales_org_code` varchar(14) DEFAULT NULL COMMENT '电器公司代码',
  `install_card_code` varchar(60) DEFAULT NULL COMMENT '安装卡编码',
  `outer_machine_code` varchar(60) DEFAULT NULL COMMENT '外机条码',
  `inner_machine_code` varchar(60) DEFAULT NULL COMMENT '内机条码',
  `is_finish` varchar(1) DEFAULT NULL COMMENT '是否完成',
  `bill_type` varchar(10) DEFAULT NULL COMMENT '单据类型',
  `installation_type` varchar(10) DEFAULT NULL,
  `longitude` double DEFAULT NULL COMMENT '经度',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `plan_finish_suquence` int(11) DEFAULT NULL COMMENT '计划完成顺序',
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_install_bill
-- ----------------------------
INSERT INTO `crm_install_bill` VALUES ('053f20e37306478f8b8407d5e6c4a4ba', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('06155dd90be844eabed9e62e11137de8', 'aa', null, '111', 'E0014', '2014-11-11', '2014-11-11 15:00:00', '2014-11-11 18:00:00', '江西', '王五', '13681239343', '110', '2014-1-1', '北京', null, '张三', '李四', '1111', '111', null, null, null, null, '2014-09-23 00:00:00', '备注', '1', null, '2014-12-12 11:11:11', null, null, null, null, null, '111', 'aa111', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('0ff51b4eb9a3447397a1de578ba33ea0', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('124b9571ad634d16ab0ca2aa8bc9bf53', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', null, 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('324524f6df214e4da1063c1e1950e428', null, '0', 'crm_001', 'E0014', '2014-09-24', null, null, null, null, null, null, null, 'S121', null, 'wbsjg_001', 'undefined_001', '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-23 15:59:11', 'LGX121016', '2014-09-23 15:59:11', null, '00', null, null, null, null, null, null, '0200080383', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('4d4dbb153031428c83658b286cdd5832', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('50e68bef98ea424eaca327fef0faf967', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('588dae29c4ac415aa5f652eaa8e41e68', null, '0', 'crm_001', 'E0010', '2014-09-24', '2014-09-24 08:00:00', '2014-09-24 10:00:00', '山西省运城市临猗县政府', '程彪', '13263180885', null, null, 'S121', null, 'wbsjg_001', 'undefined_001', '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-23 15:59:11', 'LGX121016', '2014-09-23 15:59:11', null, '00', null, null, null, null, null, null, '0200080383', '0200080383', '4001', null, null, null, null, null, '1', '110.78048515609', '35.150945617143', null);
INSERT INTO `crm_install_bill` VALUES ('6ded4f7bf26f4e078a67c8178fd53ea8', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('874e487413ce44ca98ca3ec88638958b', null, '0', null, 'E0010', '2014-09-23', '2014-09-23 10:00:00', null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', null, 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('935f1ad3a65b42ee8eed603a4f9e0ffc', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('9a2c566a72594d628fb14e1c71299a1d', 'S401', null, '1451049001', null, '2014-10-08', '2014-10-08 08:00:00', '2014-10-08 10:00:00', '石家庄市长安区测试路', '123', '13637373333', null, null, '0003003404', null, '0500002522', '0500002524', '000000000100189698', null, null, null, null, null, '2014-10-08 16:37:34', null, '1', null, '2014-10-08 00:00:00', null, null, null, null, null, '52777', '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('afd64ae1980f4e71bcff7189643c7938', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('c31fd24463d940ab906c5103c8472104', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('dea565a418a24879b2ee123f7f93b1fa', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', null, 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('e7ebe4dfb8b24a979779a1d41c4c68fb', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('eb7f0873c9944c55b8db007feddae038', null, '0', null, 'E0010', '2014-09-23', null, null, null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', '物流组测试专用-海尔空调KF-GW3385(338501)/SM白', 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);
INSERT INTO `crm_install_bill` VALUES ('fe07100388a5412f9fa5cd2640e66e10', null, '0', null, 'E0010', '2014-09-23', '2014-09-23 08:00:00', '2014-09-23 10:00:00', null, null, null, null, null, 'S121', null, '4001171', null, '000000000100210471', null, 'LGX121016', 'LGX121016', '2014-09-22 11:33:47', 'LGX121016', '2014-09-22 11:33:47', null, '00', null, null, null, null, null, null, '0200080373', null, '4001', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `crm_service`
-- ----------------------------
DROP TABLE IF EXISTS `crm_service`;
CREATE TABLE `crm_service` (
  `id` varchar(34) NOT NULL,
  `service_measures_code` varchar(20) DEFAULT NULL,
  `service_measures_name` varchar(40) DEFAULT NULL,
  `quantity` varchar(13) DEFAULT NULL,
  `unit_price` varchar(15) DEFAULT NULL COMMENT '数量',
  `gross_value` varchar(15) DEFAULT NULL COMMENT '单价',
  `leg_no` varchar(10) DEFAULT NULL COMMENT '价格',
  `install_bill_id` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_service
-- ----------------------------
INSERT INTO `crm_service` VALUES ('28e1354e817c413b8ce89d9516537ac3', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('2d38f0833a3b44469f3999bdcf7d84c5', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('3f2ca3ee92a941c8b69d6e86f6bb8a48', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('615f0237ff5849e69e64bba59a4d0d43', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('7a5a57e644a64154a7f30773ca3cd392', 'fw001', 'fw0000', '2', '10', '20', null, 'jl_001');
INSERT INTO `crm_service` VALUES ('7b87b510394049b3b0f00ac074469266', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('7b912234989a47fbaca92a424e11819f', '540000160', '安装费', '1.000', null, '100.00', '0200080383', '0200080383');
INSERT INTO `crm_service` VALUES ('7c05e3b2b2ea4d2f9eb83c6323a9fe31', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('7dcea0ac10ae473a869740b263af4ae4', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('8d91f6e387f04bf98673f32c45d5b58c', '540000160', '安装费', '1.000', null, '100.00', '0200080383', null);
INSERT INTO `crm_service` VALUES ('9229a38bbfe644cc9b0e8f483ac23910', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('aac443a7864746699212b28cc8b76194', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('afeeec4ffff245eba26759961bd6c34c', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('b17f5808287b445b9e07ea39d486980e', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('d0f6fc8fc0044a27972f97a04bb2ef7e', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('e0a4c77fb64e41d2ab596b35126980f1', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('f5088c1aaff342988a67e312dbebebf2', '540000160', '安装费', '1.000', null, '100.00', '0200080373', null);
INSERT INTO `crm_service` VALUES ('fa8652ae5e5e4c1c8ff7056a71cce437', 'fw002', 'fw00222', '4', '30', '120', null, 'jl_001');

-- ----------------------------
-- Table structure for `crm_web_basicdata`
-- ----------------------------
DROP TABLE IF EXISTS `crm_web_basicdata`;
CREATE TABLE `crm_web_basicdata` (
  `data_id` varchar(32) NOT NULL DEFAULT '',
  `code` varchar(12) DEFAULT NULL,
  `parent_code` varchar(12) DEFAULT NULL,
  `web_name` varchar(80) DEFAULT NULL COMMENT '网点名称',
  `sales_org` varchar(4) DEFAULT NULL COMMENT '网点名称',
  `web_level` varchar(16) DEFAULT NULL COMMENT '网点级别',
  `islast` varchar(1) DEFAULT NULL COMMENT '是否末级',
  `web_type` varchar(10) DEFAULT NULL COMMENT '网点类型',
  `web_property` varchar(8) DEFAULT NULL COMMENT '网点性质',
  `active` varchar(8) DEFAULT NULL COMMENT '是否启用',
  `good_flag` varchar(8) DEFAULT NULL COMMENT '带货安装标记',
  `servicer_perform` varchar(20) DEFAULT NULL COMMENT '服务商绩效',
  `sendText` varchar(1) DEFAULT NULL,
  `update_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_web_basicdata
-- ----------------------------
INSERT INTO `crm_web_basicdata` VALUES ('6b2b703de3a647ba8c439214d93099e8', '2', '0003000125', 'web_1', 'S502', '1', '1', '0', '1', '0', '1', '00000000000000000099', '0', 'M');
INSERT INTO `crm_web_basicdata` VALUES ('bd9232f9c2584fd59a84388cdf887725', '3', '0003000125', 'web_2', 'S101', '1', '1', '0', '1', '1', '1', '00000000000000000099', '0', 'M');
INSERT INTO `crm_web_basicdata` VALUES ('c3df2bf625c94c3599ce595422b98a24', '1', '0003000125', 'web_3', 'S401', '1', '1', '0', '1', '1', '1', '00000000000000000099', '0', 'M');

-- ----------------------------
-- Table structure for `crm_worker`
-- ----------------------------
DROP TABLE IF EXISTS `crm_worker`;
CREATE TABLE `crm_worker` (
  `worker_id` varchar(32) NOT NULL DEFAULT '',
  `website_code` varchar(12) DEFAULT NULL COMMENT '网点代码',
  `worker_code` varchar(20) DEFAULT NULL COMMENT '人员代码',
  `worker_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `worker_type` varchar(8) DEFAULT NULL,
  `logout_flag` varchar(1) DEFAULT NULL COMMENT '注销标记',
  `update_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_worker
-- ----------------------------
INSERT INTO `crm_worker` VALUES ('13aaa34c3dbb406abe8e4904e52f6436', 'S161', 'wbsjg_001', '小芳', '15810976335', '0', '0', null);
INSERT INTO `crm_worker` VALUES ('21345678fgdfg34534534535', '2', '123456789', 'test', '13681239343', '0', '0', null);
INSERT INTO `crm_worker` VALUES ('2702a77a9b1f4318b42f36e0657c762f', 'S165', '0004019153', '张三', '15063399978', '0', '1', null);
INSERT INTO `crm_worker` VALUES ('349335abc756471988211cfe90b8b834', 'S161', '0004019153', '李四', '15063399978', '0', '0', null);
INSERT INTO `crm_worker` VALUES ('70166a6ff2544abb8cfc66fb326d5d2b', 'S165', 'undefined_001', '小朱', '18311069179', '0', '1', null);
INSERT INTO `crm_worker` VALUES ('9865b64bf5044c29957c111aaa6f3200', '2', '1', '工人1', '1', '1', '1', '1');
INSERT INTO `crm_worker` VALUES ('ba1f925795874f2aad5c40ccae664f9a', '3', '3', '测试', '1', '1', '1', '1');
INSERT INTO `crm_worker` VALUES ('e64d20c36f3e4c0d994e465dcce9fb83', '1', '1', '测试', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `emp_account`
-- ----------------------------
DROP TABLE IF EXISTS `emp_account`;
CREATE TABLE `emp_account` (
  `empno` varchar(50) NOT NULL COMMENT '员工编号',
  `empname` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `ad_account` varchar(50) DEFAULT NULL COMMENT 'AD域账号',
  `ad_accountpwd` varchar(50) DEFAULT NULL COMMENT 'AD域密码',
  `ap_account` varchar(50) DEFAULT NULL COMMENT '应用系统账号',
  `ap_accountpwd` varchar(50) DEFAULT NULL COMMENT '应用系统账号密码',
  `compcode` varchar(50) DEFAULT NULL COMMENT '公司代码',
  `compname` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `phone` varchar(50) DEFAULT NULL COMMENT '移动手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `state` varchar(50) DEFAULT NULL COMMENT '状态',
  `needmodify` varchar(50) DEFAULT NULL COMMENT '是否需要修改密码',
  `operatortype` varchar(50) DEFAULT NULL COMMENT '操作类型',
  `createdate` datetime DEFAULT NULL COMMENT '创建日期',
  `createtime` varchar(10) DEFAULT NULL COMMENT '创建时间',
  `modifydate` datetime DEFAULT NULL COMMENT '修改日期',
  `modifytime` varchar(10) DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_account
-- ----------------------------
INSERT INTO `emp_account` VALUES ('00019871', '售后一', 'SHOUHOUYI11', 'Abcd123', 'SHY12010111', '123456', 'S201', '昆明国美售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00020001', '测试crm', 'CESHI144', 'Abcd123', 'CS1301011', '123456', 'S201', '昆明国美售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00060003', '三号', 'SANHAO1', 'Abcd123', 'SH1201011', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00080001', '测试十一', 'CESHISHIYI25', 'Abcd123', 'CSS12011012', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00080002', '测试十二', 'CESHISHIER15', 'Abcd123', 'CSS12010212', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00080003', '测试十三', 'CESHISHISAN15', 'Abcd123', 'CSS1201033', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00080006', '测试十六', 'CESHISHILIU14', 'Abcd123', 'CSS12011612', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00080007', '测试十七', 'CESHISHIQI14', 'Abcd123', 'CSS1201172', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00080008', '测试十八', 'CESHISHIBA4', 'Abcd123', 'CSS1201173', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00080021', '测试一', 'CESHIYI23', 'Abcd123', 'CSY1203011', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00080022', '测试二', 'CESHIER34', 'Abcd123', 'CSE12030212', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00080023', '测试三', 'CESHISAN37', 'Abcd123', 'CSS1203031', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00090003', '测试三', 'CESHISAN38', 'Abcd123', 'CSS11072512', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, 'ceshi3@ceshi.com', '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00090004', '测试四', 'CESHISI27', 'Abcd123', 'CSS12012212', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00090005', '测试五', 'CESHIWU17', 'Abcd123', 'CSW1107181', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00090006', '测试六', 'CESHILIU6', 'Abcd123', 'CSL1107181', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00090007', '测试四', 'CESHISI28', 'Abcd123', 'CSS1107241', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00090008', '测试五', 'CESHIWU18', 'Abcd123', 'CSW11072412', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00090009', '测试六', 'CESHILIU7', 'Abcd123', 'CSL1107241', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('00400132', '自建', 'ZIJIAN26', 'Abcd123', 'ZJ12070111', '123456', 'S401', '石家庄国美电器售后服务有限公司', null, null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('10000581', '靳帅民', 'JINSHUAIMIN2', 'Abcd123', 'JSM1103142', '123456', 'S401', '石家庄国美电器售后服务有限公司', '13933808523', null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('10000774', '李枫', 'LIFENG44', 'Abcd123', 'LF11051212', '123456', 'S401', '石家庄国美电器售后服务有限公司', '13633113199', null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('10000941', '武文赟', 'WUWENBIN3', 'Abcd123', 'WWB1105202', '123456', 'S401', '石家庄国美电器售后服务有限公司', '15833310543', null, '1', 'Y', '异动', '2014-09-18 00:00:00', '16:12:28', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_account` VALUES ('10007697', '甲员工', 'JIAYUANGONG11', null, 'JYG11091212', '123456', '4001', '河北国美电器有限公司', '12361451265', null, '3', 'Y', '注销', '2014-10-17 00:00:00', '03:53:13', '2014-10-17 00:00:00', '03:53:13');

-- ----------------------------
-- Table structure for `emp_accountjoblog`
-- ----------------------------
DROP TABLE IF EXISTS `emp_accountjoblog`;
CREATE TABLE `emp_accountjoblog` (
  `logid` varchar(64) NOT NULL COMMENT '日志id',
  `batchno` varchar(50) DEFAULT NULL COMMENT 'oa批次号',
  `empno` varchar(50) DEFAULT NULL COMMENT '员工编号',
  `empname` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `ad_account` varchar(50) DEFAULT NULL COMMENT 'AD域账号',
  `ap_account` varchar(50) DEFAULT NULL COMMENT '应用系统账号',
  `compname` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `deptcode` varchar(50) DEFAULT NULL COMMENT '部门代码',
  `deptname` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `positioncode` varchar(50) DEFAULT NULL COMMENT '岗位编码',
  `positionname` varchar(100) DEFAULT NULL COMMENT '岗位名称',
  `dutyflag` varchar(50) DEFAULT NULL COMMENT '兼职标志',
  `state` varchar(50) DEFAULT NULL COMMENT '状态',
  `loginfo` varchar(500) DEFAULT NULL COMMENT '消息内容',
  `errorinfo` varchar(500) DEFAULT NULL COMMENT '错误消息',
  `createdate` datetime DEFAULT NULL COMMENT '创建日期',
  `createtime` varchar(10) DEFAULT NULL COMMENT '创建时间',
  `modifydate` datetime DEFAULT NULL COMMENT '修改日期',
  `modifytime` varchar(10) DEFAULT NULL COMMENT '修改时间',
  `operatortype` varchar(50) DEFAULT NULL COMMENT '操作类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_accountjoblog
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_empposition`
-- ----------------------------
DROP TABLE IF EXISTS `emp_empposition`;
CREATE TABLE `emp_empposition` (
  `id` varchar(64) NOT NULL,
  `empno` varchar(50) NOT NULL COMMENT '员工编号',
  `headcode` varchar(50) DEFAULT NULL COMMENT '总部代码',
  `headname` varchar(100) DEFAULT NULL COMMENT '总部名称',
  `regioncode` varchar(50) DEFAULT NULL COMMENT '大区代码',
  `regionname` varchar(100) DEFAULT NULL COMMENT '大区名称',
  `onebranchcode` varchar(50) DEFAULT NULL COMMENT '以及分部代码',
  `onebranchname` varchar(100) DEFAULT NULL COMMENT '一级分部名称',
  `twobranchcode` varchar(50) DEFAULT NULL COMMENT '二级分部代码',
  `twobranchname` varchar(100) DEFAULT NULL COMMENT '二级分部名称',
  `storecode` varchar(50) DEFAULT NULL COMMENT '门店代码',
  `storename` varchar(100) DEFAULT NULL COMMENT '门店名称',
  `deptcode` varchar(50) DEFAULT NULL COMMENT '部门代码',
  `deptname` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `positioncode` varchar(50) DEFAULT NULL COMMENT '岗位代码',
  `positionname` varchar(100) DEFAULT NULL COMMENT '岗位名称',
  `startdate` varchar(50) DEFAULT NULL COMMENT '开始日期',
  `enddate` varchar(50) DEFAULT NULL COMMENT '结束日期',
  `orglevel` varchar(50) DEFAULT NULL COMMENT '组织层级',
  `orgleveldetail` varchar(50) DEFAULT NULL COMMENT '组织层级细分',
  `dutyflag` varchar(50) DEFAULT NULL COMMENT '兼职标志',
  `createdate` datetime DEFAULT NULL COMMENT '创建日期',
  `createtime` varchar(10) DEFAULT NULL COMMENT '创建时间',
  `modifydate` datetime DEFAULT NULL COMMENT '修改日期',
  `modifytime` varchar(10) DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_empposition
-- ----------------------------
INSERT INTO `emp_empposition` VALUES ('cd085ddaa8c54e85965173271f68779b', '00019871', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20120101', '99991231', null, null, '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('0e8e1573ebe94910b24b46a9bfaae3b7', '00020001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20130101', '99991231', null, null, '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('05a170ef715740e5a0f0c895680fcf1c', '00060003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, '50000829', '中山路门店家电医院', null, null, 'S120F00000V318', '河北国美中山路门店E快服务售后自建服务中心门店E快主管', '20120101', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('60f69683a14a43388051075be01b53b7', '00080001', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120110', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('8a67a9236192422384f5eaf41be91721', '00080002', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120102', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('1f49cbf236e64adfad9d54453a0b20b6', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('12a71b7e3d994220b4e2606035cdf6a7', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120103', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('470ba62681f74bbc8016f56c42b65bc0', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('114d98b15bda45bebf9cf60e3eedd248', '00080006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120116', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('e932d2af39274f74b1303b28f69625b0', '00080007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120117', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('c338d3baeafd49f19c46a1d43ebd1cd3', '00080008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120117', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('31e40974ffc542ea94d8124068856c67', '00080021', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120301', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('c91ec0d2bc1a45979f6658c8bd26ebd6', '00080022', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120302', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('131e1c29bd884e9196279c98a76ef064', '00080023', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120303', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('7faf85335f7e4238b4f76c8b86783f22', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('c9e6cb38b94c4d8cbc5e11c09253ab78', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110725', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('532e85e6fc7c4692bbf665f6016cf0d2', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('16aa6ca977bd4cf5b8357ea45cb112f4', '00090004', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120122', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('4d6f2e23407a49298a915bdbd0b23f3a', '00090005', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110718', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('572075b45f8a4eb3832a9a017078d085', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('8e1ffc572a594bca8d5aba0dce4d913e', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110718', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('16c894e7caf24f2f844d56ca87ca679d', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('f967cc39d2c94c1d90d0cd1b6220a6e8', '00090007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110724', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('9a78c839211445f89135db3b2cb55a8a', '00090008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110724', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('9aa68676c3ad4e61a0761b5fee35ef52', '00090009', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110724', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('5d042d5c23ea4e2fafc6100b5e7b235b', '00400132', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120701', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('817fa337e451480a9b5e6891852fa877', '10000581', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000G418', '河北国美售后自建服务中心调度主管', '20110314', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('f74b17e7c4704564901a510725d8fc7c', '10000774', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110512', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('78eb14f961274448b51d778abefc26bd', '10000941', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110520', '99991231', '2', '10', '1', '2014-09-18 00:00:00', '16:12:28', '2014-09-18 00:00:00', '16:12:28');
INSERT INTO `emp_empposition` VALUES ('8d772a38868c407996cfaa93b4fd931f', '00019871', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20120101', '99991231', null, null, '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('31f549ebf0894f46811404cc6936c594', '00020001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20130101', '99991231', null, null, '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('320f4fa4515248db844463378a13a09f', '00060003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, '50000829', '中山路门店家电医院', null, null, 'S120F00000V318', '河北国美中山路门店E快服务售后自建服务中心门店E快主管', '20120101', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('4d80e16f74114398be186e98d5e4bb55', '00080001', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120110', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('9e806fca4c69451db6df87fea0d4cadc', '00080002', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120102', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('1147cf27e15c447293932ffc2eb0be72', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('6729997e0c5a4bd99d07558fd919bc88', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120103', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('70ad30ef1b37492bbdb14f4344bf892e', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('0a9e18693c084cc1ab736a5c263e969d', '00080006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120116', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('08a2abd733a844e58f0f58c7839b16c9', '00080007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120117', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('576611702b07449d8bfb90c2261375b6', '00080008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120117', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('a851359ccaf543bda05e09213e5bf8d6', '00080021', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120301', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('9aa26faacf9f4fd5be4d58739886e8af', '00080022', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120302', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('bc2758f1228a48e3beb2e5090c54cc13', '00080023', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120303', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('153dd5eff02245ccab82d097f08e11ff', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('bea07e008bb748a4930bd979a1c0bc86', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110725', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('3fb277445aed458e998454959d2d4e46', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('7735a96e86f449ff881e7112744f5eb8', '00090004', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120122', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('7a2872aba65a4428980eaea732d26f4a', '00090005', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110718', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('ff0a31776420416093e3690d9f075bfa', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('2afc0314d58149f59c72f846cc91b75d', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110718', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('809f088137c94d0a9d4bdc6029fe258b', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('fd3d511fca3d4afb925bfb2497d10786', '00090007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110724', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('e6252d714be74970a2ecdc476bfa5a4e', '00090008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110724', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('216f93b2e4c84389a09e5153e4c40b0f', '00090009', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110724', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('ba2bfac4f489463493f3db2fff5f386a', '00400132', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120701', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('816cfc16cb004334b5844d798ded6fe5', '10000581', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000G418', '河北国美售后自建服务中心调度主管', '20110314', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('3d1f3f1a541649358ed7694b7f5e131c', '10000774', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110512', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('a031d424d99a45199f39fdf676d7c85b', '10000941', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110520', '99991231', '2', '10', '1', '2014-09-30 00:00:00', '17:50:00', '2014-09-30 00:00:00', '17:50:00');
INSERT INTO `emp_empposition` VALUES ('8171c5ea1fc541a1b35fbddc43df7f88', '00019871', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20120101', '99991231', null, null, '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('58c491ab52a348bba5659cf8cff3c4a1', '00020001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20130101', '99991231', null, null, '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('4d2f5796021045dfa43a8d0fe7b13df4', '00060003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, '50000829', '中山路门店家电医院', null, null, 'S120F00000V318', '河北国美中山路门店E快服务售后自建服务中心门店E快主管', '20120101', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('ac268b430a2f4111803a76d47a5c8937', '00080001', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120110', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('daa74310b8ef46f796275069e50da117', '00080002', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120102', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('bb2844a7a65f4e79bd7e4525966a929f', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('d71c35910672495583786797050b21a8', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120103', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('55e6168514bc44f891ca2bc7d24a03f8', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('ccb6b3cf46ee498f8fa2dd4c7b66c8b8', '00080006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120116', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('e59889fb583a49f4a28baeb0dd08973e', '00080007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('b469c078631d4ad5bd81431ed05a04c0', '00080008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('d9954ce4d7ae47319ce319643c97a540', '00080021', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120301', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('3192057608484bc7bd95a1fb51aebc2f', '00080022', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120302', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('b41e831da5544ac3a260b60d569763d6', '00080023', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120303', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('94037f74af9444dcacbfefaf3dc02da8', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('e963531b93e6443b9f93287880ce0f2b', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110725', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('587f2974fd4c4c3991ebb717fe28653f', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('e811ecf459e34ae3ad327dcca454b18a', '00090004', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120122', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('01506ef56b0743cfb8c1773c998a7325', '00090005', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('20c1abd70ecd4144b19266a6a7028da0', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('322700fd1fbe4f6a937ecad165765326', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('b02d9d9d7a244e469e344bc5b3d01c98', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('840e26de3bc84744a0d875a83774faee', '00090007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('8b6586faaf724551bcd80b0334beedd0', '00090008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('48e445e6939d42738dec1b2af6e6f1a8', '00090009', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('6ed28ea86235406aa379dae678e0e39e', '00400132', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120701', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('87bf2d66e733435e91d1f41e3effb7c5', '10000581', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000G418', '河北国美售后自建服务中心调度主管', '20110314', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('614601878e2f4e138fd6a4089f979ae2', '10000774', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110512', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('3c2b8856447c44c48e4c2cf788f7614d', '10000941', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110520', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:40:53', '2014-10-08 00:00:00', '09:40:53');
INSERT INTO `emp_empposition` VALUES ('6460f6b72eb445aebaa61c0f62cf2e4f', '00019871', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20120101', '99991231', null, null, '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('5c168d30b7044893bcf5a7cf66b7daaf', '00020001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20130101', '99991231', null, null, '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('42ea1e1edf6243b0b937b0f123e83ddb', '00060003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, '50000829', '中山路门店家电医院', null, null, 'S120F00000V318', '河北国美中山路门店E快服务售后自建服务中心门店E快主管', '20120101', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('5e383f70b72e4fea9a699e553a1f344c', '00080001', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120110', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('35731994cc5640dc9e21b7035004870a', '00080002', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120102', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('24186c80e9084370a10215676fe803cb', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('6ffb12f5d4b84d2cb86753a29c13b6a0', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120103', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('b042ea414906494aa0bc43e8a25457cc', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('3ea6c62ef3a74ab4b80919cbc75fce26', '00080006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120116', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('d421f4c2936942cabb0d4155e8182955', '00080007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('1fb3e34b04e34ff4a3b5eba364e94439', '00080008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('4937fbb454d94b86885e7c4e1e1a4cd0', '00080021', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120301', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('d0aa04621a58460fab976015d614a204', '00080022', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120302', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('60b882b0be33452ea5f0a0908750d409', '00080023', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120303', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('7f592739544749638e98aa545c8fe0ae', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('18ba8441212c4a86baf5f1ee85501ffa', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110725', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('4d999a6c591d47b493ea3bb96d8c554e', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('bf9f0de6eb514963bec6a8a218534226', '00090004', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120122', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('4df1b22c92834d57a36b1575e87a1b46', '00090005', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('e5116c3c023a490691a4643ade6670d0', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('baf069587d0f466194219f50736020f3', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('178b762485954c8091e3919c7dec1e11', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('4729db92a4a44637bf40d7cb6b6c3f13', '00090007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('10b30e58cd2a44968477a34f1c29c523', '00090008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('dd927ce382144b60a4e2f663bcf22fa0', '00090009', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('025492f522324a48a5bfa89259690b8c', '00400132', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120701', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('8b2313308a4848ffa0ad177534d5edbb', '10000581', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000G418', '河北国美售后自建服务中心调度主管', '20110314', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('41e69f3e8a354880894334af95dd8424', '10000774', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110512', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('09bc5ef4b90448f986c5f11e3a37d6b5', '10000941', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110520', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:45:00', '2014-10-08 00:00:00', '09:45:00');
INSERT INTO `emp_empposition` VALUES ('e7bdb8457a2342f6a68c9719e8622a62', '00019871', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20120101', '99991231', null, null, '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('2c5ebf5bfc354dc29e7234c67869f122', '00020001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20130101', '99991231', null, null, '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('adbf5e65fc264af9b4a65ad85fb442eb', '00060003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, '50000829', '中山路门店家电医院', null, null, 'S120F00000V318', '河北国美中山路门店E快服务售后自建服务中心门店E快主管', '20120101', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('a03471846e4647dbb3ecdb7ccef8e026', '00080001', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120110', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('ac600b509c7042d895be438a68050463', '00080002', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120102', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('690c34ca073c47ada9ad6b5d2cbbff32', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('bd63d2088c414ac49aad890125dd15a2', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120103', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('0ab5731508a24ed3a5f013aed13b6611', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('92d22dd301764b28823da1091c5107f8', '00080006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120116', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('a4597351106b450d8721518459a515e8', '00080007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('04a6a0d14d8f4171bbc7a83d1d5db272', '00080008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('e4741a2a2be445529310d3c44af5c67a', '00080021', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120301', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('5ad9a2ffd0d842d7b297f50f38fa6fa5', '00080022', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120302', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('67c7786e96bd4c5693da6733373c0a74', '00080023', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120303', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('53bd2f28390c4cad89b095b64fbcca56', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('93923d1a643a4d8d815282bc919f0d4a', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110725', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('af7eaf6e33224631a1220ccde762b5cd', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('f880e3d771ed49579e1ac92fcc4f2996', '00090004', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120122', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('8eb69efb60de41c7ba114a453d7180e6', '00090005', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('cd53cbd2dfa74ceaad8a011e4817ca67', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('72bd8a729b8845ceae099fc94650bbf4', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('56140b50b27d46d69df6f9976f58c68d', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('d1a470b2654e46b3abc8eb210a04c3b2', '00090007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('415d3fdcc7d540cf8a15744c604c0af4', '00090008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('781f7760f4ce4b119e669a1084226a94', '00090009', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('5af1d656d74e41e09e72f31b983ed5ed', '00400132', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120701', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('83697e2a1664450b9f18814cda7dff20', '10000581', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000G418', '河北国美售后自建服务中心调度主管', '20110314', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('8af4ed33b78b45268e9db66e37844b77', '10000774', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110512', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('fe65898c5fd84582872ddf4ec4ba286d', '10000941', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110520', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:50:00', '2014-10-08 00:00:00', '09:50:00');
INSERT INTO `emp_empposition` VALUES ('21b2a37bd0044b04a48e040956d00ade', '00019871', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20120101', '99991231', null, null, '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('a5709e57e9054658a902fd4cf082c621', '00020001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20130101', '99991231', null, null, '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('1da33d00f7734b098fadf8145eef3a58', '00060003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, '50000829', '中山路门店家电医院', null, null, 'S120F00000V318', '河北国美中山路门店E快服务售后自建服务中心门店E快主管', '20120101', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('b31fd6f7ad7a46dabcfb89577b7fff6f', '00080001', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120110', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('94717d7d2aa743688fdbf129ce86ba1a', '00080002', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120102', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('50590f59ca774724b55f5074591442ea', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('c9be9d1a2a21483a8225eb7704d12f80', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120103', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('a96ad1ca51d9495d9d4b2061e8f2be13', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('2cf050e399f04a3992477c7439e14e7d', '00080006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120116', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('4026abe9fd0547a087e588a55290cc3a', '00080007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('d99e5bd59dbd471ba9e6d61b8afed965', '00080008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('760594745fa74aba94239000d1bfb1dc', '00080021', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120301', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('86a905684c3244ab9ee3280cc549572e', '00080022', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120302', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('8315dd5872c84d18a0a8acf71317c48f', '00080023', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120303', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('f6b38fd990514c02a2b1a393fe8341ce', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('a0386efd0c824b4fa74fd62665e74c07', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110725', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('e0cc3cab94bd402eaaec6ecd3b6aa121', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('092585809baf414ab81c6e8ff46b188c', '00090004', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120122', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('ffff9bfdebb34c6faa908f10cff17d55', '00090005', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('1fd4d4c6b64d4f62a3924d5624964d51', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('bc721d51af684166b193724bee443ec8', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('92f2438a0a9e448ba925545cb69581d9', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('399e92c348bd4a1f9dd6b7e8776ec68c', '00090007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('09d97704f32547da8429a0696ec64034', '00090008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('12608264414747dca445faf0546e48df', '00090009', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('14ab0b3a19cc4ffd8a1fd5ddeef7678e', '00400132', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120701', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('f33b696c81a8470c952c968275fd5d16', '10000581', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000G418', '河北国美售后自建服务中心调度主管', '20110314', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('ea93cce26a6a4c9291d744b66bd99683', '10000774', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110512', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('5bbbfd0791684c98a8e292d125605a54', '10000941', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110520', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '09:55:00', '2014-10-08 00:00:00', '09:55:00');
INSERT INTO `emp_empposition` VALUES ('6d37541fe65945c0ba2f27847c76d5d9', '00019871', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20120101', '99991231', null, null, '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('2d66670380234376a0302b5ad2d30aa0', '00020001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '20130101', '99991231', null, null, '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('37362f90674c42c6b8ecbbc5c3113012', '00060003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, '50000829', '中山路门店家电医院', null, null, 'S120F00000V318', '河北国美中山路门店E快服务售后自建服务中心门店E快主管', '20120101', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('9490ba0ac01748f9923260f2169a9424', '00080001', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120110', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('5e3aa59050a74ae6959452147930e913', '00080002', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120102', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('d7822946dbed47cabe865dc62cbef7c6', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('df5fb770e45a4a3bacdad4d59e84299b', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120103', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('de43af5e5ab140669b5f091a86e13734', '00080003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000841', '售后服务中心（自建）测四', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120105', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('da707918616441898fbdd905febf82a3', '00080006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120116', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('5db4f69069004ebfad075420a180d88a', '00080007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('56102a6a673d4aaab072c3be425bcdbb', '00080008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000842', '售后服务中心（自建）测五', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120117', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('d113f7d1d6cc40fcbea3cd8e971a4eee', '00080021', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120301', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('b7320dc451174af99c2fdd614709bd69', '00080022', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20120302', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('c362289bb8e540e89c5db75fae7a54f6', '00080023', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000847', '售后服务中心（自建）测六', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20120303', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('e20b39a4babd46ba9e37aff62d36538d', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('847d4571bd264cc387437709ba907e6f', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110725', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('8c095985a12b4dd0b79cf946fceedf06', '00090003', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110721', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('5680ba41fe4f4970b1a3c145f3967d4f', '00090004', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120122', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('ad619f1f2f9649e18bcaadddf1606ab8', '00090005', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('2b215484f65e4411b6deabac64ebb775', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('ad932be8e3b843f985cf96322518267b', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110718', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('b4aa8c18906e44d0971d6180ecc87ed9', '00090006', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000835', '售后服务中心（自建）测二', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110720', '99991231', '2', '10', '0', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('e69267b234914410b81d84273531b523', '00090007', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('fc7ef1e0a4fc4ba8af6767cfb8d96088', '00090008', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000L718', '河北国美售后自建服务中心传统家电主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('313b3ce2d40d4c41a45b61f2d3aac985', '00090009', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000840', '售后服务中心（自建）测三', 'HB00F00000V418', '河北国美售后自建服务中心安装服务商主管', '20110724', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('ef685c4d422f4731af34d1f04a25bdf4', '00400132', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000830', '售后服务中心（自建）测试', 'HB00F00000H718', '河北国美售后自建服务中心服务质量管理主管', '20120701', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('0ec9518afb60407ba8b2a47c25250d99', '10000581', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000G418', '河北国美售后自建服务中心调度主管', '20110314', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('8534438691824e81a45c0cd964b06f42', '10000774', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110512', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');
INSERT INTO `emp_empposition` VALUES ('f4c1709d7ba24aa7bfe2750472075e6a', '10000941', null, null, '10000158', '华北大区', '10000168', '河北分部', null, null, null, null, '50000151', '售后服务中心（自建）', 'HB00F00000U520', '河北国美售后自建服务中心信息专员', '20110520', '99991231', '2', '10', '1', '2014-10-08 00:00:00', '10:15:00', '2014-10-08 00:00:00', '10:15:00');

-- ----------------------------
-- Table structure for `emp_sysvar`
-- ----------------------------
DROP TABLE IF EXISTS `emp_sysvar`;
CREATE TABLE `emp_sysvar` (
  `varcode` varchar(50) NOT NULL COMMENT '变量编码',
  `varname` varchar(50) DEFAULT NULL COMMENT '变量名称',
  `varvalue` varchar(50) NOT NULL COMMENT '变量值',
  `vardesc` varchar(50) DEFAULT NULL COMMENT '变量描述',
  `varremark` varchar(50) DEFAULT NULL COMMENT '变量备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_sysvar
-- ----------------------------
INSERT INTO `emp_sysvar` VALUES ('abatchno', null, '20141016172535292', '获取账号的批次号！', null);

-- ----------------------------
-- Table structure for `jl_account`
-- ----------------------------
DROP TABLE IF EXISTS `jl_account`;
CREATE TABLE `jl_account` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '帐号',
  `account_number` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `account_name` varchar(80) DEFAULT NULL,
  `account_password` varchar(40) DEFAULT NULL,
  `company_code` varchar(10) DEFAULT NULL COMMENT '公司代码',
  `account_dept` varchar(30) DEFAULT NULL COMMENT '所属部门',
  `website_code` varchar(12) DEFAULT NULL COMMENT '所属网点',
  `website_name` varchar(80) DEFAULT NULL COMMENT '所属网点名称',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` decimal(8,0) DEFAULT NULL COMMENT '0正常 1锁定',
  `init_password` date DEFAULT NULL,
  `account_status` decimal(10,0) DEFAULT NULL COMMENT '人员状态 0系统新建；1新增；2异调；3注销；4解锁；5锁定；6临时锁定；',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jl_account
-- ----------------------------
INSERT INTO `jl_account` VALUES ('111111', '111111', 'b', '1', '2', '2', '2', '2', '2014-01-01', '2014-11-01', '3', '2014-01-01', '0');
INSERT INTO `jl_account` VALUES ('222222', '222222', 'test', '2', '2', '2', '2', '2', '2055-09-01', '2014-11-01', '3', '2014-01-01', '0');
INSERT INTO `jl_account` VALUES ('30012081', '30012081', '30012081', '670b14728ad9902aecba32e22fa4f6bd', 'S502', 'S502', '0003001208', '北京潞城伟业电器维修部', '2013-03-20', '9999-12-31', '0', '2013-04-17', '0');
INSERT INTO `jl_account` VALUES ('333333', '333333', 'b', '1', '2', '2', '2', '2', '2014-01-01', '2014-11-01', '3', '2014-01-01', '0');

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '1', '125', '1111', '2014-09-05 16:51:11');
INSERT INTO `person` VALUES ('2', '2', '2', '2222', '2014-09-15 18:03:14');
INSERT INTO `person` VALUES ('1123', 'asd', null, null, '2014-09-16 15:22:09');

-- ----------------------------
-- Table structure for `sh_code`
-- ----------------------------
DROP TABLE IF EXISTS `sh_code`;
CREATE TABLE `sh_code` (
  `code_id` varchar(16) NOT NULL,
  `code_name` varchar(20) NOT NULL,
  `editable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_code
-- ----------------------------
INSERT INTO `sh_code` VALUES ('worker_logout', '安装工注销标记', '1');
INSERT INTO `sh_code` VALUES ('boolean', '真假值(是，否)', '1');
INSERT INTO `sh_code` VALUES ('device_status', '设备状态', '1');
INSERT INTO `sh_code` VALUES ('interface_type', '接口类型', '1');
INSERT INTO `sh_code` VALUES ('result_content', '消息处理结果', '1');
INSERT INTO `sh_code` VALUES ('sender', '消息发送方', '1');
INSERT INTO `sh_code` VALUES ('receiver', '消息接收方', '1');
INSERT INTO `sh_code` VALUES ('user_type', '系统用户类型', '1');
INSERT INTO `sh_code` VALUES ('message_type', '消息的类型', '1');

-- ----------------------------
-- Table structure for `sh_code_setting`
-- ----------------------------
DROP TABLE IF EXISTS `sh_code_setting`;
CREATE TABLE `sh_code_setting` (
  `code_id` varchar(16) NOT NULL,
  `code_key` varchar(30) NOT NULL,
  `code_value` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_code_setting
-- ----------------------------
INSERT INTO `sh_code_setting` VALUES ('worker_logout', '1', '是');
INSERT INTO `sh_code_setting` VALUES ('worker_logout', '0', '否');
INSERT INTO `sh_code_setting` VALUES ('boolean', '1', '是');
INSERT INTO `sh_code_setting` VALUES ('boolean', '0', '否');
INSERT INTO `sh_code_setting` VALUES ('device_status', '1', '启用');
INSERT INTO `sh_code_setting` VALUES ('device_status', '0', '禁用');
INSERT INTO `sh_code_setting` VALUES ('interface_type', 'CRM263', 'CRM263');
INSERT INTO `sh_code_setting` VALUES ('interface_type', 'CRM272', 'CRM272');
INSERT INTO `sh_code_setting` VALUES ('interface_type', 'CRM197', 'CRM197');
INSERT INTO `sh_code_setting` VALUES ('interface_type', 'MD088', 'MD088');
INSERT INTO `sh_code_setting` VALUES ('interface_type', 'CRM270', 'CRM270');
INSERT INTO `sh_code_setting` VALUES ('interface_type', 'CRM078', 'CRM078');
INSERT INTO `sh_code_setting` VALUES ('interface_type', 'CRM076', 'CRM076');
INSERT INTO `sh_code_setting` VALUES ('interface_type', 'CRM273', 'CRM273');
INSERT INTO `sh_code_setting` VALUES ('interface_type', 'EMP', 'EMP 账号接口');
INSERT INTO `sh_code_setting` VALUES ('result_content', '0', '失败');
INSERT INTO `sh_code_setting` VALUES ('result_content', '1', '成功');
INSERT INTO `sh_code_setting` VALUES ('receiver', 'DIS', 'DIS');
INSERT INTO `sh_code_setting` VALUES ('receiver', 'MDIS', 'MDIS');
INSERT INTO `sh_code_setting` VALUES ('sender', 'EMP', 'EMP');
INSERT INTO `sh_code_setting` VALUES ('sender', 'CRM', 'CRM');
INSERT INTO `sh_code_setting` VALUES ('user_type', '0', 'EMP');
INSERT INTO `sh_code_setting` VALUES ('user_type', '1', 'JL');
INSERT INTO `sh_code_setting` VALUES ('user_type', '2', 'ADMIN');
INSERT INTO `sh_code_setting` VALUES ('user_type', '3', 'CRM');
INSERT INTO `sh_code_setting` VALUES ('message_type', '0', '订单消息');
INSERT INTO `sh_code_setting` VALUES ('message_type', '1', '系统消息');
INSERT INTO `sh_code_setting` VALUES ('message_type', '2', '客诉消息');

-- ----------------------------
-- Table structure for `sh_data_record`
-- ----------------------------
DROP TABLE IF EXISTS `sh_data_record`;
CREATE TABLE `sh_data_record` (
  `id` varchar(64) NOT NULL,
  `xml_content` longtext,
  `interface_type` varchar(64) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `direction` varchar(10) DEFAULT NULL,
  `result_content` char(2) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  `message_id` varchar(64) DEFAULT NULL,
  `date_send` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_data_record
-- ----------------------------
INSERT INTO `sh_data_record` VALUES ('00d25a8e490649c4a1dc4fb0e8a5dd70', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC />\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 15:04:18', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('0a03ded5b2324d36868f826d329b3cf6', '<XMLSTRING><HEADER><INTERFACE_ID>EMP_ILM_GetUserByApplication</INTERFACE_ID><MESSAGE_ID>37a69b9daae548c6b59e496fe743fe72</MESSAGE_ID><SENDER>EMP</SENDER><RECEIVER>ASS</RECEIVER><DTSEND>20140923092148958</DTSEND></HEADER><DATASET><BATCH_NUMBER>20140923092148958</BATCH_NUMBER><ROW><SERIAL_NUMBER>2626657</SERIAL_NUMBER><EMPLOYEE_ID>00001890</EMPLOYEE_ID><DISPLAY_NAME>刘利娜</DISPLAY_NAME><AD_ACCOUNT>liulina9</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LLN1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE>18932532577</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626861</SERIAL_NUMBER><EMPLOYEE_ID>00004119</EMPLOYEE_ID><DISPLAY_NAME>张洁</DISPLAY_NAME><AD_ACCOUNT /><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4902</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司安阳彰德路店</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2627123</SERIAL_NUMBER><EMPLOYEE_ID>00010101</EMPLOYEE_ID><DISPLAY_NAME>传输一</DISPLAY_NAME><AD_ACCOUNT>chuanshuyi1</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CSY1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626143</SERIAL_NUMBER><EMPLOYEE_ID>00201203</EMPLOYEE_ID><DISPLAY_NAME>深圳社保</DISPLAY_NAME><AD_ACCOUNT>shenzhenshebao11</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>SZS14061310</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626642</SERIAL_NUMBER><EMPLOYEE_ID>09999995</EMPLOYEE_ID><DISPLAY_NAME>合力四</DISPLAY_NAME><AD_ACCOUNT>gelisi</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GLS140911</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13821111118</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626404</SERIAL_NUMBER><EMPLOYEE_ID>10000015</EMPLOYEE_ID><DISPLAY_NAME>丁宝国</DISPLAY_NAME><AD_ACCOUNT>dingbaoguo2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>DBG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2627060</SERIAL_NUMBER><EMPLOYEE_ID>10000016</EMPLOYEE_ID><DISPLAY_NAME>杜平</DISPLAY_NAME><AD_ACCOUNT>duping2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>DP1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626654</SERIAL_NUMBER><EMPLOYEE_ID>10000017</EMPLOYEE_ID><DISPLAY_NAME>关学群</DISPLAY_NAME><AD_ACCOUNT>guanxuequn2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GXQ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626986</SERIAL_NUMBER><EMPLOYEE_ID>10000018</EMPLOYEE_ID><DISPLAY_NAME>李晶明</DISPLAY_NAME><AD_ACCOUNT>lijingming2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LJM1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625818</SERIAL_NUMBER><EMPLOYEE_ID>10000019</EMPLOYEE_ID><DISPLAY_NAME>李涌康</DISPLAY_NAME><AD_ACCOUNT>lichongkang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LCK1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626022</SERIAL_NUMBER><EMPLOYEE_ID>10000020</EMPLOYEE_ID><DISPLAY_NAME>李玉凤</DISPLAY_NAME><AD_ACCOUNT>liyufeng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LYF1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626114</SERIAL_NUMBER><EMPLOYEE_ID>10000021</EMPLOYEE_ID><DISPLAY_NAME>刘涛</DISPLAY_NAME><AD_ACCOUNT>liutao47</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LT1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626106</SERIAL_NUMBER><EMPLOYEE_ID>10000022</EMPLOYEE_ID><DISPLAY_NAME>田恩凤</DISPLAY_NAME><AD_ACCOUNT>tianenfeng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>TEF1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626439</SERIAL_NUMBER><EMPLOYEE_ID>10000023</EMPLOYEE_ID><DISPLAY_NAME>王德利</DISPLAY_NAME><AD_ACCOUNT>wangdeli5</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WDL1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626299</SERIAL_NUMBER><EMPLOYEE_ID>10000024</EMPLOYEE_ID><DISPLAY_NAME>王建国</DISPLAY_NAME><AD_ACCOUNT>wangjianguo4</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WJG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626663</SERIAL_NUMBER><EMPLOYEE_ID>10000025</EMPLOYEE_ID><DISPLAY_NAME>王玉梅</DISPLAY_NAME><AD_ACCOUNT>wangyumei3</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WYM1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625854</SERIAL_NUMBER><EMPLOYEE_ID>10000026</EMPLOYEE_ID><DISPLAY_NAME>邢维</DISPLAY_NAME><AD_ACCOUNT>gengwei6</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GW1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626815</SERIAL_NUMBER><EMPLOYEE_ID>10000027</EMPLOYEE_ID><DISPLAY_NAME>赵宾</DISPLAY_NAME><AD_ACCOUNT>zhaobin18</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZB1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626281</SERIAL_NUMBER><EMPLOYEE_ID>10000028</EMPLOYEE_ID><DISPLAY_NAME>杨晓红</DISPLAY_NAME><AD_ACCOUNT>yangxiaogong2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>YXG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626636</SERIAL_NUMBER><EMPLOYEE_ID>10000029</EMPLOYEE_ID><DISPLAY_NAME>杨少斌</DISPLAY_NAME><AD_ACCOUNT>yangshaobin3</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>YSB1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626186</SERIAL_NUMBER><EMPLOYEE_ID>10000125</EMPLOYEE_ID><DISPLAY_NAME>魏晓晖</DISPLAY_NAME><AD_ACCOUNT>weixiaohui13</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WXH1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>18660809552</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626696</SERIAL_NUMBER><EMPLOYEE_ID>10000127</EMPLOYEE_ID><DISPLAY_NAME>陈连征</DISPLAY_NAME><AD_ACCOUNT>chenlianzheng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CLZ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13311009367</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626145</SERIAL_NUMBER><EMPLOYEE_ID>10000197</EMPLOYEE_ID><DISPLAY_NAME>吴勇</DISPLAY_NAME><AD_ACCOUNT>wuyong7</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WY1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626694</SERIAL_NUMBER><EMPLOYEE_ID>10000198</EMPLOYEE_ID><DISPLAY_NAME>毛晓军</DISPLAY_NAME><AD_ACCOUNT>maoxiaojun2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>MXJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2627086</SERIAL_NUMBER><EMPLOYEE_ID>10000199</EMPLOYEE_ID><DISPLAY_NAME>张心林</DISPLAY_NAME><AD_ACCOUNT>zhangxinlin2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZXL1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626102</SERIAL_NUMBER><EMPLOYEE_ID>10000200</EMPLOYEE_ID><DISPLAY_NAME>吴波</DISPLAY_NAME><AD_ACCOUNT>wubo5</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WB1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626600</SERIAL_NUMBER><EMPLOYEE_ID>10000219</EMPLOYEE_ID><DISPLAY_NAME>戴萌</DISPLAY_NAME><AD_ACCOUNT>daimeng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>DM1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13911758909</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625852</SERIAL_NUMBER><EMPLOYEE_ID>10000221</EMPLOYEE_ID><DISPLAY_NAME>李友刚</DISPLAY_NAME><AD_ACCOUNT>liyougang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LYG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>15816883118</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2627051</SERIAL_NUMBER><EMPLOYEE_ID>10000222</EMPLOYEE_ID><DISPLAY_NAME>张阳</DISPLAY_NAME><AD_ACCOUNT>zhangyang63</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZY1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>15810479353</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626872</SERIAL_NUMBER><EMPLOYEE_ID>10000241</EMPLOYEE_ID><DISPLAY_NAME>崔福双</DISPLAY_NAME><AD_ACCOUNT>cuifushuang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CFS1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13152909066</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625989</SERIAL_NUMBER><EMPLOYEE_ID>10000785</EMPLOYEE_ID><DISPLAY_NAME>崔洪强</DISPLAY_NAME><AD_ACCOUNT>cuihongjiang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CHJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13621294767</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626707</SERIAL_NUMBER><EMPLOYEE_ID>10000787</EMPLOYEE_ID><DISPLAY_NAME>宛霞</DISPLAY_NAME><AD_ACCOUNT>wanxia2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WX1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13910117881</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626469</SERIAL_NUMBER><EMPLOYEE_ID>10002074</EMPLOYEE_ID><DISPLAY_NAME>詹克军</DISPLAY_NAME><AD_ACCOUNT>zhankejun2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZKJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626753</SERIAL_NUMBER><EMPLOYEE_ID>10002077</EMPLOYEE_ID><DISPLAY_NAME>何强</DISPLAY_NAME><AD_ACCOUNT>hejiang16</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>HJ140627</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626173</SERIAL_NUMBER><EMPLOYEE_ID>10003977</EMPLOYEE_ID><DISPLAY_NAME>ewg</DISPLAY_NAME><AD_ACCOUNT>ewg1</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>EWG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626324</SERIAL_NUMBER><EMPLOYEE_ID>10004333</EMPLOYEE_ID><DISPLAY_NAME>上线</DISPLAY_NAME><AD_ACCOUNT>shangxian2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>SX1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626383</SERIAL_NUMBER><EMPLOYEE_ID>10006924</EMPLOYEE_ID><DISPLAY_NAME>hg</DISPLAY_NAME><AD_ACCOUNT>hg1</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>HG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625948</SERIAL_NUMBER><EMPLOYEE_ID>10006937</EMPLOYEE_ID><DISPLAY_NAME>李伟</DISPLAY_NAME><AD_ACCOUNT>liwei164</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LW140627</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625880</SERIAL_NUMBER><EMPLOYEE_ID>10006983</EMPLOYEE_ID><DISPLAY_NAME>fdggh</DISPLAY_NAME><AD_ACCOUNT>fdggh11</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>FDGGH140627</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2626030</SERIAL_NUMBER><EMPLOYEE_ID>10007528</EMPLOYEE_ID><DISPLAY_NAME>乙</DISPLAY_NAME><AD_ACCOUNT>yi53</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>Y1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW></DATASET></XMLSTRING>', 'EMP', '2014-10-08 10:15:00', 'in', '1', 'EMP', 'DIS', null, '2014-09-23 09:21:48');
INSERT INTO `sh_data_record` VALUES ('0cdf123500cc4fc2b962bea41fd9f362', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM197</INTERFACE_ID>\r\n    <MESSAGE_ID>541765C0E7652C93E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>DIS</RECEIVER>\r\n    <DTSEND>20140919073245798</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <!-- \n    <CRM272>\n      <HEADER>\n        <AZD01>111</AZD01>\n        <KHMC>111</KHMC>\n        <LXDZ>111</LXDZ>\n        <LXDH>1111111111</LXDH>\n        <QTDH>222222</QTDH>\n        <SPBM>1111</SPBM>\n        <SPMC>111</SPMC>\n        <YYSJ>2014-09-23</YYSJ>\n        <YYSJD>08-10</YYSJD>\n        <AZWD01>北京</AZWD01>\n        <GSXX01>aa</GSXX01>\n        <THDH>111</THDH>\n        <WB_GSXX01>aa111</WB_GSXX01>\n        <DJZT>1</DJZT>\n        <PGSJ>2014-09-23</PGSJ>\n        <BZ>备注</BZ>\n      </HEADER>\n      <ITEMS>\n        <ITEM>\n          <GRDM>张三</GRDM>\n        </ITEM>\n        <ITEM>\n          <GRDM>李四</GRDM>\n        </ITEM>\n      </ITEMS>\n    </CRM272>-->\r\n    <!-- JL第三方账户-->\r\n    <CRM263>\r\n      <CZY01>111111</CZY01>\r\n      <RYXX01>111111</RYXX01>\r\n      <RYXM>b</RYXM>\r\n      <CZYMM>1</CZYMM>\r\n      <GSXX01>2</GSXX01>\r\n      <BM01>2</BM01>\r\n      <AZWD01>2</AZWD01>\r\n      <WDMC>2</WDMC>\r\n      <QSRQ>2014-01-01</QSRQ>\r\n      <ZZRQ>2014-11-01</ZZRQ>\r\n      <ZT>3</ZT>\r\n      <CCRQ>2014-01-01</CCRQ>\r\n      <ZXBJ>0</ZXBJ>\r\n    </CRM263>\r\n    <CRM263>\r\n      <CZY01>333333</CZY01>\r\n      <RYXX01>333333</RYXX01>\r\n      <RYXM>b</RYXM>\r\n      <CZYMM>1</CZYMM>\r\n      <GSXX01>2</GSXX01>\r\n      <BM01>2</BM01>\r\n      <AZWD01>2</AZWD01>\r\n      <WDMC>2</WDMC>\r\n      <QSRQ>2014-01-01</QSRQ>\r\n      <ZZRQ>2014-11-01</ZZRQ>\r\n      <ZT>3</ZT>\r\n      <CCRQ>2014-01-01</CCRQ>\r\n      <ZXBJ>0</ZXBJ>\r\n    </CRM263>\r\n    <!-- 顾客资料、预约时间修改传售后APP(CRM197)\n    <CRM197>\n      <DJHM>111</DJHM>\n      <DJLX>1</DJLX>\n      <LXDH>13681239343</LXDH>\n      <LXDZ>江西</LXDZ>\n      <KHMC>王五</KHMC>\n      <SJHM>110</SJHM>\n      <GHRQ>2014-12-12 11:11:11</GHRQ>\n      <YYSJ>2014-11-11 12：12：13</YYSJ>\n      <HWZTSJ>2014-1-1</HWZTSJ>\n      <AZLX>1</AZLX>\n      <YYSJ_S>15</YYSJ_S>\n      <YYSJ_E>18</YYSJ_E>\n    </CRM197> -->\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM197', '2014-10-08 17:45:08', 'in', '1', 'CRM', 'DIS', '541765C0E7652C93E10000000A800B02', '2014-09-19 07:32:45');
INSERT INTO `sh_data_record` VALUES ('1db11278148e4e1cb6d70864851351ee', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM197</INTERFACE_ID>\r\n    <MESSAGE_ID>0709f1e84035b6b2db79ce80b6460f49</MESSAGE_ID>\r\n    <SENDER>DIS</SENDER>\r\n    <RECEIVER>CRM</RECEIVER>\r\n    <DTSEND>20141009141022801</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM197>\r\n      <AZLX>1</AZLX>\r\n      <DJHM>52777</DJHM>\r\n      <DJLX>1</DJLX>\r\n      <GHRQ>2014-10-08 00:00:00.0</GHRQ>\r\n      <GZSC>河北世纪商城</GZSC>\r\n      <HWZT>0</HWZT>\r\n      <HWZTSJ />\r\n      <KHMC>123</KHMC>\r\n      <LXDH>13637373333</LXDH>\r\n      <LXDZ>石家庄市长安区测试路</LXDZ>\r\n      <SJHM />\r\n      <YYSJ>2014-10-08 08:00:00.0</YYSJ>\r\n      <YYSJ_S>08</YYSJ_S>\r\n      <YYSJ_E>10</YYSJ_E>\r\n      <KFPZFS>1</KFPZFS>\r\n      <FHRQ_S>20141009050000</FHRQ_S>\r\n      <FHRQ_E>20141009070000</FHRQ_E>\r\n      <KHDQ>0000001256</KHDQ>\r\n      <SHFS>2</SHFS>\r\n    </CRM197>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM197', '2014-10-09 15:02:47', 'in', '1', 'DIS', 'CRM', '0709f1e84035b6b2db79ce80b6460f49', '2014-10-09 14:10:22');
INSERT INTO `sh_data_record` VALUES ('33cf766a4df5495399ffd25489a83ad5', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ>山西省运城市临猗县政府</LXDZ>\r\n        <KHMC>程彪</KHMC>\r\n        <LXDH>13263180885</LXDH>\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:48:00', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('3411609d7f8f4832a42ac9ac5045a26f', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM197</INTERFACE_ID>\r\n    <MESSAGE_ID>541765C0E7652C93E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>DIS</RECEIVER>\r\n    <DTSEND>20140919073245798</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <!-- \n    <CRM272>\n      <HEADER>\n        <AZD01>111</AZD01>\n        <KHMC>111</KHMC>\n        <LXDZ>111</LXDZ>\n        <LXDH>1111111111</LXDH>\n        <QTDH>222222</QTDH>\n        <SPBM>1111</SPBM>\n        <SPMC>111</SPMC>\n        <YYSJ>2014-09-23</YYSJ>\n        <YYSJD>08-10</YYSJD>\n        <AZWD01>北京</AZWD01>\n        <GSXX01>aa</GSXX01>\n        <THDH>111</THDH>\n        <WB_GSXX01>aa111</WB_GSXX01>\n        <DJZT>1</DJZT>\n        <PGSJ>2014-09-23</PGSJ>\n        <BZ>备注</BZ>\n      </HEADER>\n      <ITEMS>\n        <ITEM>\n          <GRDM>张三</GRDM>\n        </ITEM>\n        <ITEM>\n          <GRDM>李四</GRDM>\n        </ITEM>\n      </ITEMS>\n    </CRM272>-->\r\n    <!-- JL第三方账户-->\r\n    <CRM263>\r\n      <CZY01>111111</CZY01>\r\n      <RYXX01>111111</RYXX01>\r\n      <RYXM>b</RYXM>\r\n      <CZYMM>1</CZYMM>\r\n      <GSXX01>2</GSXX01>\r\n      <BM01>2</BM01>\r\n      <AZWD01>2</AZWD01>\r\n      <WDMC>2</WDMC>\r\n      <QSRQ>2014-01-01</QSRQ>\r\n      <ZZRQ>2014-11-01</ZZRQ>\r\n      <ZT>3</ZT>\r\n      <CCRQ>2014-01-01</CCRQ>\r\n      <ZXBJ>0</ZXBJ>\r\n    </CRM263>\r\n    <CRM263>\r\n      <CZY01>333333</CZY01>\r\n      <RYXX01>333333</RYXX01>\r\n      <RYXM>b</RYXM>\r\n      <CZYMM>1</CZYMM>\r\n      <GSXX01>2</GSXX01>\r\n      <BM01>2</BM01>\r\n      <AZWD01>2</AZWD01>\r\n      <WDMC>2</WDMC>\r\n      <QSRQ>2014-01-01</QSRQ>\r\n      <ZZRQ>2014-11-01</ZZRQ>\r\n      <ZT>3</ZT>\r\n      <CCRQ>2014-01-01</CCRQ>\r\n      <ZXBJ>0</ZXBJ>\r\n    </CRM263>\r\n    <!-- 顾客资料、预约时间修改传售后APP(CRM197)\n    <CRM197>\n      <DJHM>111</DJHM>\n      <DJLX>1</DJLX>\n      <LXDH>13681239343</LXDH>\n      <LXDZ>江西</LXDZ>\n      <KHMC>王五</KHMC>\n      <SJHM>110</SJHM>\n      <GHRQ>2014-12-12 11:11:11</GHRQ>\n      <YYSJ>2014-11-11 12：12：13</YYSJ>\n      <HWZTSJ>2014-1-1</HWZTSJ>\n      <AZLX>1</AZLX>\n      <YYSJ_S>15</YYSJ_S>\n      <YYSJ_E>18</YYSJ_E>\n    </CRM197> -->\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM197', '2014-10-08 17:45:24', 'in', '1', 'CRM', 'DIS', '541765C0E7652C93E10000000A800B02', '2014-09-19 07:32:45');
INSERT INTO `sh_data_record` VALUES ('342f4404524c456382f2c061fcc5d595', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:17:37', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('34d56b61d3e948138592921854467174', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM263</INTERFACE_ID>\r\n    <MESSAGE_ID>bd3ae86c997095640dc61c0275ea3e47</MESSAGE_ID>\r\n    <SENDER>DIS</SENDER>\r\n    <RECEIVER>HXSH</RECEIVER>\r\n    <DTSEND>20141009141342942</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM263>\r\n      <CZY01>30012081</CZY01>\r\n      <RYXX01>30012081</RYXX01>\r\n      <RYXM>30012081</RYXM>\r\n      <CZYMM>670b14728ad9902aecba32e22fa4f6bd</CZYMM>\r\n      <GSXX01>S502</GSXX01>\r\n      <BM01>S502</BM01>\r\n      <AZWD01>0003001208</AZWD01>\r\n      <WDMC>北京潞城伟业电器维修部</WDMC>\r\n      <QSRQ>2013-03-20 00:00:00.0</QSRQ>\r\n      <ZZRQ>9999-12-31 00:00:00.0</ZZRQ>\r\n      <ZT>0</ZT>\r\n      <CCRQ>2013-04-17 09:45:54.0</CCRQ>\r\n      <ZXBJ>0</ZXBJ>\r\n    </CRM263>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM263', '2014-10-09 15:10:50', 'in', '1', 'DIS', 'HXSH', 'bd3ae86c997095640dc61c0275ea3e47', '2014-10-09 14:13:42');
INSERT INTO `sh_data_record` VALUES ('352e55cc9a33410cadb1e023f76e25e2', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM272</INTERFACE_ID>\r\n    <MESSAGE_ID>4658cf6522cea39387dfdbcf3aafec4d</MESSAGE_ID>\r\n    <SENDER>DIS</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20141008165930193</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM272>\r\n      <HEADER>\r\n        <AZD01>52777</AZD01>\r\n        <KHMC>123</KHMC>\r\n        <LXDZ>石家庄市长安区测试路</LXDZ>\r\n        <LXDH>13637373333</LXDH>\r\n        <QTDH />\r\n        <SPBM>000000000100189698</SPBM>\r\n        <SPMC />\r\n        <YYSJ>2014-10-09 08:00:00.0</YYSJ>\r\n        <AZWD01>0003003404</AZWD01>\r\n        <WDMC>北京东方售后维修公司</WDMC>\r\n        <GSXX01>S401</GSXX01>\r\n        <GSMC>石家庄国美电器售后服务有限公司</GSMC>\r\n        <THDH>1451049001</THDH>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <WB_GSMC>河北国美电器有限公司</WB_GSMC>\r\n        <DJZT>2</DJZT>\r\n        <AZFS>1</AZFS>\r\n        <PGSJ>2014-10-08 16:37:34.0</PGSJ>\r\n        <AZLX>1</AZLX>\r\n        <YYSJD>08-10</YYSJD>\r\n        <BZ />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM>\r\n          <GRDM>0500002522</GRDM>\r\n          <GRMC>刘帅</GRMC>\r\n          <LXFS>15010887034</LXFS>\r\n        </ITEM>\r\n        <ITEM>\r\n          <GRDM>0500002524</GRDM>\r\n          <GRMC>刘建保</GRMC>\r\n          <LXFS>13439058816</LXFS>\r\n        </ITEM>\r\n      </ITEMS>\r\n    </CRM272>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM272', '2014-10-08 16:59:16', 'in', '1', 'DIS', 'MDIS', '4658cf6522cea39387dfdbcf3aafec4d', '2014-10-08 16:59:30');
INSERT INTO `sh_data_record` VALUES ('3732c2f8c87b497a8b5b3fa8bc3a86e8', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ>山西省运城市临猗县政府</LXDZ>\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:17:48', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('3ca0b24545ca411f96d2bcd3f7d8c027', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:50:07', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('421379375c9040b19b57a33023a135d0', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC />\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:59:10', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('42a79f22696d4ab394bc5634bd7fe9c0', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM197</INTERFACE_ID>\r\n    <MESSAGE_ID>541765C0E7652C93E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>DIS</RECEIVER>\r\n    <DTSEND>20140919073245798</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <!-- \n    <CRM272>\n      <HEADER>\n        <AZD01>111</AZD01>\n        <KHMC>111</KHMC>\n        <LXDZ>111</LXDZ>\n        <LXDH>1111111111</LXDH>\n        <QTDH>222222</QTDH>\n        <SPBM>1111</SPBM>\n        <SPMC>111</SPMC>\n        <YYSJ>2014-09-23</YYSJ>\n        <YYSJD>08-10</YYSJD>\n        <AZWD01>北京</AZWD01>\n        <GSXX01>aa</GSXX01>\n        <THDH>111</THDH>\n        <WB_GSXX01>aa111</WB_GSXX01>\n        <DJZT>1</DJZT>\n        <PGSJ>2014-09-23</PGSJ>\n        <BZ>备注</BZ>\n      </HEADER>\n      <ITEMS>\n        <ITEM>\n          <GRDM>张三</GRDM>\n        </ITEM>\n        <ITEM>\n          <GRDM>李四</GRDM>\n        </ITEM>\n      </ITEMS>\n    </CRM272>\n     -->\r\n    <!-- JL第三方账户\n    <CRM263>\n      <CZY01>111111</CZY01>\n      <RYXX01>111111</RYXX01>\n      <RYXM>b</RYXM>\n      <CZYMM>1</CZYMM>\n      <GSXX01>2</GSXX01>\n      <BM01>2</BM01>\n      <AZWD01>2</AZWD01>\n      <WDMC>2</WDMC>\n      <QSRQ>2014-01-01</QSRQ>\n      <ZZRQ>2014-11-01</ZZRQ>\n      <ZT>3</ZT>\n      <CCRQ>2014-01-01</CCRQ>\n      <ZXBJ>0</ZXBJ>\n    </CRM263> -->\r\n    <!-- 顾客资料、预约时间修改传售后APP(CRM197)-->\r\n    <CRM197>\r\n      <DJHM>111</DJHM>\r\n      <DJLX>1</DJLX>\r\n      <LXDH>13681239343</LXDH>\r\n      <LXDZ>江西</LXDZ>\r\n      <KHMC>王五</KHMC>\r\n      <SJHM>110</SJHM>\r\n      <GHRQ>2014-12-12 11:11:11</GHRQ>\r\n      <YYSJ>2014-11-11 12：12：13</YYSJ>\r\n      <HWZTSJ>2014-1-1</HWZTSJ>\r\n      <AZLX>1</AZLX>\r\n      <YYSJ_S>15</YYSJ_S>\r\n      <YYSJ_E>18</YYSJ_E>\r\n    </CRM197>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM197', '2014-10-08 11:36:09', 'in', '1', 'CRM', 'DIS', '541765C0E7652C93E10000000A800B02', '2014-09-19 07:32:45');
INSERT INTO `sh_data_record` VALUES ('4ad8d91dbff64b5fae23049ee9ec89fd', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:32:17', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('4b0cf8f13f6c4bc884e842c295775189', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC />\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 15:03:02', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('52929ec452b049f7a57532d7ddf07601', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM272</INTERFACE_ID>\r\n    <MESSAGE_ID>96280f1f5c98a1bdfe49d8b9b2f08cb8</MESSAGE_ID>\r\n    <SENDER>DIS</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20141009141251247</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM272>\r\n      <HEADER>\r\n        <AZD01>52777</AZD01>\r\n        <KHMC>123</KHMC>\r\n        <LXDZ>石家庄市长安区测试路</LXDZ>\r\n        <LXDH>13637373333</LXDH>\r\n        <QTDH />\r\n        <SPBM>000000000100189698</SPBM>\r\n        <SPMC />\r\n        <YYSJ>2014-10-08 08:00:00.0</YYSJ>\r\n        <AZWD01>0003003404</AZWD01>\r\n        <WDMC>北京东方售后维修公司</WDMC>\r\n        <GSXX01>S401</GSXX01>\r\n        <GSMC>石家庄国美电器售后服务有限公司</GSMC>\r\n        <THDH>1451049001</THDH>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <WB_GSMC>河北国美电器有限公司</WB_GSMC>\r\n        <DJZT>2</DJZT>\r\n        <AZFS>1</AZFS>\r\n        <PGSJ>2014-10-08 16:37:34.0</PGSJ>\r\n        <AZLX>1</AZLX>\r\n        <YYSJD>08-10</YYSJD>\r\n        <BZ />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM>\r\n          <GRDM>0500002522</GRDM>\r\n          <GRMC>刘帅</GRMC>\r\n          <LXFS>15010887034</LXFS>\r\n        </ITEM>\r\n        <ITEM>\r\n          <GRDM>0500002524</GRDM>\r\n          <GRMC>刘建保</GRMC>\r\n          <LXFS>13439058816</LXFS>\r\n        </ITEM>\r\n      </ITEMS>\r\n    </CRM272>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM272', '2014-10-09 14:32:39', 'in', '1', 'DIS', 'MDIS', '96280f1f5c98a1bdfe49d8b9b2f08cb8', '2014-10-09 14:12:51');
INSERT INTO `sh_data_record` VALUES ('555bc81f6e4944c194afb1048a774747', '<XMLSTRING><HEADER><INTERFACE_ID>EMP_ILM_GetUserByApplication</INTERFACE_ID><MESSAGE_ID>d1a8d8b3c9b04360a21ce1c7329ee18b</MESSAGE_ID><SENDER>EMP</SENDER><RECEIVER>ASS</RECEIVER><DTSEND>20141016172535292</DTSEND></HEADER><DATASET><BATCH_NUMBER>20141016172535292</BATCH_NUMBER><ROW><SERIAL_NUMBER>2629630</SERIAL_NUMBER><EMPLOYEE_ID>00025489</EMPLOYEE_ID><DISPLAY_NAME>合力二</DISPLAY_NAME><AD_ACCOUNT>gelier</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GLE140801</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW></DATASET></XMLSTRING>', 'EMP', '2014-10-17 03:53:03', 'in', '1', 'EMP', 'DIS', null, '2014-10-16 17:25:35');
INSERT INTO `sh_data_record` VALUES ('5c8fb69d634e4dd6a9b8840967ca351a', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM197</INTERFACE_ID>\r\n    <MESSAGE_ID>541765C0E7652C93E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>DIS</RECEIVER>\r\n    <DTSEND>20140919073245798</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <!-- \n    <CRM272>\n      <HEADER>\n        <AZD01>111</AZD01>\n        <KHMC>111</KHMC>\n        <LXDZ>111</LXDZ>\n        <LXDH>1111111111</LXDH>\n        <QTDH>222222</QTDH>\n        <SPBM>1111</SPBM>\n        <SPMC>111</SPMC>\n        <YYSJ>2014-09-23</YYSJ>\n        <YYSJD>08-10</YYSJD>\n        <AZWD01>北京</AZWD01>\n        <GSXX01>aa</GSXX01>\n        <THDH>111</THDH>\n        <WB_GSXX01>aa111</WB_GSXX01>\n        <DJZT>1</DJZT>\n        <PGSJ>2014-09-23</PGSJ>\n        <BZ>备注</BZ>\n      </HEADER>\n      <ITEMS>\n        <ITEM>\n          <GRDM>张三</GRDM>\n        </ITEM>\n        <ITEM>\n          <GRDM>李四</GRDM>\n        </ITEM>\n      </ITEMS>\n    </CRM272>\n     -->\r\n    <!-- JL第三方账户\n    <CRM263>\n      <CZY01>111111</CZY01>\n      <RYXX01>111111</RYXX01>\n      <RYXM>b</RYXM>\n      <CZYMM>1</CZYMM>\n      <GSXX01>2</GSXX01>\n      <BM01>2</BM01>\n      <AZWD01>2</AZWD01>\n      <WDMC>2</WDMC>\n      <QSRQ>2014-01-01</QSRQ>\n      <ZZRQ>2014-11-01</ZZRQ>\n      <ZT>3</ZT>\n      <CCRQ>2014-01-01</CCRQ>\n      <ZXBJ>0</ZXBJ>\n    </CRM263> -->\r\n    <!-- 顾客资料、预约时间修改传售后APP(CRM197)-->\r\n    <CRM197>\r\n      <DJHM>111</DJHM>\r\n      <DJLX>1</DJLX>\r\n      <LXDH>13681239343</LXDH>\r\n      <LXDZ>江西</LXDZ>\r\n      <KHMC>王五</KHMC>\r\n      <SJHM>110</SJHM>\r\n      <GHRQ>2014-12-12 11:11:11</GHRQ>\r\n      <YYSJ>2014-11-11 12：12：13</YYSJ>\r\n      <HWZTSJ>2014-1-1</HWZTSJ>\r\n      <AZLX>1</AZLX>\r\n      <YYSJ_S>15</YYSJ_S>\r\n      <YYSJ_E>18</YYSJ_E>\r\n    </CRM197>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM197', '2014-10-08 11:36:21', 'in', '1', 'CRM', 'DIS', '541765C0E7652C93E10000000A800B02', '2014-09-19 07:32:45');
INSERT INTO `sh_data_record` VALUES ('63f5e8e4a0b848c992c8949281577d8d', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:28:54', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('67e208f117e34e0f9f41bd1d6575cf77', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ>山西省运城市临猗县政府</LXDZ>\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:21:11', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('6acc46ea1a494360a64c3ae0e615281b', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0014</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:28:49', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('6f3b9e829cd84d2fa7defa77d52a1b46', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:37:54', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('7620e340ead049e186f417dfcca33d66', '<XMLSTRING><HEADER><INTERFACE_ID>EMP_ILM_GetUserByApplication</INTERFACE_ID><MESSAGE_ID>c95fb92d7105496288e034ac8650c1a7</MESSAGE_ID><SENDER>EMP</SENDER><RECEIVER>ASS</RECEIVER><DTSEND>20140923094726440</DTSEND></HEADER><DATASET><BATCH_NUMBER>20140923094726440</BATCH_NUMBER><ROW><SERIAL_NUMBER>2627177</SERIAL_NUMBER><EMPLOYEE_ID>09999995</EMPLOYEE_ID><DISPLAY_NAME>合力四</DISPLAY_NAME><AD_ACCOUNT>gelisi</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GLS140911</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13821111119</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW></DATASET></XMLSTRING>', 'EMP', '2014-10-08 10:15:00', 'in', '1', 'EMP', 'DIS', null, '2014-09-23 09:47:26');
INSERT INTO `sh_data_record` VALUES ('7738b990c61849cc8a328ff1b62a9a29', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ>山西省运城市临猗县政府</LXDZ>\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:15:15', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('7dd9198c919845c4a4dd464959da4e3a', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:27:32', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('814e1c357b164ab6835482891c222ace', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:43:25', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('8a9a218fbd0a4fda9ec7bd1f4e381ae3', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM197</INTERFACE_ID>\r\n    <MESSAGE_ID>40570381e670ab412df08e3781da2be3</MESSAGE_ID>\r\n    <SENDER>DIS</SENDER>\r\n    <RECEIVER>CRM</RECEIVER>\r\n    <DTSEND>20141008172426039</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM197>\r\n      <AZLX>1</AZLX>\r\n      <DJHM>52777</DJHM>\r\n      <DJLX>1</DJLX>\r\n      <GHRQ>2014-10-08 00:00:00.0</GHRQ>\r\n      <GZSC>河北世纪商城</GZSC>\r\n      <HWZT>0</HWZT>\r\n      <HWZTSJ />\r\n      <KHMC>123</KHMC>\r\n      <LXDH>13637373333</LXDH>\r\n      <LXDZ>石家庄市长安区测试路</LXDZ>\r\n      <SJHM />\r\n      <YYSJ>2014-10-08 08:00:00.0</YYSJ>\r\n      <YYSJ_S>08</YYSJ_S>\r\n      <YYSJ_E>10</YYSJ_E>\r\n      <KFPZFS>1</KFPZFS>\r\n      <FHRQ_S>20141009050000</FHRQ_S>\r\n      <FHRQ_E>20141009070000</FHRQ_E>\r\n      <KHDQ>0000001256</KHDQ>\r\n      <SHFS>2</SHFS>\r\n    </CRM197>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM197', '2014-10-08 17:24:12', 'in', '1', 'DIS', 'CRM', '40570381e670ab412df08e3781da2be3', '2014-10-08 17:24:26');
INSERT INTO `sh_data_record` VALUES ('8cd88cd3c6d54a3aa0ba162ee95be0c6', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM263</INTERFACE_ID>\r\n    <MESSAGE_ID>2db0cb84d3fae8e9f20e143ffd32dff3</MESSAGE_ID>\r\n    <SENDER>DIS</SENDER>\r\n    <RECEIVER>HXSH</RECEIVER>\r\n    <DTSEND>20141008165839076</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM263>\r\n      <CZY01>SHS401</CZY01>\r\n      <RYXX01>S401</RYXX01>\r\n      <RYXM>S401</RYXM>\r\n      <CZYMM>670b14728ad9902aecba32e22fa4f6bd</CZYMM>\r\n      <GSXX01>S401</GSXX01>\r\n      <BM01>S401</BM01>\r\n      <AZWD01>0003000125</AZWD01>\r\n      <WDMC>银川天翔电子技术服务部</WDMC>\r\n      <QSRQ>2014-10-08 00:00:00.0</QSRQ>\r\n      <ZZRQ>9999-12-31 00:00:00.0</ZZRQ>\r\n      <ZT>0</ZT>\r\n      <CCRQ>2014-10-08 16:41:38.0</CCRQ>\r\n      <ZXBJ>0</ZXBJ>\r\n    </CRM263>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM263', '2014-10-08 16:58:25', 'in', '1', 'DIS', 'HXSH', '2db0cb84d3fae8e9f20e143ffd32dff3', '2014-10-08 16:58:39');
INSERT INTO `sh_data_record` VALUES ('a2079c923caa40d6b7fcd114b7e7f921', '<XMLSTRING><HEADER><INTERFACE_ID>EMP_ILM_GetUserByApplication</INTERFACE_ID><MESSAGE_ID>2e7395f5b9304db3b1de80b85aaf9c9d</MESSAGE_ID><SENDER>EMP</SENDER><RECEIVER>ASS</RECEIVER><DTSEND>20141016113106218</DTSEND></HEADER><DATASET><BATCH_NUMBER>20141016113106218</BATCH_NUMBER><ROW><SERIAL_NUMBER>2629439</SERIAL_NUMBER><EMPLOYEE_ID>00001890</EMPLOYEE_ID><DISPLAY_NAME>刘利娜</DISPLAY_NAME><AD_ACCOUNT>liulina9</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LLN1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE>18932532577</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629406</SERIAL_NUMBER><EMPLOYEE_ID>00004119</EMPLOYEE_ID><DISPLAY_NAME>张洁</DISPLAY_NAME><AD_ACCOUNT /><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4902</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司安阳彰德路店</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628442</SERIAL_NUMBER><EMPLOYEE_ID>00010101</EMPLOYEE_ID><DISPLAY_NAME>传输一</DISPLAY_NAME><AD_ACCOUNT>chuanshuyi1</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CSY1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629038</SERIAL_NUMBER><EMPLOYEE_ID>00025489</EMPLOYEE_ID><DISPLAY_NAME>合力二</DISPLAY_NAME><AD_ACCOUNT>gelier</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GLE140801</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628775</SERIAL_NUMBER><EMPLOYEE_ID>00201203</EMPLOYEE_ID><DISPLAY_NAME>深圳社保</DISPLAY_NAME><AD_ACCOUNT>shenzhenshebao11</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>SZS14061310</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629495</SERIAL_NUMBER><EMPLOYEE_ID>10000015</EMPLOYEE_ID><DISPLAY_NAME>丁宝国</DISPLAY_NAME><AD_ACCOUNT>dingbaoguo2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>DBG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628269</SERIAL_NUMBER><EMPLOYEE_ID>10000016</EMPLOYEE_ID><DISPLAY_NAME>杜平</DISPLAY_NAME><AD_ACCOUNT>duping2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>DP1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628420</SERIAL_NUMBER><EMPLOYEE_ID>10000017</EMPLOYEE_ID><DISPLAY_NAME>关学群</DISPLAY_NAME><AD_ACCOUNT>guanxuequn2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GXQ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628123</SERIAL_NUMBER><EMPLOYEE_ID>10000018</EMPLOYEE_ID><DISPLAY_NAME>李晶明</DISPLAY_NAME><AD_ACCOUNT>lijingming2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LJM1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629384</SERIAL_NUMBER><EMPLOYEE_ID>10000019</EMPLOYEE_ID><DISPLAY_NAME>李涌康</DISPLAY_NAME><AD_ACCOUNT>lichongkang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LCK1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628749</SERIAL_NUMBER><EMPLOYEE_ID>10000020</EMPLOYEE_ID><DISPLAY_NAME>李玉凤</DISPLAY_NAME><AD_ACCOUNT>liyufeng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LYF1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628980</SERIAL_NUMBER><EMPLOYEE_ID>10000021</EMPLOYEE_ID><DISPLAY_NAME>刘涛</DISPLAY_NAME><AD_ACCOUNT>liutao47</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LT1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628155</SERIAL_NUMBER><EMPLOYEE_ID>10000022</EMPLOYEE_ID><DISPLAY_NAME>田恩凤</DISPLAY_NAME><AD_ACCOUNT>tianenfeng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>TEF1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628505</SERIAL_NUMBER><EMPLOYEE_ID>10000023</EMPLOYEE_ID><DISPLAY_NAME>王德利</DISPLAY_NAME><AD_ACCOUNT>wangdeli5</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WDL1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628152</SERIAL_NUMBER><EMPLOYEE_ID>10000024</EMPLOYEE_ID><DISPLAY_NAME>王建国</DISPLAY_NAME><AD_ACCOUNT>wangjianguo4</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WJG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628356</SERIAL_NUMBER><EMPLOYEE_ID>10000025</EMPLOYEE_ID><DISPLAY_NAME>王玉梅</DISPLAY_NAME><AD_ACCOUNT>wangyumei3</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WYM1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629018</SERIAL_NUMBER><EMPLOYEE_ID>10000026</EMPLOYEE_ID><DISPLAY_NAME>邢维</DISPLAY_NAME><AD_ACCOUNT>gengwei6</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GW1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628583</SERIAL_NUMBER><EMPLOYEE_ID>10000027</EMPLOYEE_ID><DISPLAY_NAME>赵宾</DISPLAY_NAME><AD_ACCOUNT>zhaobin18</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZB1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629253</SERIAL_NUMBER><EMPLOYEE_ID>10000028</EMPLOYEE_ID><DISPLAY_NAME>杨晓红</DISPLAY_NAME><AD_ACCOUNT>yangxiaogong2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>YXG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628427</SERIAL_NUMBER><EMPLOYEE_ID>10000029</EMPLOYEE_ID><DISPLAY_NAME>杨少斌</DISPLAY_NAME><AD_ACCOUNT>yangshaobin3</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>YSB1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628603</SERIAL_NUMBER><EMPLOYEE_ID>10000125</EMPLOYEE_ID><DISPLAY_NAME>魏晓晖</DISPLAY_NAME><AD_ACCOUNT>weixiaohui13</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WXH1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>18660809552</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628983</SERIAL_NUMBER><EMPLOYEE_ID>10000127</EMPLOYEE_ID><DISPLAY_NAME>陈连征</DISPLAY_NAME><AD_ACCOUNT>chenlianzheng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CLZ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13311009367</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628857</SERIAL_NUMBER><EMPLOYEE_ID>10000197</EMPLOYEE_ID><DISPLAY_NAME>吴勇</DISPLAY_NAME><AD_ACCOUNT>wuyong7</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WY1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628388</SERIAL_NUMBER><EMPLOYEE_ID>10000198</EMPLOYEE_ID><DISPLAY_NAME>毛晓军</DISPLAY_NAME><AD_ACCOUNT>maoxiaojun2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>MXJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628977</SERIAL_NUMBER><EMPLOYEE_ID>10000199</EMPLOYEE_ID><DISPLAY_NAME>张心林</DISPLAY_NAME><AD_ACCOUNT>zhangxinlin2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZXL1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629323</SERIAL_NUMBER><EMPLOYEE_ID>10000200</EMPLOYEE_ID><DISPLAY_NAME>吴波</DISPLAY_NAME><AD_ACCOUNT>wubo5</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WB1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628987</SERIAL_NUMBER><EMPLOYEE_ID>10000219</EMPLOYEE_ID><DISPLAY_NAME>戴萌</DISPLAY_NAME><AD_ACCOUNT>daimeng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>DM1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13911758909</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629085</SERIAL_NUMBER><EMPLOYEE_ID>10000221</EMPLOYEE_ID><DISPLAY_NAME>李友刚</DISPLAY_NAME><AD_ACCOUNT>liyougang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LYG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>15816883118</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628510</SERIAL_NUMBER><EMPLOYEE_ID>10000222</EMPLOYEE_ID><DISPLAY_NAME>张阳</DISPLAY_NAME><AD_ACCOUNT>zhangyang63</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZY1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>15810479353</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628593</SERIAL_NUMBER><EMPLOYEE_ID>10000241</EMPLOYEE_ID><DISPLAY_NAME>崔福双</DISPLAY_NAME><AD_ACCOUNT>cuifushuang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CFS1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13152909066</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628264</SERIAL_NUMBER><EMPLOYEE_ID>10000785</EMPLOYEE_ID><DISPLAY_NAME>崔洪强</DISPLAY_NAME><AD_ACCOUNT>cuihongjiang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CHJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13621294767</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628753</SERIAL_NUMBER><EMPLOYEE_ID>10000787</EMPLOYEE_ID><DISPLAY_NAME>宛霞</DISPLAY_NAME><AD_ACCOUNT>wanxia2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WX1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13910117881</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629501</SERIAL_NUMBER><EMPLOYEE_ID>10002074</EMPLOYEE_ID><DISPLAY_NAME>詹克军</DISPLAY_NAME><AD_ACCOUNT>zhankejun2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZKJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629013</SERIAL_NUMBER><EMPLOYEE_ID>10002077</EMPLOYEE_ID><DISPLAY_NAME>何强</DISPLAY_NAME><AD_ACCOUNT>hejiang16</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>HJ140627</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629398</SERIAL_NUMBER><EMPLOYEE_ID>10003977</EMPLOYEE_ID><DISPLAY_NAME>ewg</DISPLAY_NAME><AD_ACCOUNT>ewg1</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>EWG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629240</SERIAL_NUMBER><EMPLOYEE_ID>10004333</EMPLOYEE_ID><DISPLAY_NAME>上线</DISPLAY_NAME><AD_ACCOUNT>shangxian2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>SX1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628705</SERIAL_NUMBER><EMPLOYEE_ID>10006924</EMPLOYEE_ID><DISPLAY_NAME>hg</DISPLAY_NAME><AD_ACCOUNT>hg1</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>HG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2628588</SERIAL_NUMBER><EMPLOYEE_ID>10006937</EMPLOYEE_ID><DISPLAY_NAME>李伟</DISPLAY_NAME><AD_ACCOUNT>liwei164</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LW140627</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629138</SERIAL_NUMBER><EMPLOYEE_ID>10006983</EMPLOYEE_ID><DISPLAY_NAME>fdggh</DISPLAY_NAME><AD_ACCOUNT>fdggh11</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>FDGGH140627</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629181</SERIAL_NUMBER><EMPLOYEE_ID>10007528</EMPLOYEE_ID><DISPLAY_NAME>乙</DISPLAY_NAME><AD_ACCOUNT>yi53</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>Y1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2629055</SERIAL_NUMBER><EMPLOYEE_ID>10007697</EMPLOYEE_ID><DISPLAY_NAME>甲员工</DISPLAY_NAME><AD_ACCOUNT>jiayuangong11</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>JYG11091212</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE>12361451265</MOBILE><EMAIL /><STATE>3</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW></DATASET></XMLSTRING>', 'EMP', '2014-10-17 03:53:03', 'in', '1', 'EMP', 'DIS', null, '2014-10-16 11:31:06');
INSERT INTO `sh_data_record` VALUES ('ab68018c290648919e2baff0bbd49b00', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:53:36', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('b0f1b9940cc14651ac86bf37beb76435', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM197</INTERFACE_ID>\r\n    <MESSAGE_ID>541765C0E7652C93E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>DIS</RECEIVER>\r\n    <DTSEND>20140919073245798</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <!-- \n    <CRM272>\n      <HEADER>\n        <AZD01>111</AZD01>\n        <KHMC>111</KHMC>\n        <LXDZ>111</LXDZ>\n        <LXDH>1111111111</LXDH>\n        <QTDH>222222</QTDH>\n        <SPBM>1111</SPBM>\n        <SPMC>111</SPMC>\n        <YYSJ>2014-09-23</YYSJ>\n        <YYSJD>08-10</YYSJD>\n        <AZWD01>北京</AZWD01>\n        <GSXX01>aa</GSXX01>\n        <THDH>111</THDH>\n        <WB_GSXX01>aa111</WB_GSXX01>\n        <DJZT>1</DJZT>\n        <PGSJ>2014-09-23</PGSJ>\n        <BZ>备注</BZ>\n      </HEADER>\n      <ITEMS>\n        <ITEM>\n          <GRDM>张三</GRDM>\n        </ITEM>\n        <ITEM>\n          <GRDM>李四</GRDM>\n        </ITEM>\n      </ITEMS>\n    </CRM272>\n     -->\r\n    <!-- JL第三方账户\n    <CRM263>\n      <CZY01>111111</CZY01>\n      <RYXX01>111111</RYXX01>\n      <RYXM>b</RYXM>\n      <CZYMM>1</CZYMM>\n      <GSXX01>2</GSXX01>\n      <BM01>2</BM01>\n      <AZWD01>2</AZWD01>\n      <WDMC>2</WDMC>\n      <QSRQ>2014-01-01</QSRQ>\n      <ZZRQ>2014-11-01</ZZRQ>\n      <ZT>3</ZT>\n      <CCRQ>2014-01-01</CCRQ>\n      <ZXBJ>0</ZXBJ>\n    </CRM263> -->\r\n    <!-- 顾客资料、预约时间修改传售后APP(CRM197)-->\r\n    <CRM197>\r\n      <DJHM>111</DJHM>\r\n      <DJLX>1</DJLX>\r\n      <LXDH>13681239343</LXDH>\r\n      <LXDZ>江西</LXDZ>\r\n      <KHMC>王五</KHMC>\r\n      <SJHM>110</SJHM>\r\n      <GHRQ>2014-12-12 11:11:11</GHRQ>\r\n      <YYSJ>2014-11-11 12：12：13</YYSJ>\r\n      <HWZTSJ>2014-1-1</HWZTSJ>\r\n      <AZLX>1</AZLX>\r\n      <YYSJ_S>15</YYSJ_S>\r\n      <YYSJ_E>18</YYSJ_E>\r\n    </CRM197>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM197', '2014-10-08 11:06:39', 'in', '1', 'CRM', 'DIS', '541765C0E7652C93E10000000A800B02', '2014-09-19 07:32:45');
INSERT INTO `sh_data_record` VALUES ('b167ecf033d3415db0f7e823d58b9ed5', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:26:54', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('b26d138f97ea40f99e3a25fc7a283ed4', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ>山西省运城市临猗县政府</LXDZ>\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:13:23', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('b42d791f39f047c39e971a9e5115a3ef', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH>山西省运城市临猗县政府</LXDH>\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:06:06', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('b73bb986398e4614bf43973787a315b5', '<XMLSTRING><HEADER><INTERFACE_ID>EMP_ILM_GetUserByApplication</INTERFACE_ID><MESSAGE_ID>b935642031264aab9802b0fbf76ef3b8</MESSAGE_ID><SENDER>EMP</SENDER><RECEIVER>ASS</RECEIVER><DTSEND>20140918151155438</DTSEND></HEADER><DATASET><BATCH_NUMBER>20140918151155438</BATCH_NUMBER><ROW><SERIAL_NUMBER>2624238</SERIAL_NUMBER><EMPLOYEE_ID>09999995</EMPLOYEE_ID><DISPLAY_NAME>合力四</DISPLAY_NAME><AD_ACCOUNT>gelisi</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GLS140911</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13821111117</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW></DATASET></XMLSTRING>', 'EMP', '2014-10-08 10:15:00', 'in', '1', 'EMP', 'DIS', null, '2014-09-18 15:11:55');
INSERT INTO `sh_data_record` VALUES ('bc18bdd231d048c983056099776b3a2b', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC />\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 10:55:26', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('ca1d161bda884189b79fc96eceb9514e', '<XMLSTRING><HEADER><INTERFACE_ID>EMP_ILM_GetUserByApplication</INTERFACE_ID><MESSAGE_ID>5b10943315cd46a291b0083f4803308d</MESSAGE_ID><SENDER>EMP</SENDER><RECEIVER>ASS</RECEIVER><DTSEND>20140918153036146</DTSEND></HEADER><DATASET><BATCH_NUMBER>20140918153036146</BATCH_NUMBER><ROW><SERIAL_NUMBER>2624249</SERIAL_NUMBER><EMPLOYEE_ID>00019871</EMPLOYEE_ID><DISPLAY_NAME>售后一</DISPLAY_NAME><AD_ACCOUNT>shouhouyi11</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>SHY12010111</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S201</COMPANY_CODE><COMPANY_NAME>昆明国美售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE /><REGION_NAME /><FIRST_SUBSECTION_CODE /><FIRST_SUBSECTION_NAME /><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE /><DEPT_NAME /><POSITION_CODE /><POSITION_DESC /><STARTDATE>20120101</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL /><LEVEL_DETAIL /></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624248</SERIAL_NUMBER><EMPLOYEE_ID>00020001</EMPLOYEE_ID><DISPLAY_NAME>测试crm</DISPLAY_NAME><AD_ACCOUNT>ceshi144</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CS1301011</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S201</COMPANY_CODE><COMPANY_NAME>昆明国美售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE /><REGION_NAME /><FIRST_SUBSECTION_CODE /><FIRST_SUBSECTION_NAME /><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE /><DEPT_NAME /><POSITION_CODE /><POSITION_DESC /><STARTDATE>20130101</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL /><LEVEL_DETAIL /></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624273</SERIAL_NUMBER><EMPLOYEE_ID>00060003</EMPLOYEE_ID><DISPLAY_NAME>三号</DISPLAY_NAME><AD_ACCOUNT>sanhao1</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>SH1201011</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE>50000829</STORE_CODE><STORE_NAME>中山路门店家电医院</STORE_NAME><DEPT_CODE /><DEPT_NAME /><POSITION_CODE>S120F00000V318</POSITION_CODE><POSITION_DESC>河北国美中山路门店E快服务售后自建服务中心门店E快主管</POSITION_DESC><STARTDATE>20120101</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624253</SERIAL_NUMBER><EMPLOYEE_ID>00080001</EMPLOYEE_ID><DISPLAY_NAME>测试十一</DISPLAY_NAME><AD_ACCOUNT>ceshishiyi25</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS12011012</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000841</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测四</DEPT_NAME><POSITION_CODE>HB00F00000H718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心服务质量管理主管</POSITION_DESC><STARTDATE>20120110</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624258</SERIAL_NUMBER><EMPLOYEE_ID>00080002</EMPLOYEE_ID><DISPLAY_NAME>测试十二</DISPLAY_NAME><AD_ACCOUNT>ceshishier15</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS12010212</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000841</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测四</DEPT_NAME><POSITION_CODE>HB00F00000H718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心服务质量管理主管</POSITION_DESC><STARTDATE>20120102</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624266</SERIAL_NUMBER><EMPLOYEE_ID>00080003</EMPLOYEE_ID><DISPLAY_NAME>测试十三</DISPLAY_NAME><AD_ACCOUNT>ceshishisan15</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS1201033</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>0</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000841</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测四</DEPT_NAME><POSITION_CODE>HB00F00000L718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心传统家电主管</POSITION_DESC><STARTDATE>20120105</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624271</SERIAL_NUMBER><EMPLOYEE_ID>00080003</EMPLOYEE_ID><DISPLAY_NAME>测试十三</DISPLAY_NAME><AD_ACCOUNT>ceshishisan15</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS1201033</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000841</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测四</DEPT_NAME><POSITION_CODE>HB00F00000V418</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心安装服务商主管</POSITION_DESC><STARTDATE>20120103</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM><ITEM><PRIMARY>0</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000841</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测四</DEPT_NAME><POSITION_CODE>HB00F00000L718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心传统家电主管</POSITION_DESC><STARTDATE>20120105</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624255</SERIAL_NUMBER><EMPLOYEE_ID>00080006</EMPLOYEE_ID><DISPLAY_NAME>测试十六</DISPLAY_NAME><AD_ACCOUNT>ceshishiliu14</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS12011612</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000842</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测五</DEPT_NAME><POSITION_CODE>HB00F00000H718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心服务质量管理主管</POSITION_DESC><STARTDATE>20120116</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624263</SERIAL_NUMBER><EMPLOYEE_ID>00080007</EMPLOYEE_ID><DISPLAY_NAME>测试十七</DISPLAY_NAME><AD_ACCOUNT>ceshishiqi14</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS1201172</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000842</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测五</DEPT_NAME><POSITION_CODE>HB00F00000L718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心传统家电主管</POSITION_DESC><STARTDATE>20120117</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624269</SERIAL_NUMBER><EMPLOYEE_ID>00080008</EMPLOYEE_ID><DISPLAY_NAME>测试十八</DISPLAY_NAME><AD_ACCOUNT>ceshishiba4</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS1201173</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000842</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测五</DEPT_NAME><POSITION_CODE>HB00F00000V418</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心安装服务商主管</POSITION_DESC><STARTDATE>20120117</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624257</SERIAL_NUMBER><EMPLOYEE_ID>00080021</EMPLOYEE_ID><DISPLAY_NAME>测试一</DISPLAY_NAME><AD_ACCOUNT>ceshiyi23</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSY1203011</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000847</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测六</DEPT_NAME><POSITION_CODE>HB00F00000H718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心服务质量管理主管</POSITION_DESC><STARTDATE>20120301</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624261</SERIAL_NUMBER><EMPLOYEE_ID>00080022</EMPLOYEE_ID><DISPLAY_NAME>测试二</DISPLAY_NAME><AD_ACCOUNT>ceshier34</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSE12030212</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000847</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测六</DEPT_NAME><POSITION_CODE>HB00F00000L718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心传统家电主管</POSITION_DESC><STARTDATE>20120302</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624272</SERIAL_NUMBER><EMPLOYEE_ID>00080023</EMPLOYEE_ID><DISPLAY_NAME>测试三</DISPLAY_NAME><AD_ACCOUNT>ceshisan37</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS1203031</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000847</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测六</DEPT_NAME><POSITION_CODE>HB00F00000V418</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心安装服务商主管</POSITION_DESC><STARTDATE>20120303</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624265</SERIAL_NUMBER><EMPLOYEE_ID>00090003</EMPLOYEE_ID><DISPLAY_NAME>测试三</DISPLAY_NAME><AD_ACCOUNT>ceshisan38</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS11072512</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL>ceshi3@ceshi.com</EMAIL><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>0</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000830</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测试</DEPT_NAME><POSITION_CODE>HB00F00000L718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心传统家电主管</POSITION_DESC><STARTDATE>20110721</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624270</SERIAL_NUMBER><EMPLOYEE_ID>00090003</EMPLOYEE_ID><DISPLAY_NAME>测试三</DISPLAY_NAME><AD_ACCOUNT>ceshisan38</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS11072512</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL>ceshi3@ceshi.com</EMAIL><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000830</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测试</DEPT_NAME><POSITION_CODE>HB00F00000V418</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心安装服务商主管</POSITION_DESC><STARTDATE>20110725</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM><ITEM><PRIMARY>0</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000830</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测试</DEPT_NAME><POSITION_CODE>HB00F00000L718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心传统家电主管</POSITION_DESC><STARTDATE>20110721</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624254</SERIAL_NUMBER><EMPLOYEE_ID>00090004</EMPLOYEE_ID><DISPLAY_NAME>测试四</DISPLAY_NAME><AD_ACCOUNT>ceshisi27</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS12012212</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000835</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测二</DEPT_NAME><POSITION_CODE>HB00F00000H718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心服务质量管理主管</POSITION_DESC><STARTDATE>20120122</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624256</SERIAL_NUMBER><EMPLOYEE_ID>00090005</EMPLOYEE_ID><DISPLAY_NAME>测试五</DISPLAY_NAME><AD_ACCOUNT>ceshiwu17</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSW1107181</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000835</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测二</DEPT_NAME><POSITION_CODE>HB00F00000H718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心服务质量管理主管</POSITION_DESC><STARTDATE>20110718</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624264</SERIAL_NUMBER><EMPLOYEE_ID>00090006</EMPLOYEE_ID><DISPLAY_NAME>测试六</DISPLAY_NAME><AD_ACCOUNT>ceshiliu6</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSL1107181</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>0</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000835</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测二</DEPT_NAME><POSITION_CODE>HB00F00000L718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心传统家电主管</POSITION_DESC><STARTDATE>20110720</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624267</SERIAL_NUMBER><EMPLOYEE_ID>00090006</EMPLOYEE_ID><DISPLAY_NAME>测试六</DISPLAY_NAME><AD_ACCOUNT>ceshiliu6</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSL1107181</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000835</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测二</DEPT_NAME><POSITION_CODE>HB00F00000V418</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心安装服务商主管</POSITION_DESC><STARTDATE>20110718</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM><ITEM><PRIMARY>0</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000835</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测二</DEPT_NAME><POSITION_CODE>HB00F00000L718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心传统家电主管</POSITION_DESC><STARTDATE>20110720</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624260</SERIAL_NUMBER><EMPLOYEE_ID>00090007</EMPLOYEE_ID><DISPLAY_NAME>测试四</DISPLAY_NAME><AD_ACCOUNT>ceshisi28</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSS1107241</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000840</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测三</DEPT_NAME><POSITION_CODE>HB00F00000H718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心服务质量管理主管</POSITION_DESC><STARTDATE>20110724</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624262</SERIAL_NUMBER><EMPLOYEE_ID>00090008</EMPLOYEE_ID><DISPLAY_NAME>测试五</DISPLAY_NAME><AD_ACCOUNT>ceshiwu18</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSW11072412</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000840</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测三</DEPT_NAME><POSITION_CODE>HB00F00000L718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心传统家电主管</POSITION_DESC><STARTDATE>20110724</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624268</SERIAL_NUMBER><EMPLOYEE_ID>00090009</EMPLOYEE_ID><DISPLAY_NAME>测试六</DISPLAY_NAME><AD_ACCOUNT>ceshiliu7</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>CSL1107241</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000840</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测三</DEPT_NAME><POSITION_CODE>HB00F00000V418</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心安装服务商主管</POSITION_DESC><STARTDATE>20110724</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624259</SERIAL_NUMBER><EMPLOYEE_ID>00400132</EMPLOYEE_ID><DISPLAY_NAME>自建</DISPLAY_NAME><AD_ACCOUNT>zijian26</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>ZJ12070111</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000830</DEPT_CODE><DEPT_NAME>售后服务中心（自建）测试</DEPT_NAME><POSITION_CODE>HB00F00000H718</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心服务质量管理主管</POSITION_DESC><STARTDATE>20120701</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624250</SERIAL_NUMBER><EMPLOYEE_ID>10000581</EMPLOYEE_ID><DISPLAY_NAME>靳帅民</DISPLAY_NAME><AD_ACCOUNT>jinshuaimin2</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>JSM1103142</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE>13933808523</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000151</DEPT_CODE><DEPT_NAME>售后服务中心（自建）</DEPT_NAME><POSITION_CODE>HB00F00000G418</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心调度主管</POSITION_DESC><STARTDATE>20110314</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624252</SERIAL_NUMBER><EMPLOYEE_ID>10000774</EMPLOYEE_ID><DISPLAY_NAME>李枫</DISPLAY_NAME><AD_ACCOUNT>lifeng44</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>LF11051212</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE>13633113199</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000151</DEPT_CODE><DEPT_NAME>售后服务中心（自建）</DEPT_NAME><POSITION_CODE>HB00F00000U520</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心信息专员</POSITION_DESC><STARTDATE>20110512</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624251</SERIAL_NUMBER><EMPLOYEE_ID>10000941</EMPLOYEE_ID><DISPLAY_NAME>武文赟</DISPLAY_NAME><AD_ACCOUNT>wuwenbin3</AD_ACCOUNT><AD_ACCOUNT_PWD>Abcd123</AD_ACCOUNT_PWD><APP_ACCOUNT>WWB1105202</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>S401</COMPANY_CODE><COMPANY_NAME>石家庄国美电器售后服务有限公司</COMPANY_NAME><MOBILE>15833310543</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW><ITEM><PRIMARY>1</PRIMARY><HEADQUATERS_CODE /><HEADQUATERS_NAME /><REGION_CODE>10000158</REGION_CODE><REGION_NAME>华北大区</REGION_NAME><FIRST_SUBSECTION_CODE>10000168</FIRST_SUBSECTION_CODE><FIRST_SUBSECTION_NAME>河北分部</FIRST_SUBSECTION_NAME><SECOND_SUBSECTION_CODE /><SECOND_SUBSECTION_NAME /><STORE_CODE /><STORE_NAME /><DEPT_CODE>50000151</DEPT_CODE><DEPT_NAME>售后服务中心（自建）</DEPT_NAME><POSITION_CODE>HB00F00000U520</POSITION_CODE><POSITION_DESC>河北国美售后自建服务中心信息专员</POSITION_DESC><STARTDATE>20110520</STARTDATE><ENDDATE>99991231</ENDDATE><LEVEL>2</LEVEL><LEVEL_DETAIL>10</LEVEL_DETAIL></ITEM></NEW></POSITIONINFO></ROW></DATASET></XMLSTRING>', 'EMP', '2014-10-08 10:15:00', 'in', '1', 'EMP', 'DIS', null, '2014-09-18 15:30:36');
INSERT INTO `sh_data_record` VALUES ('cada9bf2c3514f199d70e509f36738f9', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC />\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 10:53:34', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('cb608c875c6a401abd570c9758c2035c', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM272</INTERFACE_ID>\r\n    <MESSAGE_ID>96280f1f5c98a1bdfe49d8b9b2f08cb8</MESSAGE_ID>\r\n    <SENDER>DIS</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20141009141251247</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM272>\r\n      <HEADER>\r\n        <AZD01>52777</AZD01>\r\n        <KHMC>123</KHMC>\r\n        <LXDZ>石家庄市长安区测试路</LXDZ>\r\n        <LXDH>13637373333</LXDH>\r\n        <QTDH />\r\n        <SPBM>000000000100189698</SPBM>\r\n        <SPMC />\r\n        <YYSJ>2014-10-08 08:00:00.0</YYSJ>\r\n        <AZWD01>0003003404</AZWD01>\r\n        <WDMC>北京东方售后维修公司</WDMC>\r\n        <GSXX01>S401</GSXX01>\r\n        <GSMC>石家庄国美电器售后服务有限公司</GSMC>\r\n        <THDH>1451049001</THDH>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <WB_GSMC>河北国美电器有限公司</WB_GSMC>\r\n        <DJZT>2</DJZT>\r\n        <AZFS>1</AZFS>\r\n        <PGSJ>2014-10-08 16:37:34.0</PGSJ>\r\n        <AZLX>1</AZLX>\r\n        <YYSJD>08-10</YYSJD>\r\n        <BZ />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM>\r\n          <GRDM>0500002522</GRDM>\r\n          <GRMC>刘帅</GRMC>\r\n          <LXFS>15010887034</LXFS>\r\n        </ITEM>\r\n        <ITEM>\r\n          <GRDM>0500002524</GRDM>\r\n          <GRMC>刘建保</GRMC>\r\n          <LXFS>13439058816</LXFS>\r\n        </ITEM>\r\n      </ITEMS>\r\n    </CRM272>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM272', '2014-10-09 14:38:26', 'in', '1', 'DIS', 'MDIS', '96280f1f5c98a1bdfe49d8b9b2f08cb8', '2014-10-09 14:12:51');
INSERT INTO `sh_data_record` VALUES ('cc68d1b0597a4f1180dd3805981c78ac', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ>山西省运城市临猗县政府</LXDZ>\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:07:07', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('cdf01cb23f7c421db98243ee813fa362', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ>山西省运城市临猗县政府</LXDZ>\r\n        <KHMC>程彪</KHMC>\r\n        <LXDH>13263180885</LXDH>\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:49:33', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('d2d477844d15479ea3021e1779741f2e', '<XMLSTRING><HEADER><INTERFACE_ID>EMP_ILM_GetUserByApplication</INTERFACE_ID><MESSAGE_ID>97d2fd2d6da94bb3af6b5e9263623cd9</MESSAGE_ID><SENDER>EMP</SENDER><RECEIVER>ASS</RECEIVER><DTSEND>20140919101848799</DTSEND></HEADER><DATASET><BATCH_NUMBER>20140919101848799</BATCH_NUMBER><ROW><SERIAL_NUMBER>2625240</SERIAL_NUMBER><EMPLOYEE_ID>00001890</EMPLOYEE_ID><DISPLAY_NAME>刘利娜</DISPLAY_NAME><AD_ACCOUNT>liulina9</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LLN1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE>18932532577</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624446</SERIAL_NUMBER><EMPLOYEE_ID>00004119</EMPLOYEE_ID><DISPLAY_NAME>张洁</DISPLAY_NAME><AD_ACCOUNT /><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4902</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司安阳彰德路店</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625471</SERIAL_NUMBER><EMPLOYEE_ID>00010101</EMPLOYEE_ID><DISPLAY_NAME>传输一</DISPLAY_NAME><AD_ACCOUNT>chuanshuyi1</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CSY1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625563</SERIAL_NUMBER><EMPLOYEE_ID>00201203</EMPLOYEE_ID><DISPLAY_NAME>深圳社保</DISPLAY_NAME><AD_ACCOUNT>shenzhenshebao11</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>SZS14061310</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624841</SERIAL_NUMBER><EMPLOYEE_ID>09999995</EMPLOYEE_ID><DISPLAY_NAME>合力四</DISPLAY_NAME><AD_ACCOUNT>gelisi</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GLS140911</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13821111117</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625114</SERIAL_NUMBER><EMPLOYEE_ID>10000015</EMPLOYEE_ID><DISPLAY_NAME>丁宝国</DISPLAY_NAME><AD_ACCOUNT>dingbaoguo2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>DBG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624519</SERIAL_NUMBER><EMPLOYEE_ID>10000016</EMPLOYEE_ID><DISPLAY_NAME>杜平</DISPLAY_NAME><AD_ACCOUNT>duping2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>DP1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625205</SERIAL_NUMBER><EMPLOYEE_ID>10000017</EMPLOYEE_ID><DISPLAY_NAME>关学群</DISPLAY_NAME><AD_ACCOUNT>guanxuequn2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GXQ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625575</SERIAL_NUMBER><EMPLOYEE_ID>10000018</EMPLOYEE_ID><DISPLAY_NAME>李晶明</DISPLAY_NAME><AD_ACCOUNT>lijingming2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LJM1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624661</SERIAL_NUMBER><EMPLOYEE_ID>10000019</EMPLOYEE_ID><DISPLAY_NAME>李涌康</DISPLAY_NAME><AD_ACCOUNT>lichongkang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LCK1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625231</SERIAL_NUMBER><EMPLOYEE_ID>10000020</EMPLOYEE_ID><DISPLAY_NAME>李玉凤</DISPLAY_NAME><AD_ACCOUNT>liyufeng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LYF1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625132</SERIAL_NUMBER><EMPLOYEE_ID>10000021</EMPLOYEE_ID><DISPLAY_NAME>刘涛</DISPLAY_NAME><AD_ACCOUNT>liutao47</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LT1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624716</SERIAL_NUMBER><EMPLOYEE_ID>10000022</EMPLOYEE_ID><DISPLAY_NAME>田恩凤</DISPLAY_NAME><AD_ACCOUNT>tianenfeng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>TEF1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624586</SERIAL_NUMBER><EMPLOYEE_ID>10000023</EMPLOYEE_ID><DISPLAY_NAME>王德利</DISPLAY_NAME><AD_ACCOUNT>wangdeli5</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WDL1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625358</SERIAL_NUMBER><EMPLOYEE_ID>10000024</EMPLOYEE_ID><DISPLAY_NAME>王建国</DISPLAY_NAME><AD_ACCOUNT>wangjianguo4</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WJG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624675</SERIAL_NUMBER><EMPLOYEE_ID>10000025</EMPLOYEE_ID><DISPLAY_NAME>王玉梅</DISPLAY_NAME><AD_ACCOUNT>wangyumei3</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WYM1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624763</SERIAL_NUMBER><EMPLOYEE_ID>10000026</EMPLOYEE_ID><DISPLAY_NAME>邢维</DISPLAY_NAME><AD_ACCOUNT>gengwei6</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GW1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625225</SERIAL_NUMBER><EMPLOYEE_ID>10000027</EMPLOYEE_ID><DISPLAY_NAME>赵宾</DISPLAY_NAME><AD_ACCOUNT>zhaobin18</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZB1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625256</SERIAL_NUMBER><EMPLOYEE_ID>10000028</EMPLOYEE_ID><DISPLAY_NAME>杨晓红</DISPLAY_NAME><AD_ACCOUNT>yangxiaogong2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>YXG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625078</SERIAL_NUMBER><EMPLOYEE_ID>10000029</EMPLOYEE_ID><DISPLAY_NAME>杨少斌</DISPLAY_NAME><AD_ACCOUNT>yangshaobin3</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>YSB1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625084</SERIAL_NUMBER><EMPLOYEE_ID>10000125</EMPLOYEE_ID><DISPLAY_NAME>魏晓晖</DISPLAY_NAME><AD_ACCOUNT>weixiaohui13</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WXH1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>18660809552</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625343</SERIAL_NUMBER><EMPLOYEE_ID>10000127</EMPLOYEE_ID><DISPLAY_NAME>陈连征</DISPLAY_NAME><AD_ACCOUNT>chenlianzheng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CLZ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13311009367</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624607</SERIAL_NUMBER><EMPLOYEE_ID>10000197</EMPLOYEE_ID><DISPLAY_NAME>吴勇</DISPLAY_NAME><AD_ACCOUNT>wuyong7</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WY1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625007</SERIAL_NUMBER><EMPLOYEE_ID>10000198</EMPLOYEE_ID><DISPLAY_NAME>毛晓军</DISPLAY_NAME><AD_ACCOUNT>maoxiaojun2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>MXJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625247</SERIAL_NUMBER><EMPLOYEE_ID>10000199</EMPLOYEE_ID><DISPLAY_NAME>张心林</DISPLAY_NAME><AD_ACCOUNT>zhangxinlin2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZXL1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624654</SERIAL_NUMBER><EMPLOYEE_ID>10000200</EMPLOYEE_ID><DISPLAY_NAME>吴波</DISPLAY_NAME><AD_ACCOUNT>wubo5</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WB1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624436</SERIAL_NUMBER><EMPLOYEE_ID>10000219</EMPLOYEE_ID><DISPLAY_NAME>戴萌</DISPLAY_NAME><AD_ACCOUNT>daimeng2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>DM1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13911758909</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624642</SERIAL_NUMBER><EMPLOYEE_ID>10000221</EMPLOYEE_ID><DISPLAY_NAME>李友刚</DISPLAY_NAME><AD_ACCOUNT>liyougang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LYG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>15816883118</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625642</SERIAL_NUMBER><EMPLOYEE_ID>10000222</EMPLOYEE_ID><DISPLAY_NAME>张阳</DISPLAY_NAME><AD_ACCOUNT>zhangyang63</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZY1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>15810479353</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625405</SERIAL_NUMBER><EMPLOYEE_ID>10000241</EMPLOYEE_ID><DISPLAY_NAME>崔福双</DISPLAY_NAME><AD_ACCOUNT>cuifushuang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CFS1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13152909066</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625058</SERIAL_NUMBER><EMPLOYEE_ID>10000785</EMPLOYEE_ID><DISPLAY_NAME>崔洪强</DISPLAY_NAME><AD_ACCOUNT>cuihongjiang2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>CHJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13621294767</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625559</SERIAL_NUMBER><EMPLOYEE_ID>10000787</EMPLOYEE_ID><DISPLAY_NAME>宛霞</DISPLAY_NAME><AD_ACCOUNT>wanxia2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>WX1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE>13910117881</MOBILE><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625434</SERIAL_NUMBER><EMPLOYEE_ID>10002074</EMPLOYEE_ID><DISPLAY_NAME>詹克军</DISPLAY_NAME><AD_ACCOUNT>zhankejun2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>ZKJ1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624807</SERIAL_NUMBER><EMPLOYEE_ID>10002077</EMPLOYEE_ID><DISPLAY_NAME>何强</DISPLAY_NAME><AD_ACCOUNT>hejiang16</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>HJ140627</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624665</SERIAL_NUMBER><EMPLOYEE_ID>10003977</EMPLOYEE_ID><DISPLAY_NAME>ewg</DISPLAY_NAME><AD_ACCOUNT>ewg1</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>EWG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>1001</COMPANY_CODE><COMPANY_NAME>国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2624718</SERIAL_NUMBER><EMPLOYEE_ID>10004333</EMPLOYEE_ID><DISPLAY_NAME>上线</DISPLAY_NAME><AD_ACCOUNT>shangxian2</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>SX1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625237</SERIAL_NUMBER><EMPLOYEE_ID>10006924</EMPLOYEE_ID><DISPLAY_NAME>hg</DISPLAY_NAME><AD_ACCOUNT>hg1</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>HG1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625186</SERIAL_NUMBER><EMPLOYEE_ID>10006937</EMPLOYEE_ID><DISPLAY_NAME>李伟</DISPLAY_NAME><AD_ACCOUNT>liwei164</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>LW140627</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625298</SERIAL_NUMBER><EMPLOYEE_ID>10006983</EMPLOYEE_ID><DISPLAY_NAME>fdggh</DISPLAY_NAME><AD_ACCOUNT>fdggh11</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>FDGGH140627</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4901</COMPANY_CODE><COMPANY_NAME>河南省国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW><ROW><SERIAL_NUMBER>2625203</SERIAL_NUMBER><EMPLOYEE_ID>10007528</EMPLOYEE_ID><DISPLAY_NAME>乙</DISPLAY_NAME><AD_ACCOUNT>yi53</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>Y1406131</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW></DATASET></XMLSTRING>', 'EMP', '2014-10-08 10:15:00', 'in', '1', 'EMP', 'DIS', null, '2014-09-19 10:18:48');
INSERT INTO `sh_data_record` VALUES ('d4ddb347ad804730af6aa592d3781e43', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC />\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 10:53:49', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('da5268eeb7d947d39f1059bf3aaf2726', '<XMLSTRING><HEADER><INTERFACE_ID>EMP_ILM_GetUserByApplication</INTERFACE_ID><MESSAGE_ID>38e12745bf624f6bacb1b6533b871a2a</MESSAGE_ID><SENDER>EMP</SENDER><RECEIVER>ASS</RECEIVER><DTSEND>20141016164058978</DTSEND></HEADER><DATASET><BATCH_NUMBER>20141016164058978</BATCH_NUMBER><ROW><SERIAL_NUMBER>2629587</SERIAL_NUMBER><EMPLOYEE_ID>00025489</EMPLOYEE_ID><DISPLAY_NAME>合力二</DISPLAY_NAME><AD_ACCOUNT>gelier</AD_ACCOUNT><AD_ACCOUNT_PWD /><APP_ACCOUNT>GLE140801</APP_ACCOUNT><APP_ACCOUNT_PWD>123456</APP_ACCOUNT_PWD><COMPANY_CODE>4001</COMPANY_CODE><COMPANY_NAME>河北国美电器有限公司</COMPANY_NAME><MOBILE /><EMAIL /><STATE>1</STATE><POSITIONINFO><NEW /></POSITIONINFO></ROW></DATASET></XMLSTRING>', 'EMP', '2014-10-17 03:53:03', 'in', '1', 'EMP', 'DIS', null, '2014-10-16 16:40:58');
INSERT INTO `sh_data_record` VALUES ('db4d1b81c6764e3e83e47dd950d24bd3', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:39:38', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('dbbcfd5ca6cc4a3d8393d992955a1598', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:35:07', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');
INSERT INTO `sh_data_record` VALUES ('de5d32ecdba64bc28e22630db47c8ea7', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM272</INTERFACE_ID>\r\n    <MESSAGE_ID>96280f1f5c98a1bdfe49d8b9b2f08cb8</MESSAGE_ID>\r\n    <SENDER>DIS</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20141009141251247</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM272>\r\n      <HEADER>\r\n        <AZD01>52777</AZD01>\r\n        <KHMC>123</KHMC>\r\n        <LXDZ>石家庄市长安区测试路</LXDZ>\r\n        <LXDH>13637373333</LXDH>\r\n        <QTDH />\r\n        <SPBM>000000000100189698</SPBM>\r\n        <SPMC />\r\n        <YYSJ>2014-10-08 08:00:00.0</YYSJ>\r\n        <AZWD01>0003003404</AZWD01>\r\n        <WDMC>北京东方售后维修公司</WDMC>\r\n        <GSXX01>S401</GSXX01>\r\n        <GSMC>石家庄国美电器售后服务有限公司</GSMC>\r\n        <THDH>1451049001</THDH>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <WB_GSMC>河北国美电器有限公司</WB_GSMC>\r\n        <DJZT>2</DJZT>\r\n        <AZFS>1</AZFS>\r\n        <PGSJ>2014-10-08 16:37:34.0</PGSJ>\r\n        <AZLX>1</AZLX>\r\n        <YYSJD>08-10</YYSJD>\r\n        <BZ />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM>\r\n          <GRDM>0500002522</GRDM>\r\n          <GRMC>刘帅</GRMC>\r\n          <LXFS>15010887034</LXFS>\r\n        </ITEM>\r\n        <ITEM>\r\n          <GRDM>0500002524</GRDM>\r\n          <GRMC>刘建保</GRMC>\r\n          <LXFS>13439058816</LXFS>\r\n        </ITEM>\r\n      </ITEMS>\r\n    </CRM272>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM272', '2014-10-09 14:49:13', 'in', '1', 'DIS', 'MDIS', '96280f1f5c98a1bdfe49d8b9b2f08cb8', '2014-10-09 14:12:51');
INSERT INTO `sh_data_record` VALUES ('e5c5cc9f1bed4b7f8743ed9fc78c7614', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0014</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:24:59', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('e6e6ddb8db4b42e88e9cd1d4d0088ba5', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH>山西省运城市临猗县政府</LXDH>\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:02:33', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('e823868425a141b28b1897f70fb703da', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM272</INTERFACE_ID>\r\n    <MESSAGE_ID>96280f1f5c98a1bdfe49d8b9b2f08cb8</MESSAGE_ID>\r\n    <SENDER>DIS</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20141009141251247</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM272>\r\n      <HEADER>\r\n        <AZD01>52777</AZD01>\r\n        <KHMC>123</KHMC>\r\n        <LXDZ>石家庄市长安区测试路</LXDZ>\r\n        <LXDH>13637373333</LXDH>\r\n        <QTDH />\r\n        <SPBM>000000000100189698</SPBM>\r\n        <SPMC />\r\n        <YYSJ>2014-10-08 08:00:00.0</YYSJ>\r\n        <AZWD01>0003003404</AZWD01>\r\n        <WDMC>北京东方售后维修公司</WDMC>\r\n        <GSXX01>S401</GSXX01>\r\n        <GSMC>石家庄国美电器售后服务有限公司</GSMC>\r\n        <THDH>1451049001</THDH>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <WB_GSMC>河北国美电器有限公司</WB_GSMC>\r\n        <DJZT>2</DJZT>\r\n        <AZFS>1</AZFS>\r\n        <PGSJ>2014-10-08 16:37:34.0</PGSJ>\r\n        <AZLX>1</AZLX>\r\n        <YYSJD>08-10</YYSJD>\r\n        <BZ />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM>\r\n          <GRDM>0500002522</GRDM>\r\n          <GRMC>刘帅</GRMC>\r\n          <LXFS>15010887034</LXFS>\r\n        </ITEM>\r\n        <ITEM>\r\n          <GRDM>0500002524</GRDM>\r\n          <GRMC>刘建保</GRMC>\r\n          <LXFS>13439058816</LXFS>\r\n        </ITEM>\r\n      </ITEMS>\r\n    </CRM272>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM272', '2014-10-09 15:01:14', 'in', '1', 'DIS', 'MDIS', '96280f1f5c98a1bdfe49d8b9b2f08cb8', '2014-10-09 14:12:51');
INSERT INTO `sh_data_record` VALUES ('fcd74ba0da7d470e8fd225d56d0c4c30', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541D487F845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140923075911887</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH>crm_001</THDH>\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140924000000</YYSJ>\r\n        <LXDZ>山西省运城市临猗县政府</LXDZ>\r\n        <KHMC>程彪</KHMC>\r\n        <LXDH>13263180885</LXDH>\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>wbsjg_001</GRDM1>\r\n        <GRDM2>undefined_001</GRDM2>\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC>物流组测试专用-海尔空调KF-GW3385(338501)/SM白</SPMC>\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140923155911</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140923155911</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080383</WB_AZD01>\r\n        <AZD01>0200080383</AZD01>\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB>1</ZAZLB>\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>500000518</SPBM>\r\n          <SPMC>步进电机(DQ04-25A)DG13B3-02TRU2811</SPMC>\r\n          <SL>1.000</SL>\r\n          <DJ>40.02</DJ>\r\n          <JE>48.01</JE>\r\n          <PPB01>01528</PPB01>\r\n          <SPFL01>C0201001</SPFL01>\r\n          <WXD01>0200080383</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-10 09:36:18', 'in', '1', 'CRM', 'MDIS', '541D487F845203B5E10000000A800B02', '2014-09-23 07:59:11');
INSERT INTO `sh_data_record` VALUES ('ffd3308f666447e4a64e7ace518b6a56', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ns1:MT_CRM_Req xmlns:ns1=\"_http://gome.com/DIS/MOBILE/Inbound\">\r\n  <HEADER>\r\n    <INTERFACE_ID>CRM270</INTERFACE_ID>\r\n    <MESSAGE_ID>541DD08C845203B5E10000000A800B02</MESSAGE_ID>\r\n    <SENDER>CRM</SENDER>\r\n    <RECEIVER>MDIS</RECEIVER>\r\n    <DTSEND>20140922033348306</DTSEND>\r\n  </HEADER>\r\n  <XML_DATA>\r\n    <CRM270>\r\n      <HEADER>\r\n        <GSXX01 />\r\n        <WXLX>0</WXLX>\r\n        <THDH />\r\n        <DJZT>E0010</DJZT>\r\n        <YYSJ>20140923000000</YYSJ>\r\n        <LXDZ />\r\n        <KHMC />\r\n        <LXDH />\r\n        <QTDH />\r\n        <HWZTSJ />\r\n        <YJWD01>S121</YJWD01>\r\n        <AZWD01 />\r\n        <GRDM1>4001171</GRDM1>\r\n        <GRDM2 />\r\n        <SPBM>000000000100210471</SPBM>\r\n        <SPMC />\r\n        <HZGRDM>LGX121016</HZGRDM>\r\n        <HZGRMC>LGX121016</HZGRMC>\r\n        <HZRQ>20140922113347</HZRQ>\r\n        <PGR>LGX121016</PGR>\r\n        <PGSJ>20140922113347</PGSJ>\r\n        <BZ />\r\n        <AZLEX>00</AZLEX>\r\n        <XXLY />\r\n        <WB_AZD01>0200080373</WB_AZD01>\r\n        <AZD01 />\r\n        <WB_GSXX01>4001</WB_GSXX01>\r\n        <ZYYSJD>08-10</ZYYSJD>\r\n        <ZAZLB />\r\n      </HEADER>\r\n      <ITEMS>\r\n        <ITEM1>\r\n          <WXCS01>540000160</WXCS01>\r\n          <WXCSMC>安装费</WXCSMC>\r\n          <SL>1.000</SL>\r\n          <WXCSFY>100.00</WXCSFY>\r\n          <WXD01>0200080373</WXD01>\r\n        </ITEM1>\r\n        <ITEM2>\r\n          <SPBM>1231</SPBM>\r\n          <SPMC>abcd</SPMC>\r\n          <SL>1</SL>\r\n          <DJ>1</DJ>\r\n          <JE>2</JE>\r\n          <PPB01>3</PPB01>\r\n          <SPFL01>4</SPFL01>\r\n          <WXD01>5</WXD01>\r\n        </ITEM2>\r\n      </ITEMS>\r\n    </CRM270>\r\n  </XML_DATA>\r\n</ns1:MT_CRM_Req>', 'CRM270', '2014-10-09 14:56:44', 'in', '1', 'CRM', 'MDIS', '541DD08C845203B5E10000000A800B02', '2014-09-22 03:33:48');

-- ----------------------------
-- Table structure for `sh_device_manage`
-- ----------------------------
DROP TABLE IF EXISTS `sh_device_manage`;
CREATE TABLE `sh_device_manage` (
  `user_id` varchar(20) NOT NULL,
  `user_type` varchar(1) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `sn_no` varchar(64) DEFAULT NULL,
  `client_version` varchar(10) DEFAULT NULL,
  `os_info` varchar(20) DEFAULT NULL,
  `device_info` varchar(20) DEFAULT NULL,
  `baidu_id` varchar(32) DEFAULT NULL,
  `access_token` varchar(64) DEFAULT NULL,
  `is_root` tinyint(1) DEFAULT NULL COMMENT '是否root',
  `is_double` tinyint(1) DEFAULT NULL COMMENT '是否双卡',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_device_manage
-- ----------------------------
INSERT INTO `sh_device_manage` VALUES ('123456789', null, '13681239343', '352720061149677', '1.0.5', 'android 4.2.2', 'HTC D516t', '1003704142894874031', '', '1', '1', '1');
INSERT INTO `sh_device_manage` VALUES ('wbsjg_001', null, '15810976335', '14E23749-543F-46CD-AF63-A1A7031F8EFF', '1.0', 'iPhone OS7.0.3', 'iPhone Simulator', '', '', '0', '1', '1');

-- ----------------------------
-- Table structure for `sh_group_message`
-- ----------------------------
DROP TABLE IF EXISTS `sh_group_message`;
CREATE TABLE `sh_group_message` (
  `id` varchar(64) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `worker_id` varchar(64) DEFAULT NULL,
  `msg_time` datetime DEFAULT NULL,
  `send_time` datetime NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `send_user_id` varchar(64) DEFAULT NULL,
  `send_user_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_group_message
-- ----------------------------
INSERT INTO `sh_group_message` VALUES ('007fcb5d727a4399859df2a4d2ab9743', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:32:39', '2014-08-12 15:16:17', null, '2', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('009d5ac0d7f1428f8d5f8e960e7a1c00', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:55:01', '2014-08-12 15:38:39', null, '2', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('0296a2fc7ac54d4288c6bfb5f357a878', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:33:51', '2014-09-30 15:33:49', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('029f383d47f7422583f92fad4f9a9b72', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 14:53:55', '2014-06-25 14:34:34', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('043375979e9441629e7ad295f74677b6', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 09:57:19', '2014-09-30 09:57:17', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('086569e01dc34a9ab7eebe170e888e90', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-24 16:19:15', '2014-06-24 15:55:58', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('098e6fed104b4a17861f178251caad4a', 'fds', 'dfs', null, '123456789', '2014-07-18 11:41:05', '2014-07-18 11:21:12', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('0a415bc8bffa4973b435d45d7fd419d4', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:32:25', '2014-09-30 15:32:23', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('0a8b9fb50e2840a2b05f39335aa11a03', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-28 18:22:56', '2014-09-28 18:21:22', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('0a9e6c0348fd4a998bd603bd2546d6ec', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:29:08', '2014-09-30 15:29:07', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('0d08559ecfc445b7981602598943a804', '新订单提醒', '你有新的订单,订单号：4000007001', '北京市朝阳区(五环里)鼎好电子大厦B座10层', '123456789', '2014-07-10 18:29:28', '2014-07-10 18:08:38', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('0d6043c1155c4421a5696b5bf0c3a2a8', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:41:04', '2014-06-26 15:18:01', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('0e19f2a649424e5baede9ca9f224b94a', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:17:16', '2014-08-05 16:59:58', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('0e405aed5796473aa3e12389d33d7e6b', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 13:58:38', '2014-07-31 13:40:39', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('0ea8e404abbd4ad88222639176e38711', 'title2', 'content2', null, '123456789', '2014-06-20 15:27:11', '2014-06-20 15:03:23', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('11eb0a0d63c24ae296acfc299682231b', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 17:45:13', '2014-07-31 17:27:15', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('13246b1747ee43a1acd2a52f2c297249', '订单提醒', '订单：0001059908,已派工', '滨河北路2号中银花园2-5-402', '123456789', '2014-10-11 10:09:32', '2014-10-11 10:09:27', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('14245e7497ce472e99770caefef47c75', '新订单提醒', '你有新的订单,订单号：WT201405290003', '石家庄市长安区测试路', '123456789', '2014-09-03 10:50:56', '2014-09-03 10:49:56', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('154223ba1c9d4bd4bffd438258868f27', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 17:45:13', '2014-07-31 17:27:15', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('15698237f8c8462b8e2efc81193a6a17', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:46:36', '2014-06-26 15:23:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('1698bbab0a984496af7915a9f8b0e302', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-24 16:15:43', '2014-06-24 15:52:26', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('17682587d65846ef82acadef468205b4', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 17:45:32', '2014-07-31 17:27:34', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1813af55bfc245018c1227af33e97449', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 11:39:46', '2014-09-30 11:39:44', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1a494b6bca7f45c38432ebcd0d57063f', '标题', '一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:43:57', '2014-06-26 15:20:54', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('1a495002aead4bc79cddff13d742cb9e', 'test', 'test', null, '123456789', '2014-06-30 11:43:27', '2014-06-30 11:25:13', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('1b3ea822f0884d0fa2e64115de1ae91d', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 17:45:32', '2014-07-31 17:27:34', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1ba8f3a3c59640d7b6ba6fd47329bbe8', 'wuliu', 'dfdsfdsfdsfs', null, '123456789', '2014-06-30 12:50:30', '2014-06-30 12:32:16', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('1bc46ee622c44996b0ec4ed5e675fc6e', 'title6', 'content6', null, '123456789', '2014-06-24 14:36:39', '2014-06-24 14:13:21', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('1be5c491168e43168116097fc1140ee1', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:29:28', '2014-08-12 15:13:06', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1c2e005f2bbe40258db344b7b6a44282', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 17:45:18', '2014-07-31 17:27:20', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1c5ba285ceb54411aad15eb95aaaebe8', '订单提醒', '订单：0001059908,已派工', '滨河北路2号中银花园2-5-402', '123456789', '2014-10-11 10:03:54', '2014-10-11 10:03:48', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1c635c22506d476fb4dc7e45c2c6aaba', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 18:08:27', '2014-08-05 17:51:09', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1e25a3f303164bd6927925e22afdc58b', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:36:02', '2014-08-12 15:19:40', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1f174e003ebe424cb3be0d8f5b52a44b', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-24 16:15:43', '2014-06-24 15:52:26', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1f2e1468ee4d4f96ada2a825cd534e57', '订单提醒', '订单：0001081117,已派工', '黑龙江哈尔滨市香坊区双开冰箱区长江路尚东辉煌城19号楼1单元1901室禧龙大市场后身			', '123456789', '2014-10-11 10:19:15', '2014-10-11 10:19:10', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('1ff47059e4e34e69a68899a4af8e1161', '订单提醒', '订单：4071213438,已派工', '北京市东城区永定门路和平里中街3号院5号楼1106', '123456789', '2014-10-11 09:36:45', '2014-10-11 09:36:40', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('2008c7c7b31d4791b4ffeeac4a1648d3', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:34:18', '2014-08-12 15:17:56', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('22321299efa84611b3a742624bd21201', 'title3', 'content3', null, '123456789', '2014-06-24 14:27:19', '2014-06-24 14:04:00', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('22cc516d84954175b947230d8711f59d', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:38:59', '2014-06-26 15:15:56', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('230a96b5360a4e9cb2c98216f77f4775', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 11:42:45', '2014-06-25 11:23:23', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('24e0c062ca154402a3f2588becce3ee3', '新订单提醒', '你有新的订单,订单号：4000005637', '石家庄桥东区新华路', '123456789', '2014-07-10 18:19:40', '2014-07-10 17:58:50', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('254ac82af7db4ad9a667eac5079af9f6', '订单提醒', '订单：0000121355,已取消', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-28 17:05:29', '2014-09-28 17:03:54', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('26ab03e2c37043ef93077fe6a5eed888', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:46:51', '2014-08-05 17:29:33', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('2759359f5e5645be968c8457a5d2a9f8', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:19:21', '2014-08-05 17:02:03', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('27a9312130294f269cb306a8c74b9567', '标题', '内容1', null, '123456789', '2014-06-20 11:59:34', '2014-06-20 11:35:45', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('282a0a45ecd94e0aae8d9408dfd5f438', '订单提醒', '订单：0001081117,已完成', '黑龙江哈尔滨市香坊区双开冰箱区长江路尚东辉煌城19号楼1单元1901室禧龙大市场后身			', '123456789', '2014-10-11 10:28:45', '2014-10-11 10:28:40', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('294c6a23110442aca4f3ddef76747873', '新订单提醒', '你有新的订单,订单号：4000008888', '北京市朝阳区(五环里)朝阳小学', '123456789', '2014-06-25 15:50:44', '2014-06-25 15:31:24', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('2a4194b6088845db90ad9b1663eb7251', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-06 09:49:54', '2014-08-06 09:32:42', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('2aab275b9fe54b8aa971dd0bc77cf663', '新订单提醒', '你有新的订单,订单号：4000007001', '北京市朝阳区(五环里)鼎好电子大厦B座10层', '123456789', '2014-07-10 18:28:05', '2014-07-10 18:07:15', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('2bd99104c36d4f8096ac61e0016d9f7a', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:38:59', '2014-06-26 15:15:56', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('2e2de4428447428e8dd38ff7426a26b8', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:46:36', '2014-06-26 15:23:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('2edd14d855214675b937ddf3f19c4ece', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:35:18', '2014-08-12 15:18:56', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('2f6a28a0e5ce4882bfd30c8f81d19785', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 18:08:27', '2014-08-05 17:51:09', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('2ff8a9dd64a9436d851a0dfc25f9e055', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 18:08:27', '2014-08-05 17:51:09', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('301a95620a0e4b0794b9eb85e041ea6f', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-25 19:00:34', '2014-07-25 18:41:35', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('3046347590ed4e8b8964b8b3ebc279e7', '通知', 'hello', '北京朝阳', '123456789', '2014-06-05 14:30:58', '2014-06-05 14:30:58', '1', '1', '222222', null);
INSERT INTO `sh_group_message` VALUES ('3094360f2a914106a363cc0379c1b911', 'title6', 'content6', null, '123456789', '2014-06-24 14:36:39', '2014-06-24 14:13:21', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('319190dd34ed478f8e1f9e572b091b96', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:17:08', '2014-08-05 16:59:50', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('32fdbd44f5474fc5abed5c1e25d7b346', '新订单提醒', '你有新的订单,订单号：4000005216', '石家庄市长安区集团测试', '123456789', '2014-06-20 15:47:54', '2014-06-20 15:23:57', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('33454502b94848c19f981ccc4cc26ae3', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 14:04:59', '2014-08-04 13:47:32', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('33915f9c81354126842de39366c26bb4', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:38:59', '2014-06-26 15:15:56', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('348d69b05ac4487386878d615ab1b37d', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:34:58', '2014-09-30 15:34:56', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('3579c76934f641679695286e0ec86979', 'dfsdf', 'dsfdsfddfs', null, '123456789', '2014-07-10 19:03:30', '2014-07-10 18:42:30', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('3602f12aa0e349b7bdb49ed872f728f0', '标题', '一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:43:57', '2014-06-26 15:20:54', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('36b506ca03c444338f00e0efdd0d432d', 'title4', 'content4', null, '123456789', '2014-06-24 14:32:45', '2014-06-24 14:09:25', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('36c5daab502d4e29a9b1d5c1b029b01d', 'title5', 'content5', null, '123456789', '2014-06-24 14:35:22', '2014-06-24 14:12:04', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('3708ef6b62e84c4c925b1771c06cda94', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:28:36', '2014-09-30 15:28:34', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('37b06d9ad01e41338c3e8dad7fbba487', 'title6', 'content6', null, '123456789', '2014-06-24 14:36:39', '2014-06-24 14:13:21', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('3852937b1ab3448abdfe2ad338a56a5f', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:26:20', '2014-08-12 15:09:58', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('38ceb2c9fcd146dd966fd0f9f3cbb7d5', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 09:32:56', '2014-08-04 09:15:28', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('392d941feae94e24a60be215c6f92882', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:40:52', '2014-08-12 15:24:30', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('3b0aebea93c44fa5adbfb2c4e4f0c5a3', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 17:45:32', '2014-07-31 17:27:34', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('3b122e670c8f4f1f8e2ffaf3418fdc03', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 11:42:45', '2014-06-25 11:23:23', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('3c0a6aa2452246e3a5c175c64c5492d1', '系统升级', '测试消息', null, '123456789', '2014-06-25 09:58:29', '2014-06-25 09:39:06', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('3c41a1f24c7a40e8b631f07ac39e954f', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:19:21', '2014-08-05 17:02:03', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('3c51001f8a3e4444bec61a6eb660bd5d', 'title3', 'content3', null, '123456789', '2014-06-24 14:27:29', '2014-06-24 14:04:12', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('3caf3331f8f24b79b0b7b6744baf0ef8', '系统升级1', '测试消息1', null, '123456789', '2014-06-25 11:41:56', '2014-06-25 11:22:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('3d8e2fcf7462405db6c60adf935e8a01', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 14:53:55', '2014-06-25 14:34:34', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('3db82ca80b434dd2a5283e788d754da6', 'test', 'test', null, '123456789', '2014-06-30 11:43:27', '2014-06-30 11:25:13', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('3f0309267c8a434eb08efb982e0b454e', '订单提醒', '订单：0000121355,已取消', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-28 18:40:31', '2014-09-28 18:38:57', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('3f0b7d01f55c4aac885dcc22525ed3d8', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:19:21', '2014-08-05 17:02:03', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('4173d4533dad49488ec4b2154217e84d', '标题', '内容1', null, '123456789', '2014-06-20 11:59:33', '2014-06-20 11:35:44', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('44ada0a0779c4fd4af031cf91363187f', '新订单提醒', '你有新的订单,订单号：4059858963', '上海嘉定双单路1509号263号2101室', '123456789', '2014-09-12 17:32:46', '2014-09-12 17:31:33', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('44ddbc7efb7a4e9698b81064479cdde9', 'fffd', 'dfgfd', null, '123456789', '2014-07-11 18:44:19', '2014-07-11 18:23:36', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('453a6d7980e64e30b1871407ef1cab76', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:17:08', '2014-08-05 16:59:50', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('461cb4e6abf84c60a69d720f09630a4b', 'wuliu', 'dfdsfdsfdsfs', null, '123456789', '2014-06-30 12:50:30', '2014-06-30 12:32:16', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('4648a0296a3a4790bc29f08dcf30b950', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 14:53:55', '2014-06-25 14:34:34', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('483e0001362545c2b4b4c08a8a50a3a9', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:49:59', '2014-08-12 15:33:37', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('491a68f84c984216843d8ff1eaa5cf86', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:28:12', '2014-08-12 15:11:50', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('4a5c439c23e94bcfbb34734df2ab44d4', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-10-08 10:52:22', '2014-10-08 10:52:11', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('4ae24e51c66b48889e589ddb9fbee2c2', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-10-08 10:49:43', '2014-10-08 10:49:32', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('4c85a19f7cb5447c84f00a9e04e99a19', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:41:32', '2014-08-12 15:25:10', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('4d80031bf28e437fa59d898e66731165', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-17 10:36:04', '2014-07-17 10:16:04', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('4e15c20386a94d88b631b3a687b86eb4', '标题', '内容1', null, '123456789', '2014-06-20 11:59:33', '2014-06-20 11:35:44', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('4eacdec1966b4fd4861425f3ebd1bbc5', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 13:58:38', '2014-07-31 13:40:39', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('4f65b51c55f242af9fc0867b99c4d2ee', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 10:20:44', '2014-09-30 10:20:41', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('4fac379c3c454f54be00a4bc5dc31edc', '新订单提醒', '你有新的订单,订单号：4000005637', '石家庄桥东区新华路', '123456789', '2014-07-10 18:25:01', '2014-07-10 18:04:12', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('51a2b701231b48c7baec051b6b2dca95', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-17 10:36:03', '2014-07-17 10:16:03', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('51f9a11c40814f69bc38fdfa04c878a6', 'wuliu', 'dfdsfdsfdsfs', null, '123456789', '2014-06-30 12:50:30', '2014-06-30 12:32:16', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('53d098bc4f384ca0a1faebbbbc40198d', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-17 10:36:03', '2014-07-17 10:16:03', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('54cb6671cef8434297fc4d5de61d70f9', '新订单提醒', '你有新的订单,订单号：4000005637', '石家庄桥东区新华路', '123456789', '2014-07-10 18:23:02', '2014-07-10 18:02:12', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('55571c5dec7849c39671c379aa1c14fd', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-17 10:36:03', '2014-07-17 10:16:03', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('592220b7992c40a7b1ec4ad4b95ea3ba', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:17:16', '2014-08-05 16:59:58', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('59ff6f94aa204c9da86c962467a8523b', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:41:04', '2014-06-26 15:18:01', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('5afe9297981e4c319fb4759f4ed1da6a', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 14:53:55', '2014-06-25 14:34:34', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('5bbde90b20874a42865078ad5975a89a', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 14:03:56', '2014-08-04 13:46:29', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('5bd5c3022c93471abd701e380e294622', '标题', '一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:43:57', '2014-06-26 15:20:54', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('5c8a407b791945199077b8e33b0e1149', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-28 17:06:05', '2014-09-28 17:04:30', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('5e0f817f18fe4960be4f2af476052a5f', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:17:08', '2014-08-05 16:59:50', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('5ef2804390644f8491325e33bee86eb0', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-10-08 10:41:15', '2014-10-08 10:41:02', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('5f8a5326909f46838fc078c8f3c689f8', 'dfsdf', 'dsfdsfddfs', null, '123456789', '2014-07-10 19:04:40', '2014-07-10 18:43:49', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('5fde2fe6fc1d4105b648564d188b8a4d', '标题', '一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:43:57', '2014-06-26 15:20:54', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('6072588949ed44139f585ba0f4ccf68a', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-25 19:00:34', '2014-07-25 18:41:35', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('619740e6b8f143198272bf05b340320a', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 16:55:50', '2014-08-05 16:38:32', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('61a8c01cf7424a33bed1d04682944b33', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:38:59', '2014-06-26 15:15:56', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('61b64bd0fe534367b8548c31c6950f33', '管理员消息标题', '管理员消息内容', null, '123456789', '2014-06-20 15:59:15', '2014-06-20 15:35:27', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('62fe01f6df674b5f8888ddee2e99e498', 'title4', 'content4', null, '123456789', '2014-06-24 14:31:42', '2014-06-24 14:08:23', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('6395351b1a0847168ed53b5b98abfdee', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:13:21', '2014-08-05 16:56:03', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('63e4cc315cb04853a36ca4cb81af49e8', '系统升级1', '测试消息1', null, '123456789', '2014-06-25 11:41:56', '2014-06-25 11:22:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('64d3324cde3d41a999e18de8ef57e807', '新订单提醒', '你有新的订单,订单号：4059858962', '上海嘉定双单路1509号263号2101室', '123456789', '2014-09-12 17:31:27', '2014-09-12 17:30:14', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('66323c47ba5e43f0aeee07b4e0bd3918', 'title5', 'content5', null, '123456789', '2014-06-24 14:35:21', '2014-06-24 14:12:03', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('67483261d74a4221b7ea5c2473997aaa', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-28 16:36:35', '2014-09-28 16:34:59', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('68330fab7b8b4443b2cb85574d1cce29', '新订单提醒', '你有新的订单,订单号：4000007001', '北京市朝阳区(五环里)鼎好电子大厦B座10层', '123456789', '2014-07-10 18:19:40', '2014-07-10 17:58:51', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('69214eb87bf544d79bbd71f9d9064d3d', '新订单提醒', '你有新的订单,订单号：4000008888', '北京市朝阳区(五环里)朝阳小学', '123456789', '2014-06-25 15:53:27', '2014-06-25 15:34:06', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('6b6aa784466b497f96fab6b5ea6bd3d8', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-24 16:15:43', '2014-06-24 15:52:26', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('6e0e346e0b514065a5db4e3cc1ca135f', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:57:09', '2014-08-05 17:39:52', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('6fae7c0c1dfc48feac5c4935fd5ea8f6', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-24 16:19:15', '2014-06-24 15:55:58', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('704c5522145c4a1694acab9359f9207c', '系统升级', '测试消息', null, '123456789', '2014-06-25 09:58:29', '2014-06-25 09:39:06', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('70a97c3d921f4e8bb41349a89ce72260', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:13:21', '2014-08-05 16:56:03', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('70d3b905b5554335b23e2c315254bceb', 'fffd', 'dfgfd', null, '123456789', '2014-07-11 18:44:19', '2014-07-11 18:23:36', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('711f935020fc436cac4523791bcb4903', 'title1', 'content1', null, '123456789', '2014-06-20 15:07:13', '2014-06-20 14:43:24', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('7163ad2d7c7449d7a64044fc87d354e6', '订单提醒', '订单：0001081117,已完成', '黑龙江哈尔滨市香坊区双开冰箱区长江路尚东辉煌城19号楼1单元1901室禧龙大市场后身			', '123456789', '2014-10-11 10:29:31', '2014-10-11 10:29:27', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('71e086ead0c04bafab989b36942c8c8b', 'wuliu', 'dfdsfdsfdsfs', null, '123456789', '2014-06-30 12:50:30', '2014-06-30 12:32:16', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('71ecb091df4743f7b9510822bbb70a31', '系统升级', '测试消息', null, '123456789', '2014-06-25 09:58:29', '2014-06-25 09:39:06', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('720c33600a2c41e99f80f99a8ef52f1e', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 14:53:55', '2014-06-25 14:34:34', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7405b2eb55b945c997925927bfc74104', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 13:58:38', '2014-07-31 13:40:39', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('741ca36151434b54b74c7dfabb3834a1', '订单提醒', '订单：0000121355,已取消', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-28 18:44:29', '2014-09-28 18:42:54', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7561ce12c54e48e6a821f00246707347', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-28 18:25:56', '2014-09-28 18:24:22', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7591ecfb0cfb4bdcab43b649b08c87e5', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:57:10', '2014-08-05 17:39:52', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('75c11043306949ff8afe990da18d6dc3', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:28:53', '2014-08-12 15:12:31', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('760efb1aaf794ae298e52db1d9064a9b', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 17:45:18', '2014-07-31 17:27:20', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('77b59e0e8d754ec3a7d9000e521950f2', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:38:59', '2014-06-26 15:15:56', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('78f67fcdf63a4067ad173316ab72a489', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:29:32', '2014-08-12 15:13:10', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7980791b88f0460191720ee6f76b2a2f', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:00:36', '2014-08-05 16:43:18', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7a980cdbd3894f58954302409f93914c', '新订单提醒', '你有新的订单,订单号：4000008888', '北京市朝阳区(五环里)朝阳小学', '123456789', '2014-06-25 15:53:27', '2014-06-25 15:34:07', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7c547f4aff434f4d89072584d3bc3cd6', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 18:09:13', '2014-08-05 17:51:55', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7c69d4ca8772444ba2d45a8b9e4bcb18', '新订单提醒', '你有新的订单,订单号：4000008888', '北京市朝阳区(五环里)朝阳小学', '123456789', '2014-06-25 15:50:44', '2014-06-25 15:31:24', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7e994a12d7cc47e285659935cc45c5c6', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-25 19:00:34', '2014-07-25 18:41:35', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7fce7d5c7887440482738d1dc86c5894', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 14:03:59', '2014-08-04 13:46:32', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('7fcfd82e9bd64a3580e16f1b06614ee0', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:16:28', '2014-08-05 16:59:10', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('80b411ab8c6e4591a6323556768c3a1b', '新订单提醒', '你有新的订单,订单号：0000001309', '石家庄桥东区东大路20号测试', '123456789', '2014-06-20 15:47:59', '2014-06-20 15:24:10', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('840442d1d222411aad13caa525658621', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-24 16:19:15', '2014-06-24 15:55:58', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('84a11dbce08245d6989126cff9f94c92', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:28:15', '2014-09-30 15:28:14', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('84f8449ffefd4a109384f0203f793005', 'title1', 'content1', null, '123456789', '2014-06-20 15:07:06', '2014-06-20 14:43:17', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('850f606f8ac44aa492fada5eac62a66c', '订单提醒', '订单：4072344069,已派工', '北京市密云县密云镇兴云乙区3-3-502', '123456789', '2014-10-11 09:46:01', '2014-10-11 09:45:56', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('8590db6bb4444b21bfa3e34a9950f5dd', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 14:03:56', '2014-08-04 13:46:29', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('86e07aa9c41340668daf45ebabdd7198', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-10-08 10:49:01', '2014-10-08 10:48:48', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('8747071ddb0a4ea587153ae274ab0858', 'test', 'test', null, '123456789', '2014-06-30 11:43:26', '2014-06-30 11:25:12', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('879af8d485704e49ab22633414c93cfc', 'title3', 'content3', null, '123456789', '2014-06-24 14:27:23', '2014-06-24 14:04:04', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('89a6e073cf7d41d087ddbcfb4211d001', '新订单提醒', '你有新的订单,订单号：4000007001', '北京市朝阳区(五环里)鼎好电子大厦B座10层', '123456789', '2014-07-10 18:07:37', '2014-07-10 17:46:46', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('8c1a0f487a6642ba8dfedc8e9c24c8fe', 'fds', 'dfs', null, '123456789', '2014-07-18 11:41:05', '2014-07-18 11:21:12', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('8c45a68b2c7e459294fa2ef46c1cc983', 'title4', 'content4', null, '123456789', '2014-06-24 14:31:46', '2014-06-24 14:08:27', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('8d8e62ccb9f64ca49b87cde9cd25a0af', '订单提醒', '订单：0001059908,已派工', '滨河北路2号中银花园2-5-402', '123456789', '2014-10-11 10:04:50', '2014-10-11 10:04:46', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('8ee51b78d2664c5db31776718590f6b2', '系统升级1', '测试消息1', null, '123456789', '2014-06-25 11:41:56', '2014-06-25 11:22:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('8f55b9a2d2984f26a35d26a312d21f83', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:34:03', '2014-08-12 15:17:41', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('8fee4e26ac6040309ba8f24061febde0', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:41:04', '2014-06-26 15:18:01', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('90a9237e434e43e2b5d9b6d500d0f570', '新订单提醒', '你有新的订单,订单号：4000007001', '北京市朝阳区(五环里)鼎好电子大厦B座10层', '123456789', '2014-08-05 10:25:35', '2014-08-05 10:07:54', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('919b6e6cedb34449bd47b907e76e647e', '新订单提醒', '你有新的订单,订单号：4000005637', '石家庄桥东区新华路', '123456789', '2014-07-10 18:28:04', '2014-07-10 18:07:14', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('91c1786013aa48bab6cd62a53c78628b', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:30:03', '2014-08-12 15:13:41', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('91fedf16056b490b8e24e89b010d8c1c', 'wuliu', 'dfdsfdsfdsfs', null, '123456789', '2014-06-30 12:50:30', '2014-06-30 12:32:16', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('92b1d388c1b44961aace4258d1f3ded1', '管理员消息标题', '管理员消息内容', null, '123456789', '2014-06-20 15:59:15', '2014-06-20 15:35:27', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('96274c105e47456a9b2f44f9aaa6f7d3', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 14:03:56', '2014-08-04 13:46:29', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('963c9630c90c4d9cb54a42327c16df04', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:00:35', '2014-08-05 16:43:18', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('975d2c87c47d47f5b463380e8a1d18c4', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:46:51', '2014-08-05 17:29:33', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('97f58c0c56e040ec857951d9a85e548f', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:31:18', '2014-08-12 15:14:56', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('97f704bcfe654da78565225175a3ffa4', '新订单提醒', '你有新的订单,订单号：4000008888', '北京市朝阳区(五环里)朝阳小学', '123456789', '2014-06-25 15:50:44', '2014-06-25 15:31:24', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('986a79b240da4e06a44e8a706e4a560c', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:46:36', '2014-06-26 15:23:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('98776cf734e5417c976d18cda442d221', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:29:36', '2014-09-30 15:29:35', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('98fea58ba32749f28c430bb943d6b85b', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-17 10:36:04', '2014-07-17 10:16:04', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('99352d7877ca4801811fdc0748ed9546', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:00:35', '2014-08-05 16:43:18', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('99871256ed02430d961fc73d9ac488fb', 'wuliu', 'dfdsfdsfdsfs', null, '123456789', '2014-06-30 12:50:30', '2014-06-30 12:32:16', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('9aed4845e3604da0830ac173093b765d', 'dfds', 'dfsf', null, '123456789', '2014-07-11 18:52:39', '2014-07-11 18:31:56', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('9c1bb1e0e48849e49ab4911e3d8384d3', '系统升级1', '测试消息1', null, '123456789', '2014-06-25 11:41:56', '2014-06-25 11:22:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('9c4f9ab3e9334c3fa62806bb9704d110', 'fffd', 'dfgfd', null, '123456789', '2014-07-11 18:44:19', '2014-07-11 18:23:36', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('9d815415a830441ebaabab5f31a283e4', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 09:32:56', '2014-08-04 09:15:27', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('9ddee6362a8e4ec7a01d40cfc1ccfbfc', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:57:10', '2014-08-05 17:39:52', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('9e1a0d7456274ff69ee07d408ccfa824', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 11:42:45', '2014-06-25 11:23:23', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('9f1bfdd0a6144cc6a56aca914c029f34', 'dsfds', 'dsfdsf', null, '123456789', '2014-07-18 11:08:59', '2014-07-18 10:49:07', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('a0f176b32ed74c68bfd7bfce85321082', '新订单提醒', '你有新的订单,订单号：4000005637', '石家庄桥东区新华路', '123456789', '2014-08-05 10:25:33', '2014-08-05 10:07:53', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('a49c644c422348f3b7a6972f04bde8ab', '新订单提醒', '你有新的订单,订单号：4000007026', '北京市东城区鼎好电子大厦B座10层', '123456789', '2014-07-10 18:02:18', '2014-07-10 17:41:27', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('a4e387571b324340ba736ad97a28afd8', 'dfsdf', 'dsfdsfddfs', null, '123456789', '2014-07-10 19:04:23', '2014-07-10 18:43:34', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('a553cbe0f5044127a27c0e3a490bef54', '新订单提醒', '你有新的订单,订单号：4000007535', '北京市朝阳区(五环里)朝阳小学', '123456789', '2014-07-10 18:02:01', '2014-07-10 17:41:08', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('a6bb11f5cb6043b5a9e7c6ee1b1a9ad3', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:33:12', '2014-08-12 15:16:50', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('a71d4e09b0434f81bee1e7a2c50ed114', '标题', '一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:43:57', '2014-06-26 15:20:54', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('a99d931e85b54333b343c0a06198c7ae', '标题', '一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:43:57', '2014-06-26 15:20:54', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('a9ebe3c89fec4a368a6a3f0bddff0362', 'test', 'test', null, '123456789', '2014-06-30 11:43:27', '2014-06-30 11:25:13', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('a9f988a953e048e9b996c92cb515936c', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:16:28', '2014-08-05 16:59:10', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('aa1aa39f5cce48ad87a4e636a4f2d804', 'title5', 'content5', null, '123456789', '2014-06-24 14:35:21', '2014-06-24 14:12:03', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('ae987930be6b4ca98644380f34371e12', '订单提醒', '订单：0001059908,已派工', '滨河北路2号中银花园2-5-402', '123456789', '2014-10-11 10:06:05', '2014-10-11 10:06:01', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('b1e9ccecb1084cb1aa38243fd0e43d37', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:16:28', '2014-08-05 16:59:10', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('b22e9b35eba9436799e0bd242863fee9', 'title4', 'content4', null, '123456789', '2014-06-24 14:32:41', '2014-06-24 14:09:17', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('b317274178844a11830dd2433e32c797', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 17:45:13', '2014-07-31 17:27:15', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('b3f90eb1f87e4472a9362f9c32d51b9a', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:38:59', '2014-06-26 15:15:56', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('b48c4902fc5148119094af9374234dfb', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:46:36', '2014-06-26 15:23:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('b5d51519c5f54c16a93b255ca2fab774', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 16:55:50', '2014-08-05 16:38:32', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('b6253aebd22a4089be0a26e8dbd2a98a', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:41:04', '2014-06-26 15:18:01', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('b6335b36ab25446d926b47d521933770', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 14:03:59', '2014-08-04 13:46:32', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('b77d0e09c01542e99eb4ea6b3d942541', '新订单提醒', '你有新的订单,订单号：WT201405290002', '石家庄市长安区测试路', '123456789', '2014-09-03 10:49:20', '2014-09-03 10:48:20', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('b8c165b855de4441b12d390ad41594ac', '订单提醒', '订单：0000121355,已完成', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 11:40:58', '2014-09-30 11:40:56', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('b8c534e77ddf4bfd8c172e556e65211b', 'title3', 'content3', null, '123456789', '2014-06-24 14:27:29', '2014-06-24 14:04:12', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('bb6494ea4d7e44548de41b1a2367a9ec', '新订单提醒', '你有新的订单,订单号：4000005637', '石家庄桥东区新华路', '123456789', '2014-07-10 18:07:21', '2014-07-10 17:46:30', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('bb9c815cb45245059140aff5239c0767', 'test', 'test', null, '123456789', '2014-06-30 11:43:27', '2014-06-30 11:25:13', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('bd5c3f6dc6d241098f33f0e5b045f755', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:41:04', '2014-06-26 15:18:01', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('bed482b58c424a1ca040a26e094a17c4', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 18:09:13', '2014-08-05 17:51:55', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('bed5646a8aae4ffc9fb292e725fcdd12', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 18:09:13', '2014-08-05 17:51:55', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('bf34369370ae423eb889c32210eb08c0', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-28 16:27:40', '2014-09-28 16:24:52', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('bf407ecb80ca4c89a1649c7b622f5a04', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 16:55:50', '2014-08-05 16:38:32', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('c1f49f64a0094eabb0bef7faae3276b3', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-31 17:45:18', '2014-07-31 17:27:20', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('c4fd16a2ae8a44ffa69eb6d006878890', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:41:43', '2014-08-12 15:25:21', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('c56f201c7f6a4538b7f84e4988b19efc', '管理员消息标题', '管理员消息内容', null, '123456789', '2014-06-20 15:59:15', '2014-06-20 15:35:27', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('c59e2254929445ddb86ae43881c5ffb8', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:41:04', '2014-06-26 15:18:01', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('c5ba2f1770ec4b1481b69a44090c2b19', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 18:01:54', '2014-08-05 17:44:37', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('c63b516dbce74908a38f1029474f87ef', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 11:42:45', '2014-06-25 11:23:23', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('c7e8b52322394d96bbbf2642ed4a66c3', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:29:59', '2014-09-30 15:29:57', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('ca8840a0b05b4162890302a0ef85491d', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-07-17 10:36:04', '2014-07-17 10:16:04', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('caf916f62dc44d90b677392eb2402206', '新订单提醒', '你有新的订单,订单号：4000007001', '北京市朝阳区(五环里)鼎好电子大厦B座10层', '123456789', '2014-07-10 18:23:02', '2014-07-10 18:02:13', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('cb31a8ab8c104d7e889a92bcba9f9f48', 'test', 'test', null, '123456789', '2014-06-30 11:43:27', '2014-06-30 11:25:12', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('d01f47c99028457f9041ecaa5f993b80', '新订单提醒', '你有新的订单,订单号：4000008888', '北京市朝阳区(五环里)朝阳小学', '123456789', '2014-06-25 15:53:27', '2014-06-25 15:34:07', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('d12ba3ba1d9e4b438f17874bbbd2edd4', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:13:21', '2014-08-05 16:56:03', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('d1788d9bbb7d49ad91485d9563b17db1', '订单提醒', '订单：0001081117,已取消', '黑龙江哈尔滨市香坊区双开冰箱区长江路尚东辉煌城19号楼1单元1901室禧龙大市场后身			', '123456789', '2014-10-11 10:27:58', '2014-10-11 10:27:53', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('d63fd598dfb349feac3be678e9165bac', 'title2', 'content2', null, '123456789', '2014-06-20 15:27:10', '2014-06-20 15:03:22', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('d6bdfc6a876244ccad1d6686c5486e6b', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:46:36', '2014-06-26 15:23:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('d6c975157cc840a785891c91698aca6f', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:27:11', '2014-08-12 15:10:49', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('d7adb0abd3234f81aff54f51d29920f2', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-06 09:49:54', '2014-08-06 09:32:41', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('d8f3795d76bc48e3ac11e72d95edbaf2', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 14:04:59', '2014-08-04 13:47:32', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('d97cc7789ef44a26a95ed4c33ade5aef', '新订单提醒', '你有新的订单,订单号：WT201405290002', '石家庄市长安区测试路', '123456789', '2014-09-03 10:47:46', '2014-09-03 10:46:45', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('da19bd22b72945daa4553fdce054a6fe', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:32:57', '2014-09-30 15:32:56', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('dcbbcb17e60e4e02a662b93f508576b7', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-25 11:42:45', '2014-06-25 11:23:23', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('dcd58998c18a44e2a768e922de882dfb', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 14:03:59', '2014-08-04 13:46:32', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('ddeb591c02ea44c787ac135492711b9f', '订单提醒', '订单：0000121355,已完成', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-30 15:27:14', '2014-09-30 15:27:12', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('e1d4e5b1dc294be4befb4ea81925b9a9', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-24 16:15:43', '2014-06-24 15:52:26', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('e25c3f16077447a6b6dbd3801c816df0', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 18:01:54', '2014-08-05 17:44:37', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('e273f156c3564cc7af7ddeaab185b69e', '新订单提醒', '你有新的订单,订单号：0000001309', '石家庄桥东区东大路20号测试', '123456789', '2014-06-20 15:47:58', '2014-06-20 15:24:08', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('e52b6fbe5f81461eba93e7df259dab53', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-06 09:49:54', '2014-08-06 09:32:42', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('e618ef989d9145e7bdbeaa6b6761b40f', '系统升级1', '测试消息1', null, '123456789', '2014-06-25 11:41:56', '2014-06-25 11:22:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('e68de10e3f7f40808cb081b6a3f3a83d', '新订单提醒', '你有新的订单,订单号：4000005637', '石家庄桥东区新华路', '123456789', '2014-07-10 18:29:28', '2014-07-10 18:08:38', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('e6f5dd22591040b2b7f45bf11f77b27e', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-06-24 16:19:15', '2014-06-24 15:55:58', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('eb423994cc254b41a153278d1910bfda', '标题', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', null, '123456789', '2014-06-26 15:46:36', '2014-06-26 15:23:33', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('ed6d2854151e40238ac0218c682a40c2', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:37:48', '2014-08-12 15:21:26', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('edddeb0a83d64382a44d72b8cde97fa7', '系统升级', '测试消息', null, '123456789', '2014-06-25 09:58:29', '2014-06-25 09:39:06', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('f209dd4cf05146c2b862bf8ed18da742', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:46:50', '2014-08-05 17:29:33', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('f2fd0f94aa8d4583a24657e02422a247', '新订单提醒', '你有新的订单,订单号：4000005216', '石家庄市长安区集团测试', '123456789', '2014-06-20 15:47:55', '2014-06-20 15:24:06', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('f31001e7020a4f94802b3b8e527808fb', 'title6', 'content6', null, '123456789', '2014-06-24 14:36:39', '2014-06-24 14:13:21', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('f51b623117d941c783ac0d9e638afe2d', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 14:04:59', '2014-08-04 13:47:32', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('f523335e3cac42e6ab72e453dc4dfbac', 'title5', 'content5', null, '123456789', '2014-06-24 14:35:22', '2014-06-24 14:12:04', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('f62cf05c76ea47db8fe54dd4a8e3657c', '新订单提醒', '你有新的订单,订单号：4000007001', '北京市朝阳区(五环里)鼎好电子大厦B座10层', '123456789', '2014-07-10 18:25:02', '2014-07-10 18:04:12', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('f6b41e886d4f42d6b7b0ace61ccb4330', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-04 09:32:56', '2014-08-04 09:15:28', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('f83a8045c9e3415b85351a874370ff5d', 'dfds', 'dfsf', null, '123456789', '2014-07-11 18:52:49', '2014-07-11 18:32:06', null, '1', '222222', '2');
INSERT INTO `sh_group_message` VALUES ('f8accf2ecd8645079434d7a5b1fca9bd', '订单提醒', '订单：0000121355,已派工', '云南曲靖市麒麟区麒麟南路国美华盛国际店松下专柜', '123456789', '2014-09-28 18:46:46', '2014-09-28 18:45:11', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('fa194e722d0b41ce85a663e58b3911a4', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 17:17:16', '2014-08-05 16:59:58', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('fc77293a33394c9098a3e565a65ea67e', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-12 15:35:44', '2014-08-12 15:19:22', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('fdc3c8ae85a54402a5099b0ef320b2aa', '订单提醒', '订单：4072344069,已派工', '北京市密云县密云镇兴云乙区3-3-502', '123456789', '2014-10-11 09:43:16', '2014-10-11 09:43:09', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('fef774b41363424fbacd348e5c0646f8', '新订单提醒', '你有新的订单,订单号：WT201405290003', '石家庄市长安区测试路', '123456789', '2014-09-03 11:12:18', '2014-09-03 11:11:18', null, '0', '222222', null);
INSERT INTO `sh_group_message` VALUES ('ff17416f2c574b5eaa4b4b219f4bf154', '客诉消息', '您有一条新客诉消息', null, '123456789', '2014-08-05 18:01:54', '2014-08-05 17:44:37', null, '2', '222222', null);
INSERT INTO `sh_group_message` VALUES ('bed1f819a6644b5ba2e24ce9b4217d18', '222', '222', null, '', null, '2014-10-14 14:34:11', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('03ec0d72e90a44f08dcb01c0e0470658', '1', '1', null, '1', null, '2014-10-14 15:43:13', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('fb027536bf724b9d868f93e5aa5fa61a', '系统消息', '这是系统消息的内容。', null, '123456789', null, '2014-10-14 16:46:55', '工人', '1', 'sys', '2');
INSERT INTO `sh_group_message` VALUES ('d2a718ffdb524749a70f965514c24c94', '222', '这个222的内容', null, '123456789', null, '2014-10-14 16:48:09', '工人', '1', 'sys', '2');
INSERT INTO `sh_group_message` VALUES ('7733aa8a5aed4db1861e26da0df10b03', '222', '222', null, '123456789', null, '2014-10-14 16:49:28', '网点', '1', 'sys', '2');
INSERT INTO `sh_group_message` VALUES ('40e8481ca8f74be0aec3d8c867991220', '222', '222', null, '1', null, '2014-10-14 16:49:28', '网点', '1', 'sys', '2');
INSERT INTO `sh_group_message` VALUES ('76741e5cbe3e44618b0b94c9b8b01757', '123', '123345', null, '1', null, '2014-10-14 16:56:32', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('b5122e8b019544af80afa6e088e58143', '123', '123345', null, '123456789', null, '2014-10-14 16:56:32', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('80e3234b88aa4e76baadbd6593388eaa', '123', '1233435', null, '123456789', null, '2014-10-14 16:57:34', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('1cddcb965f7b418da2e20bf0abffa95b', '11', '11', null, '123456789', null, '2014-10-14 17:12:44', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('2548e6c973ac49be923acbadce3a80cb', '123', '123345', null, '123456789', null, '2014-10-14 17:13:29', '网点', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('a5914ab4e1b7474ba6b5e018e86b0b5c', '123', '123345', null, '1', null, '2014-10-14 17:13:30', '网点', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('4b55df0b8c0a43f197e1b78108a2f550', '123', '213234', null, '123456789', null, '2014-10-14 17:15:07', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('56304f962e5b462d8b1cf18d2adf70ff', '121324', '2134234234234234', null, '123456789', null, '2014-10-14 17:18:21', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('c9bae6d22c664f58a9074608948cfe75', '123123', '123213123', null, '123456789', null, '2014-10-14 17:19:13', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('cf06494918d04a4cbfcee40cde634643', '123214', '12312', null, '123456789', null, '2014-10-14 17:21:22', '工人', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('414ef046f1dc4e798f7ab692c6242d29', '123465546456456', '3111111111111111', null, '123456789', null, '2014-10-14 17:21:39', '网点', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('3387a705db884d25a39614f55cd34ab0', '123465546456456', '3111111111111111', null, '1', null, '2014-10-14 17:21:39', '网点', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('387d309aa9f949fb91d803b312b28bba', '111111111111', '11111111', null, '123456789', null, '2014-10-14 17:22:11', '网点', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('97fca43cf3b649a0832a29d511a5e026', '111111111111', '11111111', null, '1', null, '2014-10-14 17:22:11', '网点', '1', '222222', '1');
INSERT INTO `sh_group_message` VALUES ('b3c92b4145224670ab4a564b03338924', '1', 'a', null, '3', null, '2014-10-20 09:42:50', '工人', '1', 'sys', '2');
INSERT INTO `sh_group_message` VALUES ('a509e9adb73248908482b0183a8e74a1', '1', 'a', null, 'undefined_001', null, '2014-10-20 09:42:50', '工人', '1', 'sys', '2');

-- ----------------------------
-- Table structure for `sh_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sh_menu`;
CREATE TABLE `sh_menu` (
  `menu_id` varchar(64) NOT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_menu
-- ----------------------------
INSERT INTO `sh_menu` VALUES ('002', '人员管理', null, null, '2014-09-04 13:33:56');
INSERT INTO `sh_menu` VALUES ('00201', '安装工管理', '002', '/worker/workerView', '2014-09-16 11:18:44');
INSERT INTO `sh_menu` VALUES ('003', '系统管理', null, null, '2014-09-17 14:06:03');
INSERT INTO `sh_menu` VALUES ('00301', '系统人员管理', '003', '/user/userListView', '2014-09-30 13:21:49');
INSERT INTO `sh_menu` VALUES ('00302', '日志管理', '003', '/log/shMessageLogListView', '2014-09-25 15:09:07');
INSERT INTO `sh_menu` VALUES ('004', '消息管理', null, null, '2014-10-11 09:45:55');
INSERT INTO `sh_menu` VALUES ('00401', '群发消息', '004', '/groupMessage/groupMessageListView', '2014-10-11 09:47:30');
INSERT INTO `sh_menu` VALUES ('005', '权限管理', null, null, '2014-10-11 09:45:26');
INSERT INTO `sh_menu` VALUES ('00501', '设备管理', '005', '/shDeviceManage/shDeviceListView', '2014-10-11 09:46:34');
INSERT INTO `sh_menu` VALUES ('009', 'Demo', null, null, '2014-09-17 15:04:41');
INSERT INTO `sh_menu` VALUES ('demo1', '人员列表', '009', '/person/personListView', '2014-09-17 15:04:44');

-- ----------------------------
-- Table structure for `sh_message`
-- ----------------------------
DROP TABLE IF EXISTS `sh_message`;
CREATE TABLE `sh_message` (
  `id` varchar(64) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `msg_time` datetime NOT NULL,
  `send_time` datetime NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `rend_user_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_8` (`rend_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_message
-- ----------------------------

-- ----------------------------
-- Table structure for `sh_role`
-- ----------------------------
DROP TABLE IF EXISTS `sh_role`;
CREATE TABLE `sh_role` (
  `role_id` varchar(64) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `position_code` varchar(64) DEFAULT NULL,
  `position_name` varchar(60) DEFAULT NULL,
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_role
-- ----------------------------
INSERT INTO `sh_role` VALUES ('2c82a724d6684b47a09884be32ad9b0b', '总部', 'ZB00', '高管');
INSERT INTO `sh_role` VALUES ('9e16bb7f93e0493293655c13bf4f7379', '经理', 'manager', '经理');
INSERT INTO `sh_role` VALUES ('A003000011', '总部监察中心总监', 'GMZBA003000011', '国美总部总部监察中心总监');
INSERT INTO `sh_role` VALUES ('A003000012', '总部监察中心副总监', 'GMZBA003000012', '国美总部总部监察中心副总监');
INSERT INTO `sh_role` VALUES ('A003000013', '总部监察中心总监助理', 'GMZBA003000013', '国美总部总部监察中心总监助理');
INSERT INTO `sh_role` VALUES ('A003080016', '总部监察中心纪检部经理', 'GMZBA003080016', '国美总部总部监察中心纪检部经理');
INSERT INTO `sh_role` VALUES ('A003080017', '总部监察中心纪检部副经理', 'GMZBA003080017', '国美总部总部监察中心纪检部副经理');
INSERT INTO `sh_role` VALUES ('A003080040', '总部监察中心纪检部高级纪检师', 'GMZBA003080040', '总部监察中心纪检部高级纪检师');
INSERT INTO `sh_role` VALUES ('A00308W941', '集团总部监察中心纪检部西部大区纪检师', 'GMZBA00308W941', '国美总部总部监察中心纪检部西部大区纪检师');
INSERT INTO `sh_role` VALUES ('A003090016', '总部监察中心内审部经理', 'GMZBA003090016', '国美总部总部监察中心内审部经理');
INSERT INTO `sh_role` VALUES ('A003090017', '总部监察中心内审部副经理', 'GMZBA003090017', '国美总部总部监察中心内审部副经理');
INSERT INTO `sh_role` VALUES ('A003090043', '总部监察中心内审部高级审计师', 'GMZBA003090043', '总部监察中心内审部高级审计师');
INSERT INTO `sh_role` VALUES ('A00309W944', '集团总部监察中心内审部西部大区审计师', 'GMZBA00309W944', '国美总部总部监察中心内审部西部大区审计师');
INSERT INTO `sh_role` VALUES ('A003100016', '总部监察中心合规部经理', 'GMZBA003100016', '国美总部总部监察中心合规部经理');
INSERT INTO `sh_role` VALUES ('A003106B44', '总部监察中心合规部高级合规审计师', 'GMZBA003106B44', '国美总部总部监察中心合规部高级合规审计师');
INSERT INTO `sh_role` VALUES ('A009000016', '总部财务中心稽核管理部经理', 'GMZBA009000016', '国美总部总部财务中心稽核管理部经理');
INSERT INTO `sh_role` VALUES ('A009410016', '总部财务中心计划管理部经理', 'GMZBA009410016', '国美总部总部财务中心计划管理部经理');
INSERT INTO `sh_role` VALUES ('A009419718', '总部财务中心计划管理部门店管理主管', 'GMZBA009419718', '国美总部总部财务中心计划管理部门店管理主管');
INSERT INTO `sh_role` VALUES ('A009419818', '总部财务中心计划管理部资产主管', 'GMZBA009419818', '国美总部总部财务中心计划管理部资产主管');
INSERT INTO `sh_role` VALUES ('A009V6FN18', '总部财务中心稽核管理部结算核查主管', 'GMZBA009V6FN18', '国美总部总部财务中心稽核管理部结算核查主管');
INSERT INTO `sh_role` VALUES ('A009V6FO18', '总部财务中心稽核管理部资金核查主管', 'GMZBA009V6FO18', '国美总部总部财务中心稽核管理部资金核查主管');
INSERT INTO `sh_role` VALUES ('A009V6FP18', '总部财务中心稽核管理部门店核查主管', 'GMZBA009V6FP18', '国美总部总部财务中心稽核管理部门店核查主管');
INSERT INTO `sh_role` VALUES ('A009V6FQ18', '总部财务中心稽核管理部费用核查主管', 'GMZBA009V6FQ18', '国美总部总部财务中心稽核管理部费用核查主管');
INSERT INTO `sh_role` VALUES ('A012000013', '总部客服中心总监助理', 'GMZBA012000013', '国美总部总部客服中心总监助理');
INSERT INTO `sh_role` VALUES ('A012550067', '总部客服中心呼叫中心助理', 'GMZBA012550067', '国美总部总部客服中心呼叫中心助理');
INSERT INTO `sh_role` VALUES ('A012557S14', '总部客服中心呼叫中心呼出业务部长', 'GMZBA012557S14', '国美总部总部客服中心呼叫中心呼出业务部长');
INSERT INTO `sh_role` VALUES ('A01255E114', '总部客服中心呼叫中心运营部长', 'GMZBA01255E114', '国美总部总部客服中心呼叫中心运营部长');
INSERT INTO `sh_role` VALUES ('A012P10014', '总部客服中心服务督导部部长', 'GMZBA012P10014', '国美总部总部客服中心服务督导部部长');
INSERT INTO `sh_role` VALUES ('A014000011', '总部营运中心总监', 'GMZBA014000011', '总部营运中心总监');
INSERT INTO `sh_role` VALUES ('A014000012', '总部营运中心副总监', 'GMZBA014000012', '总部营运中心副总监');
INSERT INTO `sh_role` VALUES ('A014660016', '总部物流运管部经理', 'GMZBA014660016', '总部营运中心物流运管部经理');
INSERT INTO `sh_role` VALUES ('A014660017', '总部物流运管部副经理', 'GMZBA014660017', '国美总部总部营运中心物流运管部副经理');
INSERT INTO `sh_role` VALUES ('A014660718', '总部物流运管部服务主管', 'GMZBA014660718', '国美总部总部营运中心物流运管部服务主管');
INSERT INTO `sh_role` VALUES ('A014661R18', '总部物流运管部配送主管', 'GMZBA014661R18', '总部营运中心物流运管部配送主管');
INSERT INTO `sh_role` VALUES ('A014661S18', '总部物流运管部调拨主管', 'GMZBA014661S18', '总部营运中心物流运管部调拨主管');
INSERT INTO `sh_role` VALUES ('A014663T20', '总部物流运管部品质专员', 'GMZBA014663T20', '总部营运中心物流运管部品质专员');
INSERT INTO `sh_role` VALUES ('A01466G318', '总部物流运管部费用及车辆主管', 'GMZBA01466G318', '总部营运中心物流运管部费用及车辆主管');
INSERT INTO `sh_role` VALUES ('A01466G518', '总部物流运管部仓储主管', 'GMZBA01466G518', '总部营运中心物流运管部仓储主管');
INSERT INTO `sh_role` VALUES ('A014670016', '总部物流项目部经理', 'GMZBA014670016', '总部营运中心物流项目部经理');
INSERT INTO `sh_role` VALUES ('A014670017', '总部物流项目部副经理', 'GMZBA014670017', '国美总部总部营运中心物流项目部副经理');
INSERT INTO `sh_role` VALUES ('A014671418', '总部营运中心物流项目部项目主管', 'GMZBA014671418', '国美总部总部营运中心物流项目部项目主管');
INSERT INTO `sh_role` VALUES ('A014671420', '总部营运中心物流项目部项目专员', 'GMZBA014671420', '国美总部总部营运中心物流项目部项目专员');
INSERT INTO `sh_role` VALUES ('A01467B318', '总部物流项目部培训检查主管', 'GMZBA01467B318', '总部营运中心物流项目部培训检查主管');
INSERT INTO `sh_role` VALUES ('A01467B320', '总部物流项目部培训检查专员', 'GMZBA01467B320', '总部营运中心物流项目部培训检查专员');
INSERT INTO `sh_role` VALUES ('A018410014', '总部3C业务中心计划管理部部长', 'GMZBA018410014', '国美总部总部3C业务中心计划管理部部长');
INSERT INTO `sh_role` VALUES ('A018410015', '总部3C业务中心计划管理部副部长', 'GMZBA018410015', '国美总部总部3C业务中心计划管理部副部长');
INSERT INTO `sh_role` VALUES ('A018410018', '总部3C业务中心计划管理部主管', 'GMZBA018410018', '国美总部总部3C业务中心计划管理部主管');
INSERT INTO `sh_role` VALUES ('A088000012', '总部流程权限管理中心副总监', 'GMZBA088000012', '国美总部总部流程权限管理中心副总监');
INSERT INTO `sh_role` VALUES ('A088D12I18', '总部流程权限管理中心权限维护部总部权限主管', 'GMZBA088D12I18', '国美总部总部流程权限管理中心权限维护部总部权限主管');
INSERT INTO `sh_role` VALUES ('A088D12I76', '总部流程权限管理中心权限维护部总部权限维护员', 'GMZBA088D12I76', '国美总部总部流程权限管理中心权限维护部总部权限维护员');
INSERT INTO `sh_role` VALUES ('B00000E911', '大区营销总监', 'Z00004B00000E911', '华南大区大区营销总监');
INSERT INTO `sh_role` VALUES ('C000000008', '一级分部总经理', 'HZ00C000000008', '惠州分部一级分部总经理');
INSERT INTO `sh_role` VALUES ('C00000E411', '一级分部营运总监', 'HN01C00000E411', '河南分部一级分部营运总监');
INSERT INTO `sh_role` VALUES ('C00000M311', '一级分部财务总监', 'HZ00C00000M311', '一级分部财务总监');
INSERT INTO `sh_role` VALUES ('C022009718', '一级分部财务部门店管理主管', 'HZ00C022009718', '一级分部财务部门店管理主管');
INSERT INTO `sh_role` VALUES ('C02200A018', '一级分部财务部稽核主管', 'HZ00C02200A018', '惠州分部一级分部财务部稽核主管');
INSERT INTO `sh_role` VALUES ('C02200M818', '一级分部财务部会计主管', 'HZ00C02200M818', '一级分部财务部会计主管');
INSERT INTO `sh_role` VALUES ('C023000016', '一级分部监察部经理', 'BJ00C023000016', '北京分部一级分部监察部经理');
INSERT INTO `sh_role` VALUES ('C023000040', '一级分部监察部高级纪检师', 'CD00C023000040', '成都分部一级分部监察部高级纪检师');
INSERT INTO `sh_role` VALUES ('C023000041', '一级分部监察部纪检师', 'BJ00C023000041', '北京分部一级分部监察部纪检师');
INSERT INTO `sh_role` VALUES ('C023000043', '一级分部监察部高级审计师', 'CD00C023000043', '成都分部一级分部监察部高级审计师');
INSERT INTO `sh_role` VALUES ('C023000044', '一级分部监察部审计师', 'BJ00C023000044', '北京分部一级分部监察部审计师');
INSERT INTO `sh_role` VALUES ('C030000016', '一级分部客服部经理', 'HZ00C030000016', '一级分部客服部经理');
INSERT INTO `sh_role` VALUES ('C031000016', '一级分部物流部经理', 'HB00C031000016', '河北分部一级分部物流部经理');
INSERT INTO `sh_role` VALUES ('C031000017', '一级分部物流部副经理', 'CQ00C031000017', '重庆分部一级分部物流部副经理');
INSERT INTO `sh_role` VALUES ('C031001R48', '一级分部物流部配送会计', 'CD00C031001R48', '成都分部一级分部物流部配送会计');
INSERT INTO `sh_role` VALUES ('C031001R49', '一级分部物流部配送出纳', 'CD00C031001R49', '成都分部一级分部物流部配送出纳');
INSERT INTO `sh_role` VALUES ('C031001S20', '一级分部物流部调拨专员', 'HB00C031001S20', '河北分部一级分部物流部调拨专员');
INSERT INTO `sh_role` VALUES ('C031002R18', '一级分部物流部调拨及车辆主管', 'HB00C031002R18', '河北分部一级分部物流部调拨及车辆主管');
INSERT INTO `sh_role` VALUES ('C031002X57', '一级分部物流部残次库管', 'CD00C031002X57', '成都分部一级分部物流部残次库管');
INSERT INTO `sh_role` VALUES ('C031005518', '一级分部物流部检查主管', 'HN01C031005518', '河南分部一级分部物流部检查主管');
INSERT INTO `sh_role` VALUES ('C03100G116', '一级分部物流部高级经理', 'BJ00C03100G116', '北京分部一级分部物流部高级经理');
INSERT INTO `sh_role` VALUES ('C03100G418', '一级分部物流部调度主管', 'BJ00C03100G418', '北京分部一级分部物流部调度主管');
INSERT INTO `sh_role` VALUES ('C03100G420', '一级分部物流部调度专员', 'BJ00C03100G420', '北京分部一级分部物流部调度专员');
INSERT INTO `sh_role` VALUES ('C03100G518', '一级分部物流部仓储主管', 'HB00C03100G518', '河北分部一级分部物流部仓储主管');
INSERT INTO `sh_role` VALUES ('C03100N220', '一级分部物流部物流专员', 'HB00C03100N220', '河北分部一级分部物流部物流专员');
INSERT INTO `sh_role` VALUES ('C03100N222', '一级分部物流部物流干事', 'HB00C03100N222', '河北分部一级分部物流部物流干事');
INSERT INTO `sh_role` VALUES ('C03100P220', '一级分部物流部退货专员', 'CZ00C03100P220', '常州分部一级分部物流部退货专员');
INSERT INTO `sh_role` VALUES ('C031H81R48', '物流部海尔项目配送会计', 'BJDZC031H81R48', '北京大中一级分部物流部海尔项目配送会计');
INSERT INTO `sh_role` VALUES ('C031H8G420', '物流部海尔项目调度专员', 'BJDZC031H8G420', '北京大中一级分部物流部海尔项目调度专员');
INSERT INTO `sh_role` VALUES ('C031H8P057', '物流部海尔项目品类库管', 'BJDZC031H8P057', '北京大中一级分部物流部海尔项目品类库管');
INSERT INTO `sh_role` VALUES ('C043000017', '一级分部3C计划管理部副经理', 'HNYLC043000017', '河南永乐一级分部3C计划管理部副经理');
INSERT INTO `sh_role` VALUES ('C043000058', '一级分部3C计划管理部库工', 'HN01C043000058', '河南分部一级分部3C计划管理部库工');
INSERT INTO `sh_role` VALUES ('C04300L118', '一级分部3C计划管理部计划管理主管', 'AH00C04300L118', '安徽分部一级分部3C计划管理部计划管理主管');
INSERT INTO `sh_role` VALUES ('C04300L120', '一级分部3C计划管理部计划管理专员', 'AH00C04300L120', '安徽分部一级分部3C计划管理部计划管理专员');
INSERT INTO `sh_role` VALUES ('C04300N218', '一级分部3C计划管理部物流主管', 'HB00C04300N218', '河北分部一级分部3C计划管理部物流主管');
INSERT INTO `sh_role` VALUES ('C04300N220', '一级分部3C计划管理部物流专员', 'HB00C04300N220', '河北分部一级分部3C计划管理部物流专员');
INSERT INTO `sh_role` VALUES ('C043J1H018', '3C计划管理部讯点3C物流主管', 'DL00C043J1H018', '大连分部一级分部3C计划管理部讯点3C物流主管');
INSERT INTO `sh_role` VALUES ('C045000021', '一级分部电子商务业务', 'HZ00C045000021', '一级分部电子商务业务');
INSERT INTO `sh_role` VALUES ('C04500L618', '一级分部电子商务业务主管', 'HZ00C04500L618', '一级分部电子商务业务主管');
INSERT INTO `sh_role` VALUES ('D031000016', '二级分部物流部经理', 'V01D031000016', '唐山分部二级分部物流部经理');
INSERT INTO `sh_role` VALUES ('D031001R48', '二级分部物流部配送会计', 'A02D031001R48', '张家口分部二级分部物流部配送会计');
INSERT INTO `sh_role` VALUES ('D031001R49', '二级分部物流部配送出纳', 'D02D031001R49', '川北分部二级分部物流部配送出纳');
INSERT INTO `sh_role` VALUES ('D03100E518', '二级分部物流部邯郸物流主管', '703D03100E518', '邯邢分部二级分部物流部邯郸物流主管');
INSERT INTO `sh_role` VALUES ('D03100E548', '二级分部物流部邯郸物流会计', '703D03100E548', '邯邢分部二级分部物流部邯郸物流会计');
INSERT INTO `sh_role` VALUES ('D03100E556', '二级分部物流部邯郸物流调度', '703D03100E556', '邯邢分部二级分部物流部邯郸物流调度');
INSERT INTO `sh_role` VALUES ('D03100E648', '二级分部物流部邢台物流会计', '703D03100E648', '邯邢分部二级分部物流部邢台物流会计');
INSERT INTO `sh_role` VALUES ('D03100E656', '二级分部物流部邢台物流调度', '703D03100E656', '邯邢分部二级分部物流部邢台物流调度');
INSERT INTO `sh_role` VALUES ('D03100G418', '二级分部物流部调度主管', 'D02D03100G418', '川北分部二级分部物流部调度主管');
INSERT INTO `sh_role` VALUES ('D03100G420', '二级分部物流部调度专员', 'K01D03100G420', '湖州分部二级分部物流部调度专员');
INSERT INTO `sh_role` VALUES ('D03100G518', '二级分部物流部仓储主管', 'D03D03100G518', '攀枝花分部二级分部物流部仓储主管');
INSERT INTO `sh_role` VALUES ('D03100N218', '二级分部物流部物流主管', '502D03100N218', '濮阳分部二级分部物流部物流主管');
INSERT INTO `sh_role` VALUES ('D03100N222', '二级分部物流部物流干事', '703D03100N222', '邯邢分部二级分部物流部物流干事');
INSERT INTO `sh_role` VALUES ('D03100N258', '二级分部物流部物流库工', '502D03100N258', '濮阳分部二级分部物流部物流库工');
INSERT INTO `sh_role` VALUES ('D03100P057', '二级分部物流部品类库管', '701D03100P057', '保定分部二级分部物流部品类库管');
INSERT INTO `sh_role` VALUES ('D031B01R48', '物流部瓦房店配送会计', 'S04D031B01R48', '普瓦分部二级分部物流部瓦房店配送会计');
INSERT INTO `sh_role` VALUES ('D031B0G420', '物流部瓦房店调度专员', 'S04D031B0G420', '普瓦分部二级分部物流部瓦房店调度专员');
INSERT INTO `sh_role` VALUES ('D031B0N218', '物流部瓦房店物流主管', 'S04D031B0N218', '普瓦分部二级分部物流部瓦房店物流主管');
INSERT INTO `sh_role` VALUES ('D031B11R48', '物流部庄河配送会计', 'S04D031B11R48', '普瓦分部二级分部物流部庄河配送会计');
INSERT INTO `sh_role` VALUES ('D031B1G420', '物流部庄河调度专员', 'S04D031B1G420', '普瓦分部二级分部物流部庄河调度专员');
INSERT INTO `sh_role` VALUES ('D031B1N218', '物流部庄河物流主管', 'S04D031B1N218', '普瓦分部二级分部物流部庄河物流主管');
INSERT INTO `sh_role` VALUES ('D031B1P057', '物流部庄河品类库管', 'S04D031B1P057', '普瓦分部二级分部物流部庄河品类库管');
INSERT INTO `sh_role` VALUES ('D031B21R48', '物流部凯里配送会计', '602D031B21R48', '黔南分部二级分部物流部凯里配送会计');
INSERT INTO `sh_role` VALUES ('D031B2N218', '物流部凯里物流主管', '602D031B2N218', '黔南分部二级分部物流部凯里物流主管');
INSERT INTO `sh_role` VALUES ('D031B2P057', '物流部凯里品类库管', '602D031B2P057', '黔南分部二级分部物流部凯里品类库管');
INSERT INTO `sh_role` VALUES ('D031B31R48', '物流部铜仁配送会计', '602D031B31R48', '黔南分部二级分部物流部铜仁配送会计');
INSERT INTO `sh_role` VALUES ('D031B3G420', '物流部铜仁调度专员', '602D031B3G420', '黔南分部二级分部物流部铜仁调度专员');
INSERT INTO `sh_role` VALUES ('D031B3N218', '物流部铜仁物流主管', '602D031B3N218', '黔南分部二级分部物流部铜仁物流主管');
INSERT INTO `sh_role` VALUES ('D031B3P057', '物流部铜仁品类库管', '602D031B3P057', '黔南分部二级分部物流部铜仁品类库管');
INSERT INTO `sh_role` VALUES ('D031B41R48', '物流部六盘水配送会计', '602D031B41R48', '黔南分部二级分部物流部六盘水配送会计');
INSERT INTO `sh_role` VALUES ('D031B4G420', '物流部六盘水调度专员', '602D031B4G420', '黔南分部二级分部物流部六盘水调度专员');
INSERT INTO `sh_role` VALUES ('D031B4N218', '物流部六盘水物流主管', '602D031B4N218', '黔南分部二级分部物流部六盘水物流主管');
INSERT INTO `sh_role` VALUES ('D031B4P057', '物流部六盘水品类库管', '602D031B4P057', '黔南分部二级分部物流部六盘水品类库管');
INSERT INTO `sh_role` VALUES ('D031B51R48', '物流部北海配送会计', '1B3D031B51R48', '钦北防分部二级分部物流部北海配送会计');
INSERT INTO `sh_role` VALUES ('D031B51R49', '物流部北海配送出纳', '1B3D031B51R49', '钦北防分部二级分部物流部北海配送出纳');
INSERT INTO `sh_role` VALUES ('D031B5G420', '物流部北海调度专员', '1B3D031B5G420', '钦北防分部二级分部物流部北海调度专员');
INSERT INTO `sh_role` VALUES ('D031B5G518', '物流部北海仓储主管', '1B3D031B5G518', '钦北防分部二级分部物流部北海仓储主管');
INSERT INTO `sh_role` VALUES ('D031B5N218', '物流部北海物流主管', '1B3D031B5N218', '钦北防分部二级分部物流部北海物流主管');
INSERT INTO `sh_role` VALUES ('D031B5N222', '物流部北海物流干事', '1B3D031B5N222', '钦北防分部二级分部物流部北海物流干事');
INSERT INTO `sh_role` VALUES ('D031B5P057', '物流部北海品类库管', '1B3D031B5P057', '钦北防分部二级分部物流部北海品类库管');
INSERT INTO `sh_role` VALUES ('D031B61R48', '物流部钦州配送会计', '1B3D031B61R48', '钦北防分部二级分部物流部钦州配送会计');
INSERT INTO `sh_role` VALUES ('D031B6G420', '物流部钦州调度专员', '1B3D031B6G420', '钦北防分部二级分部物流部钦州调度专员');
INSERT INTO `sh_role` VALUES ('D031B6N218', '物流部钦州物流主管', '1B3D031B6N218', '钦北防分部二级分部物流部钦州物流主管');
INSERT INTO `sh_role` VALUES ('D031B6P057', '物流部钦州品类库管', '1B3D031B6P057', '钦北防分部二级分部物流部钦州品类库管');
INSERT INTO `sh_role` VALUES ('D031I8P057', '物流部长垣品类库管', '503D031I8P057', '新乡分部二级分部物流部长垣品类库管');
INSERT INTO `sh_role` VALUES ('D049000056', '二级分部业务组调度', '508D049000056', '新密分部二级分部业务组调度');
INSERT INTO `sh_role` VALUES ('D051000056', '二级分部营运组调度', '510D051000056', '巩义分部二级分部营运组调度');
INSERT INTO `sh_role` VALUES ('D05100T118', '二级分部营运组物流售后主管', '503D05100T118', '新乡分部二级分部营运组物流售后主管');
INSERT INTO `sh_role` VALUES ('D089000018', '二级分部运营部主管', '703D089000018', '邯邢分部二级分部运营部主管');
INSERT INTO `sh_role` VALUES ('E071000057', '门店库房组库管', 'A33ZE071000057', '濮阳凤凰广场店门店库房组库管');
INSERT INTO `sh_role` VALUES ('E071000058', '门店库房组库工', 'A20RE071000058', '定州大世界店门店库房组库工');
INSERT INTO `sh_role` VALUES ('E07300R318', '门店客服组客服主管', 'A20RE07300R318', '定州大世界店门店客服组客服主管');
INSERT INTO `sh_role` VALUES ('E076000720', '门店服务台组服务专员', 'A20RE076000720', '定州大世界店门店服务台组服务专员');
INSERT INTO `sh_role` VALUES ('E076003W22', '门店服务台组服务台干事', 'A33JE076003W22', '濮阳大庆店门店服务台组服务台干事');
INSERT INTO `sh_role` VALUES ('E076003W33', '门店服务台组服务台主任', 'A33JE076003W33', '濮阳大庆店门店服务台组服务台主任');
INSERT INTO `sh_role` VALUES ('E07600H920', '门店服务台组以旧换新专员', 'A20AE07600H920', '河北世纪商城门店服务台组以旧换新专员');
INSERT INTO `sh_role` VALUES ('E17300R322', '新活馆客服组客服干事', 'A336E17300R322', '河南德化店新活馆客服组客服干事');
INSERT INTO `sh_role` VALUES ('H100001R48', '二级配送中心配送会计', 'BXJ401H100001R48', '惠州国美梅州中转仓二级配送中心配送会计');
INSERT INTO `sh_role` VALUES ('H10000N218', '二级配送中心物流主管', 'BXJ201H10000N218', '惠州国美汕头配送中心二级配送中心物流主管');
INSERT INTO `sh_role` VALUES ('H10000N220', '二级配送中心物流专员', 'BXJ401H10000N220', '惠州国美梅州中转仓二级配送中心物流专员');
INSERT INTO `sh_role` VALUES ('I0I1000011', '国美物流公司国美业务中心总监', 'GMZBI0I1000011', '国美总部国美物流公司国美业务中心总监');
INSERT INTO `sh_role` VALUES ('I0I1000012', '国美物流公司国美业务中心副总监', 'GMZBI0I1000012', '国美总部国美物流公司国美业务中心副总监');
INSERT INTO `sh_role` VALUES ('I0I17G0016', '国美物流公司国美业务中心B2C部经理', 'GMZBI0I17G0016', '国美总部国美物流公司国美业务中心B2C部经理');
INSERT INTO `sh_role` VALUES ('I0I17G0718', '国美物流公司国美业务中心B2C部服务主管', 'GMZBI0I17G0718', '国美总部国美物流公司国美业务中心B2C部服务主管');
INSERT INTO `sh_role` VALUES ('I0I17G1R17', '国美物流公司国美业务中心B2C部配送副经理', 'GMZBI0I17G1R17', '国美总部国美物流公司国美业务中心B2C部配送副经理');
INSERT INTO `sh_role` VALUES ('I0I17G1R18', '国美物流公司国美业务中心B2C部配送主管', 'GMZBI0I17G1R18', '国美总部国美物流公司国美业务中心B2C部配送主管');
INSERT INTO `sh_role` VALUES ('I0I17G1S18', '国美物流公司国美业务中心B2C部调拨主管', 'GMZBI0I17G1S18', '国美总部国美物流公司国美业务中心B2C部调拨主管');
INSERT INTO `sh_role` VALUES ('I0I17GG318', '国美物流公司国美业务中心B2C部费用及车辆主管', 'GMZBI0I17GG318', '国美总部国美物流公司国美业务中心B2C部费用及车辆主管');
INSERT INTO `sh_role` VALUES ('I0I17GG517', '国美物流公司国美业务中心B2C部仓储副经理', 'GMZBI0I17GG517', '国美总部国美物流公司国美业务中心B2C部仓储副经理');
INSERT INTO `sh_role` VALUES ('I0I17GG518', '国美物流公司国美业务中心B2C部仓储主管', 'GMZBI0I17GG518', '国美总部国美物流公司国美业务中心B2C部仓储主管');
INSERT INTO `sh_role` VALUES ('I0I18G0016', '国美物流公司国美业务中心安全技术部经理', 'GMZBI0I18G0016', '国美总部国美物流公司国美业务中心安全技术部经理');
INSERT INTO `sh_role` VALUES ('I0I18G0818', '国美物流公司国美业务中心安全技术部安全主管', 'GMZBI0I18G0818', '国美总部国美物流公司国美业务中心安全技术部安全主管');
INSERT INTO `sh_role` VALUES ('I0I19G0016', '国美物流公司国美业务中心物流管理部经理', 'GMZBI0I19G0016', '国美总部国美物流公司国美业务中心物流管理部经理');
INSERT INTO `sh_role` VALUES ('I0I19G0017', '国美物流公司国美业务中心物流管理部副经理', 'GMZBI0I19G0017', '国美总部国美物流公司国美业务中心物流管理部副经理');
INSERT INTO `sh_role` VALUES ('I0I19G5Z18', '国美物流公司国美业务中心物流管理部合同主管', 'GMZBI0I19G5Z18', '国美总部国美物流公司国美业务中心物流管理部合同主管');
INSERT INTO `sh_role` VALUES ('I0I19GB318', '国美物流公司国美业务中心物流管理部培训检查主管', 'GMZBI0I19GB318', '国美总部国美物流公司国美业务中心物流管理部培训检查主管');
INSERT INTO `sh_role` VALUES ('I0I19GG718', '国美物流公司国美业务中心物流管理部设备主管', 'GMZBI0I19GG718', '国美总部国美物流公司国美业务中心物流管理部设备主管');
INSERT INTO `sh_role` VALUES ('I0I21H0017', '国美物流公司财务商务中心财务商务部副经理', 'GMZBI0I21H0017', '国美总部国美物流公司财务商务中心财务商务部副经理');
INSERT INTO `sh_role` VALUES ('I0I21H0049', '国美物流公司财务商务中心财务商务部出纳', 'GMZBI0I21H0049', '国美总部国美物流公司财务商务中心财务商务部出纳');
INSERT INTO `sh_role` VALUES ('I0I21HGQ18', '国美物流公司财务商务中心财务商务部结算及成本控制主管', 'GMZBI0I21HGQ18', '国美总部国美物流公司财务商务中心财务商务部结算及成本控制主管');
INSERT INTO `sh_role` VALUES ('I0I21HGQ48', '国美物流公司财务商务中心财务商务部结算及成本控制会计', 'GMZBI0I21HGQ48', '国美总部国美物流公司财务商务中心财务商务部结算及成本控制会计');
INSERT INTO `sh_role` VALUES ('I0I21HGR18', '国美物流公司财务商务中心财务商务部总账会计主管', 'GMZBI0I21HGR18', '国美总部国美物流公司财务商务中心财务商务部总账会计主管');
INSERT INTO `sh_role` VALUES ('I0I21HM948', '国美物流公司财务商务中心财务商务部税务会计', 'GMZBI0I21HM948', '国美总部国美物流公司财务商务中心财务商务部税务会计');
INSERT INTO `sh_role` VALUES ('N000001R48', '一级配送中心配送会计', 'BX3F01N000001R48', '惠州国美惠州配送中心一级配送中心配送会计');
INSERT INTO `sh_role` VALUES ('N000001R49', '一级配送中心配送出纳', 'BX3F01N000001R49', '惠州国美惠州配送中心一级配送中心配送出纳');
INSERT INTO `sh_role` VALUES ('N00000N216', '一级配送中心物流经理', 'BX3F01N00000N216', '惠州国美惠州配送中心一级配送中心物流经理');
INSERT INTO `sh_role` VALUES ('O000005518', '一级操作中心检查主管', 'HZ00O000005518', '一级操作中心检查主管');
INSERT INTO `sh_role` VALUES ('O00000G418', '一级操作中心调度主管', 'HZ00O00000G418', '一级操作中心调度主管');
INSERT INTO `sh_role` VALUES ('O00000G518', '一级操作中心仓储主管', 'HZ00O00000G518', '一级操作中心仓储主管');
INSERT INTO `sh_role` VALUES ('O00000HI16', '一级操作中心常务经理', 'HZ00O00000HI16', '一级操作中心常务经理');

-- ----------------------------
-- Table structure for `sh_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sh_role_resource`;
CREATE TABLE `sh_role_resource` (
  `role_id` varchar(64) NOT NULL,
  `resource_id` varchar(64) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `FK_Reference_3` (`resource_id`),
  CONSTRAINT `sh_role_resource_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sh_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `sh_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sh_sys_user`;
CREATE TABLE `sh_sys_user` (
  `account` varchar(60) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `company_code` varchar(60) DEFAULT NULL,
  `webcode` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_sys_user
-- ----------------------------
INSERT INTO `sh_sys_user` VALUES ('sys', 'aaa', 'S165', '');

-- ----------------------------
-- Table structure for `sh_user_pwd_info`
-- ----------------------------
DROP TABLE IF EXISTS `sh_user_pwd_info`;
CREATE TABLE `sh_user_pwd_info` (
  `user_id` varchar(32) NOT NULL COMMENT 'SAP,JL_ID',
  `password` varchar(64) DEFAULT NULL COMMENT 'SAP,JL',
  `user_type` char(6) NOT NULL DEFAULT '' COMMENT '来源(emp,jl.sh)',
  PRIMARY KEY (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_user_pwd_info
-- ----------------------------
INSERT INTO `sh_user_pwd_info` VALUES ('0004019153', '123456', '0');
INSERT INTO `sh_user_pwd_info` VALUES ('111111', '2', '1');
INSERT INTO `sh_user_pwd_info` VALUES ('123456789', '85634c50afcfe48c35df5ddac3e29444', '3');
INSERT INTO `sh_user_pwd_info` VALUES ('222222', '1', '1');
INSERT INTO `sh_user_pwd_info` VALUES ('30012081', '670b14728ad9902aecba32e22fa4f6bd', '1');
INSERT INTO `sh_user_pwd_info` VALUES ('333333', '1', '1');
INSERT INTO `sh_user_pwd_info` VALUES ('JYG11091212', null, '0');
INSERT INTO `sh_user_pwd_info` VALUES ('SHS401', '670b14728ad9902aecba32e22fa4f6bd', '1');
INSERT INTO `sh_user_pwd_info` VALUES ('sys', 'a', '2');
INSERT INTO `sh_user_pwd_info` VALUES ('wbsjg_001', 'e99b62fbe14756b11bb95714c9909387', '3');

-- ----------------------------
-- Table structure for `sh_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sh_user_role`;
CREATE TABLE `sh_user_role` (
  `user_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_user_role
-- ----------------------------
INSERT INTO `sh_user_role` VALUES ('sys01', '2c82a724d6684b47a09884be32ad9b0b');
INSERT INTO `sh_user_role` VALUES ('9f2cb6e634d640208540d12cc7dac8af', '9e16bb7f93e0493293655c13bf4f7379');
INSERT INTO `sh_user_role` VALUES ('203108', 'A003000011');
INSERT INTO `sh_user_role` VALUES ('203108', 'A003000012');
INSERT INTO `sh_user_role` VALUES ('203119', 'A003000012');
INSERT INTO `sh_user_role` VALUES ('203109', 'A003000013');
INSERT INTO `sh_user_role` VALUES ('203111', 'A003080016');
INSERT INTO `sh_user_role` VALUES ('209732', 'A003080017');
INSERT INTO `sh_user_role` VALUES ('232913', 'A003080017');
INSERT INTO `sh_user_role` VALUES ('100000', 'A003080040');
INSERT INTO `sh_user_role` VALUES ('209751', 'A00308W941');
INSERT INTO `sh_user_role` VALUES ('203119', 'A003090016');
INSERT INTO `sh_user_role` VALUES ('209741', 'A003090017');
INSERT INTO `sh_user_role` VALUES ('203121', 'A003090043');
INSERT INTO `sh_user_role` VALUES ('203122', 'A003090043');
INSERT INTO `sh_user_role` VALUES ('209746', 'A00309W944');
INSERT INTO `sh_user_role` VALUES ('209740', 'A003100016');
INSERT INTO `sh_user_role` VALUES ('209744', 'A003106B44');
INSERT INTO `sh_user_role` VALUES ('232856', 'A003106B44');
INSERT INTO `sh_user_role` VALUES ('229186', 'A009000016');
INSERT INTO `sh_user_role` VALUES ('231298', 'A009410016');
INSERT INTO `sh_user_role` VALUES ('231302', 'A009419718');
INSERT INTO `sh_user_role` VALUES ('232045', 'A009419718');
INSERT INTO `sh_user_role` VALUES ('230428', 'A009419818');
INSERT INTO `sh_user_role` VALUES ('230429', 'A009419818');
INSERT INTO `sh_user_role` VALUES ('230431', 'A009419818');
INSERT INTO `sh_user_role` VALUES ('230341', 'A009V6FN18');
INSERT INTO `sh_user_role` VALUES ('232272', 'A009V6FN18');
INSERT INTO `sh_user_role` VALUES ('230340', 'A009V6FO18');
INSERT INTO `sh_user_role` VALUES ('230345', 'A009V6FO18');
INSERT INTO `sh_user_role` VALUES ('230344', 'A009V6FP18');
INSERT INTO `sh_user_role` VALUES ('231301', 'A009V6FQ18');
INSERT INTO `sh_user_role` VALUES ('231375', 'A009V6FQ18');
INSERT INTO `sh_user_role` VALUES ('203136', 'A012000013');
INSERT INTO `sh_user_role` VALUES ('227333', 'A012550067');
INSERT INTO `sh_user_role` VALUES ('229233', 'A012557S14');
INSERT INTO `sh_user_role` VALUES ('227334', 'A01255E114');
INSERT INTO `sh_user_role` VALUES ('227336', 'A01255E114');
INSERT INTO `sh_user_role` VALUES ('227335', 'A012P10014');
INSERT INTO `sh_user_role` VALUES ('202288', 'A014000011');
INSERT INTO `sh_user_role` VALUES ('203137', 'A014000011');
INSERT INTO `sh_user_role` VALUES ('202279', 'A014000012');
INSERT INTO `sh_user_role` VALUES ('202280', 'A014000012');
INSERT INTO `sh_user_role` VALUES ('202281', 'A014000012');
INSERT INTO `sh_user_role` VALUES ('202282', 'A014000012');
INSERT INTO `sh_user_role` VALUES ('203139', 'A014000012');
INSERT INTO `sh_user_role` VALUES ('203140', 'A014000012');
INSERT INTO `sh_user_role` VALUES ('202744', 'A014660016');
INSERT INTO `sh_user_role` VALUES ('204101', 'A014660016');
INSERT INTO `sh_user_role` VALUES ('203142', 'A014660017');
INSERT INTO `sh_user_role` VALUES ('209361', 'A014660017');
INSERT INTO `sh_user_role` VALUES ('203148', 'A014660718');
INSERT INTO `sh_user_role` VALUES ('202286', 'A014661R18');
INSERT INTO `sh_user_role` VALUES ('202287', 'A014661R18');
INSERT INTO `sh_user_role` VALUES ('203143', 'A014661R18');
INSERT INTO `sh_user_role` VALUES ('202741', 'A014661S18');
INSERT INTO `sh_user_role` VALUES ('203145', 'A014661S18');
INSERT INTO `sh_user_role` VALUES ('202278', 'A014663T20');
INSERT INTO `sh_user_role` VALUES ('202743', 'A014663T20');
INSERT INTO `sh_user_role` VALUES ('202275', 'A01466G318');
INSERT INTO `sh_user_role` VALUES ('203144', 'A01466G318');
INSERT INTO `sh_user_role` VALUES ('202746', 'A01466G518');
INSERT INTO `sh_user_role` VALUES ('203146', 'A01466G518');
INSERT INTO `sh_user_role` VALUES ('209368', 'A01466G518');
INSERT INTO `sh_user_role` VALUES ('202283', 'A014670016');
INSERT INTO `sh_user_role` VALUES ('203149', 'A014670016');
INSERT INTO `sh_user_role` VALUES ('203150', 'A014670017');
INSERT INTO `sh_user_role` VALUES ('203147', 'A014671418');
INSERT INTO `sh_user_role` VALUES ('208035', 'A014671420');
INSERT INTO `sh_user_role` VALUES ('202284', 'A01467B318');
INSERT INTO `sh_user_role` VALUES ('203151', 'A01467B318');
INSERT INTO `sh_user_role` VALUES ('202285', 'A01467B320');
INSERT INTO `sh_user_role` VALUES ('203152', 'A01467B320');
INSERT INTO `sh_user_role` VALUES ('203154', 'A018410014');
INSERT INTO `sh_user_role` VALUES ('211165', 'A018410015');
INSERT INTO `sh_user_role` VALUES ('203155', 'A018410018');
INSERT INTO `sh_user_role` VALUES ('203309', 'A018410018');
INSERT INTO `sh_user_role` VALUES ('211207', 'A018410018');
INSERT INTO `sh_user_role` VALUES ('211058', 'A088000012');
INSERT INTO `sh_user_role` VALUES ('203701', 'A088D12I18');
INSERT INTO `sh_user_role` VALUES ('209850', 'A088D12I18');
INSERT INTO `sh_user_role` VALUES ('202982', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('207769', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('208034', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209373', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209385', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209407', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209523', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209524', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209525', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209526', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209527', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209761', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209846', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('209998', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('211074', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('211123', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('211124', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('211161', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('211162', 'A088D12I76');
INSERT INTO `sh_user_role` VALUES ('208184', 'B00000E911');
INSERT INTO `sh_user_role` VALUES ('232799', 'C000000008');
INSERT INTO `sh_user_role` VALUES ('202476', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('203159', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('204739', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('206556', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('206621', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('206714', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('206915', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('208476', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('208529', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('208573', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('208605', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('208684', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('208768', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('208910', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('208961', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('209002', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('209057', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('209129', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('209216', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('209254', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('209306', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('209473', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('209588', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('210044', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('211047', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('211069', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('211085', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('211214', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('230696', 'C00000E411');
INSERT INTO `sh_user_role` VALUES ('230591', 'C00000M311');
INSERT INTO `sh_user_role` VALUES ('229177', 'C022009718');
INSERT INTO `sh_user_role` VALUES ('229176', 'C02200A018');
INSERT INTO `sh_user_role` VALUES ('230630', 'C02200M818');
INSERT INTO `sh_user_role` VALUES ('203160', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('203161', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('206573', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('206614', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('206711', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('206898', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('207927', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208473', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208495', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208524', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208570', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208601', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208651', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208679', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208717', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208764', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208788', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208833', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208878', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208906', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208958', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('208998', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('209054', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('209125', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('209151', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('209301', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('209613', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('211312', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('211465', 'C023000016');
INSERT INTO `sh_user_role` VALUES ('209303', 'C023000040');
INSERT INTO `sh_user_role` VALUES ('209804', 'C023000040');
INSERT INTO `sh_user_role` VALUES ('210783', 'C023000040');
INSERT INTO `sh_user_role` VALUES ('210821', 'C023000040');
INSERT INTO `sh_user_role` VALUES ('210825', 'C023000040');
INSERT INTO `sh_user_role` VALUES ('210831', 'C023000040');
INSERT INTO `sh_user_role` VALUES ('210847', 'C023000040');
INSERT INTO `sh_user_role` VALUES ('210849', 'C023000040');
INSERT INTO `sh_user_role` VALUES ('210852', 'C023000040');
INSERT INTO `sh_user_role` VALUES ('203166', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('203167', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('206616', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('206900', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('207926', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('208498', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('208528', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('208604', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('208653', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('208683', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('208767', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('208909', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('208960', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('209305', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('209419', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('209426', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('211029', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('211063', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('211221', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('211225', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('211233', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('211275', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('232122', 'C023000041');
INSERT INTO `sh_user_role` VALUES ('203162', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('203163', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('204714', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('206899', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('207926', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208474', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208496', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208525', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208571', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208601', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208680', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208765', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208834', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208907', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208957', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('208999', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('209055', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('209128', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('209153', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('209213', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('209302', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('211049', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('211238', 'C023000043');
INSERT INTO `sh_user_role` VALUES ('203164', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('203165', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('206615', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('206713', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('206900', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('206901', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('207688', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('207927', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208475', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208497', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208526', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208527', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208572', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208602', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208603', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208652', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208681', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208682', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208718', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208719', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208789', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208791', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208835', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208879', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208908', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('208959', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209000', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209001', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209056', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209126', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209127', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209152', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209214', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209215', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209304', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209372', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('209402', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('210773', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('210859', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('211062', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('211112', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('211211', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('211328', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('229300', 'C023000044');
INSERT INTO `sh_user_role` VALUES ('232281', 'C030000016');
INSERT INTO `sh_user_role` VALUES ('203168', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('203169', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('203230', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('204765', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('206622', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('206716', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208500', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208530', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208574', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208575', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208606', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208655', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208769', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208793', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208836', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208880', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208912', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('209003', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('209059', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('209130', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('209156', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('209217', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('209255', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('209521', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('209587', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('210104', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('210536', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('210760', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('211167', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('211288', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('211707', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('211708', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('211709', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('211945', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('214034', 'C031000016');
INSERT INTO `sh_user_role` VALUES ('208531', 'C031000017');
INSERT INTO `sh_user_role` VALUES ('208686', 'C031000017');
INSERT INTO `sh_user_role` VALUES ('209004', 'C031000017');
INSERT INTO `sh_user_role` VALUES ('209113', 'C031000017');
INSERT INTO `sh_user_role` VALUES ('211167', 'C031000017');
INSERT INTO `sh_user_role` VALUES ('211308', 'C031000017');
INSERT INTO `sh_user_role` VALUES ('203172', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('203604', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('206559', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('206857', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208049', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208479', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208534', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208577', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208608', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208657', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208772', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208795', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208796', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208838', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208882', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('208914', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209006', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209062', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209132', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209158', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209219', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209220', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209310', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209390', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209538', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('209554', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('210050', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('210102', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('210172', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('210518', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('210969', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('211023', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('211031', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('211097', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('211250', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('211363', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('211387', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('211902', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('212014', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('212119', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('212564', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('212975', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('213038', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('213539', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('214066', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('214074', 'C031001R48');
INSERT INTO `sh_user_role` VALUES ('203174', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('204649', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('206560', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('206709', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('206719', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('206858', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208480', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208481', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208482', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208503', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208578', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208579', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208609', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208688', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208797', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208839', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208966', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208967', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('208968', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('209133', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('209159', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('209311', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('209312', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('209375', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('209390', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('209429', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('209472', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('210098', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('210170', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('210198', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('211007', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('211040', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('211057', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('211067', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('211247', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('211348', 'C031001R49');
INSERT INTO `sh_user_role` VALUES ('203180', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('203193', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('203629', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('204142', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('204848', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('204849', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('206051', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('206725', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('208535', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('208545', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('208620', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('208621', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('208782', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('208928', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('208929', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('208930', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('208976', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('209019', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('209069', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('209230', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('209435', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('209478', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('209479', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('209480', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('210388', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('210936', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('211134', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('211196', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('211322', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('211324', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('211326', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('211448', 'C031001S20');
INSERT INTO `sh_user_role` VALUES ('203186', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('203204', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('203214', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('204303', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('204783', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('206564', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('206628', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('206723', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208508', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208539', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208584', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208615', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208662', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208696', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208777', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208807', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208920', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208972', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('209066', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('209115', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('209165', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('209224', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('209261', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('209326', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('210996', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('211417', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('211427', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('212007', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('212015', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('212561', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('212786', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('212979', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('213902', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('215036', 'C031002R18');
INSERT INTO `sh_user_role` VALUES ('208507', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('208580', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('208610', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('208659', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('208798', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('208840', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('208916', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('209134', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('209161', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('209231', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('209465', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('209474', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('209477', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('209668', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('210004', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('210019', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('210724', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('210834', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('210984', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('211192', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('211281', 'C031002X57');
INSERT INTO `sh_user_role` VALUES ('203196', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('204305', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('204307', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('204310', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('204312', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('207087', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208484', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208536', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208581', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208612', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208660', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208690', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208774', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208841', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208884', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208921', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208969', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('209063', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('209162', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('209314', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('209467', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('210083', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('210963', 'C031005518');
INSERT INTO `sh_user_role` VALUES ('208792', 'C03100G116');
INSERT INTO `sh_user_role` VALUES ('209058', 'C03100G116');
INSERT INTO `sh_user_role` VALUES ('209155', 'C03100G116');
INSERT INTO `sh_user_role` VALUES ('209307', 'C03100G116');
INSERT INTO `sh_user_role` VALUES ('210536', 'C03100G116');
INSERT INTO `sh_user_role` VALUES ('203178', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('203179', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('203801', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('204774', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('206562', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('206626', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('206721', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('206859', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208485', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208506', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208537', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208582', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208613', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208691', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208723', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208775', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208805', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208842', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208918', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208970', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('208974', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('209064', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('209136', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('209163', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('209222', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('209412', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('209589', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('210086', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('210107', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('211050', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('211115', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('211372', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('211373', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('211375', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('211386', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('211447', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('211690', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('211999', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('212042', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('213064', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('213258', 'C03100G418');
INSERT INTO `sh_user_role` VALUES ('203181', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('203182', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('203183', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('203184', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('203185', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204121', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204303', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204304', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204306', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204308', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204311', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204313', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204316', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204317', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204318', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204319', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('204341', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('206629', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('206631', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('206995', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('207687', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208040', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208487', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208488', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208509', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208510', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208538', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208583', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208585', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208586', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208614', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208663', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208664', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208692', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208693', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208694', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208778', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208810', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208811', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208813', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208820', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208822', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208845', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208885', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208922', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208923', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208973', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208975', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('208982', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209016', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209018', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209067', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209068', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209069', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209070', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209082', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209138', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209140', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209143', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209145', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209166', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209173', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209226', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209264', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209265', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209267', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209317', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209318', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209320', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209321', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209322', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209420', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209432', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209610', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209677', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('209849', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('210084', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('210173', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('210879', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('210926', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('210930', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211034', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211189', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211204', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211246', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211277', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211304', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211317', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211323', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211327', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211339', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211358', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211365', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211379', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211384', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211385', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211441', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211442', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211444', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211445', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211730', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211850', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('211997', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('212520', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('212528', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('213221', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('213552', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('213553', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('213673', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('214004', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('214018', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('214511', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('215104', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('215389', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('215428', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('215496', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('215498', 'C03100G420');
INSERT INTO `sh_user_role` VALUES ('203231', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('204766', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('206558', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('206623', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('206870', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('207076', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('208501', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('208532', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('208576', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('208607', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('208770', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('208794', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('208837', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('208881', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('208913', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('209005', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('209009', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('209060', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('209131', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('209157', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('209218', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('209221', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('209309', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('210061', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('210109', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('210997', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('211167', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('211215', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('211235', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('211436', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('211440', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('212668', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('213854', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('214538', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('215562', 'C03100G518');
INSERT INTO `sh_user_role` VALUES ('203175', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('203190', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('204201', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('204335', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('204362', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('204651', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('204829', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('204831', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206566', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206567', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206627', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206630', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206632', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206726', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206727', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206860', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206861', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206862', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206863', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206864', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206865', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206867', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206869', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('206941', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('207271', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('207786', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208489', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208490', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208491', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208512', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208542', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208543', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208544', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208587', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208589', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208590', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208591', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208592', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208617', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208618', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208619', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208698', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208703', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208780', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208781', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208815', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208816', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208817', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208818', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208821', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208843', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208847', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208848', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208849', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208886', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208887', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208924', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208925', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208926', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208977', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208978', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208979', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208980', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208981', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('208985', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209011', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209014', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209016', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209017', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209065', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209071', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209072', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209073', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209077', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209078', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209079', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209080', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209081', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209099', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209137', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209141', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209142', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209144', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209164', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209167', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209169', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209171', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209172', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209223', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209227', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209228', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209279', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209323', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209324', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209325', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209411', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209413', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209428', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209431', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209433', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209437', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209443', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209540', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209578', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209615', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209655', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209656', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209675', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209676', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209848', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('209861', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210079', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210084', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210174', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210468', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210470', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210746', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210902', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210903', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210904', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('210927', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211053', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211056', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211096', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211134', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211146', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211180', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211226', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211227', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211234', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211251', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211267', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211319', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211321', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211325', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211353', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211354', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211355', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211356', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211362', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211364', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211437', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211438', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211439', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211880', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211916', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('211940', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('212041', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('212758', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('212785', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('212791', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('213287', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('213556', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('213719', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('213793', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('214199', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('214525', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('214866', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('215254', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('215389', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('215495', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('215621', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('215650', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('215651', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('215652', 'C03100N220');
INSERT INTO `sh_user_role` VALUES ('203180', 'C03100N222');
INSERT INTO `sh_user_role` VALUES ('203187', 'C03100N222');
INSERT INTO `sh_user_role` VALUES ('203189', 'C03100N222');
INSERT INTO `sh_user_role` VALUES ('211425', 'C03100N222');
INSERT INTO `sh_user_role` VALUES ('211839', 'C03100N222');
INSERT INTO `sh_user_role` VALUES ('211840', 'C03100N222');
INSERT INTO `sh_user_role` VALUES ('206563', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('206633', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('206722', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('206866', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('208646', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('208661', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('208919', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('209065', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('209316', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('209539', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('210085', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('210108', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('211318', 'C03100P220');
INSERT INTO `sh_user_role` VALUES ('207848', 'C031H81R48');
INSERT INTO `sh_user_role` VALUES ('207849', 'C031H8G420');
INSERT INTO `sh_user_role` VALUES ('207850', 'C031H8P057');
INSERT INTO `sh_user_role` VALUES ('204514', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('206607', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('206700', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('206902', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('208598', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('208952', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('209210', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('209826', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('209971', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('211099', 'C043000017');
INSERT INTO `sh_user_role` VALUES ('203203', 'C043000058');
INSERT INTO `sh_user_role` VALUES ('203204', 'C043000058');
INSERT INTO `sh_user_role` VALUES ('203205', 'C043000058');
INSERT INTO `sh_user_role` VALUES ('203197', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('203198', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('204538', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('206902', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('208598', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('208877', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('209210', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('209421', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('209971', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('211296', 'C04300L118');
INSERT INTO `sh_user_role` VALUES ('203199', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('203200', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('206571', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('206607', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('206701', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('208599', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('208649', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('209211', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('209382', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('211343', 'C04300L120');
INSERT INTO `sh_user_role` VALUES ('203201', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('203521', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('204516', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('206572', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('206608', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('206702', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208471', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208494', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208600', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208650', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208678', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208715', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208786', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208832', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208904', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208954', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('208997', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('209052', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('209123', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('209149', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('209212', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('209299', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('209370', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('209537', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('209586', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('209667', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('210087', 'C04300N218');
INSERT INTO `sh_user_role` VALUES ('203521', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('204521', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('206906', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208050', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208051', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208472', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208523', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208557', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208677', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208716', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208905', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208955', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('208997', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('209124', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('209300', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('209590', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('210088', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('210089', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('210090', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('210721', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('211205', 'C04300N220');
INSERT INTO `sh_user_role` VALUES ('206702', 'C043J1H018');
INSERT INTO `sh_user_role` VALUES ('231994', 'C045000021');
INSERT INTO `sh_user_role` VALUES ('232751', 'C045000021');
INSERT INTO `sh_user_role` VALUES ('231994', 'C04500L618');
INSERT INTO `sh_user_role` VALUES ('208561', 'D031000016');
INSERT INTO `sh_user_role` VALUES ('203224', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('203225', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('203226', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('203599', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('203602', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('203603', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('204181', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('205514', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('205515', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('206033', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('206576', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('206580', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('206606', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('206753', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('206772', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('208563', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('208987', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('209193', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('209464', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('209648', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('209674', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('209856', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('209997', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('210382', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('210423', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('210452', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('210990', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('211156', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('211199', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('211299', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('211424', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('211861', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('211864', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('211884', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('211912', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('211917', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('212002', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('212025', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('212789', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('213710', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('213937', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('214403', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('215328', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('215459', 'D031001R48');
INSERT INTO `sh_user_role` VALUES ('205542', 'D031001R49');
INSERT INTO `sh_user_role` VALUES ('208042', 'D031001R49');
INSERT INTO `sh_user_role` VALUES ('208564', 'D031001R49');
INSERT INTO `sh_user_role` VALUES ('208865', 'D031001R49');
INSERT INTO `sh_user_role` VALUES ('209032', 'D031001R49');
INSERT INTO `sh_user_role` VALUES ('209389', 'D031001R49');
INSERT INTO `sh_user_role` VALUES ('209608', 'D031001R49');
INSERT INTO `sh_user_role` VALUES ('210175', 'D031001R49');
INSERT INTO `sh_user_role` VALUES ('211005', 'D031001R49');
INSERT INTO `sh_user_role` VALUES ('203243', 'D03100E518');
INSERT INTO `sh_user_role` VALUES ('203582', 'D03100E548');
INSERT INTO `sh_user_role` VALUES ('203583', 'D03100E548');
INSERT INTO `sh_user_role` VALUES ('203640', 'D03100E648');
INSERT INTO `sh_user_role` VALUES ('208565', 'D03100G418');
INSERT INTO `sh_user_role` VALUES ('209177', 'D03100G418');
INSERT INTO `sh_user_role` VALUES ('213295', 'D03100G418');
INSERT INTO `sh_user_role` VALUES ('203220', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203221', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203222', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203223', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203367', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203585', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203586', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203587', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203591', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203592', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('203593', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('204320', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('204321', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('204324', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('204325', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('204327', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('204329', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('204332', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('205283', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('205949', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('208559', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('208566', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('209968', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('210002', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('210397', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('210759', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('211137', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('211158', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('211160', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('211261', 'D03100G420');
INSERT INTO `sh_user_role` VALUES ('204314', 'D03100G518');
INSERT INTO `sh_user_role` VALUES ('204835', 'D03100G518');
INSERT INTO `sh_user_role` VALUES ('205511', 'D03100G518');
INSERT INTO `sh_user_role` VALUES ('206581', 'D03100G518');
INSERT INTO `sh_user_role` VALUES ('208562', 'D03100G518');
INSERT INTO `sh_user_role` VALUES ('209194', 'D03100G518');
INSERT INTO `sh_user_role` VALUES ('209519', 'D03100G518');
INSERT INTO `sh_user_role` VALUES ('209522', 'D03100G518');
INSERT INTO `sh_user_role` VALUES ('211119', 'D03100G518');
INSERT INTO `sh_user_role` VALUES ('202674', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203206', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203207', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203208', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203209', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203210', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203211', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203212', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203213', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203215', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203587', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203590', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203669', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203670', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('204314', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('204326', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('204333', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('206052', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('206575', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('206578', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('206605', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('206751', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('206770', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('206791', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('208558', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('208656', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('208744', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('209225', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('209519', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('209622', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('209834', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('210007', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('210217', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('210245', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('211418', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('211423', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('211446', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('211860', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('211895', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('211987', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('212054', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('212790', 'D03100N218');
INSERT INTO `sh_user_role` VALUES ('203216', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('205513', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('205543', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('206076', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('206578', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('206579', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('207114', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('208463', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('208567', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('209180', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('209188', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('209247', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('210101', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('211055', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('211064', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('211075', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('211121', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('211254', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('211290', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('211330', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('214666', 'D03100N222');
INSERT INTO `sh_user_role` VALUES ('202703', 'D03100N258');
INSERT INTO `sh_user_role` VALUES ('203229', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203230', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203231', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203233', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203234', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203235', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203236', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203237', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203238', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203239', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203240', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203242', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203664', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('203666', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('204334', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('205284', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('205285', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('205516', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('205517', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('205947', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('206054', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('206055', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('206694', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('206752', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('206771', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('206792', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('207247', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('208551', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('209399', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('209803', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('211300', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('211406', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('211407', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('211419', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('211428', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('211430', 'D03100P057');
INSERT INTO `sh_user_role` VALUES ('206778', 'D031B01R48');
INSERT INTO `sh_user_role` VALUES ('204330', 'D031B0G420');
INSERT INTO `sh_user_role` VALUES ('206777', 'D031B0N218');
INSERT INTO `sh_user_role` VALUES ('206783', 'D031B11R48');
INSERT INTO `sh_user_role` VALUES ('206784', 'D031B1G420');
INSERT INTO `sh_user_role` VALUES ('206785', 'D031B1N218');
INSERT INTO `sh_user_role` VALUES ('206785', 'D031B1P057');
INSERT INTO `sh_user_role` VALUES ('209857', 'D031B21R48');
INSERT INTO `sh_user_role` VALUES ('206645', 'D031B2N218');
INSERT INTO `sh_user_role` VALUES ('206647', 'D031B2P057');
INSERT INTO `sh_user_role` VALUES ('209836', 'D031B31R48');
INSERT INTO `sh_user_role` VALUES ('206652', 'D031B3G420');
INSERT INTO `sh_user_role` VALUES ('206650', 'D031B3N218');
INSERT INTO `sh_user_role` VALUES ('207872', 'D031B3P057');
INSERT INTO `sh_user_role` VALUES ('211183', 'D031B41R48');
INSERT INTO `sh_user_role` VALUES ('206656', 'D031B4G420');
INSERT INTO `sh_user_role` VALUES ('206654', 'D031B4N218');
INSERT INTO `sh_user_role` VALUES ('206657', 'D031B4P057');
INSERT INTO `sh_user_role` VALUES ('206601', 'D031B51R48');
INSERT INTO `sh_user_role` VALUES ('206601', 'D031B51R49');
INSERT INTO `sh_user_role` VALUES ('204328', 'D031B5G420');
INSERT INTO `sh_user_role` VALUES ('206602', 'D031B5G518');
INSERT INTO `sh_user_role` VALUES ('206599', 'D031B5N218');
INSERT INTO `sh_user_role` VALUES ('206600', 'D031B5N222');
INSERT INTO `sh_user_role` VALUES ('206603', 'D031B5P057');
INSERT INTO `sh_user_role` VALUES ('209969', 'D031B61R48');
INSERT INTO `sh_user_role` VALUES ('211030', 'D031B6G420');
INSERT INTO `sh_user_role` VALUES ('207690', 'D031B6N218');
INSERT INTO `sh_user_role` VALUES ('209833', 'D031B6P057');
INSERT INTO `sh_user_role` VALUES ('203250', 'D05100T118');
INSERT INTO `sh_user_role` VALUES ('203247', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('203253', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('204401', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208039', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208460', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208520', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208546', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208593', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208641', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208742', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208748', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208856', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208873', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('208931', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('209034', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('209198', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('209232', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('209853', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('209854', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('210923', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('210964', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('210979', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211116', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211171', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211173', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211184', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211185', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211202', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211248', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211252', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211295', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('211341', 'D089000018');
INSERT INTO `sh_user_role` VALUES ('202477', 'E071000057');
INSERT INTO `sh_user_role` VALUES ('202478', 'E071000057');
INSERT INTO `sh_user_role` VALUES ('202644', 'E071000057');
INSERT INTO `sh_user_role` VALUES ('202504', 'E071000058');
INSERT INTO `sh_user_role` VALUES ('202624', 'E071000058');
INSERT INTO `sh_user_role` VALUES ('202655', 'E071000058');
INSERT INTO `sh_user_role` VALUES ('203348', 'E07300R318');
INSERT INTO `sh_user_role` VALUES ('203394', 'E07300R318');
INSERT INTO `sh_user_role` VALUES ('215660', 'E07300R318');
INSERT INTO `sh_user_role` VALUES ('203312', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203344', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203349', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203384', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203395', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203406', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203448', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203451', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203466', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203503', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203506', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203508', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203542', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203549', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('203673', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('211369', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('211370', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('211371', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('215664', 'E076000720');
INSERT INTO `sh_user_role` VALUES ('202536', 'E076003W22');
INSERT INTO `sh_user_role` VALUES ('202544', 'E076003W22');
INSERT INTO `sh_user_role` VALUES ('202589', 'E076003W22');
INSERT INTO `sh_user_role` VALUES ('202614', 'E076003W22');
INSERT INTO `sh_user_role` VALUES ('202529', 'E076003W33');
INSERT INTO `sh_user_role` VALUES ('202612', 'E076003W33');
INSERT INTO `sh_user_role` VALUES ('202627', 'E076003W33');
INSERT INTO `sh_user_role` VALUES ('228012', 'H100001R48');
INSERT INTO `sh_user_role` VALUES ('228016', 'H10000N218');
INSERT INTO `sh_user_role` VALUES ('228254', 'H10000N220');
INSERT INTO `sh_user_role` VALUES ('227460', 'I0I1000011');
INSERT INTO `sh_user_role` VALUES ('204101', 'I0I1000012');
INSERT INTO `sh_user_role` VALUES ('229833', 'I0I17G0016');
INSERT INTO `sh_user_role` VALUES ('229396', 'I0I17G0718');
INSERT INTO `sh_user_role` VALUES ('230065', 'I0I17G0718');
INSERT INTO `sh_user_role` VALUES ('227172', 'I0I17G1R17');
INSERT INTO `sh_user_role` VALUES ('227162', 'I0I17G1R18');
INSERT INTO `sh_user_role` VALUES ('229897', 'I0I17G1R18');
INSERT INTO `sh_user_role` VALUES ('230320', 'I0I17G1R18');
INSERT INTO `sh_user_role` VALUES ('210180', 'I0I17G1S18');
INSERT INTO `sh_user_role` VALUES ('231250', 'I0I17GG318');
INSERT INTO `sh_user_role` VALUES ('203143', 'I0I17GG517');
INSERT INTO `sh_user_role` VALUES ('229980', 'I0I17GG518');
INSERT INTO `sh_user_role` VALUES ('229985', 'I0I17GG518');
INSERT INTO `sh_user_role` VALUES ('230289', 'I0I18G0016');
INSERT INTO `sh_user_role` VALUES ('232804', 'I0I18G0818');
INSERT INTO `sh_user_role` VALUES ('231471', 'I0I19G0016');
INSERT INTO `sh_user_role` VALUES ('229981', 'I0I19G0017');
INSERT INTO `sh_user_role` VALUES ('229978', 'I0I19G5Z18');
INSERT INTO `sh_user_role` VALUES ('231489', 'I0I19G5Z18');
INSERT INTO `sh_user_role` VALUES ('229983', 'I0I19GB318');
INSERT INTO `sh_user_role` VALUES ('229834', 'I0I19GG718');
INSERT INTO `sh_user_role` VALUES ('233017', 'I0I21H0017');
INSERT INTO `sh_user_role` VALUES ('230101', 'I0I21H0049');
INSERT INTO `sh_user_role` VALUES ('232809', 'I0I21HGQ18');
INSERT INTO `sh_user_role` VALUES ('232821', 'I0I21HGQ18');
INSERT INTO `sh_user_role` VALUES ('232824', 'I0I21HGQ18');
INSERT INTO `sh_user_role` VALUES ('230099', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('230104', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('231387', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('232337', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('232811', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('232813', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('232826', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('232829', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('232830', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('232831', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('232832', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('232833', 'I0I21HGQ48');
INSERT INTO `sh_user_role` VALUES ('230099', 'I0I21HGR18');
INSERT INTO `sh_user_role` VALUES ('230104', 'I0I21HGR18');
INSERT INTO `sh_user_role` VALUES ('230101', 'I0I21HM948');
INSERT INTO `sh_user_role` VALUES ('231253', 'N000001R48');
INSERT INTO `sh_user_role` VALUES ('228398', 'N000001R49');
INSERT INTO `sh_user_role` VALUES ('213319', 'N00000N216');
INSERT INTO `sh_user_role` VALUES ('213391', 'O000005518');
INSERT INTO `sh_user_role` VALUES ('213392', 'O00000G418');
INSERT INTO `sh_user_role` VALUES ('231710', 'O00000G518');
INSERT INTO `sh_user_role` VALUES ('213319', 'O00000HI16');

-- ----------------------------
-- View structure for `v_code`
-- ----------------------------
DROP VIEW IF EXISTS `v_code`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_code` AS (select `sh_code`.`code_id` AS `code_id`,`sh_code`.`code_name` AS `code_name`,`sh_code_setting`.`code_key` AS `code_key`,`sh_code_setting`.`code_value` AS `code_value` from (`sh_code` join `sh_code_setting`) where (`sh_code`.`code_id` = `sh_code_setting`.`code_id`)) ;

-- ----------------------------
-- View structure for `v_user`
-- ----------------------------
DROP VIEW IF EXISTS `v_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_user` AS select `emp_account`.`empname` AS `name`,`emp_account`.`ap_account` AS `account`,`emp_account`.`ap_accountpwd` AS `password`,`emp_account`.`compcode` AS `company_code`,'' AS `webcode`,0 AS `from_type` from `emp_account` union all select `jl_account`.`account_name` AS `name`,`jl_account`.`account_number` AS `account`,`jl_account`.`account_password` AS `password`,`jl_account`.`company_code` AS `company_code`,`jl_account`.`website_code` AS `webcode`,1 AS `from_type` from `jl_account` union all select `sh_sys_user`.`account` AS `name`,`sh_sys_user`.`account` AS `account`,`sh_sys_user`.`password` AS `password`,`sh_sys_user`.`company_code` AS `company_code`,`sh_sys_user`.`webcode` AS `webcode`,2 AS `from_type` from `sh_sys_user` ;
