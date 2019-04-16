DROP VIEW if EXISTS  dm_jxwts.edi_asn_package_moving_log_view;
CREATE VIEW dm_jxwts.edi_asn_package_moving_log_view as 
select ods_jxwts.ediasnpackagemovinglog.id	as id,
	-- 操作仓库：[需计算]如果操作类型是前端扫描，值为**供应商描述(descript)，其它全部使用视图中的whousenr
	ods_jxwts.whouse.nr as whouse_nr, 
	-- 操作类型
	-- 中转入库[description("中转入库")]transferenter = 1,
	-- 中转发出[description("中转发出")]transfersend = 2,
	-- 客户收货[description("bbac收货")]clientreceive = 3,
	-- 手动交付[description("手动交付")]manualdelivery = 4,
	-- 司机盲扫发出[description("前端扫描")]driversend = 9
	ods_jxwts.ediasnpackagemovinglog.actiontype as action_type, 
	-- 操作员
	creator.name as creator_name, 
	-- 运输车辆
	ods_jxwts.car.nr as car_nr, 
	-- 司机
	ods_jxwts.user.name as driver_name, 
	-- 司机联系方式
	ods_jxwts.user.phone as driver_phone, 

	-- 运输单编号
	ods_jxwts.ediasntransport.transportnumber as transport_nr,
	--  发货单编号
	ods_jxwts.ediasndeliverynode.delnotenumber as delnote_number,
	-- 标签号
	ods_jxwts.ediasnpackage.nr as edi_asn_package_nr,
	-- 零件号
	ods_jxwts.part.nr as part_nr, 
	-- 件数
	ods_jxwts.ediasnpackage.quantityperpack as quantity_perpack, 
	--  供应商id
	EdiAsnPackage.supplierId as supplier_id, 
	--  供应商代码
	ods_jxwts.part.suppliercode as supplier_code, 
	--  卸货口
	ods_jxwts.dockpoint.code as dockpoint_code, 
	-- asn到货时间
	ods_jxwts.ediasntransport.arrivaldate as arrival_date, 
	-- 创建时间
	ods_jxwts.ediasnpackagemovinglog.createdat  as created_at 
from
	ods_jxwts.ediasnpackagemovinglog
	-- ediasnpackagemovinglog 关联来源
left outer join ods_jxwts.whouse on ods_jxwts.ediasnpackagemovinglog.whouseid = ods_jxwts.whouse.id
left outer join ods_jxwts.car on ods_jxwts.ediasnpackagemovinglog.carid = ods_jxwts.car.id
left outer join ods_jxwts.user on ods_jxwts.ediasnpackagemovinglog.driverid = ods_jxwts.user.id
left outer join ods_jxwts.user as creator on ods_jxwts.ediasnpackagemovinglog.creatorid = creator.id

	-- ediasnpackage 关联来源
left outer join ods_jxwts.ediasnpackage on ods_jxwts.ediasnpackagemovinglog.packageid = ods_jxwts.ediasnpackage.id

left outer join ods_jxwts.ediasntransport on ods_jxwts.ediasnpackage.ediasntransportid = ods_jxwts.ediasntransport.id
left outer join ods_jxwts.ediasndeliverynode on ods_jxwts.ediasnpackage.edideliverynodeid = ods_jxwts.ediasndeliverynode.id
left outer join ods_jxwts.dockpoint on ods_jxwts.ediasnpackage.dockpointid = ods_jxwts.dockpoint.id
left outer join ods_jxwts.part on ods_jxwts.ediasnpackage.partid = ods_jxwts.part.id



/*
	CREATE OR REPLACE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `ods_jxwts`.`ediasnpackagemovinglogview` AS SELECT
		EdiAsnPackageMovingLog.id,
		EdiAsnPackageMovingLog.packageId,
		EdiAsnPackageMovingLog.whouseId,
		EdiAsnPackageMovingLog.carId,
		EdiAsnPackageMovingLog.driverId,
		EdiAsnPackageMovingLog.creatorId,
		EdiAsnPackageMovingLog.createdAt,
		EdiAsnPackageMovingLog.actionType,
		EdiAsnPackageMovingLog.relationId,
		EdiAsnPackage.nr AS ediAsnPackageNr,
		EdiAsnPackage.ediAsnTransportId,
		EdiAsnPackage.ediDeliveryNodeId,
		EdiAsnPackage.quantityperpack,
		EdiAsnPackage.packagetype,
		EdiAsnPackage.quantitypack,
		EdiAsnPackage.partId,
		EdiAsnPackage.orderno,
		EdiAsnPackage.supplierId,
		EdiAsnPackage.milkDate,
		EdiAsnPackage.parentPackageId,
		EdiAsnPackage.state,
		EdiAsnPackage.dataSourceType,
		EdiAsnPackage.dockPointId,
		EdiAsnPackage.delivDate,
		EdiAsnDeliveryNode.delnotenumber,
		DockPoint.CODE AS dockPointCode,
		Part.Nr AS partNr,
		Part.supplierCode,
		Whouse.nr AS whouseNr,
		Whouse.NAME AS whouseName,
		Car.Nr AS carNr,
		USER.phone AS driverPhone,
		USER.NAME AS driverName,
		Creator.NAME AS creatorName,
		Creator.phone AS creatorPhone,
		EdiAsnTransport.transportnumber AS transportNr,
		EdiAsnTransport.arrivaldate AS arrivalDate 
	FROM
		EdiAsnPackageMovingLog
		LEFT OUTER JOIN Whouse ON EdiAsnPackageMovingLog.whouseId = Whouse.id
		LEFT OUTER JOIN Car ON EdiAsnPackageMovingLog.carId = Car.id
		LEFT OUTER JOIN USER ON EdiAsnPackageMovingLog.driverId = USER.id
		LEFT OUTER JOIN USER AS Creator ON EdiAsnPackageMovingLog.creatorId = Creator.id
		LEFT OUTER JOIN EdiAsnPackage ON EdiAsnPackageMovingLog.packageId = EdiAsnPackage.id
		LEFT OUTER JOIN EdiAsnTransport ON EdiAsnPackage.ediAsnTransportId = EdiAsnTransport.id
		LEFT OUTER JOIN EdiAsnDeliveryNode ON EdiAsnPackage.ediDeliveryNodeId = EdiAsnDeliveryNode.id
		LEFT OUTER JOIN DockPoint ON EdiAsnPackage.dockPointId = DockPoint.id
		LEFT OUTER JOIN Part ON EdiAsnPackage.partId = Part.id;
		
	*/

