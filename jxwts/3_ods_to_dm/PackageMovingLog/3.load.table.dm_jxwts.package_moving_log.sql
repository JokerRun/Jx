# 增量写入dm_jxwts.package_moving_log
INSERT INTO dm_jxwts.package_moving_log SELECT
src.* 
FROM
	dm_jxwts.edi_asn_package_moving_log_view src 
WHERE
	src.created_at >= '2018-08-01 00:00:00' 
	AND src.id NOT IN ( SELECT tgt.id FROM package_moving_log tgt )
;

# 全量写入dm_jxwts.package_moving_log
INSERT INTO dm_jxwts.package_moving_log SELECT
src.*
FROM
	dm_jxwts.edi_asn_package_moving_log_view src
WHERE  src.id NOT IN ( SELECT tgt.id FROM package_moving_log tgt )
;
