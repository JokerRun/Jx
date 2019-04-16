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

 Date: 16/04/2019 09:25:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for h_sat_car
-- ----------------------------
DROP TABLE IF EXISTS `h_sat_car`;
CREATE TABLE `h_sat_car`  (
  `h_car_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NOT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `car_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NULL DEFAULT NULL,
  `Nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverId` int(11) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `carAreaCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carTroopCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carTypeId` int(11) NULL DEFAULT NULL,
  `innerLength` double NOT NULL DEFAULT 0,
  `innerWidth` double NOT NULL DEFAULT 0,
  `innerHeight` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`h_car_hk`, `load_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for h_sat_deliverynode
-- ----------------------------
DROP TABLE IF EXISTS `h_sat_deliverynode`;
CREATE TABLE `h_sat_deliverynode`  (
  `h_delivery_node_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NOT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL,
  `ediAsnTransportId` int(11) NULL DEFAULT NULL,
  `transactiontype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weightnet` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weightgross` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delnotenumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plantname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plantcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dock` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customerno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suppliername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delnotedate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `archived` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customerpoboxid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierpoboxid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdDateTime` datetime(0) NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `currentDataId` int(11) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `dataSourceType` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`h_delivery_node_hk`, `load_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for h_sat_dockpoint
-- ----------------------------
DROP TABLE IF EXISTS `h_sat_dockpoint`;
CREATE TABLE `h_sat_dockpoint`  (
  `h_dockpoint_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NOT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dockpoint_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `workTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isInUse` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`h_dockpoint_hk`, `load_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for h_sat_edi_package
-- ----------------------------
DROP TABLE IF EXISTS `h_sat_edi_package`;
CREATE TABLE `h_sat_edi_package`  (
  `h_package_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NOT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL,
  `nr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ediAsnTransportId` int(11) NULL DEFAULT NULL,
  `ediDeliveryNodeId` int(11) NULL DEFAULT NULL,
  `internalid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantityperpack` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tara` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemnopackcustomer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemnopacksupplier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ownership` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recycling` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batchno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `klt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `printflag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packagetype` int(11) NULL DEFAULT NULL,
  `delnotepositionid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantitypack` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `labelnofrom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stacking` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `partId` int(11) NULL DEFAULT NULL,
  `orderno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierId` int(11) NULL DEFAULT NULL,
  `milkDate` datetime(0) NULL DEFAULT NULL,
  `parentPackageId` int(11) NULL DEFAULT NULL,
  `parentPathIds` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `state` int(11) NULL DEFAULT NULL,
  `currentWhouseId` int(11) NULL DEFAULT NULL,
  `currentDockPointId` int(11) NULL DEFAULT NULL,
  `currentUserId` int(11) NULL DEFAULT NULL,
  `currentCarId` int(11) NULL DEFAULT NULL,
  `currentCarTrailerId` int(11) NULL DEFAULT NULL,
  `isChecked` bit(1) NOT NULL DEFAULT b'0',
  `checkedAt` datetime(0) NULL DEFAULT NULL,
  `checkUserId` int(11) NULL DEFAULT NULL,
  `checkCarId` int(11) NULL DEFAULT NULL,
  `checkCarTrailerId` int(11) NULL DEFAULT NULL,
  `lastDeliveryPackageRelationId` int(11) NULL DEFAULT NULL,
  `sentAt` datetime(0) NULL DEFAULT NULL,
  `receivedAt` datetime(0) NULL DEFAULT NULL,
  `dataSourceType` int(11) NULL DEFAULT NULL,
  `ediAsnPositionId` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `dockPointId` int(11) NULL DEFAULT NULL,
  `delivDate` datetime(0) NULL DEFAULT NULL,
  `isSAPReceived` bit(1) NULL DEFAULT NULL,
  `sapReceivedAt` datetime(0) NULL DEFAULT NULL,
  `receiverId` int(11) NULL DEFAULT NULL,
  `totalQty` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for h_sat_edi_transport
-- ----------------------------
DROP TABLE IF EXISTS `h_sat_edi_transport`;
CREATE TABLE `h_sat_edi_transport`  (
  `h_transport_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NULL DEFAULT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transport_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL,
  `transportnumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customerpoboxid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierpoboxid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plantname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plantcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customerno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customerdock` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suppliername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loadingdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loadingtime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrivaldate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrivaltime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carrier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transportationmode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transportationcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transportationid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transportationid2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `freightterms` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weightnet` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weightgross` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `archived` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editransmissionnonew` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editransmissionnoold` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editransmissiondate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdDateTime` datetime(0) NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `ediProcessMessageId` int(11) NULL DEFAULT NULL,
  `arrivaldateDatetime` datetime(0) NULL DEFAULT NULL,
  `currentDataId` int(11) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `currentWhouseId` int(11) NULL DEFAULT NULL,
  `sentAt` datetime(0) NULL DEFAULT NULL,
  `receivedAt` datetime(0) NULL DEFAULT NULL,
  `dataSourceType` int(11) NULL DEFAULT NULL,
  `supplierId` int(11) NULL DEFAULT NULL,
  `dockPointId` int(11) NULL DEFAULT NULL,
  `milkDate` datetime(0) NULL DEFAULT NULL,
  `supplierTrasnNr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivDate` datetime(0) NULL DEFAULT NULL,
  `isDispatched` bit(1) NULL DEFAULT b'0',
  `trayCount` int(11) NULL DEFAULT NULL,
  `packageCount` int(11) NULL DEFAULT NULL,
  `singlePackageCount` int(11) NULL DEFAULT NULL,
  `isCanceled` bit(1) NULL DEFAULT b'0',
  `isVerify` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for h_sat_part
-- ----------------------------
DROP TABLE IF EXISTS `h_sat_part`;
CREATE TABLE `h_sat_part`  (
  `h_part_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NOT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL,
  `Nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kltContent` int(11) NOT NULL,
  `kltLength` int(11) NULL DEFAULT NULL,
  `kltWidth` int(11) NULL DEFAULT NULL,
  `kltHeight` int(11) NULL DEFAULT NULL,
  `luContent` int(11) NOT NULL,
  `luLength` int(11) NULL DEFAULT NULL,
  `luWidth` int(11) NULL DEFAULT NULL,
  `luHeight` int(11) NULL DEFAULT NULL,
  `unitsPerPallet` int(11) NULL DEFAULT NULL,
  `unitsPerLayer` int(11) NULL DEFAULT NULL,
  `layers` int(11) NULL DEFAULT NULL,
  `palletStackingLayers` int(11) NULL DEFAULT NULL,
  `packageType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packageCategory` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packagingMaterialType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isWithWheels` bit(1) NULL DEFAULT NULL,
  `isFolding` bit(1) NULL DEFAULT NULL,
  `lengthAfterFolding` int(11) NULL DEFAULT NULL,
  `widthAfterFolding` int(11) NULL DEFAULT NULL,
  `heightAfterFolding` int(11) NULL DEFAULT NULL,
  `packagingAmount` int(11) NULL DEFAULT NULL,
  `isWithReturnable` bit(1) NULL DEFAULT NULL,
  `isPackageReturnable` bit(1) NULL DEFAULT NULL,
  `isPalletReturnable` bit(1) NULL DEFAULT NULL,
  `isLidReturnable` bit(1) NULL DEFAULT NULL,
  `mainCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PalletCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lidCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isPI` bit(1) NULL DEFAULT NULL,
  `isWPI` bit(1) NULL DEFAULT NULL,
  `weight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grossWeight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tareWeight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weightUnit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deliveryFlodingLayers` int(11) NULL DEFAULT NULL,
  `doublePalletCount` int(11) NULL DEFAULT NULL,
  `perPalletLength` int(11) NULL DEFAULT NULL,
  `milkRunDatePre` int(11) NOT NULL DEFAULT 0,
  `isCarriage` bit(1) NOT NULL DEFAULT b'1',
  `orderNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentDockPointId` int(11) NULL DEFAULT NULL,
  `dockPointId` int(11) NULL DEFAULT NULL,
  `chineseName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `minPickPack` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packModel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`h_part_hk`, `load_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for h_sat_user
-- ----------------------------
DROP TABLE IF EXISTS `h_sat_user`;
CREATE TABLE `h_sat_user`  (
  `h_user_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NOT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL,
  `nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwdSalt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wxOpenId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wx_access_token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wx_access_token_expires_in` int(11) NULL DEFAULT NULL,
  `wx_refresh_token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wx_scope` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleType` int(11) NULL DEFAULT NULL,
  `jgRegId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whouseId` int(11) NULL DEFAULT NULL,
  `carTroopId` int(11) NULL DEFAULT NULL,
  `driverLicense` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverLevel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`h_user_hk`, `load_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for h_sat_whouse
-- ----------------------------
DROP TABLE IF EXISTS `h_sat_whouse`;
CREATE TABLE `h_sat_whouse`  (
  `h_warehouse_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NOT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL,
  `nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `dockPointId` int(11) NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkMan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkPhone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isInUse` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`h_warehouse_hk`, `load_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for l_sat_edi_package
-- ----------------------------
DROP TABLE IF EXISTS `l_sat_edi_package`;
CREATE TABLE `l_sat_edi_package`  (
  `l_package_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NOT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL,
  `nr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ediAsnTransportId` int(11) NULL DEFAULT NULL,
  `ediDeliveryNodeId` int(11) NULL DEFAULT NULL,
  `internalid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantityperpack` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tara` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemnopackcustomer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemnopacksupplier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ownership` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recycling` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batchno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `klt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `printflag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packagetype` int(11) NULL DEFAULT NULL,
  `delnotepositionid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantitypack` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `labelnofrom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stacking` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `partId` int(11) NULL DEFAULT NULL,
  `orderno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierId` int(11) NULL DEFAULT NULL,
  `milkDate` datetime(0) NULL DEFAULT NULL,
  `parentPackageId` int(11) NULL DEFAULT NULL,
  `parentPathIds` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `state` int(11) NULL DEFAULT NULL,
  `currentWhouseId` int(11) NULL DEFAULT NULL,
  `currentDockPointId` int(11) NULL DEFAULT NULL,
  `currentUserId` int(11) NULL DEFAULT NULL,
  `currentCarId` int(11) NULL DEFAULT NULL,
  `currentCarTrailerId` int(11) NULL DEFAULT NULL,
  `isChecked` bit(1) NOT NULL DEFAULT b'0',
  `checkedAt` datetime(0) NULL DEFAULT NULL,
  `checkUserId` int(11) NULL DEFAULT NULL,
  `checkCarId` int(11) NULL DEFAULT NULL,
  `checkCarTrailerId` int(11) NULL DEFAULT NULL,
  `lastDeliveryPackageRelationId` int(11) NULL DEFAULT NULL,
  `sentAt` datetime(0) NULL DEFAULT NULL,
  `receivedAt` datetime(0) NULL DEFAULT NULL,
  `dataSourceType` int(11) NULL DEFAULT NULL,
  `ediAsnPositionId` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `dockPointId` int(11) NULL DEFAULT NULL,
  `delivDate` datetime(0) NULL DEFAULT NULL,
  `isSAPReceived` bit(1) NULL DEFAULT NULL,
  `sapReceivedAt` datetime(0) NULL DEFAULT NULL,
  `receiverId` int(11) NULL DEFAULT NULL,
  `totalQty` double NULL DEFAULT NULL,
  PRIMARY KEY (`l_package_hk`, `load_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for l_sat_edi_package_moving_log
-- ----------------------------
DROP TABLE IF EXISTS `l_sat_edi_package_moving_log`;
CREATE TABLE `l_sat_edi_package_moving_log`  (
  `l_package_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` date NOT NULL,
  `load_end_date` date NULL DEFAULT NULL,
  `record_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash_diff` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL,
  `packageId` int(11) NULL DEFAULT NULL,
  `whouseId` int(11) NULL DEFAULT NULL,
  `carId` int(11) NULL DEFAULT NULL,
  `driverId` int(11) NULL DEFAULT NULL,
  `creatorId` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `actionType` int(11) NULL DEFAULT NULL,
  `relationId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`l_package_hk`, `load_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
