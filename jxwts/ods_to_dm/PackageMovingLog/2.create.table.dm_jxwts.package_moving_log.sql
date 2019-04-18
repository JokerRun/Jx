drop table if exists dm_jxwts.package_moving_log;
create table dm_jxwts.package_moving_log as 
select
	*
from
	dm_jxwts.edi_asn_package_moving_log_view
limit 1
;


ALTER TABLE `dm_jxwts`.`package_moving_log`
add  UNIQUE INDEX `uk_pkg_mov_log`(`id`) USING BTREE,
add  INDEX `idx_pkg_mov_log_create_at`(`created_at`) USING BTREE,
ADD INDEX `idx_package_moving_log_transport_nr`(`transport_nr`) USING BTREE COMMENT '`运输单编号`搜索条件',
ADD 		INDEX `idx_package_moving_log_delnote_number`(`delnote_number`) USING BTREE COMMENT '`发运单编号`搜索条件',
ADD 		INDEX `idx_package_moving_log_part_nr`(`part_nr`) USING BTREE COMMENT '`零件号`搜索条件',
		-- INDEX `idx_package_moving_log_supplier_code`(`supplier_code`) USING BTREE COMMENT '`供应商`搜索条件',
ADD 		INDEX `idx_package_moving_log_whouse_nr`(`whouse_nr`) USING BTREE COMMENT '`仓库`搜索条件',
ADD 		INDEX `idx_package_moving_log_action_type`(`action_type`) USING BTREE COMMENT '`操作类型`搜索条件',
ADD 		INDEX `idx_package_moving_log_car_nr`(`car_nr`) USING BTREE COMMENT '`车挂号`搜索条件',
ADD 		INDEX `idx_package_moving_log_edi_asn_package_nr`(`edi_asn_package_nr`) USING BTREE COMMENT '`标签号`搜索条件';
-- ADD 		INDEX `idx_package_moving_log_created_at`(`created_at`) USING BTREE COMMENT '`创建日期`搜索条件'


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

 Date: 12/04/2019 16:18:25



	SET FOREIGN_KEY_CHECKS = 0;

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
		`supplier_id` int(11)  NULL DEFAULT NULL,
		`supplier_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
		`dockpoint_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
		`arrival_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
		`created_at` datetime(0) NULL DEFAULT NULL,
		PRIMARY KEY (`id`) USING BTREE,
		INDEX `idx_package_moving_log_transport_nr`(`transport_nr`) USING BTREE COMMENT '`运输单编号`搜索条件',
		INDEX `idx_package_moving_log_delnote_number`(`delnote_number`) USING BTREE COMMENT '`发运单编号`搜索条件',
		INDEX `idx_package_moving_log_part_nr`(`part_nr`) USING BTREE COMMENT '`零件号`搜索条件',
		-- INDEX `idx_package_moving_log_supplier_code`(`supplier_code`) USING BTREE COMMENT '`供应商`搜索条件',
		INDEX `idx_package_moving_log_whouse_nr`(`whouse_nr`) USING BTREE COMMENT '`仓库`搜索条件',
		INDEX `idx_package_moving_log_action_type`(`action_type`) USING BTREE COMMENT '`操作类型`搜索条件',
		INDEX `idx_package_moving_log_car_nr`(`car_nr`) USING BTREE COMMENT '`车挂号`搜索条件',
		INDEX `idx_package_moving_log_edi_asn_package_nr`(`edi_asn_package_nr`) USING BTREE COMMENT '`标签号`搜索条件',
		INDEX `idx_package_moving_log_created_at`(`created_at`) USING BTREE COMMENT '`创建日期`搜索条件'
	) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
	
	
	SET FOREIGN_KEY_CHECKS = 1;
*/
