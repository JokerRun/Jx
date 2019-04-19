# 1.全量写入dm_jxwts.drivercheckedrecorddetail
INSERT INTO dm_jxwts.drivercheckedrecorddetail SELECT
src.*
FROM
	dm_jxwts.DriverCheckedRecordDetailView src
WHERE
	src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.drivercheckedrecorddetail tgt )
;
# 2.全量写入dm_jxwts.deliveryreceivedrecord
INSERT INTO dm_jxwts.deliveryreceivedrecord SELECT
src.*
FROM
	dm_jxwts.deliveryreceivedrecordview src
WHERE
	src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.deliveryreceivedrecord tgt )
;
# 3.全量写入dm_jxwts.package_account_report
INSERT INTO dm_jxwts.package_account_report SELECT
src.*
FROM
	dm_jxwts.package_account_report_view src
WHERE
	src.asn_package_nr NOT IN ( SELECT tgt.asn_package_nr FROM dm_jxwts.package_account_report tgt )
;

# 4.全量写入dm_jxwts.package_moving_log
INSERT INTO dm_jxwts.package_moving_log SELECT
src.*
FROM
	dm_jxwts.edi_asn_package_moving_log_view src
WHERE  src.id NOT IN ( SELECT tgt.id FROM dm_jxwts.package_moving_log tgt )
;
# 5.1.全量写入dm_jxwts.stage_transport_report
INSERT INTO dm_jxwts.stage_transport_report SELECT
src.*
FROM
	dm_jxwts.stage_transport_report_view src
WHERE
	 src.id not in ( SELECT tgt.id FROM  dm_jxwts.stage_transport_report tgt )
;
# 5.2.全量写入dm_jxwts.transport_report
INSERT INTO dm_jxwts.transport_report SELECT
src.*
FROM
	dm_jxwts.stage_transport_report src
WHERE
 not exists ( SELECT 1 FROM  dm_jxwts.stage_transport_report tgt where src.recordNr=tgt.recordNr and src.transportNr=tgt.transportNr)

;
