/*
 Navicat Premium Data Transfer

 Source Server         : jxwts_customer_test_env@101.227.69.51
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 101.227.69.51:3306
 Source Schema         : dm_jxwts

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 19/04/2019 09:49:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `cartroopCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cartrailernr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whouseNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for drivercheckedrecorddetail
-- ----------------------------
DROP TABLE IF EXISTS `drivercheckedrecorddetail`;
CREATE TABLE `drivercheckedrecorddetail`  (
  `id` int(11) NOT NULL,
  `drivername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carTroopName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carTrailerNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sourceWhouseName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `destinationWhouseName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `planTrayCount` int(11) NULL DEFAULT NULL,
  `planPackageCount` int(11) NULL DEFAULT NULL,
  `realTrayCount` int(11) NULL DEFAULT NULL,
  `realPackageCount` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for package_account_report
-- ----------------------------
DROP TABLE IF EXISTS `package_account_report`;
CREATE TABLE `package_account_report`  (
  `asn_transport_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_delivery_node_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_package_nr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_verify` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `is_sap_received` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `part_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_qty` double NULL DEFAULT NULL,
  `package_type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
  INDEX `idx_part_create_at`(`created_at`) USING BTREE COMMENT '`创建日期`搜索条件',
  INDEX `idx_part_received_at`(`received_at`) USING BTREE COMMENT '`到货日期`搜索条件',
  INDEX `idx_part_sap_received_at`(`sap_received_at`) USING BTREE COMMENT '`SAP到货日期`搜索条件',
  INDEX `idx_part_supplier_desc`(`supplier_desc`) USING BTREE COMMENT '`供应商`搜索条件',
  INDEX `uk_asn_package_nr`(`asn_package_nr`) USING BTREE COMMENT '`标签号`搜索条件'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for package_moving_log
-- ----------------------------
DROP TABLE IF EXISTS `package_moving_log`;
CREATE TABLE `package_moving_log`  (
  `id` int(11) NOT NULL,
  `whouse_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action_type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_pkg_mov_log`(`id`) USING BTREE,
  INDEX `idx_pkg_mov_log_create_at`(`created_at`) USING BTREE,
  INDEX `idx_package_moving_log_transport_nr`(`transport_nr`) USING BTREE COMMENT '`运输单编号`搜索条件',
  INDEX `idx_package_moving_log_action_type`(`action_type`) USING BTREE COMMENT '`操作类型`搜索条件'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY HASH (id)
PARTITIONS 64
(PARTITION `p0` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p1` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p10` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p11` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p12` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p13` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p14` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p15` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p16` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p17` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p18` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p19` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p2` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p20` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p21` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p22` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p23` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p24` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p25` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p26` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p27` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p28` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p29` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p3` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p30` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p31` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p32` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p33` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p34` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p35` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p36` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p37` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p38` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p39` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p4` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p40` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p41` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p42` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p43` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p44` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p45` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p46` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p47` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p48` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p49` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p5` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p50` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p51` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p52` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p53` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p54` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p55` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p56` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p57` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p58` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p59` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p6` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p60` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p61` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p62` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p63` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p7` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p8` MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p9` MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Table structure for stage_transport_report
-- ----------------------------
DROP TABLE IF EXISTS `stage_transport_report`;
CREATE TABLE `stage_transport_report`  (
  `id` int(11) NOT NULL,
  `recordNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transportNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packageNr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkedAt` datetime(0) NULL DEFAULT NULL,
  `supplierDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dockPointCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fromTypeStr` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fromNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendTime` datetime(0) NULL DEFAULT NULL,
  `cartrropName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carTrailerNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receivedAt` datetime(0) NULL DEFAULT NULL,
  `carNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carTypeNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `toWhouseNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverPhone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trayCount` int(1) NOT NULL DEFAULT 0,
  `singlePackageCount` int(1) NOT NULL DEFAULT 0,
  `valumem` decimal(35, 4) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transport_report
-- ----------------------------
DROP TABLE IF EXISTS `transport_report`;
CREATE TABLE `transport_report`  (
  `id` int(11) NOT NULL,
  `recordNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transportNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packageNr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkedAt` datetime(0) NULL DEFAULT NULL,
  `supplierDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dockPointCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fromTypeStr` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fromNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendTime` datetime(0) NULL DEFAULT NULL,
  `cartrropName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carTrailerNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receivedAt` datetime(0) NULL DEFAULT NULL,
  `carNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carTypeNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `toWhouseNr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverPhone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trayCount` int(1) NOT NULL DEFAULT 0,
  `singlePackageCount` int(1) NOT NULL DEFAULT 0,
  `valumem` decimal(35, 4) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for deliveryreceivedrecordview
-- ----------------------------
DROP VIEW IF EXISTS `deliveryreceivedrecordview`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `deliveryreceivedrecordview` AS select
       ods_prod.deliveryreceivedrecord.id,
       ods_prod.deliveryreceivedrecord.nr,
       ods_prod.deliveryreceivedrecord.carTroopId,
       ods_prod.deliveryreceivedrecord.driverId,
       ods_prod.deliveryreceivedrecord.carId,
       ods_prod.deliveryreceivedrecord.carTrailerId,
       ods_prod.deliveryreceivedrecord.toId,
       ods_prod.deliveryreceivedrecord.receivedAt,
       ods_prod.deliveryreceivedrecord.creatorId,
       ods_prod.deliveryreceivedrecord.receiveType,
       ods_prod.deliveryreceivedrecord.status,
       ods_prod.deliveryreceivedrecord.note,

       ods_prod.cartroop.code as cartroopCode,
       driver.name as driverName,
       ods_prod.car.nr as carNr,
       ods_prod.cartrailer.nr as  cartrailernr,
       ods_prod.whouse.nr as whouseNr,
        creator.name as creator
from
    ods_prod.deliveryreceivedrecord
    left outer join ods_prod.cartroop on ods_prod.cartroop.id =ods_prod.deliveryreceivedrecord.carTroopId
    left outer join ods_prod.user as driver on driver.id =ods_prod.deliveryreceivedrecord.driverId
    left outer join ods_prod.car on ods_prod.car.id =ods_prod.deliveryreceivedrecord.carId
    left outer join ods_prod.cartrailer on ods_prod.cartrailer.id =ods_prod.deliveryreceivedrecord.carTrailerId
    left outer join ods_prod.whouse on ods_prod.whouse.id =ods_prod.deliveryreceivedrecord.toId
    left outer join ods_prod.user as creator on creator.id =ods_prod.deliveryreceivedrecord.creatorId ;

-- ----------------------------
-- View structure for drivercheckedrecorddetailview
-- ----------------------------
DROP VIEW IF EXISTS `drivercheckedrecorddetailview`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `drivercheckedrecorddetailview` AS SELECT
-- ods_prod.dcd.id
-- ods_prod.dcd.nr
-- ods_prod.dcd.told
-- ods_prod.dcd.receivedAt
-- ods_prod.dcd.creatorid
-- ods_prod.dcd.receiveType
-- ods_prod.dcd.status
-- ods_prod.dcd.note
-- 驾驶员姓名：driverName
dcd.id as id,
ods_prod.u.name AS drivername,
-- 员工号：driverNr
ods_prod.u.nr AS driverNr,
-- 所属车队：carTroopName
ods_prod.troop.name AS carTroopName,
-- 车牌号：carNr
ods_prod.car.nr AS carNr,
-- 车挂号：通过carTrailerId在carTrailer表中查询nr
ods_prod.trailer.nr AS carTrailerNr,
-- 出发地：sourceWhouseName	
ods_prod.house.name AS sourceWhouseName,
-- 目的地：destinationWhouseName
ods_prod.house_two.name AS destinationWhouseName,
-- 计划托数：planTrayCount
ods_prod.dcd.planTrayCount AS planTrayCount,
-- 计划箱数：planPackageCount
ods_prod.dcd.planPackageCount AS planPackageCount,
-- 实收托数：realTrayCount
ods_prod.dcd.realTrayCount AS realTrayCount,
-- 实收箱数：realPackageCount
ods_prod.dcd.realPackageCount AS realPackageCount,
-- 创建时间：createdAt
ods_prod.dcd.createdAt AS createdAt 
FROM
	ods_prod.drivercheckedrecord dcd
	LEFT JOIN ods_prod.deliverynode node ON deliveryNodeId = ods_prod.node.id
	LEFT JOIN ods_prod.deliverynodecar nodeCar ON dcd.deliveryNodeCarId = nodeCar.id
	LEFT JOIN ods_prod.Car car ON car.id = nodeCar.carId
	LEFT JOIN ods_prod.carTrailer trailer ON nodeCar.carTrailerId = trailer.id
	LEFT JOIN ods_prod.USER u ON u.id = nodeCar.userId
	LEFT JOIN ods_prod.cartroop troop ON troop.id = u.carTroopId
	LEFT JOIN ods_prod.whouse house ON house.id = node.sourceWhouseId
	LEFT JOIN ods_prod.whouse house_two ON house_two.id = node.destinationWhouseId ;

-- ----------------------------
-- View structure for edi_asn_package_moving_log_view
-- ----------------------------
DROP VIEW IF EXISTS `edi_asn_package_moving_log_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `edi_asn_package_moving_log_view` AS select ods_prod.ediasnpackagemovinglog.id	as id,
	-- 操作仓库：[需计算]如果操作类型是前端扫描，值为**供应商描述(descript)，其它全部使用视图中的whousenr
-- 	ods_prod.whouse.nr as whouse_nr, 
	CASE 	
	WHEN ods_prod.ediasnpackagemovinglog.actiontype <> 9 THEN	ods_prod.whouse.nr
	ELSE ods_prod.part.supplierCode END  as whouse_nr,
	
	-- 操作类型
	-- 中转入库[description("中转入库")]transferenter = 1,
	-- 中转发出[description("中转发出")]transfersend = 2,
	-- 客户收货[description("bbac收货")]clientreceive = 3,
	-- 手动交付[description("手动交付")]manualdelivery = 4,
	-- 司机盲扫发出[description("前端扫描")]driversend = 9
-- 	ods_prod.ediasnpackagemovinglog.actiontype as action_type, 
	CASE 	
	WHEN ods_prod.ediasnpackagemovinglog.actiontype = 1 THEN	'中转入库'
	WHEN ods_prod.ediasnpackagemovinglog.actiontype = 2 THEN	'中转发出'
	WHEN ods_prod.ediasnpackagemovinglog.actiontype = 3 THEN	'bbac收货'
	WHEN ods_prod.ediasnpackagemovinglog.actiontype = 4 THEN	'手动交付'
	WHEN ods_prod.ediasnpackagemovinglog.actiontype = 9 THEN	'前端扫描'
	ELSE
		ods_prod.ediasnpackagemovinglog.actiontype
	END as action_type,

	-- 操作员
	creator.name as creator_name, 
	-- 运输车辆
	ods_prod.car.nr as car_nr, 
	-- 司机
	ods_prod.user.name as driver_name, 
	-- 司机联系方式
	ods_prod.user.phone as driver_phone, 

	-- 运输单编号
	ods_prod.ediasntransport.transportnumber as transport_nr,
	--  发货单编号
	ods_prod.ediasndeliverynode.delnotenumber as delnote_number,
	-- 标签号
	ods_prod.ediasnpackage.nr as edi_asn_package_nr,
	-- 零件号
	ods_prod.part.nr as part_nr, 
	-- 件数
	ods_prod.ediasnpackage.quantityperpack as quantity_perpack, 
	--  供应商id
	EdiAsnPackage.supplierId as supplier_id, 
	--  供应商代码
	ods_prod.part.suppliercode as supplier_code, 
	--  卸货口
	ods_prod.dockpoint.code as dockpoint_code, 
	-- asn到货时间
	ods_prod.ediasntransport.arrivaldate as arrival_date, 
	-- 创建时间
	ods_prod.ediasnpackagemovinglog.createdat  as created_at 
from
	ods_prod.ediasnpackagemovinglog
	-- ediasnpackagemovinglog 关联来源
left outer join ods_prod.whouse on ods_prod.ediasnpackagemovinglog.whouseid = ods_prod.whouse.id
left outer join ods_prod.car on ods_prod.ediasnpackagemovinglog.carid = ods_prod.car.id
left outer join ods_prod.user on ods_prod.ediasnpackagemovinglog.driverid = ods_prod.user.id
left outer join ods_prod.user as creator on ods_prod.ediasnpackagemovinglog.creatorid = creator.id

	-- ediasnpackage 关联来源
left outer join ods_prod.ediasnpackage on ods_prod.ediasnpackagemovinglog.packageid = ods_prod.ediasnpackage.id

left outer join ods_prod.ediasntransport on ods_prod.ediasnpackage.ediasntransportid = ods_prod.ediasntransport.id
left outer join ods_prod.ediasndeliverynode on ods_prod.ediasnpackage.edideliverynodeid = ods_prod.ediasndeliverynode.id
left outer join ods_prod.dockpoint on ods_prod.ediasnpackage.dockpointid = ods_prod.dockpoint.id
left outer join ods_prod.part on ods_prod.ediasnpackage.partid = ods_prod.part.id ;

-- ----------------------------
-- View structure for package_account_report_view
-- ----------------------------
DROP VIEW IF EXISTS `package_account_report_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `package_account_report_view` AS select
/*    --     ods_prod.ediasnpackage.id,
    --     ods_prod.ediasnpackage.ediasntransportid,
    --     ods_prod.ediasnpackage.edideliverynodeid,
    --     ods_prod.ediasnpackage.internalid,
    --     ods_prod.ediasnpackage.parentid,
    --     ods_prod.ediasnpackage.quantityperpack,
    --     ods_prod.ediasnpackage.tara,
    --     ods_prod.ediasnpackage.itemnopackcustomer,
    --     ods_prod.ediasnpackage.itemnopacksupplier,
    --     ods_prod.ediasnpackage.ownership,
    --     ods_prod.ediasnpackage.recycling,
    --     ods_prod.ediasnpackage.batchno,
    --     ods_prod.ediasnpackage.klt,
    --     ods_prod.ediasnpackage.printflag,
    --     ods_prod.ediasnpackage.delnotepositionid,
    --     ods_prod.ediasnpackage.quantitypack,
    --     ods_prod.ediasnpackage.labelnofrom,
    --     ods_prod.ediasnpackage.stacking,
    --     ods_prod.ediasnpackage.partid,
    --     ods_prod.ediasnpackage.orderno,
    --     ods_prod.ediasnpackage.supplierid,
    --     ods_prod.ediasnpackage.currentwhouseid,
    --     ods_prod.ediasnpackage.currentdockpointid,
    --     ods_prod.ediasnpackage.currentuserid,
    --     ods_prod.ediasnpackage.currentcarid,
    --     ods_prod.ediasnpackage.currentcartrailerid,
    --     ods_prod.ediasnpackage.ischecked,
    --     ods_prod.ediasnpackage.checkedat,
    --     ods_prod.ediasnpackage.checkuserid,
    --     ods_prod.ediasnpackage.checkcarid,
    --     ods_prod.ediasnpackage.checkcartrailerid,
    --     ods_prod.ediasnpackage.lastdeliverypackagerelationid,
    --     ods_prod.ediasnpackage.sentat,
    --     ods_prod.ediasnpackage.updatedat,
    --     ods_prod.ediasnpackage.dockpointid,
    --     ods_prod.ediasnpackage.delivdate,
    --     ods_prod.whouse.address                   as whouseaddress,
    --     ods_prod.supplier.name                    as suppliername,
    --     ods_prod.supplier.address                 as supplieraddress,
    --     ods_prod.supplier.city                    as suppliercity,
    --     ods_prod.ediasndeliverynode.delnotedate,
    --     ods_prod.ediasnpackage.datasourcetype,
    --     ods_prod.ediasnpackage.ediasnpositionid,
    --     ods_prod.ediasnpackage.parentpackageid,
    --     ods_prod.ediasnpackage.parentpathids,
    --     ods_prod.whouse.name                      as whousename,
*/

    -- 运输单编号：asntransportnr
    ods_prod.ediasntransport.transportnumber as asn_transport_nr,
    -- 发货单编号：asndeliverynodenr
    ods_prod.ediasndeliverynode.delnotenumber as asn_delivery_node_nr,
    -- 标签号：nr
    ods_prod.ediasnpackage.nr as asn_package_nr,
    -- 状态：state通过枚举deliverystate计算
