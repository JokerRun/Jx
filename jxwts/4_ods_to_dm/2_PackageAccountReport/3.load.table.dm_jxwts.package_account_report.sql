

# 增量写入dm_jxwts.package_account_report
INSERT INTO dm_jxwts.package_account_report SELECT
src.* 
FROM
	dm_jxwts.package_account_report_view src 
WHERE
	src.created_at >= '2018-08-01 00:00:00'
	AND src.asn_package_nr NOT IN ( SELECT tgt.asn_package_nr FROM dm_jxwts.package_account_report tgt )
;

# 全量写入dm_jxwts.package_account_report
INSERT INTO dm_jxwts.package_account_report SELECT
src.*
FROM
	dm_jxwts.package_account_report_view src
WHERE
	src.asn_package_nr NOT IN ( SELECT tgt.asn_package_nr FROM dm_jxwts.package_account_report tgt )
;

