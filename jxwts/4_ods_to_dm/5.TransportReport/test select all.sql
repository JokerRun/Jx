SELECT
*
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

where
dbo.EdiAsnPackage.nr in ('S0015663890170448989''M0015675751170433664', 'S0015675751170433665', 'S0015675751170433666', 'S0015675751170433667', 'S0015675751170433668', 'S0015675751170433669', 'M0015675751170433670', 'M0015675751170433671', 'S0015675751170433672', 'S0015675751170433673', 'S0015675751170433674')

-- GROUP BY
-- 	dbo.DeliveryReceivedEdiPackageRelation.nr,
-- 	dbo.EdiAsnTransport.transportnumber