/*  deliverystate：运输状态，包装箱、托、运单
    public enum deliverystate
    {
        /// 创建[description("创建")]init = 50,
        /// 已配载[description("已配载")]deliverdispatched =90,
        /// 供应商已备货[description("已备货")]supplierready = 100,
        /// 已验收 [description("已验收")]checked = 400,
        /// 部分验收 [description("部分验收")]partialchecked = 401,
        /// 送货中[description("送货中")]ondelivering = 500,
        /////部分送货途中[description("部分送货途中")] partialondelivering = 501,
        ///已送达[description("已送达")]sendarrival = 600,
        ///部分送达 [description("部分送达")] partialsendarrival =601,
        ///  已接收  [description("已接收")] received = 700,
        ///  部分接收  [description("部分接收")]  partialreceived = 701,
        /// 已交付 [description("已交付")] instocked = 800,
        /// 部分交付 [description("部分交付")] partialinstocked = 801
}
*/
--     ods_prod.ediasnpackage.state as state,
		CASE 
		WHEN ods_prod.ediasnpackage.state = 50 THEN '创建'
		WHEN ods_prod.ediasnpackage.state = 90 THEN '已配载'
		WHEN ods_prod.ediasnpackage.state = 100 THEN '已备货'
		WHEN ods_prod.ediasnpackage.state = 400 THEN '已验收'
		WHEN ods_prod.ediasnpackage.state = 401 THEN '部分验收'
		WHEN ods_prod.ediasnpackage.state = 500 THEN '送货中'
		WHEN ods_prod.ediasnpackage.state = 501 THEN '部分送货途中'
		WHEN ods_prod.ediasnpackage.state = 600 THEN '已送达'
		WHEN ods_prod.ediasnpackage.state = 601 THEN '部分送达'
		WHEN ods_prod.ediasnpackage.state = 700 THEN '已接收'
		WHEN ods_prod.ediasnpackage.state = 701 THEN '部分接收'
		WHEN ods_prod.ediasnpackage.state = 800 THEN '已交付'
		WHEN ods_prod.ediasnpackage.state = 801 THEN '部分交付'
		ELSE
			ods_prod.ediasnpackage.state
		END  as state ,

		
		
		
		
    -- 是否验单：bool isverify计算为： 是/否
