/*
 Navicat Premium Data Transfer

 Source Server         : mysql@121.199.48.53
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 121.199.48.53:3306
 Source Schema         : dm_jxwts

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 24/04/2019 14:31:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for delivery_received_record
-- ----------------------------
DROP TABLE IF EXISTS `delivery_received_record`;
CREATE TABLE `delivery_received_record`  (
  `id` int(11) NOT NULL,
  `nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_troop_id` int(11) NULL DEFAULT NULL,
  `driver_id` int(11) NULL DEFAULT NULL,
  `car_id` int(11) NULL DEFAULT NULL,
  `car_trailer_id` int(11) NULL DEFAULT NULL,
  `to_id` int(11) NULL DEFAULT NULL,
  `received_at` datetime(0) NULL DEFAULT NULL,
  `creator_id` int(11) NULL DEFAULT NULL,
  `receive_type` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `note` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_troop_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_trailer_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whouse_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driver_checked_record_detail
-- ----------------------------
DROP TABLE IF EXISTS `driver_checked_record_detail`;
CREATE TABLE `driver_checked_record_detail`  (
  `id` int(11) NOT NULL,
  `driver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cartroop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_trailer_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_whouse_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `destination_whouse_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_tray_count` int(11) NULL DEFAULT NULL,
  `plan_package_count` int(11) NULL DEFAULT NULL,
  `real_tray_count` int(11) NULL DEFAULT NULL,
  `real_package_count` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `driver_checked_record_detail_id_uindex`(`id`) USING BTREE,
  INDEX `idx_created_at`(`created_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for package_account_report
-- ----------------------------
DROP TABLE IF EXISTS `package_account_report`;
CREATE TABLE `package_account_report`  (
  `id` int(11) NOT NULL,
  `asn_package_nr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_transport_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_delivery_node_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `is_verify` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `is_sap_received` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `part_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_qty` double NULL DEFAULT NULL,
  `package_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `valumem` decimal(32, 1) NULL DEFAULT NULL,
  `weightt` double(18, 1) NULL DEFAULT NULL,
  `gross_weight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tare_weight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_arrival_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `milk_date` datetime(0) NULL DEFAULT NULL,
  `received_at` datetime(0) NULL DEFAULT NULL,
  `sap_received_at` datetime(0) NULL DEFAULT NULL,
  `receiver_id` int(11) NULL DEFAULT NULL,
  `receiver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whouse_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dockpoint_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_created_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updatedat` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `package_account_report_id_uindex`(`id`) USING BTREE,
  INDEX `idx_package_transport_dn_nr`(`asn_package_nr`, `asn_transport_nr`, `asn_delivery_node_nr`) USING BTREE,
  INDEX `idx_created_at`(`created_at`, `asn_created_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for package_moving_log
-- ----------------------------
DROP TABLE IF EXISTS `package_moving_log`;
CREATE TABLE `package_moving_log`  (
  `id` int(11) NOT NULL,
  `whouse_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action_type` int(11) NULL DEFAULT NULL,
  `creator_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transport_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delnote_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edi_asn_package_nr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `part_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity_perpack` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_id` int(11) NULL DEFAULT NULL,
  `supplier_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dockpoint_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrival_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  UNIQUE INDEX `uk_pkg_mov_log`(`id`) USING BTREE,
  INDEX `idx_pkg_mov_log_create_at`(`created_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stage_transport_report
-- ----------------------------
DROP TABLE IF EXISTS `stage_transport_report`;
CREATE TABLE `stage_transport_report`  (
  `id` int(11) NOT NULL,
  `record_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transport_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `package_nr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checked_at` datetime(0) NULL DEFAULT NULL,
  `supplier_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dockpoint_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_type_str` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `from_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_time` datetime(0) NULL DEFAULT NULL,
  `car_trrop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_trailer_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `received_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `car_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_type_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_whousenr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tray_count` int(1) NOT NULL DEFAULT 0,
  `single_package_count` int(1) NOT NULL DEFAULT 0,
  `valumem` decimal(35, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stage_transport_report_id_uindex`(`id`) USING BTREE,
  INDEX `idx_rexeived_created_updated_at`(`received_at`, `created_at`, `updated_at`) USING BTREE,
  INDEX `idx_record_transport_package_nr`(`record_nr`, `transport_nr`, `package_nr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transport_report
-- ----------------------------
DROP TABLE IF EXISTS `transport_report`;
CREATE TABLE `transport_report`  (
  `record_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transport_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `package_nr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checked_at` datetime(0) NULL DEFAULT NULL,
  `supplier_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dockpoint_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_type_str` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `from_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_time` datetime(0) NULL DEFAULT NULL,
  `car_trrop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_trailer_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `received_at` datetime(0) NULL DEFAULT NULL,
  `car_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_type_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_whousenr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tray_count` decimal(32, 0) NULL DEFAULT NULL,
  `single_package_count` decimal(32, 0) NULL DEFAULT NULL,
  `valumem` decimal(57, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`record_nr`, `transport_nr`) USING BTREE,
  UNIQUE INDEX `idx_record_transport_package_nr`(`record_nr`, `transport_nr`) USING BTREE,
  INDEX `idx_received_at`(`received_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for delivery_received_record_view
-- ----------------------------
DROP VIEW IF EXISTS `delivery_received_record_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `delivery_received_record_view` AS select `ods_prod`.`deliveryreceivedrecord`.`id` AS `id`,`ods_prod`.`deliveryreceivedrecord`.`nr` AS `nr`,`ods_prod`.`deliveryreceivedrecord`.`carTroopId` AS `car_troop_id`,`ods_prod`.`deliveryreceivedrecord`.`driverId` AS `driver_id`,`ods_prod`.`deliveryreceivedrecord`.`carId` AS `car_id`,`ods_prod`.`deliveryreceivedrecord`.`carTrailerId` AS `car_trailer_id`,`ods_prod`.`deliveryreceivedrecord`.`toId` AS `to_id`,`ods_prod`.`deliveryreceivedrecord`.`receivedAt` AS `received_at`,`ods_prod`.`deliveryreceivedrecord`.`creatorId` AS `creator_id`,`ods_prod`.`deliveryreceivedrecord`.`receiveType` AS `receive_type`,`ods_prod`.`deliveryreceivedrecord`.`status` AS `status`,`ods_prod`.`deliveryreceivedrecord`.`note` AS `note`,`ods_prod`.`cartroop`.`code` AS `car_troop_code`,`driver`.`name` AS `driver_name`,`ods_prod`.`car`.`Nr` AS `car_nr`,`ods_prod`.`cartrailer`.`nr` AS `car_trailer_nr`,`ods_prod`.`whouse`.`nr` AS `whouse_nr`,`creator`.`name` AS `creator` from ((((((`ods_prod`.`deliveryreceivedrecord` left join `ods_prod`.`cartroop` on((`ods_prod`.`cartroop`.`id` = `ods_prod`.`deliveryreceivedrecord`.`carTroopId`))) left join `ods_prod`.`user` `driver` on((`driver`.`id` = `ods_prod`.`deliveryreceivedrecord`.`driverId`))) left join `ods_prod`.`car` on((`ods_prod`.`car`.`id` = `ods_prod`.`deliveryreceivedrecord`.`carId`))) left join `ods_prod`.`cartrailer` on((`ods_prod`.`cartrailer`.`id` = `ods_prod`.`deliveryreceivedrecord`.`carTrailerId`))) left join `ods_prod`.`whouse` on((`ods_prod`.`whouse`.`id` = `ods_prod`.`deliveryreceivedrecord`.`toId`))) left join `ods_prod`.`user` `creator` on((`creator`.`id` = `ods_prod`.`deliveryreceivedrecord`.`creatorId`)));

-- ----------------------------
-- View structure for driver_checked_record_detail_view
-- ----------------------------
DROP VIEW IF EXISTS `driver_checked_record_detail_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `driver_checked_record_detail_view` AS select `ods_prod`.`drivercheckedrecord`.`id` AS `id`,`ods_prod`.`user`.`name` AS `driver_name`,`ods_prod`.`user`.`nr` AS `driver_nr`,`ods_prod`.`cartroop`.`name` AS `cartroop_name`,`ods_prod`.`car`.`Nr` AS `car_nr`,`ods_prod`.`cartrailer`.`nr` AS `car_trailer_nr`,`src_whouse`.`name` AS `source_whouse_name`,`dest_whouse`.`name` AS `destination_whouse_name`,`ods_prod`.`drivercheckedrecord`.`planTrayCount` AS `plan_tray_count`,`ods_prod`.`drivercheckedrecord`.`planPackageCount` AS `plan_package_count`,`ods_prod`.`drivercheckedrecord`.`realTrayCount` AS `real_tray_count`,`ods_prod`.`drivercheckedrecord`.`realPackageCount` AS `real_package_count`,`ods_prod`.`drivercheckedrecord`.`createdAt` AS `created_at` from ((((((((`ods_prod`.`drivercheckedrecord` left join `ods_prod`.`deliverynodecar` on((`ods_prod`.`drivercheckedrecord`.`deliveryNodeCarId` = `ods_prod`.`deliverynodecar`.`id`))) left join `ods_prod`.`car` on((`ods_prod`.`car`.`id` = `ods_prod`.`deliverynodecar`.`carId`))) left join `ods_prod`.`cartrailer` on((`ods_prod`.`deliverynodecar`.`carTrailerId` = `ods_prod`.`cartrailer`.`id`))) left join `ods_prod`.`user` on((`ods_prod`.`user`.`id` = `ods_prod`.`deliverynodecar`.`userId`))) left join `ods_prod`.`cartroop` on((`ods_prod`.`cartroop`.`id` = `ods_prod`.`user`.`carTroopId`))) left join `ods_prod`.`deliverynode` on((`ods_prod`.`drivercheckedrecord`.`deliveryNodeId` = `ods_prod`.`deliverynode`.`id`))) left join `ods_prod`.`whouse` `src_whouse` on((`src_whouse`.`id` = `ods_prod`.`deliverynode`.`sourceWhouseId`))) left join `ods_prod`.`whouse` `dest_whouse` on((`dest_whouse`.`id` = `ods_prod`.`deliverynode`.`destinationWhouseId`)));

-- ----------------------------
-- View structure for edi_asn_package_moving_log_view
-- ----------------------------
DROP VIEW IF EXISTS `edi_asn_package_moving_log_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `edi_asn_package_moving_log_view` AS select `ods_prod`.`ediasnpackagemovinglog`.`id` AS `id`,`ods_prod`.`whouse`.`nr` AS `whouse_nr`,`ods_prod`.`ediasnpackagemovinglog`.`actionType` AS `action_type`,`creator`.`name` AS `creator_name`,`ods_prod`.`car`.`Nr` AS `car_nr`,`ods_prod`.`user`.`name` AS `driver_name`,`ods_prod`.`user`.`phone` AS `driver_phone`,`ods_prod`.`ediasntransport`.`transportnumber` AS `transport_nr`,`ods_prod`.`ediasndeliverynode`.`delnotenumber` AS `delnote_number`,`ods_prod`.`ediasnpackage`.`nr` AS `edi_asn_package_nr`,`ods_prod`.`part`.`Nr` AS `part_nr`,`ods_prod`.`ediasnpackage`.`quantityperpack` AS `quantity_perpack`,`ods_prod`.`ediasnpackage`.`supplierId` AS `supplier_id`,`ods_prod`.`part`.`supplierCode` AS `supplier_code`,`ods_prod`.`dockpoint`.`code` AS `dockpoint_code`,`ods_prod`.`ediasntransport`.`arrivaldate` AS `arrival_date`,`ods_prod`.`ediasnpackagemovinglog`.`createdAt` AS `created_at` from (((((((((`ods_prod`.`ediasnpackagemovinglog` left join `ods_prod`.`whouse` on((`ods_prod`.`ediasnpackagemovinglog`.`whouseId` = `ods_prod`.`whouse`.`id`))) left join `ods_prod`.`car` on((`ods_prod`.`ediasnpackagemovinglog`.`carId` = `ods_prod`.`car`.`id`))) left join `ods_prod`.`user` on((`ods_prod`.`ediasnpackagemovinglog`.`driverId` = `ods_prod`.`user`.`id`))) left join `ods_prod`.`user` `creator` on((`ods_prod`.`ediasnpackagemovinglog`.`creatorId` = `creator`.`id`))) left join `ods_prod`.`ediasnpackage` on((`ods_prod`.`ediasnpackagemovinglog`.`packageId` = `ods_prod`.`ediasnpackage`.`id`))) left join `ods_prod`.`ediasntransport` on((`ods_prod`.`ediasnpackage`.`ediAsnTransportId` = `ods_prod`.`ediasntransport`.`id`))) left join `ods_prod`.`ediasndeliverynode` on((`ods_prod`.`ediasnpackage`.`ediDeliveryNodeId` = `ods_prod`.`ediasndeliverynode`.`id`))) left join `ods_prod`.`dockpoint` on((`ods_prod`.`ediasnpackage`.`dockPointId` = `ods_prod`.`dockpoint`.`id`))) left join `ods_prod`.`part` on((`ods_prod`.`ediasnpackage`.`partId` = `ods_prod`.`part`.`id`)));

-- ----------------------------
-- View structure for package_account_report_view
-- ----------------------------
DROP VIEW IF EXISTS `package_account_report_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `package_account_report_view` AS select `ods_prod`.`ediasnpackage`.`id` AS `id`,`ods_prod`.`ediasnpackage`.`nr` AS `asn_package_nr`,`ods_prod`.`ediasntransport`.`transportnumber` AS `asn_transport_nr`,`ods_prod`.`ediasndeliverynode`.`delnotenumber` AS `asn_delivery_node_nr`,(case when (`ods_prod`.`ediasnpackage`.`state` = 50) then '创建' when (`ods_prod`.`ediasnpackage`.`state` = 90) then '已配载' when (`ods_prod`.`ediasnpackage`.`state` = 100) then '已备货' when (`ods_prod`.`ediasnpackage`.`state` = 400) then '已验收' when (`ods_prod`.`ediasnpackage`.`state` = 401) then '部分验收' when (`ods_prod`.`ediasnpackage`.`state` = 500) then '送货中' when (`ods_prod`.`ediasnpackage`.`state` = 501) then '部分送货途中' when (`ods_prod`.`ediasnpackage`.`state` = 600) then '已送达' when (`ods_prod`.`ediasnpackage`.`state` = 601) then '部分送达' when (`ods_prod`.`ediasnpackage`.`state` = 700) then '已接收' when (`ods_prod`.`ediasnpackage`.`state` = 701) then '部分接收' when (`ods_prod`.`ediasnpackage`.`state` = 800) then '已交付' when (`ods_prod`.`ediasnpackage`.`state` = 801) then '部分交付' else '未知状态' end) AS `state`,(case `ods_prod`.`ediasntransport`.`isVerify` when 'true' then '是' else '否' end) AS `is_verify`,(case `ods_prod`.`ediasnpackage`.`isSAPReceived` when 'true' then '已交付' else '未交付' end) AS `is_sap_received`,`ods_prod`.`part`.`Nr` AS `part_nr`,`ods_prod`.`ediasnpackage`.`totalQty` AS `total_qty`,(case when (`ods_prod`.`ediasnpackage`.`packagetype` = 1) then '托' when (`ods_prod`.`ediasnpackage`.`packagetype` = 2) then '混合' when (`ods_prod`.`ediasnpackage`.`packagetype` = 3) then '箱' when (`ods_prod`.`ediasnpackage`.`packagetype` = 999) then '未知' else '未知' end) AS `package_type`,round(((case when (`ods_prod`.`ediasnpackage`.`packagetype` = 1) then ((`ods_prod`.`part`.`luLength` * `ods_prod`.`part`.`luWidth`) * `ods_prod`.`part`.`luHeight`) when (`ods_prod`.`ediasnpackage`.`packagetype` = 3) then ((`ods_prod`.`part`.`kltLength` * `ods_prod`.`part`.`kltWidth`) * `ods_prod`.`part`.`kltHeight`) else 0.0 end) / 1000000000),1) AS `valumem`,round((case when (`ods_prod`.`ediasnpackage`.`packagetype` = 1) then `ods_prod`.`part`.`grossWeight` when (`ods_prod`.`ediasnpackage`.`packagetype` = 3) then `ods_prod`.`part`.`tareWeight` else 0.0 end),1) AS `weightt`,`ods_prod`.`part`.`grossWeight` AS `gross_weight`,`ods_prod`.`part`.`tareWeight` AS `tare_weight`,`ods_prod`.`supplier`.`description` AS `supplier_desc`,`ods_prod`.`supplier`.`code` AS `supplier_code`,`ods_prod`.`ediasntransport`.`arrivaldate` AS `asn_arrival_date`,`ods_prod`.`ediasnpackage`.`milkDate` AS `milk_date`,`ods_prod`.`ediasnpackage`.`receivedAt` AS `received_at`,`ods_prod`.`ediasnpackage`.`sapReceivedAt` AS `sap_received_at`,`ods_prod`.`ediasnpackage`.`receiverId` AS `receiver_id`,`ods_prod`.`user`.`name` AS `receiver_name`,`ods_prod`.`user`.`phone` AS `receiver_phone`,`ods_prod`.`whouse`.`nr` AS `whouse_nr`,`ods_prod`.`dockpoint`.`code` AS `dockpoint_code`,`ods_prod`.`ediasnpackage`.`createdAt` AS `asn_created_at`,`ods_prod`.`ediasnpackage`.`createdAt` AS `created_at`,`ods_prod`.`ediasnpackage`.`updatedAt` AS `updatedat` from (((((((`ods_prod`.`ediasnpackage` left join `ods_prod`.`part` on((`ods_prod`.`ediasnpackage`.`partId` = `ods_prod`.`part`.`id`))) left join `ods_prod`.`ediasndeliverynode` on((`ods_prod`.`ediasnpackage`.`ediDeliveryNodeId` = `ods_prod`.`ediasndeliverynode`.`id`))) left join `ods_prod`.`ediasntransport` on((`ods_prod`.`ediasnpackage`.`ediAsnTransportId` = `ods_prod`.`ediasntransport`.`id`))) left join `ods_prod`.`supplier` on((`ods_prod`.`ediasnpackage`.`supplierId` = `ods_prod`.`supplier`.`id`))) left join `ods_prod`.`whouse` on((`ods_prod`.`ediasnpackage`.`currentWhouseId` = `ods_prod`.`whouse`.`id`))) left join `ods_prod`.`dockpoint` on((`ods_prod`.`ediasnpackage`.`currentDockPointId` = `ods_prod`.`dockpoint`.`id`))) left join `ods_prod`.`user` on((`ods_prod`.`ediasnpackage`.`receiverId` = `ods_prod`.`user`.`id`)));

-- ----------------------------
-- View structure for stage_transport_report_view
-- ----------------------------
DROP VIEW IF EXISTS `stage_transport_report_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `stage_transport_report_view` AS select `ods_prod`.`deliveryreceivededipackagerelation`.`id` AS `id`,`ods_prod`.`deliveryreceivedrecord`.`nr` AS `record_nr`,`ods_prod`.`ediasntransport`.`transportnumber` AS `transport_nr`,`ods_prod`.`ediasnpackage`.`nr` AS `package_nr`,`ods_prod`.`ediasnpackage`.`checkedAt` AS `checked_at`,`ods_prod`.`supplier`.`description` AS `supplier_desc`,`ods_prod`.`dockpoint`.`code` AS `dockpoint_code`,(case `ods_prod`.`deliveryreceivededipackagerelation`.`fromType` when 1 then '供应商' when 2 then '自有仓库' else '' end) AS `from_type_str`,(case `ods_prod`.`deliveryreceivededipackagerelation`.`fromType` when 1 then `from_house`.`nr` when 2 then `ods_prod`.`supplier`.`code` else '' end) AS `from_nr`,`ods_prod`.`deliveryreceivededipackagerelation`.`sendTime` AS `send_time`,`ods_prod`.`cartroop`.`name` AS `car_trrop_name`,`ods_prod`.`cartrailer`.`nr` AS `car_trailer_nr`,`ods_prod`.`deliveryreceivedrecord`.`receivedAt` AS `received_at`,`ods_prod`.`ediasnpackage`.`createdAt` AS `created_at`,`ods_prod`.`ediasnpackage`.`updatedAt` AS `updated_at`,`ods_prod`.`car`.`Nr` AS `car_nr`,`ods_prod`.`cartype`.`nr` AS `car_type_nr`,`to_house`.`nr` AS `to_whousenr`,`ods_prod`.`user`.`name` AS `driver_name`,`ods_prod`.`user`.`phone` AS `driver_phone`,(case `ods_prod`.`ediasnpackage`.`packagetype` when 1 then 1 else 0 end) AS `tray_count`,(case `ods_prod`.`ediasnpackage`.`packagetype` when 3 then 1 else 0 end) AS `single_package_count`,round((case when (`ods_prod`.`ediasnpackage`.`packagetype` = 1) then (((((`ods_prod`.`part`.`luLength` / 1000) * `ods_prod`.`part`.`luWidth`) / 1000) * `ods_prod`.`part`.`luHeight`) / 1000) when (`ods_prod`.`ediasnpackage`.`packagetype` = 3) then (((((`ods_prod`.`part`.`kltLength` / 1000) * `ods_prod`.`part`.`kltWidth`) / 1000) * `ods_prod`.`part`.`kltHeight`) / 1000) else 0.0 end),4) AS `valumem` from (((((((((((((`ods_prod`.`deliveryreceivedrecord` left join `ods_prod`.`deliveryreceivededipackagerelation` on((`ods_prod`.`deliveryreceivededipackagerelation`.`deliveryReceivedRecordId` = `ods_prod`.`deliveryreceivedrecord`.`id`))) left join `ods_prod`.`whouse` `from_house` on((`ods_prod`.`deliveryreceivededipackagerelation`.`fromId` = `from_house`.`id`))) left join `ods_prod`.`ediasnpackage` on((`ods_prod`.`deliveryreceivededipackagerelation`.`ediAsnPackageId` = `ods_prod`.`ediasnpackage`.`id`))) left join `ods_prod`.`ediasntransport` on((`ods_prod`.`ediasnpackage`.`ediAsnTransportId` = `ods_prod`.`ediasntransport`.`id`))) left join `ods_prod`.`part` on((`ods_prod`.`ediasnpackage`.`partId` = `ods_prod`.`part`.`id`))) left join `ods_prod`.`supplier` on((`ods_prod`.`ediasnpackage`.`supplierId` = `ods_prod`.`supplier`.`id`))) left join `ods_prod`.`dockpoint` on((`ods_prod`.`ediasnpackage`.`dockPointId` = `ods_prod`.`dockpoint`.`id`))) left join `ods_prod`.`user` on((`ods_prod`.`deliveryreceivedrecord`.`driverId` = `ods_prod`.`user`.`id`))) left join `ods_prod`.`whouse` `to_house` on((`ods_prod`.`deliveryreceivedrecord`.`toId` = `to_house`.`id`))) left join `ods_prod`.`car` on((`ods_prod`.`deliveryreceivedrecord`.`carId` = `ods_prod`.`car`.`id`))) left join `ods_prod`.`cartype` on((`ods_prod`.`car`.`carTypeId` = `ods_prod`.`cartype`.`id`))) left join `ods_prod`.`cartrailer` on((`ods_prod`.`cartrailer`.`id` = `ods_prod`.`deliveryreceivedrecord`.`carTrailerId`))) left join `ods_prod`.`cartroop` on((`ods_prod`.`cartroop`.`id` = `ods_prod`.`deliveryreceivedrecord`.`carTroopId`)));

-- ----------------------------
-- View structure for transport_report_view
-- ----------------------------
DROP VIEW IF EXISTS `transport_report_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `transport_report_view` AS select `rep`.`record_nr` AS `record_nr`,`rep`.`transport_nr` AS `transport_nr`,min(`rep`.`package_nr`) AS `package_nr`,min(`rep`.`checked_at`) AS `checked_at`,min(`rep`.`supplier_desc`) AS `supplier_desc`,min(`rep`.`dockpoint_code`) AS `dockpoint_code`,min(`rep`.`from_type_str`) AS `from_type_str`,min(`rep`.`from_nr`) AS `from_nr`,min(`rep`.`send_time`) AS `send_time`,min(`rep`.`car_trrop_name`) AS `car_trrop_name`,min(`rep`.`car_trailer_nr`) AS `car_trailer_nr`,min(`rep`.`received_at`) AS `received_at`,min(`rep`.`car_nr`) AS `car_nr`,min(`rep`.`car_type_nr`) AS `car_type_nr`,min(`rep`.`to_whousenr`) AS `to_whousenr`,min(`rep`.`driver_name`) AS `driver_name`,min(`rep`.`driver_phone`) AS `driver_phone`,sum(`rep`.`tray_count`) AS `tray_count`,sum(`rep`.`single_package_count`) AS `single_package_count`,sum(`rep`.`valumem`) AS `valumem` from `stage_transport_report` `rep` group by `rep`.`record_nr`,`rep`.`transport_nr`;

SET FOREIGN_KEY_CHECKS = 1;
