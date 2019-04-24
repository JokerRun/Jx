/*
 Navicat Premium Data Transfer

 Source Server         : mysql@121.199.48.53
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 121.199.48.53:3306
 Source Schema         : ods_prod

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 24/04/2019 14:32:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for a_test_increment
-- ----------------------------
DROP TABLE IF EXISTS `a_test_increment`;
CREATE TABLE `a_test_increment`  (
  `f1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `f3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdat` date NULL DEFAULT NULL,
  `b1` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`f1`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `id` int(11) NOT NULL,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cartrailer
-- ----------------------------
DROP TABLE IF EXISTS `cartrailer`;
CREATE TABLE `cartrailer`  (
  `id` int(11) NOT NULL,
  `carAreaId` int(11) NULL DEFAULT NULL,
  `nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `length` double NOT NULL,
  `innerLength` double NOT NULL,
  `innerWidth` double NOT NULL,
  `innerHeight` double NOT NULL,
  `capacity` double NULL DEFAULT NULL,
  `carTroopId` int(11) NULL DEFAULT NULL,
  `carTypeId` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cartroop
-- ----------------------------
DROP TABLE IF EXISTS `cartroop`;
CREATE TABLE `cartroop`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leader` int(11) NULL DEFAULT NULL,
  `carAreaId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cartype
-- ----------------------------
DROP TABLE IF EXISTS `cartype`;
CREATE TABLE `cartype`  (
  `id` int(11) NOT NULL,
  `nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for deliverynode
-- ----------------------------
DROP TABLE IF EXISTS `deliverynode`;
CREATE TABLE `deliverynode`  (
  `id` int(11) NOT NULL,
  `nr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sourceWhouseId` int(11) NULL DEFAULT NULL,
  `destinationWhouseId` int(11) NULL DEFAULT NULL,
  `currentWhouseId` int(11) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `createUserId` int(11) NULL DEFAULT NULL,
  `isCarTroopDelivery` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT b'0',
  `carTroopId` int(11) NULL DEFAULT NULL,
  `shouldSentArrivalDateTime` datetime(0) NULL DEFAULT NULL,
  `goToPickDateTime` datetime(0) NULL DEFAULT NULL,
  `deliveryMode` int(11) NULL DEFAULT 100,
  `isPickOver` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pickOverAt` datetime(0) NULL DEFAULT NULL,
  `isSent` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sentAt` datetime(0) NULL DEFAULT NULL,
  `isReceived` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receivedAt` datetime(0) NULL DEFAULT NULL,
  `stowageCarRemark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `supplierTrasnNr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for deliverynodecar
-- ----------------------------
DROP TABLE IF EXISTS `deliverynodecar`;
CREATE TABLE `deliverynodecar`  (
  `id` int(11) NOT NULL,
  `carId` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `deliveryNodeId` int(11) NULL DEFAULT NULL,
  `carTrailerId` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `isInStnDeliver` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isSent` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sentAt` datetime(0) NULL DEFAULT NULL,
  `isReceived` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receivedAt` datetime(0) NULL DEFAULT NULL,
  `isPickOver` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pickOverAt` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for deliverynodeedipackagerelation
-- ----------------------------
DROP TABLE IF EXISTS `deliverynodeedipackagerelation`;
CREATE TABLE `deliverynodeedipackagerelation`  (
  `id` int(11) NOT NULL,
  `deliveryNodeId` int(11) NULL DEFAULT NULL,
  `ediAsnTransportId` int(11) NULL DEFAULT NULL,
  `ediAsnPackageId` int(11) NULL DEFAULT NULL,
  `checkedAt` datetime(0) NULL DEFAULT NULL,
  `checkUserId` int(11) NULL DEFAULT NULL,
  `checkCarId` int(11) NULL DEFAULT NULL,
  `checkCarTrailerId` int(11) NULL DEFAULT NULL,
  `isChecked` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for deliveryreceivededipackagerelation
-- ----------------------------
DROP TABLE IF EXISTS `deliveryreceivededipackagerelation`;
CREATE TABLE `deliveryreceivededipackagerelation`  (
  `id` int(11) NOT NULL,
  `deliveryReceivedRecordId` int(11) NOT NULL,
  `ediAsnPackageId` int(11) NOT NULL,
  `fromType` int(11) NULL DEFAULT NULL,
  `fromId` int(11) NOT NULL,
  `sendTime` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_drr_pkg_id`(`deliveryReceivedRecordId`, `ediAsnPackageId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for deliveryreceivedrecord
-- ----------------------------
DROP TABLE IF EXISTS `deliveryreceivedrecord`;
CREATE TABLE `deliveryreceivedrecord`  (
  `id` int(11) NOT NULL,
  `nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carTroopId` int(11) NULL DEFAULT NULL,
  `driverId` int(11) NULL DEFAULT NULL,
  `carId` int(11) NULL DEFAULT NULL,
  `carTrailerId` int(11) NULL DEFAULT NULL,
  `toId` int(11) NULL DEFAULT NULL,
  `receivedAt` datetime(0) NULL DEFAULT NULL,
  `creatorId` int(11) NULL DEFAULT NULL,
  `receiveType` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 100,
  `note` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `deliveryreceivedrecord_id_uindex`(`id`) USING BTREE,
  INDEX `idx_received_at`(`receivedAt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dockpoint
-- ----------------------------
DROP TABLE IF EXISTS `dockpoint`;
CREATE TABLE `dockpoint`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `workTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isInUse` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for drivercheckedrecord
-- ----------------------------
DROP TABLE IF EXISTS `drivercheckedrecord`;
CREATE TABLE `drivercheckedrecord`  (
  `id` int(11) NOT NULL,
  `deliveryNodeId` int(11) NOT NULL,
  `deliveryNodeCarId` int(11) NULL DEFAULT NULL,
  `ediAsnTransportId` int(11) NULL DEFAULT NULL,
  `realTrayCount` int(11) NULL DEFAULT 0,
  `realPackageCount` int(11) NULL DEFAULT 0,
  `planTrayCount` int(11) NULL DEFAULT 0,
  `planPackageCount` int(11) NULL DEFAULT 0,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `creatorId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `drivercheckedrecord_id_uindex`(`id`) USING BTREE,
  INDEX `idx_created_at`(`createdAt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ediasndeliverynode
-- ----------------------------
DROP TABLE IF EXISTS `ediasndeliverynode`;
CREATE TABLE `ediasndeliverynode`  (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ediasnpackage
-- ----------------------------
DROP TABLE IF EXISTS `ediasnpackage`;
CREATE TABLE `ediasnpackage`  (
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
  `isChecked` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
  `isSAPReceived` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sapReceivedAt` datetime(0) NULL DEFAULT NULL,
  `receiverId` int(11) NULL DEFAULT NULL,
  `totalQty` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created_at_updated_at`(`createdAt`, `updatedAt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ediasnpackagemovinglog
-- ----------------------------
DROP TABLE IF EXISTS `ediasnpackagemovinglog`;
CREATE TABLE `ediasnpackagemovinglog`  (
  `id` int(11) NOT NULL,
  `packageId` int(11) NULL DEFAULT NULL,
  `whouseId` int(11) NULL DEFAULT NULL,
  `carId` int(11) NULL DEFAULT NULL,
  `driverId` int(11) NULL DEFAULT NULL,
  `creatorId` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `actionType` int(11) NULL DEFAULT NULL,
  `relationId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created_at`(`createdAt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ediasnposition
-- ----------------------------
DROP TABLE IF EXISTS `ediasnposition`;
CREATE TABLE `ediasnposition`  (
  `id` int(11) NOT NULL,
  `ediAsnTransportId` int(11) NULL DEFAULT NULL,
  `ediAsnDeliveryNodeId` int(11) NULL DEFAULT NULL,
  `positionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weightnet` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weightgross` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packedquantity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customeridentifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordertype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderpos` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemnocustomer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemnosupplier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemdesccustomer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consignment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pointofuse` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `applicationkey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batchno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `engchglevel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `countryoforigin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dangerousgoods` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bondedgoods` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `dataSourceType` int(11) NULL DEFAULT NULL,
  `trayCount` int(11) NOT NULL,
  `packageCount` int(11) NOT NULL,
  `singlePackageCount` int(11) NOT NULL,
  `partId` int(11) NOT NULL,
  `partNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ediasntransport
-- ----------------------------
DROP TABLE IF EXISTS `ediasntransport`;
CREATE TABLE `ediasntransport`  (
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
  `isDispatched` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trayCount` int(11) NULL DEFAULT NULL,
  `packageCount` int(11) NULL DEFAULT NULL,
  `singlePackageCount` int(11) NULL DEFAULT NULL,
  `isCanceled` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isVerify` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for part
-- ----------------------------
DROP TABLE IF EXISTS `part`;
CREATE TABLE `part`  (
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
  `isWithWheels` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isFolding` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lengthAfterFolding` int(11) NULL DEFAULT NULL,
  `widthAfterFolding` int(11) NULL DEFAULT NULL,
  `heightAfterFolding` int(11) NULL DEFAULT NULL,
  `packagingAmount` int(11) NULL DEFAULT NULL,
  `isWithReturnable` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isPackageReturnable` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isPalletReturnable` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isLidReturnable` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mainCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PalletCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lidCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isPI` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isWPI` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grossWeight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tareWeight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weightUnit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deliveryFlodingLayers` int(11) NULL DEFAULT NULL,
  `doublePalletCount` int(11) NULL DEFAULT NULL,
  `perPalletLength` int(11) NULL DEFAULT NULL,
  `milkRunDatePre` int(11) NOT NULL DEFAULT 0,
  `isCarriage` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentDockPointId` int(11) NULL DEFAULT NULL,
  `dockPointId` int(11) NULL DEFAULT NULL,
  `chineseName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `minPickPack` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packModel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierAreaCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `milkRunDatePre` int(11) NOT NULL DEFAULT 0,
  `linkMan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkPhone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allowPickTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allowMaxCarTypeId` int(11) NULL DEFAULT NULL,
  `workTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkMan1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkPhone2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mrperId` int(11) NULL DEFAULT NULL,
  `planTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `planCountPer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `planFrequency` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ediId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ediPwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qcId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for whouse
-- ----------------------------
DROP TABLE IF EXISTS `whouse`;
CREATE TABLE `whouse`  (
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
  `isInUse` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
