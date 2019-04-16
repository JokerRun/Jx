/*
 Navicat Premium Data Transfer

 Source Server         : jxwts_customer_test_env@101.227.69.51
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 101.227.69.51:3306
 Source Schema         : dw_raw

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 16/04/2019 09:31:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for link_edi_package
-- ----------------------------
DROP TABLE IF EXISTS `link_edi_package`;
CREATE TABLE `link_edi_package`  (
  `l_package_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h_package_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h_delivery_node_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h_transport_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`l_package_hk`) USING BTREE,
  UNIQUE INDEX `uk_hub_user`(`h_package_hk`, `h_delivery_node_hk`, `h_transport_hk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for link_edi_package_moving_log
-- ----------------------------
DROP TABLE IF EXISTS `link_edi_package_moving_log`;
CREATE TABLE `link_edi_package_moving_log`  (
  `l_package_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h_package_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h_delivery_node_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h_transport_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `package_moving_log_id` int(11) NOT NULL,
  PRIMARY KEY (`l_package_hk`) USING BTREE,
  UNIQUE INDEX `uk_hub_user`(`package_moving_log_id`, `h_package_hk`, `h_delivery_node_hk`, `h_transport_hk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'TODO: moving log 中,除了id阿字段,没有其他字段可以作为联合唯一键.' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