--     ods_prod.ediasntransport.isverify as is_verify,
		CASE WHEN ods_prod.ediasntransport.isverify THEN '是'	ELSE '否' END as is_verify,

    -- sap状态：bool issapreceived计算为：已交付/未交付
--     ods_prod.ediasnpackage.issapreceived as is_sap_received,
    CASE WHEN ods_prod.ediasnpackage.issapreceived THEN '已交付'	ELSE '未交付' END as is_sap_received,
-- 零件号：partnr
    ods_prod.part.nr  as part_nr,
    -- 件数 ：totalqty
    ods_prod.ediasnpackage.totalqty as total_qty,
    -- 包装类型
--     ods_prod.ediasnpackage.packagetype as package_type,
			CASE 
			WHEN ods_prod.ediasnpackage.packagetype = 1 THEN '托'
			WHEN ods_prod.ediasnpackage.packagetype = 2 THEN '混合'
			WHEN ods_prod.ediasnpackage.packagetype = 3 THEN '箱'
			WHEN ods_prod.ediasnpackage.packagetype = 999 THEN '未知'
			ELSE
				ods_prod.ediasnpackage.state
			END  as package_type ,
			
			
    /*
    packagetype
    public enum packagetype
        {
            /// 托[description("托")] m = 1,
            /// 混合包装 [description("混合")] g = 2,
            /// 箱子[description("箱")] s = 3,
            /// 未知[description("未知")] na = 999
        }
*/

    -- 体积 ：通过包装类型计算：
    /*   通过包装类型计算
          public double valumem
           {
               get
               {
                   double v = 0.0;
                   if (this.packagetype == (int)packagetype.m)
                   {
                       if (this.lulength.hasvalue && this.luwidth.hasvalue && this.luheight.hasvalue)
                       {
                           var l = this.lulength.value / 1000.0;
                           var w = this.luwidth.value / 1000.0;
                           var h = this.luheight.value / 1000.0;
                             v = l * w * h;

                       }
                   }
                   else if (this.packagetype == (int)packagetype.s)
                   {
                       if (this.kltlength.hasvalue && this.kltwidth.hasvalue && this.kltheight.hasvalue)
                       {
                           var l = this.kltlength.value / 1000.0;
                           var w = this.kltwidth.value / 1000.0;
                           var h = this.kltheight.value / 1000.0;
                             v = l * w * h;

                       }
                   }
                   return math.round(v,1);
               }
           }
   */
	 
	 			ROUND((CASE 
			WHEN ods_prod.ediasnpackage.packagetype = 1 THEN ods_prod.part.lulength * ods_prod.part.luwidth * ods_prod.part.luheight
			WHEN ods_prod.ediasnpackage.packagetype = 3 THEN ods_prod.part.kltlength * ods_prod.part.kltwidth * ods_prod.part.kltheight
			ELSE
				0.0
			END  )/1000000000,1)as valumem ,
