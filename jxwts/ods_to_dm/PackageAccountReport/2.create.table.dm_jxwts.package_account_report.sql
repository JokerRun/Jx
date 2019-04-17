-- 通过试图选择生成视图对应的实体表
drop table if exists dm_jxwts.package_account_report;
create table dm_jxwts.package_account_report as
select
	*
from
	dm_jxwts.package_account_report_view
limit 1
;

ALTER TABLE `dm_jxwts`.package_account_report
add  UNIQUE INDEX `uk_asn_package_nr`(`asn_package_nr`) USING BTREE COMMENT '`标签号`搜索条件',
add  INDEX `idx_part_create_at`(`created_at`) USING BTREE COMMENT '`创建日期`搜索条件',
add  INDEX `idx_part_received_at`(`received_at`) USING BTREE COMMENT '`到货日期`搜索条件',
add  INDEX `idx_part_sap_received_at`(`sap_received_at`) USING BTREE COMMENT '`SAP到货日期`搜索条件',


ADD INDEX `idx_paart_asn_transport_nr`(`asn_transport_nr`) USING BTREE COMMENT '`运输单编号`搜索条件',
ADD 		INDEX `idx_part_asn_delivery_node_nr`(`asn_delivery_node_nr`) USING BTREE COMMENT '`发运单编号`搜索条件',
ADD 		INDEX `idx_part_part_nr`(`part_nr`) USING BTREE COMMENT '`零件号`搜索条件',
ADD		INDEX `idx_part_supplier_desc`(`supplier_desc`) USING BTREE COMMENT '`供应商`搜索条件',
ADD 		INDEX `idx_part_whouse_nr`(`whouse_nr`) USING BTREE COMMENT '`仓库`搜索条件',
ADD 		INDEX `idx_part_dockpoint_code`(`dockpoint_code`) USING BTREE COMMENT '`操作类型`搜索条件';



-- ----------------------------
-- Table structure for package_account_report
-- ----------------------------
DROP TABLE IF EXISTS `package_account_report`;
CREATE TABLE `package_account_report`  (
  `asn_transport_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_delivery_node_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_package_nr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `is_verify` bit(1) NULL DEFAULT NULL,
  `is_sap_received` bit(1) NULL DEFAULT NULL,
  `part_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_qty` double NULL DEFAULT NULL,
  `package_type` int(11) NULL DEFAULT NULL,
  `klt_content` int(11) NULL DEFAULT NULL,
  `klt_length` int(11) NULL DEFAULT NULL,
  `klt_width` int(11) NULL DEFAULT NULL,
  `klt_height` int(11) NULL DEFAULT NULL,
  `lu_content` int(11) NULL DEFAULT NULL,
  `lu_length` int(11) NULL DEFAULT NULL,
  `lu_width` int(11) NULL DEFAULT NULL,
  `lu_height` int(11) NULL DEFAULT NULL,
  `gross_weight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tare_weight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_arrival_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `milk_date` datetime(0) NULL DEFAULT NULL,
  `received_at` datetime(0) NULL DEFAULT NULL,
  `sap_received_at` datetime(0) NULL DEFAULT NULL,
  `receiver_id` int(11) NULL DEFAULT NULL,
  `whouse_nr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dockpoint_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asn_created_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
