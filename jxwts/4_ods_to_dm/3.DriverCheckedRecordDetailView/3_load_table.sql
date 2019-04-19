

# 增量写入dm_jxwts.package_account_report
INSERT INTO dm_jxwts.drivercheckedrecorddetail SELECT
src.*
FROM
	dm_jxwts.drivercheckedrecorddetailview src
WHERE
	src.createdat >= '2018-08-01 00:00:00'
	AND src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.drivercheckedrecorddetail tgt )
;

# 全量写入dm_jxwts.package_account_report

INSERT INTO dm_jxwts.drivercheckedrecorddetail SELECT
src.*
FROM
	dm_jxwts.drivercheckedrecorddetailview src
WHERE
	src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.drivercheckedrecorddetail tgt )
;

