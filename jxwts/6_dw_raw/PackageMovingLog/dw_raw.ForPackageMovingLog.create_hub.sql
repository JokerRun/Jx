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

 Date: 16/04/2019 09:30:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hub_car
-- ----------------------------
DROP TABLE IF EXISTS `hub_car`;
CREATE TABLE `hub_car`  (
  `h_car_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `car_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`h_car_hk`) USING BTREE,
  UNIQUE INDEX `AK_uk_hub_car`(`car_nr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hub_dockpoint
-- ----------------------------
DROP TABLE IF EXISTS `hub_dockpoint`;
CREATE TABLE `hub_dockpoint`  (
  `h_dockpoint_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dockpoint_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`h_dockpoint_hk`) USING BTREE,
  UNIQUE INDEX `AK_uk_hub_dockpoint`(`dockpoint_nr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hub_edi_delivery_node
-- ----------------------------
DROP TABLE IF EXISTS `hub_edi_delivery_node`;
CREATE TABLE `hub_edi_delivery_node`  (
  `h_delivery_node_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delivery_node_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`h_delivery_node_hk`) USING BTREE,
  UNIQUE INDEX `uk_hub_user`(`delivery_node_nr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hub_edi_package
-- ----------------------------
DROP TABLE IF EXISTS `hub_edi_package`;
CREATE TABLE `hub_edi_package`  (
  `h_package_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `package_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`h_package_hk`) USING BTREE,
  UNIQUE INDEX `uk_hub_user`(`package_nr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hub_edi_transport
-- ----------------------------
DROP TABLE IF EXISTS `hub_edi_transport`;
CREATE TABLE `hub_edi_transport`  (
  `h_transport_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transport_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`h_transport_hk`) USING BTREE,
  UNIQUE INDEX `uk_hub_user`(`transport_nr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hub_part
-- ----------------------------
DROP TABLE IF EXISTS `hub_part`;
CREATE TABLE `hub_part`  (
  `h_part_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`h_part_hk`) USING BTREE,
  UNIQUE INDEX `AK_uk_hub_part`(`part_nr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hub_user
-- ----------------------------
DROP TABLE IF EXISTS `hub_user`;
CREATE TABLE `hub_user`  (
  `h_user_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`h_user_hk`) USING BTREE,
  UNIQUE INDEX `uk_hub_user`(`user_nr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hub_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `hub_warehouse`;
CREATE TABLE `hub_warehouse`  (
  `h_warehouse_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`h_warehouse_hk`) USING BTREE,
  UNIQUE INDEX `AK_uk_hub_warehouse`(`warehouse_nr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
