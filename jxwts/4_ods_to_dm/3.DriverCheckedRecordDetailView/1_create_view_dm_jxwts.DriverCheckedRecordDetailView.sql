drop view if exists dm_jxwts.drivercheckedrecorddetailview ;
CREATE VIEW dm_jxwts.DriverCheckedRecordDetailView AS SELECT
-- ods_prod.dcd.id
-- ods_prod.dcd.nr
-- ods_prod.dcd.told
-- ods_prod.dcd.receivedAt
-- ods_prod.dcd.creatorid
-- ods_prod.dcd.receiveType
-- ods_prod.dcd.status
-- ods_prod.dcd.note
-- 驾驶员姓名：driverName
dcd.id as id,
ods_prod.u.name AS drivername,
-- 员工号：driverNr
ods_prod.u.nr AS driverNr,
-- 所属车队：carTroopName
ods_prod.troop.name AS carTroopName,
-- 车牌号：carNr
ods_prod.car.nr AS carNr,
-- 车挂号：通过carTrailerId在carTrailer表中查询nr
ods_prod.trailer.nr AS carTrailerNr,
-- 出发地：sourceWhouseName	
ods_prod.house.name AS sourceWhouseName,
-- 目的地：destinationWhouseName
ods_prod.house_two.name AS destinationWhouseName,
-- 计划托数：planTrayCount
ods_prod.dcd.planTrayCount AS planTrayCount,
-- 计划箱数：planPackageCount
ods_prod.dcd.planPackageCount AS planPackageCount,
-- 实收托数：realTrayCount
ods_prod.dcd.realTrayCount AS realTrayCount,
-- 实收箱数：realPackageCount
ods_prod.dcd.realPackageCount AS realPackageCount,
-- 创建时间：createdAt
ods_prod.dcd.createdAt AS createdAt 
FROM
	ods_prod.drivercheckedrecord dcd
	LEFT JOIN ods_prod.deliverynode node ON deliveryNodeId = ods_prod.node.id
	LEFT JOIN ods_prod.deliverynodecar nodeCar ON dcd.deliveryNodeCarId = nodeCar.id
	LEFT JOIN ods_prod.car car ON car.id = nodeCar.carId
	LEFT JOIN ods_prod.cartrailer trailer ON nodeCar.carTrailerId = trailer.id
	LEFT JOIN ods_prod.user u ON u.id = nodeCar.userId
	LEFT JOIN ods_prod.cartroop troop ON troop.id = u.carTroopId
	LEFT JOIN ods_prod.whouse house ON house.id = node.sourceWhouseId
	LEFT JOIN ods_prod.whouse house_two ON house_two.id = node.destinationWhouseId
