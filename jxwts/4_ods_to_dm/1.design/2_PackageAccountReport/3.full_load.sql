# 全量写入dm_jxwts.package_account_report
INSERT INTO dm_jxwts.package_account_report SELECT
src.*
FROM
	dm_jxwts.package_account_report_view src
;

