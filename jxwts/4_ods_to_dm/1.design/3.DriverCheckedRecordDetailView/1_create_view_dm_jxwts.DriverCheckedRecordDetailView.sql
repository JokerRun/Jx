drop view if exists dm_jxwts.driver_checked_record_detail_view ;
create view dm_jxwts.driver_checked_record_detail_view as select
/*
-- ods_prod.drivercheckedrecord .id
-- ods_prod.drivercheckedrecord .nr
-- ods_prod.drivercheckedrecord .told
-- ods_prod.drivercheckedrecord .receivedat
-- ods_prod.drivercheckedrecord .creatorid
-- ods_prod.drivercheckedrecord .receivetype
-- ods_prod.drivercheckedrecord .status
-- ods_prod.drivercheckedrecord .note
-- 驾驶员姓名：drivername
 */
ods_prod.drivercheckedrecord .id as id,
ods_prod.user.name as driver_name,
-- 员工号：drivernr
ods_prod.user.nr as driver_nr,
-- 所属车队：cartroopname
ods_prod.cartroop.name as cartroop_name,
-- 车牌号：carnr
ods_prod.car.nr as car_nr,
-- 车挂号：通过cartrailerid在cartrailer表中查询nr
ods_prod.cartrailer.nr as car_trailer_nr,
-- 出发地：sourcewhousename	
src_whouse.name as source_whouse_name,
-- 目的地：destinationwhousename
dest_whouse.name as destination_whouse_name,
-- 计划托数：plantraycount
ods_prod.drivercheckedrecord .plantraycount as plan_tray_count,
-- 计划箱数：planpackagecount
ods_prod.drivercheckedrecord .planpackagecount as plan_package_count,
-- 实收托数：realtraycount
ods_prod.drivercheckedrecord .realtraycount as real_tray_count,
-- 实收箱数：realpackagecount
ods_prod.drivercheckedrecord .realpackagecount as real_package_count,
-- 创建时间：createdat
ods_prod.drivercheckedrecord .createdat as created_at
# ods_prod.drivercheckedrecord .receivedat as  received_at
from
	ods_prod.drivercheckedrecord
	left join ods_prod.deliverynodecar  on drivercheckedrecord.deliverynodecarid = ods_prod.deliverynodecar.id
    left join ods_prod.car on ods_prod.car.id = ods_prod.deliverynodecar.carid
    left join ods_prod.cartrailer on ods_prod.deliverynodecar.cartrailerid = ods_prod.cartrailer.id
    left join ods_prod.user on ods_prod.user.id = ods_prod.deliverynodecar.userid
    left join ods_prod.cartroop on ods_prod.cartroop.id = ods_prod.user.cartroopid
    left join ods_prod.deliverynode on drivercheckedrecord.deliverynodeid = ods_prod.deliverynode.id
    left join ods_prod.whouse src_whouse on src_whouse.id = ods_prod.deliverynode.sourcewhouseid
    left join ods_prod.whouse dest_whouse on dest_whouse.id = ods_prod.deliverynode.destinationwhouseid
;