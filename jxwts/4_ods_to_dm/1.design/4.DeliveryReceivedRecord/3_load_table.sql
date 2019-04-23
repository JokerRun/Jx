

# 增量写入dm_jxwts.package_account_report
INSERT INTO dm_jxwts.deliveryreceivedrecord SELECT
src.*
FROM
	dm_jxwts.deliveryreceivedrecordview src
WHERE
	src.receivedAt >= '2018-08-01 00:00:00'
	AND src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.deliveryreceivedrecord tgt )
;

# 全量写入dm_jxwts.package_account_report


# 增量写入dm_jxwts.package_account_report


# 增量写入dm_jxwts.package_account_report
INSERT INTO dm_jxwts.deliveryreceivedrecord SELECT
src.*
FROM
	dm_jxwts.deliveryreceivedrecordview src
WHERE
	src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.deliveryreceivedrecord tgt )
;