--     ods_prod.part.kltcontent  as klt_content ,
--     ods_prod.part.kltlength  as klt_length ,
--     ods_prod.part.kltwidth  as klt_width ,
--     ods_prod.part.kltheight  as klt_height ,
--     ods_prod.part.lucontent  as lu_content ,
--     ods_prod.part.lulength  as lu_length ,
--     ods_prod.part.luwidth  as lu_width  ,
--     ods_prod.part.luheight  as lu_height ,
 
	 
	 
	 
	 
    -- 重量 ：通过包装类型计算:
    /*通过包装类型计算
    public double weightt
            {
                get
                {
                    double d = 0;
                    if (this.packagetype == (int)packagetype.m)
                    {
                        double.tryparse(this.grossweight, out d);

                    }
                    else if (this.packagetype == (int)packagetype.s)
                    {

                        double.tryparse(this.tareweight, out d);

                    }
                    return math.round(d, 1);
                }
            }

    */
		
ROUND((CASE 
			WHEN ods_prod.ediasnpackage.packagetype = 1 THEN ods_prod.part.grossweight
			WHEN ods_prod.ediasnpackage.packagetype = 3 THEN ods_prod.part.tareweight
			ELSE
				0.0
			END  ),1)as weightt ,		

		ods_prod.part.grossweight  as gross_weight,
    ods_prod.part.tareweight  as tare_weight ,
    -- 供应商简称：supplierdesc
    ods_prod.supplier.description as supplier_desc,
    -- 供应商代码：suppliercode
    ods_prod.supplier.code as supplier_code,

    -- asn到货时间：asnarrivaldate
    ods_prod.ediasntransport.arrivaldate as asn_arrival_date,
    -- asn发货时间：milkdate格式化为：yyyy-mm-dd
    ods_prod.ediasnpackage.milkdate as milk_date,
    -- 收货时间：receivedat格式化为：yyyy/mm/dd hh:mm
    ods_prod.ediasnpackage.receivedat as received_at,
    -- 收货时间：receivedat格式化为：yyyy/mm/dd hh:mm
    ods_prod.ediasnpackage.sapreceivedat as sap_received_at,
    -- 收货扫描人：同过receiverid到用户表中查询，使用用户信息拼接name+phone，例如：李丹丹13251650234 【待定：这个字段可再处理，不一定用旧的模式，直接分成两列】
		ods_prod.ediasnpackage.receiverId  as receiver_id,
    ods_prod.user.`name` as receiver_name,
    ods_prod.user.phone as receiver_phone,
    -- 仓库：whousenr
    ods_prod.whouse.nr                        as whouse_nr,
    -- 卸货口：dockpointcode
    ods_prod.dockpoint.code                   as dockpoint_code,
    -- asn同步时间：createdat
    -- 创建时间：createdat
    ods_prod.ediasnpackage.createdat as asn_created_at,
    ods_prod.ediasnpackage.createdat as created_at
