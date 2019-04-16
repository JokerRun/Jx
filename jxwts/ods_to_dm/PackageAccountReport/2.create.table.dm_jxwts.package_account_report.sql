-- 通过试图选择生成视图对应的实体表
drop table if exists dm_jxwts.package_account_report;
create table dm_jxwts.package_account_report as
select
	*
from
	dm_jxwts.package_account_report_view
limit 1
;



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
