USE JXWTSDb;
SELECT
--	dbo.EdiAsnPackageMovingLog.id,
--	dbo.EdiAsnPackageMovingLog.packageId,
--	dbo.EdiAsnPackageMovingLog.whouseId,
--	dbo.EdiAsnPackageMovingLog.carId,
--	dbo.EdiAsnPackageMovingLog.driverId,
--	dbo.EdiAsnPackageMovingLog.creatorId,
--	dbo.EdiAsnPackageMovingLog.relationId,
--	dbo.EdiAsnPackage.ediAsnTransportId,
--	dbo.EdiAsnPackage.ediDeliveryNodeId,
--	dbo.EdiAsnPackage.packagetype,
--	dbo.EdiAsnPackage.quantitypack,
--	dbo.EdiAsnPackage.partId,
--	dbo.EdiAsnPackage.orderno,
--	dbo.EdiAsnPackage.supplierId,
--	dbo.EdiAsnPackage.milkDate,
--	dbo.EdiAsnPackage.parentPackageId,
--	dbo.EdiAsnPackage.state,
--	dbo.EdiAsnPackage.dataSourceType,
--	dbo.EdiAsnPackage.dockPointId,
--	dbo.EdiAsnPackage.delivDate,
--	Creator.phone AS creatorPhone,
--	dbo.Whouse.name AS whouseName,

	dbo.Whouse.nr AS whouseNr, --  操作仓库：[需计算]如果操作类型是前端扫描，值为**供应商描述(descript)，其它全部使用视图中的whouseNr
	dbo.EdiAsnPackageMovingLog.actionType, -- ？操作类型？
-- 中转入库[Description("中转入库")]TransferEnter = 1,
-- 中转发出[Description("中转发出")]TransferSend = 2,
-- 客户收货[Description("BBAC收货")]ClientReceive = 3,
-- 手动交付[Description("手动交付")]ManualDelivery = 4,
-- 司机盲扫发出[Description("前端扫描")]DriverSend = 9

	Creator.name AS creatorName, -- 操作员
	dbo.Car.Nr AS carNr, -- 运输车辆
	dbo.[User].name AS driverName, -- 司机
	dbo.[User].phone AS driverPhone, -- 司机联系方式

	dbo.EdiAsnTransport.transportnumber AS transportNr,-- 运输单编号
	dbo.EdiAsnDeliveryNode.delnotenumber,--  发货单编号
	dbo.EdiAsnPackage.nr AS ediAsnPackageNr,-- 标签号
	dbo.Part.Nr AS partNr, -- 零件号
	dbo.EdiAsnPackage.quantityperpack, -- 件数
	dbo.Part.supplierCode, --  供应商代码
	dbo.DockPoint.code AS dockPointCode, --  卸货口
	dbo.EdiAsnTransport.arrivaldate AS arrivalDate,  -- ASN到货时间
	dbo.EdiAsnPackageMovingLog.createdAt-- 创建时间
FROM
	dbo.EdiAsnPackageMovingLog
	-- EdiAsnPackageMovingLog 关联来源
LEFT OUTER JOIN dbo.Whouse ON dbo.EdiAsnPackageMovingLog.whouseId = dbo.Whouse.id
LEFT OUTER JOIN dbo.Car ON dbo.EdiAsnPackageMovingLog.carId = dbo.Car.id
LEFT OUTER JOIN dbo.[User] ON dbo.EdiAsnPackageMovingLog.driverId = dbo.[User].id
LEFT OUTER JOIN dbo.[User] AS Creator ON dbo.EdiAsnPackageMovingLog.creatorId = Creator.id

	-- EdiAsnPackage 关联来源
LEFT OUTER JOIN dbo.EdiAsnPackage ON dbo.EdiAsnPackageMovingLog.packageId = dbo.EdiAsnPackage.id

LEFT OUTER JOIN dbo.EdiAsnTransport ON dbo.EdiAsnPackage.ediAsnTransportId = dbo.EdiAsnTransport.id
LEFT OUTER JOIN dbo.EdiAsnDeliveryNode ON dbo.EdiAsnPackage.ediDeliveryNodeId = dbo.EdiAsnDeliveryNode.id
LEFT OUTER JOIN dbo.DockPoint ON dbo.EdiAsnPackage.dockPointId = dbo.DockPoint.id
LEFT OUTER JOIN dbo.Part ON dbo.EdiAsnPackage.partId = dbo.Part.id




