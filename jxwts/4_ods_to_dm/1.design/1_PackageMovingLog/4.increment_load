# 增量写入dm_jxwts.package_moving_log
#     是否有删除数据：无
#     是否有更新数据：无
#     是否可以直接增量：是
#     增量判断字段：createdat
#     月预计增量：~100w
#     天增量: ~3w

REPLACE INTO dm_jxwts.package_moving_log SELECT
src.*
FROM
	dm_jxwts.edi_asn_package_moving_log_view src
WHERE
    src.id NOT IN ( SELECT tgt.id FROM dm_jxwts.package_moving_log tgt )
	AND
	src.created_at between date('${loaddate-1}') and  date('${loaddate}')
;

#  注： 因为是只有增量没有更新，所以其实本脚本中的日期限制可以去掉，根据id是否存在于目标表即可（因为不存在更新操作）。

# for Explain

EXPLAIN REPLACE INTO dm_jxwts.package_moving_log SELECT
src.*
FROM
	dm_jxwts.edi_asn_package_moving_log_view src
WHERE
    src.id NOT IN ( SELECT tgt.id FROM dm_jxwts.package_moving_log tgt )
	AND
    src.created_at between date('2018-07-01') and  date('2018-08-01')
;

