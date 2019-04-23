SELECT top 6
--	dbo.EdiAsnPackage.ediAsnTransportId,
--	dbo.EdiAsnPackage.quantityperpack,
--	dbo.EdiAsnPackage.quantitypack,
--	dbo.EdiAsnPackage.supplierId,
--	dbo.EdiAsnPackage.milkDate,
--	dbo.EdiAsnPackage.parentPackageId,
--	dbo.EdiAsnPackage.dockPointId,
--	dbo.EdiAsnPackage.delivDate,
--	dbo.EdiAsnPackage.packagetype,
--	dbo.EdiAsnTransport.arrivaldate AS asnArrivalDate,
--	dbo.Supplier.NAME AS supplierName,
--	dbo.Supplier.CODE AS supplierCode,
--	-- 关系表信息
--	dbo.DeliveryReceivedEdiPackageRelation.id,
--	dbo.DeliveryReceivedEdiPackageRelation.deliveryReceivedRecordId,
--	dbo.DeliveryReceivedEdiPackageRelation.ediAsnPackageId,
--	dbo.DeliveryReceivedEdiPackageRelation.STATUS,
--	dbo.DeliveryReceivedEdiPackageRelation.remark,
--	dbo.DeliveryReceivedRecord.creatorId,
--	dbo.DeliveryReceivedRecord.receiveType,
--	dbo.DeliveryReceivedRecord.STATUS AS recordStatus,
--	dbo.Car.carTypeId,
--	dbo.CarType.NAME AS carTypeName,
--	dbo.DeliveryReceivedRecord.driverId,
--	dbo.DeliveryReceivedRecord.carId,
--	dbo.DeliveryReceivedRecord.toId,
--	Creator.nr AS creatorNr,
--	Creator.NAME AS creatorName,
--	Creator.phone AS creatorPhone,




-- 展示字段： 业务逻辑：承运单的运输托数、箱数、体积
-- NO.：[无]

-- edi信息
	dbo.EdiAsnPackage.nr AS packageNr,
-- 司机扫描时间：checkedAt
	dbo.EdiAsnPackage.checkedAt ,
-- ASN运输单号：transportNr
	dbo.EdiAsnTransport.transportnumber AS transportNr,
-- trayCount = tg.Count(s => s.packagetype == (int)PackageType.M || s.packagetype == (int)PackageType.G),
-- 托数：trayCount，计算值，见逻辑代码1
-- 箱数：singlePackageCount，计算值，见逻辑代码1
-- singlePackageCount = tg.Count(s => s.packagetype == (int)PackageType.S && s.parentPackageId == null),
-- packageCount = tg.Count(s => s.packagetype == (int)PackageType.S),
-- 体积：totalValumeMRound，计算值，见逻辑代码1
	dbo.Part.Nr,
	dbo.Part.kltContent,
	dbo.Part.kltLength,
	dbo.Part.kltWidth,
	dbo.Part.kltHeight,
	dbo.Part.luContent,
	dbo.Part.luLength,
	dbo.Part.luWidth,
	dbo.Part.luHeight,
	dbo.Part.grossWeight,
	dbo.Part.tareWeight,
    dbo.ediasnpackage.packagetype as packagetype,
--     dbo.ediasnpackage.packagetype as packagetype,
--     sum(case  dbo.ediasnpackage.packagetype when 1 then 1 else 0 end ) as trayCount,
--     sum(case  dbo.ediasnpackage.packagetype when 3 then 1 else 0 end ) as singlePackageCount,
--     sum(ROUND((CASE
--         WHEN dbo.ediasnpackage.packagetype = 1 THEN dbo.part.lulength * dbo.part.luwidth * dbo.part.luheight
--         WHEN dbo.ediasnpackage.packagetype = 3 THEN dbo.part.kltlength * dbo.part.kltwidth * dbo.part.kltheight
--         ELSE 0.0 END )/1000000000,1))as valumem ,
	ROUND((CASE
		WHEN dbo.ediasnpackage.packagetype = 1 THEN dbo.part.lulength * dbo.part.luwidth * dbo.part.luheight
		WHEN dbo.ediasnpackage.packagetype = 3 THEN dbo.part.kltlength * dbo.part.kltwidth * dbo.part.kltheight
		ELSE
			0.0
		END  )/1000000000,1)as valumem ,

-- 供应商：supplierDesc
	dbo.Supplier.description AS supplierDesc,
-- 卸货口：dockPointCode
	dbo.DockPoint.CODE AS dockPointCode,


-- 来源地：fromNr，见逻辑代码2
-- foreach (var model in qs)
--             {
--                 if (model.fromType.Value == (int)ReceivedRecordSourceType.OwnWhouse)
--                 {
--                     var from = whouseDic[model.fromId.Value];
--                     model.fromNr = from.nr;
--                 }
--                 else if (model.fromType.Value == (int)ReceivedRecordSourceType.SupplierWhouse)
--                 {
--                     var from = supplierDic[model.fromId.Value];
--                     model.fromNr = from.code;
--                 }
--                 models.Add(model);
--             }


