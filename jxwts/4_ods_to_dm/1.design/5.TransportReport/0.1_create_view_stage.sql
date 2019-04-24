drop view if exists dm_jxwts.stage_transport_report_view;
create view dm_jxwts.stage_transport_report_view as
select
    deliveryreceivededipackagerelation.id as id,
-- 佳轩承运单号：recordnr
	ods_prod.deliveryreceivedrecord.nr as record_nr,
-- asn运输单号：transportnr
	ods_prod.ediasntransport.transportnumber as transport_nr,
-- edi信息
	ods_prod.ediasnpackage.nr as package_nr,
-- 司机扫描时间：checkedat
	ods_prod.ediasnpackage.checkedat as checked_at,
-- 供应商：supplierdesc
	ods_prod.supplier.description as supplier_desc,
-- 卸货口：dockpointcode
	ods_prod.dockpoint.code as dockpoint_code,

	case ods_prod.deliveryreceivededipackagerelation.fromtype
	when 1 then '供应商'
	when 2 then '自有仓库'
	else '' end as from_type_str,

	-- ods_prod.deliveryreceivededipackagerelation.fromid,

	case deliveryreceivededipackagerelation.fromtype
	when 1 then from_house.nr
	when 2 then ods_prod.supplier.code
	else ''	end as from_nr,
	ods_prod.deliveryreceivededipackagerelation.sendtime as send_time,

	-- 运输车队：通过cartroopid到cartroop表中查询name
	ods_prod.cartroop.name as car_trrop_name,

	-- 车挂号：通过cartrailerid到cartrailer表中查询nr
	ods_prod.cartrailer.nr as car_trailer_nr,

-- 收货时间：receivedat
	ods_prod.deliveryreceivedrecord.receivedat as received_at,
    ods_prod.ediasnpackage.createdAt as created_at,
    ods_prod.ediasnpackage.updatedAt as updated_at,
	-- 运输车辆：carnr
	ods_prod.car.nr as car_nr,
	-- 车型：cartypenr
	ods_prod.cartype.nr as car_type_nr,
	-- 目的地：towhousenr
	to_house.nr as to_whousenr,
-- 司机：drivername
	ods_prod.user.name as driver_name,
-- 联系方式：driverphone
	ods_prod.user.phone as driver_phone,
    case  ods_prod.ediasnpackage.packagetype when 1 then 1 else 0 end  as tray_count,
    case  ods_prod.ediasnpackage.packagetype when 3 then 1 else 0 end  as single_package_count,
    round((case
        when ods_prod.ediasnpackage.packagetype = 1 then ods_prod.part.lulength/1000 * ods_prod.part.luwidth/1000 * ods_prod.part.luheight/1000
        when ods_prod.ediasnpackage.packagetype = 3 then ods_prod.part.kltlength/1000 * ods_prod.part.kltwidth/1000 * ods_prod.part.kltheight/1000
        else 0.0 end ),4)as valumem

from
    ods_prod.deliveryreceivedrecord
	left outer join ods_prod.deliveryreceivededipackagerelation  on ods_prod.deliveryreceivededipackagerelation.deliveryreceivedrecordid = ods_prod.deliveryreceivedrecord.id
    left outer join ods_prod.whouse from_house on ods_prod.deliveryreceivededipackagerelation.fromid = from_house.id

        -- 来自edi数据
    left outer join ods_prod.ediasnpackage on ods_prod.deliveryreceivededipackagerelation.ediasnpackageid = ods_prod.ediasnpackage.id
    left outer join ods_prod.ediasntransport on ods_prod.ediasnpackage.ediasntransportid = ods_prod.ediasntransport.id
    left outer join ods_prod.part on ods_prod.ediasnpackage.partid = ods_prod.part.id
    left outer join ods_prod.supplier on ods_prod.ediasnpackage.supplierid = ods_prod.supplier.id
    left outer join ods_prod.dockpoint on ods_prod.ediasnpackage.dockpointid = ods_prod.dockpoint.id
        -- 来自deliveryreceivedrecord数据
# 	left outer join ods_prod.deliveryreceivedrecord on ods_prod.deliveryreceivededipackagerelation.deliveryreceivedrecordid = ods_prod.deliveryreceivedrecord.id
	left outer join ods_prod.user on ods_prod.deliveryreceivedrecord.driverid = ods_prod.user.id
--	left outer join ods_prod.user as creator on ods_prod.deliveryreceivedrecord.creatorid = creator.id
--	left outer join ods_prod.whouse as from_house on ods_prod.deliveryreceivedrecord.toid = ods_prod.whouse.id
	left outer join ods_prod.whouse to_house on ods_prod.deliveryreceivedrecord.toid = to_house.id

	left outer join ods_prod.car on ods_prod.deliveryreceivedrecord.carid = ods_prod.car.id
	left outer join ods_prod.cartype on ods_prod.car.cartypeid = ods_prod.cartype.id
	left outer join ods_prod.cartrailer on ods_prod.cartrailer.id = ods_prod.deliveryreceivedrecord.cartrailerid
	left outer join ods_prod.cartroop on ods_prod.cartroop.id = ods_prod.deliveryreceivedrecord.cartroopid
#  TODO： 由于主表从rel改为drr，会导致关联到空的id，这些数据需要过滤，故添加如下条件
    where deliveryreceivededipackagerelation.id is not null
;