from ods_prod.ediasnpackage
         left outer join ods_prod.part on ods_prod.ediasnpackage.partid = ods_prod.part.id
         left outer join ods_prod.ediasndeliverynode on ods_prod.ediasnpackage.edideliverynodeid = ods_prod.ediasndeliverynode.id
         left outer join ods_prod.ediasntransport on ods_prod.ediasnpackage.ediasntransportid = ods_prod.ediasntransport.id
         left outer join ods_prod.supplier on ods_prod.ediasnpackage.supplierid = ods_prod.supplier.id
         left outer join ods_prod.whouse on ods_prod.ediasnpackage.currentwhouseid = ods_prod.whouse.id
         left outer join ods_prod.dockpoint on ods_prod.ediasnpackage.currentdockpointid = ods_prod.dockpoint.id 
				 left outer join ods_prod.user on ods_prod.ediasnpackage.receiverId = ods_prod.user.id ;

-- ----------------------------
-- View structure for stage_transport_report_view
-- ----------------------------
DROP VIEW IF EXISTS `stage_transport_report_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `stage_transport_report_view` AS SELECT
    DeliveryReceivedEdiPackageRelation.id as id,
-- 佳轩承运单号：recordNr
	ods_prod.DeliveryReceivedRecord.nr AS recordNr,
-- ASN运输单号：transportNr
	ods_prod.EdiAsnTransport.transportnumber AS transportNr,
-- edi信息
	ods_prod.EdiAsnPackage.nr AS packageNr,
-- 司机扫描时间：checkedAt
	ods_prod.EdiAsnPackage.checkedAt ,
-- 供应商：supplierDesc
	ods_prod.Supplier.description AS supplierDesc,
-- 卸货口：dockPointCode
	ods_prod.DockPoint.CODE AS dockPointCode,

	case ods_prod.DeliveryReceivedEdiPackageRelation.fromType
	when 1 then '供应商'
	when 2 then '自有仓库'
	else '' end as fromTypeStr,

	-- ods_prod.DeliveryReceivedEdiPackageRelation.fromId,

	case DeliveryReceivedEdiPackageRelation.fromType
	when 1 then from_house.nr
	when 2 then ods_prod.Supplier.code
	else ''	end as fromNr,
	ods_prod.DeliveryReceivedEdiPackageRelation.sendTime,

	-- 运输车队：通过carTroopId到carTroop表中查询name
	ods_prod.cartroop.name as cartrropName,

	-- 车挂号：通过carTrailerId到carTrailer表中查询nr
	ods_prod.cartrailer.nr as carTrailerNr,

-- 收货时间：receivedAt
	ods_prod.DeliveryReceivedRecord.receivedAt,
	-- 运输车辆：carNr
	ods_prod.Car.Nr AS carNr,
	-- 车型：carTypeNr
	ods_prod.CarType.nr AS carTypeNr,
	-- 目的地：toWhouseNr
	to_house.nr AS toWhouseNr,
-- 司机：driverName
	ods_prod.user.NAME AS driverName,
-- 联系方式：driverPhone
	ods_prod.user.phone AS driverPhone,
    case  ods_prod.ediasnpackage.packagetype when 1 then 1 else 0 end  as trayCount,
    case  ods_prod.ediasnpackage.packagetype when 3 then 1 else 0 end  as singlePackageCount,
    ROUND((CASE
        WHEN ods_prod.ediasnpackage.packagetype = 1 THEN ods_prod.part.lulength/1000 * ods_prod.part.luwidth/1000 * ods_prod.part.luheight/1000
        WHEN ods_prod.ediasnpackage.packagetype = 3 THEN ods_prod.part.kltlength/1000 * ods_prod.part.kltwidth/1000 * ods_prod.part.kltheight/1000
        ELSE 0.0 END ),4)as valumem

FROM
	ods_prod.DeliveryReceivedEdiPackageRelation
	LEFT OUTER JOIN ods_prod.Whouse from_house ON ods_prod.DeliveryReceivedEdiPackageRelation.fromId = from_house.id

	-- 来自edi数据
	LEFT OUTER JOIN ods_prod.EdiAsnPackage ON ods_prod.DeliveryReceivedEdiPackageRelation.ediAsnPackageId = ods_prod.EdiAsnPackage.id
	LEFT OUTER JOIN ods_prod.EdiAsnTransport ON ods_prod.EdiAsnPackage.ediAsnTransportId = ods_prod.EdiAsnTransport.id
	LEFT OUTER JOIN ods_prod.Part ON ods_prod.EdiAsnPackage.partId = ods_prod.Part.id
	LEFT OUTER JOIN ods_prod.Supplier ON ods_prod.EdiAsnPackage.supplierId = ods_prod.Supplier.id
	LEFT OUTER JOIN ods_prod.DockPoint ON ods_prod.EdiAsnPackage.dockPointId = ods_prod.DockPoint.id
	-- 来自DeliveryReceivedRecord数据
	LEFT OUTER JOIN ods_prod.DeliveryReceivedRecord ON ods_prod.DeliveryReceivedEdiPackageRelation.deliveryReceivedRecordId = ods_prod.DeliveryReceivedRecord.id
	LEFT OUTER JOIN ods_prod.user ON ods_prod.DeliveryReceivedRecord.driverId = ods_prod.user.id
	LEFT OUTER JOIN ods_prod.user AS Creator ON ods_prod.DeliveryReceivedRecord.creatorId = Creator.id
--	LEFT OUTER JOIN ods_prod.Whouse as from_house ON ods_prod.DeliveryReceivedRecord.toId = ods_prod.Whouse.id
	LEFT OUTER JOIN ods_prod.Whouse to_house ON ods_prod.DeliveryReceivedRecord.toId = to_house.id

	LEFT OUTER JOIN ods_prod.Car ON ods_prod.DeliveryReceivedRecord.carId = ods_prod.Car.id
	LEFT OUTER JOIN ods_prod.CarType ON ods_prod.Car.carTypeId = ods_prod.CarType.id
	LEFT OUTER JOIN ods_prod.cartrailer on ods_prod.cartrailer.id = ods_prod.DeliveryReceivedRecord.carTrailerId
	LEFT OUTER JOIN ods_prod.cartroop ON ods_prod.cartroop.id = ods_prod.DeliveryReceivedRecord.carTroopId ;

-- ----------------------------
-- View structure for transport_report_view
-- ----------------------------
DROP VIEW IF EXISTS `transport_report_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `transport_report_view` AS SELECT