-- 来源地类型：fromTypeStr, fromType对应枚举表，ReceivedRecordSourceType，枚举表计算
-- 1.2.1	ReceivedRecordSourceType：接收记录来源类型
-- 供应商[Description("供应商")]SupplierWhouse = 1,
-- 自有仓库[Description("自有仓库")]OwnWhouse = 2,
 	-- dbo.DeliveryReceivedEdiPackageRelation.fromType,
	case dbo.DeliveryReceivedEdiPackageRelation.fromType
	when 1 then '供应商'
	when 2 then '自有仓库'
	else '' end as fromTypeStr,

	-- dbo.DeliveryReceivedEdiPackageRelation.fromId,

	case DeliveryReceivedEdiPackageRelation.fromType
	when 1 then from_house.nr
	when 2 then dbo.Supplier.code
	else ''	end as fromNr,
	dbo.DeliveryReceivedEdiPackageRelation.sendTime,

	-- DeliveryReceivedRecord 信息

	-- 佳轩承运单号：recordNr
	dbo.DeliveryReceivedRecord.nr AS recordNr,
	-- 运输车队：通过carTroopId到carTroop表中查询name
	-- dbo.DeliveryReceivedRecord.carTroopId,
	dbo.cartroop.name as cartrropName,

	-- 车挂号：通过carTrailerId到carTrailer表中查询nr
	--dbo.DeliveryReceivedRecord.carTrailerId,
	dbo.cartrailer.nr as carTrailerNr,


-- 收货时间：receivedAt
	dbo.DeliveryReceivedRecord.receivedAt,
	-- 运输车辆：carNr
	dbo.Car.Nr AS carNr,
	-- 车型：carTypeNr
	dbo.CarType.nr AS carTypeNr,
	-- 目的地：toWhouseNr
	to_house.nr AS toWhouseNr,
	-- dbo.Whouse.address AS toWhouseAddress,

	dbo.[User].nr AS driverNr,
-- 司机：driverName
	dbo.[User].NAME AS driverName,
-- 联系方式：driverPhone
	dbo.[User].phone AS driverPhone
FROM
	dbo.DeliveryReceivedEdiPackageRelation
	LEFT OUTER JOIN dbo.Whouse from_house ON dbo.DeliveryReceivedEdiPackageRelation.fromId = from_house.id

	-- 来自edi数据
	LEFT OUTER JOIN dbo.EdiAsnPackage ON dbo.DeliveryReceivedEdiPackageRelation.ediAsnPackageId = dbo.EdiAsnPackage.id
	LEFT OUTER JOIN dbo.EdiAsnTransport ON dbo.EdiAsnPackage.ediAsnTransportId = dbo.EdiAsnTransport.id
	LEFT OUTER JOIN dbo.Part ON dbo.EdiAsnPackage.partId = dbo.Part.id
	LEFT OUTER JOIN dbo.Supplier ON dbo.EdiAsnPackage.supplierId = dbo.Supplier.id
	LEFT OUTER JOIN dbo.DockPoint ON dbo.EdiAsnPackage.dockPointId = dbo.DockPoint.id
	-- 来自DeliveryReceivedRecord数据
	LEFT OUTER JOIN dbo.DeliveryReceivedRecord ON dbo.DeliveryReceivedEdiPackageRelation.deliveryReceivedRecordId = dbo.DeliveryReceivedRecord.id
	LEFT OUTER JOIN dbo.[User] ON dbo.DeliveryReceivedRecord.driverId = dbo.[User].id
	LEFT OUTER JOIN dbo.[User] AS Creator ON dbo.DeliveryReceivedRecord.creatorId = Creator.id
--	LEFT OUTER JOIN dbo.Whouse as from_house ON dbo.DeliveryReceivedRecord.toId = dbo.Whouse.id
	LEFT OUTER JOIN dbo.Whouse to_house ON dbo.DeliveryReceivedRecord.toId = to_house.id

	LEFT OUTER JOIN dbo.Car ON dbo.DeliveryReceivedRecord.carId = dbo.Car.id
	LEFT OUTER JOIN dbo.CarType ON dbo.Car.carTypeId = dbo.CarType.id
	LEFT OUTER JOIN dbo.cartrailer on dbo.cartrailer.id = dbo.DeliveryReceivedRecord.carTrailerId
	LEFT OUTER JOIN dbo.cartroop ON dbo.cartroop.id = dbo.DeliveryReceivedRecord.carTroopId



--
-- GROUP BY
-- 	dbo.DeliveryReceivedRecord.nr,
-- 	dbo.EdiAsnTransport.transportnumber

