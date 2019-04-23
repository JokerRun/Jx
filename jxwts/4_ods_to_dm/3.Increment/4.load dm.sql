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
	src.created_at between date('${loaddate-1}') and date('${loaddate}')
	AND src.id NOT IN ( SELECT tgt.id FROM dm_jxwts.package_moving_log tgt )
;

# 增量写入dm_jxwts.package_account_report
# 是否有删除数据：无
# 是否有更新数据：是
# 	更新字段为：state、receivedAt、isSAPReceived、receiverId、isVerify
# 	更新频率为：频繁，且生命周期中会更新多次
#
# 是否可以直接增量：待定
# 增量判断字段：updatedAt
# 月预计增量：~40w
# 天增/更新量: ~1.3w
REPLACE INTO dm_jxwts.package_account_report SELECT
src.*
FROM
	dm_jxwts.package_account_report_view src
WHERE
	src.created_at between date('${loaddate-1}') and date('${loaddate}')
	AND src.asn_package_nr NOT IN ( SELECT tgt.asn_package_nr FROM dm_jxwts.package_account_report tgt )
;

# 增量写入dm_jxwts.drivercheckedrecorddetail
# 是否有删除数据：无
# 是否有更新数据：无
# 是否可以直接增量：是
# 增量判断字段：createdat
# 月预计增量：~2000
# 天增量: ~100

REPLACE INTO dm_jxwts.drivercheckedrecorddetail SELECT
src.*
FROM
	dm_jxwts.drivercheckedrecorddetailview src
WHERE
	src.createdat between date('${loaddate-1}') and date('${loaddate}')
	AND src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.drivercheckedrecorddetail tgt )
;

# 增量写入dm_jxwts.deliveryreceivedrecord
/*
【这个表没有使用视图，是在显示时动态查询数据】

是否有删除数据：是
是否有更新数据：是，主要更新状态
是否可以直接增量：是
增量判断字段：receivedAt，无updatedAt，可以考虑使用触发器生成
月预计增量：~4000
天增量: ~1300
*/
REPLACE INTO dm_jxwts.deliveryreceivedrecord SELECT
src.*
FROM
	dm_jxwts.deliveryreceivedrecordview src
WHERE
	src.created_at between date('${loaddate-1}') and date('${loaddate}')
	AND
      src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.deliveryreceivedrecord tgt )
;







# 增量写入dm_jxwts.stage_transport_report
/*
五、	运输报表
是否有删除数据：是
	删除DeliveryReceivedEdiPackageRelation
是否有更新数据：是
	更新DeliveryReceivedEdiPackageRelation的status；
	更新EdiAsnPackage updatedAt、status等；
是否可以直接增量：是
增量判断字段：【无】
【建议在数据库表中DeliveryReceivedEdiPackageRelation加入createdAt/updatedAt字段，并使用数据库触发器创建/更新它】
月预计增量：~60w
天增量: ~2w
*/
REPLACE INTO dm_jxwts.stage_transport_report SELECT
src.*
FROM
	dm_jxwts.stage_transport_report_view src
WHERE
# 	src.created_at between date('${loaddate-1}') and date('${loaddate}')
# 	AND
      src.id not in ( SELECT tgt.id FROM  dm_jxwts.stage_transport_report tgt )
;

# 增量写入dm_jxwts.transport_report
REPLACE INTO dm_jxwts.transport_report SELECT
src.*
FROM
	dm_jxwts.transport_report_view src
WHERE
# 	src.created_at between date('${loaddate-1}') and date('${loaddate}')
# 	AND
      not exists ( SELECT 1 FROM  dm_jxwts.stage_transport_report tgt where src.recordNr=tgt.recordNr and src.transportNr=tgt.transportNr)
;


/*

for test:
f1	f2	created_at
1	1	2019-04-16 17:15:13
2	1	2019-04-17 17:15:13
3	1	2019-04-18 17:15:13
4	1	2019-04-19 17:15:13
SELECT
	*
FROM
	`test_between`
WHERE
	created_at BETWEEN date( '2019-04-18 17:15:13' ) AND date( '2019-04-19 17:15:13'  );
result:
f1	f2	created_at
3	1	2019-04-18 17:15:13

*/
