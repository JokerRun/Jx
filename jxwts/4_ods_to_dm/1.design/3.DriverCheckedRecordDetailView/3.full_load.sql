# 全量写入dm_jxwts.package_account_report
INSERT INTO dm_jxwts.driver_checked_record_detail SELECT
src.*
FROM
	dm_jxwts.driver_checked_record_detail_view src
;

