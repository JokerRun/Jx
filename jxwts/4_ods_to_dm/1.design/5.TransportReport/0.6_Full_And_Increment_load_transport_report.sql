# Full load
# 全量写入dm_jxwts.transport_report
INSERT INTO dm_jxwts.transport_report
select

    record_nr,
    transport_nr,
-- edi信息
	min(package_nr) as package_nr,
-- 司机扫描时间：checkedat
	min(checked_at) as checked_at,
-- 供应商：supplierdesc
	min(supplier_desc )as supplier_desc,
-- 卸货口：dockpointcode
	min(dockpoint_code )as dockpoint_code,

	min(from_type_str)as from_type_str,

	-- ods_jxwts.deliveryreceivededipackagerelation.fromid,

	min(from_nr )as from_nr,
	min(send_time) as send_time,

	-- 运输车队：通过cartroopid到cartroop表中查询name
	min(car_trrop_name) as car_trrop_name,

	-- 车挂号：通过cartrailerid到cartrailer表中查询nr
	min(car_trailer_nr) as car_trailer_nr,

-- 收货时间：receivedat
	min(received_at)as received_at,
	-- 运输车辆：carnr
	min(car_nr) as car_nr,
	-- 车型：cartypenr
	min(car_type_nr) as car_type_nr,
	-- 目的地：towhousenr
	min(to_whousenr) as to_whousenr,
-- 司机：drivername
	min(driver_name) as driver_name,
-- 联系方式：driverphone
	min(driver_phone) as driver_phone,
    sum(tray_count) as tray_count,
    sum(single_package_count) as single_package_count,
    sum(valumem)as valumem

from
	dm_jxwts.stage_transport_report rep
# where rep.recordNr ='R201704200954282681'
group by
	rep.record_nr,rep.transport_nr
;


# Full load
# 全量写入dm_jxwts.transport_report
REPLACE INTO dm_jxwts.transport_report
select

    record_nr,
    transport_nr,

-- edi信息
	min(package_nr) as package_nr,
-- 司机扫描时间：checkedat
	min(checked_at) as checked_at,
-- 供应商：supplierdesc
	min(supplier_desc )as supplier_desc,
-- 卸货口：dockpointcode
	min(dockpoint_code )as dockpoint_code,

	min(from_type_str)as from_type_str,

	-- ods_jxwts.deliveryreceivededipackagerelation.fromid,

	min(from_nr )as from_nr,
	min(send_time) as send_time,

	-- 运输车队：通过cartroopid到cartroop表中查询name
	min(car_trrop_name) as car_trrop_name,

	-- 车挂号：通过cartrailerid到cartrailer表中查询nr
	min(car_trailer_nr) as car_trailer_nr,

-- 收货时间：receivedat
	min(received_at)as received_at,
	-- 运输车辆：carnr
	min(car_nr) as car_nr,
	-- 车型：cartypenr
	min(car_type_nr) as car_type_nr,
	-- 目的地：towhousenr
	min(to_whousenr) as to_whousenr,
-- 司机：drivername
	min(driver_name) as driver_name,
-- 联系方式：driverphone
	min(driver_phone) as driver_phone,
    sum(tray_count) as tray_count,
    sum(single_package_count) as single_package_count,
    sum(valumem)as valumem
from
	dm_jxwts.stage_transport_report rep
# 	TODO：咨询业务，确认是否可以利用received_at做groupby（风险：received_at的范围制定是否回对计算字段产生影响？？）
#  where rep.received_at between date('') and date('')
group by
	rep.record_nr,rep.transport_nr
;