recordNr,
transportNr,
-- edi信息
	min(packageNr) AS packageNr,
-- 司机扫描时间：checkedAt
	min(checkedAt) as checkAt,
-- 供应商：supplierDesc
	min(supplierDesc )AS supplierDesc,
-- 卸货口：dockPointCode
	min(dockPointCode )AS dockPointCode,

	min(fromTypeStr)as fromTypeStr,

	-- ods_jxwts.DeliveryReceivedEdiPackageRelation.fromId,

	min(fromNr )as fromNr,
	min(sendTime) as sendTime,

	-- 运输车队：通过carTroopId到carTroop表中查询name
	min(cartrropName) as cartrropName,

	-- 车挂号：通过carTrailerId到carTrailer表中查询nr
	min(carTrailerNr) as carTrailerNr,

-- 收货时间：receivedAt
	min(receivedAt)as receivedAt,
	-- 运输车辆：carNr
	min(carNr) AS carNr,
	-- 车型：carTypeNr
	min(carTypeNr) AS carTypeNr,
	-- 目的地：toWhouseNr
	min(toWhouseNr) AS toWhouseNr,
-- 司机：driverName
	min(driverName) AS driverName,
-- 联系方式：driverPhone
	min(driverPhone) AS driverPhone,
    sum(trayCount) as trayCount,
    sum(singlePackageCount) as singlePackageCount,
    sum(valumem)as valumem

FROM
	dm_jxwts.stage_transport_report rep
GROUP BY
	rep.recordNr,rep.transportNr ;

SET FOREIGN_KEY_CHECKS = 1;
