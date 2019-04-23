# 全量写入dm_jxwts.package_moving_log
INSERT INTO dm_jxwts.package_moving_log SELECT
src.*
FROM
	dm_jxwts.edi_asn_package_moving_log_view src
# WHERE  src.id NOT IN ( SELECT tgt.id FROM dm_jxwts.package_moving_log tgt )
;