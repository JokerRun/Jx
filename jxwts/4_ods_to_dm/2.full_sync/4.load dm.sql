# 1.全量写入dm_jxwts.drivercheckedrecorddetail
REPLACE INTO dm_jxwts.drivercheckedrecorddetail SELECT
src.*
FROM
	dm_jxwts.DriverCheckedRecordDetailView src
WHERE
	src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.drivercheckedrecorddetail tgt )
;
# 2.全量写入dm_jxwts.deliveryreceivedrecord
REPLACE INTO dm_jxwts.deliveryreceivedrecord SELECT
src.*
FROM
	dm_jxwts.deliveryreceivedrecordview src
WHERE
	src.id NOT IN ( SELECT tgt.id FROM  dm_jxwts.deliveryreceivedrecord tgt )
;
# 3.全量写入dm_jxwts.package_account_report
REPLACE INTO dm_jxwts.package_account_report SELECT
src.*
FROM
	dm_jxwts.package_account_report_view src
WHERE
	src.asn_package_nr NOT IN ( SELECT tgt.asn_package_nr FROM dm_jxwts.package_account_report tgt )
;

# 4.全量写入dm_jxwts.package_moving_log
REPLACE INTO dm_jxwts.package_moving_log SELECT
src.*
FROM
	dm_jxwts.edi_asn_package_moving_log_view src
WHERE  src.id NOT IN ( SELECT tgt.id FROM dm_jxwts.package_moving_log tgt )
;
# 5.1.全量写入dm_jxwts.stage_transport_report
REPLACE INTO dm_jxwts.stage_transport_report SELECT
src.*
FROM
	dm_jxwts.stage_transport_report_view src
WHERE
	 src.id not in ( SELECT tgt.id FROM  dm_jxwts.stage_transport_report tgt )
;
# 5.2.全量写入dm_jxwts.transport_report
# REPLACE INTO dm_jxwts.transport_report SELECT
# src.*
# FROM
# 	dm_jxwts.stage_transport_report src
# WHERE
#  not exists ( SELECT 1 FROM  dm_jxwts.stage_transport_report tgt where src.recordNr=tgt.recordNr and src.transportNr=tgt.transportNr)
# group by
# 	rep.recordnr,rep.transportnr
# ;
REPLACE INTO dm_jxwts.transport_report
select
       id,
recordnr,
transportnr,
-- edi信息
	min(packagenr) as packagenr,
-- 司机扫描时间：checkedat
	min(checkedat) as checkat,
-- 供应商：supplierdesc
	min(supplierdesc )as supplierdesc,
-- 卸货口：dockpointcode
	min(dockpointcode )as dockpointcode,

	min(fromtypestr)as fromtypestr,

	-- ods_jxwts.deliveryreceivededipackagerelation.fromid,

	min(fromnr )as fromnr,
	min(sendtime) as sendtime,

	-- 运输车队：通过cartroopid到cartroop表中查询name
	min(cartrropname) as cartrropname,

	-- 车挂号：通过cartrailerid到cartrailer表中查询nr
	min(cartrailernr) as cartrailernr,

    -- 收货时间：receivedat
	min(receivedat)as receivedat,
	-- 运输车辆：carnr
	min(carnr) as carnr,
	-- 车型：cartypenr
	min(cartypenr) as cartypenr,
	-- 目的地：towhousenr
	min(towhousenr) as towhousenr,
-- 司机：drivername
	min(drivername) as drivername,
-- 联系方式：driverphone
	min(driverphone) as driverphone,
    sum(traycount) as traycount,
    sum(singlepackagecount) as singlepackagecount,
    sum(valumem)as valumem

from
	dm_jxwts.stage_transport_report rep
# where
#  not exists ( SELECT 1 FROM  dm_jxwts.stage_transport_report tgt where src.recordNr=tgt.recordNr and src.transportNr=tgt.transportNr)

group by
	rep.recordnr,rep.transportnr