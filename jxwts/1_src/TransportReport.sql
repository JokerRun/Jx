SELECT
	dbo.DeliveryReceivedEdiPackageRelation.id,
	dbo.DeliveryReceivedEdiPackageRelation.deliveryReceivedRecordId,
	dbo.DeliveryReceivedEdiPackageRelation.ediAsnPackageId,
	dbo.DeliveryReceivedEdiPackageRelation.fromType,
	dbo.DeliveryReceivedEdiPackageRelation.fromId,
	dbo.DeliveryReceivedEdiPackageRelation.sendTime,
	dbo.DeliveryReceivedEdiPackageRelation.STATUS,
	dbo.DeliveryReceivedEdiPackageRelation.remark,
	dbo.DeliveryReceivedRecord.nr AS recordNr,
	dbo.DeliveryReceivedRecord.carTroopId,
	dbo.DeliveryReceivedRecord.driverId,
	dbo.DeliveryReceivedRecord.carId,
	dbo.DeliveryReceivedRecord.carTrailerId,
	dbo.DeliveryReceivedRecord.toId,
	dbo.DeliveryReceivedRecord.receivedAt,
	dbo.DeliveryReceivedRecord.creatorId,
	dbo.DeliveryReceivedRecord.receiveType,
	dbo.DeliveryReceivedRecord.STATUS AS recordStatus,
	dbo.EdiAsnPackage.nr AS packageNr,
	dbo.EdiAsnPackage.ediAsnTransportId,
	dbo.EdiAsnPackage.quantityperpack,
	dbo.EdiAsnPackage.quantitypack,
	dbo.EdiAsnPackage.supplierId,
	dbo.EdiAsnPackage.milkDate,
	dbo.EdiAsnPackage.parentPackageId,
	dbo.EdiAsnPackage.dockPointId,
	dbo.EdiAsnPackage.delivDate,
	dbo.EdiAsnTransport.transportnumber AS transportNr,
	dbo.EdiAsnTransport.arrivaldate AS asnArrivalDate,
	dbo.Car.Nr AS carNr,
	dbo.Car.carTypeId,
	dbo.CarType.NAME AS carTypeName,
	dbo.CarType.nr AS carTypeNr,
	Creator.nr AS creatorNr,
	Creator.NAME AS creatorName,
	Creator.phone AS creatorPhone,
	dbo.[ USER ].nr AS driverNr,
	dbo.[ USER ].NAME AS driverName,
	dbo.[ USER ].phone AS driverPhone,
	dbo.Whouse.nr AS toWhouseNr,
	dbo.Whouse.address AS toWhouseAddress,
	dbo.Supplier.NAME AS supplierName,
	dbo.Supplier.CODE AS supplierCode,
	dbo.Supplier.description AS supplierDesc,
	dbo.DockPoint.CODE AS dockPointCode,
	dbo.EdiAsnPackage.packagetype,
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
	dbo.EdiAsnPackage.checkedAt
FROM
	dbo.DeliveryReceivedEdiPackageRelation
	LEFT OUTER JOIN dbo.EdiAsnPackage ON dbo.DeliveryReceivedEdiPackageRelation.ediAsnPackageId = dbo.EdiAsnPackage.id
	LEFT OUTER JOIN dbo.EdiAsnTransport ON dbo.EdiAsnPackage.ediAsnTransportId = dbo.EdiAsnTransport.id
	LEFT OUTER JOIN dbo.Part ON dbo.EdiAsnPackage.partId = dbo.Part.id
	LEFT OUTER JOIN dbo.Supplier ON dbo.EdiAsnPackage.supplierId = dbo.Supplier.id
	LEFT OUTER JOIN dbo.DockPoint ON dbo.EdiAsnPackage.dockPointId = dbo.DockPoint.id
	LEFT OUTER JOIN dbo.DeliveryReceivedRecord ON dbo.DeliveryReceivedEdiPackageRelation.deliveryReceivedRecordId = dbo.DeliveryReceivedRecord.id
	LEFT OUTER JOIN dbo.[ USER ] ON dbo.DeliveryReceivedRecord.driverId = dbo.[ USER ].id
	LEFT OUTER JOIN dbo.[ USER ] AS Creator ON dbo.DeliveryReceivedRecord.creatorId = Creator.id
	LEFT OUTER JOIN dbo.Whouse ON dbo.DeliveryReceivedRecord.toId = dbo.Whouse.id
	LEFT OUTER JOIN dbo.Car ON dbo.DeliveryReceivedRecord.carId = dbo.Car.id
	LEFT OUTER JOIN dbo.CarType ON dbo.Car.carTypeId = dbo.CarType.id