


SELECT

-- 佳轩承运单号：recordNr
	ods_jxwts.DeliveryReceivedRecord.nr AS recordNr,
-- ASN运输单号：transportNr
	ods_jxwts.EdiAsnTransport.transportnumber AS transportNr,
-- edi信息
	min(ods_jxwts.EdiAsnPackage.nr) AS packageNr,
-- 司机扫描时间：checkedAt
	min(ods_jxwts.EdiAsnPackage.checkedAt) ,
-- 供应商：supplierDesc
	min(ods_jxwts.Supplier.description )AS supplierDesc,
-- 卸货口：dockPointCode
	min(ods_jxwts.DockPoint.CODE )AS dockPointCode,

	min(case ods_jxwts.DeliveryReceivedEdiPackageRelation.fromType
	when 1 then '供应商'
	when 2 then '自有仓库'
	else '' end )as fromTypeStr,

	-- ods_jxwts.DeliveryReceivedEdiPackageRelation.fromId,

	min(case DeliveryReceivedEdiPackageRelation.fromType
	when 1 then from_house.nr
	when 2 then ods_jxwts.Supplier.code
	else ''	end )as fromNr,
	min(ods_jxwts.DeliveryReceivedEdiPackageRelation.sendTime),


	-- 运输车队：通过carTroopId到carTroop表中查询name
	min(ods_jxwts.cartroop.name) as cartrropName,

	-- 车挂号：通过carTrailerId到carTrailer表中查询nr
	min(ods_jxwts.cartrailer.nr) as carTrailerNr,


-- 收货时间：receivedAt
	min(ods_jxwts.DeliveryReceivedRecord.receivedAt),
	-- 运输车辆：carNr
	min(ods_jxwts.Car.Nr) AS carNr,
	-- 车型：carTypeNr
	min(ods_jxwts.CarType.nr) AS carTypeNr,
	-- 目的地：toWhouseNr
	min(to_house.nr) AS toWhouseNr,
-- 司机：driverName
	min(ods_jxwts.user.NAME) AS driverName,
-- 联系方式：driverPhone
	min(ods_jxwts.user.phone) AS driverPhone,
    sum(case  ods_jxwts.ediasnpackage.packagetype when 1 then 1 else 0 end ) as trayCount,
    sum(case  ods_jxwts.ediasnpackage.packagetype when 3 then 1 else 0 end ) as singlePackageCount,
    sum(ROUND((CASE
        WHEN ods_jxwts.ediasnpackage.packagetype = 1 THEN ods_jxwts.part.lulength * ods_jxwts.part.luwidth * ods_jxwts.part.luheight
        WHEN ods_jxwts.ediasnpackage.packagetype = 3 THEN ods_jxwts.part.kltlength * ods_jxwts.part.kltwidth * ods_jxwts.part.kltheight
        ELSE 0.0 END )/1000000000,4))as valumem
# 	ROUND((CASE
# 		WHEN ods_jxwts.ediasnpackage.packagetype = 1 THEN ods_jxwts.part.lulength * ods_jxwts.part.luwidth * ods_jxwts.part.luheight
# 		WHEN ods_jxwts.ediasnpackage.packagetype = 3 THEN ods_jxwts.part.kltlength * ods_jxwts.part.kltwidth * ods_jxwts.part.kltheight
# 		ELSE
# 			0.0
# 		END  )/1000000000,1)as valumem ,
FROM
	ods_jxwts.DeliveryReceivedEdiPackageRelation
	LEFT OUTER JOIN ods_jxwts.Whouse from_house ON ods_jxwts.DeliveryReceivedEdiPackageRelation.fromId = from_house.id

	-- 来自edi数据
	LEFT OUTER JOIN ods_jxwts.EdiAsnPackage ON ods_jxwts.DeliveryReceivedEdiPackageRelation.ediAsnPackageId = ods_jxwts.EdiAsnPackage.id
	LEFT OUTER JOIN ods_jxwts.EdiAsnTransport ON ods_jxwts.EdiAsnPackage.ediAsnTransportId = ods_jxwts.EdiAsnTransport.id
	LEFT OUTER JOIN ods_jxwts.Part ON ods_jxwts.EdiAsnPackage.partId = ods_jxwts.Part.id
	LEFT OUTER JOIN ods_jxwts.Supplier ON ods_jxwts.EdiAsnPackage.supplierId = ods_jxwts.Supplier.id
	LEFT OUTER JOIN ods_jxwts.DockPoint ON ods_jxwts.EdiAsnPackage.dockPointId = ods_jxwts.DockPoint.id
	-- 来自DeliveryReceivedRecord数据
	LEFT OUTER JOIN ods_jxwts.DeliveryReceivedRecord ON ods_jxwts.DeliveryReceivedEdiPackageRelation.deliveryReceivedRecordId = ods_jxwts.DeliveryReceivedRecord.id
	LEFT OUTER JOIN ods_jxwts.user ON ods_jxwts.DeliveryReceivedRecord.driverId = ods_jxwts.user.id
	LEFT OUTER JOIN ods_jxwts.user AS Creator ON ods_jxwts.DeliveryReceivedRecord.creatorId = Creator.id
--	LEFT OUTER JOIN ods_jxwts.Whouse as from_house ON ods_jxwts.DeliveryReceivedRecord.toId = ods_jxwts.Whouse.id
	LEFT OUTER JOIN ods_jxwts.Whouse to_house ON ods_jxwts.DeliveryReceivedRecord.toId = to_house.id

	LEFT OUTER JOIN ods_jxwts.Car ON ods_jxwts.DeliveryReceivedRecord.carId = ods_jxwts.Car.id
	LEFT OUTER JOIN ods_jxwts.CarType ON ods_jxwts.Car.carTypeId = ods_jxwts.CarType.id
	LEFT OUTER JOIN ods_jxwts.cartrailer on ods_jxwts.cartrailer.id = ods_jxwts.DeliveryReceivedRecord.carTrailerId
	LEFT OUTER JOIN ods_jxwts.cartroop ON ods_jxwts.cartroop.id = ods_jxwts.DeliveryReceivedRecord.carTroopId
GROUP BY
	ods_jxwts.DeliveryReceivedRecord.nr,
	ods_jxwts.EdiAsnTransport.transportnumber

