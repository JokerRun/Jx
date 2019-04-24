--  一、SM收发货报表EdiAsnPackageMovingLogView
CREATE VIEW [dbo].[EdiAsnPackageMovingLogView]
AS
SELECT     dbo.EdiAsnPackageMovingLog.id, dbo.EdiAsnPackageMovingLog.packageId, dbo.EdiAsnPackageMovingLog.whouseId, dbo.EdiAsnPackageMovingLog.carId, dbo.EdiAsnPackageMovingLog.driverId,
                      dbo.EdiAsnPackageMovingLog.creatorId, dbo.EdiAsnPackageMovingLog.createdAt, dbo.EdiAsnPackageMovingLog.actionType, dbo.EdiAsnPackageMovingLog.relationId,
                      dbo.EdiAsnPackage.nr AS ediAsnPackageNr, dbo.EdiAsnPackage.ediAsnTransportId, dbo.EdiAsnPackage.ediDeliveryNodeId, dbo.EdiAsnPackage.quantityperpack, dbo.EdiAsnPackage.packagetype,
                      dbo.EdiAsnPackage.quantitypack, dbo.EdiAsnPackage.partId, dbo.EdiAsnPackage.orderno, dbo.EdiAsnPackage.supplierId, dbo.EdiAsnPackage.milkDate, dbo.EdiAsnPackage.parentPackageId,
                      dbo.EdiAsnPackage.state, dbo.EdiAsnPackage.dataSourceType, dbo.EdiAsnPackage.dockPointId, dbo.EdiAsnPackage.delivDate, dbo.EdiAsnDeliveryNode.delnotenumber,
                      dbo.DockPoint.code AS dockPointCode, dbo.Part.Nr AS partNr, dbo.Part.supplierCode, dbo.Whouse.nr AS whouseNr, dbo.Whouse.name AS whouseName, dbo.Car.Nr AS carNr,
                      dbo.[User].phone AS driverPhone, dbo.[User].name AS driverName, Creator.name AS creatorName, Creator.phone AS creatorPhone, dbo.EdiAsnTransport.transportnumber AS transportNr,
                      dbo.EdiAsnTransport.arrivaldate AS arrivalDate
FROM         dbo.EdiAsnPackageMovingLog LEFT OUTER JOIN
                      dbo.Whouse ON dbo.EdiAsnPackageMovingLog.whouseId = dbo.Whouse.id LEFT OUTER JOIN
                      dbo.Car ON dbo.EdiAsnPackageMovingLog.carId = dbo.Car.id LEFT OUTER JOIN
                      dbo.[User] ON dbo.EdiAsnPackageMovingLog.driverId = dbo.[User].id LEFT OUTER JOIN
                      dbo.[User] AS Creator ON dbo.EdiAsnPackageMovingLog.creatorId = Creator.id LEFT OUTER JOIN
                      dbo.EdiAsnPackage ON dbo.EdiAsnPackageMovingLog.packageId = dbo.EdiAsnPackage.id LEFT OUTER JOIN
                      dbo.EdiAsnTransport ON dbo.EdiAsnPackage.ediAsnTransportId = dbo.EdiAsnTransport.id LEFT OUTER JOIN
                      dbo.EdiAsnDeliveryNode ON dbo.EdiAsnPackage.ediDeliveryNodeId = dbo.EdiAsnDeliveryNode.id LEFT OUTER JOIN
                      dbo.DockPoint ON dbo.EdiAsnPackage.dockPointId = dbo.DockPoint.id LEFT OUTER JOIN
                      dbo.Part ON dbo.EdiAsnPackage.partId = dbo.Part.id
;
-- 二、零配件报表PackageAccountReportView
CREATE VIEW [dbo].[PackageAccountReportView]
AS
SELECT     dbo.EdiAsnDeliveryNode.delnotenumber AS asnDeliveryNodeNr, dbo.EdiAsnTransport.transportnumber AS asnTransportNr, dbo.EdiAsnTransport.arrivaldate AS asnArrivalDate,
                      dbo.EdiAsnPackage.id, dbo.EdiAsnPackage.nr, dbo.EdiAsnPackage.ediAsnTransportId, dbo.EdiAsnPackage.ediDeliveryNodeId, dbo.EdiAsnPackage.internalid, dbo.EdiAsnPackage.parentid,
                      dbo.EdiAsnPackage.quantityperpack, dbo.EdiAsnPackage.tara, dbo.EdiAsnPackage.itemnopackcustomer, dbo.EdiAsnPackage.itemnopacksupplier, dbo.EdiAsnPackage.ownership,
                      dbo.EdiAsnPackage.recycling, dbo.EdiAsnPackage.batchno, dbo.EdiAsnPackage.klt, dbo.EdiAsnPackage.printflag, dbo.EdiAsnPackage.packagetype, dbo.EdiAsnPackage.delnotepositionid,
                      dbo.EdiAsnPackage.quantitypack, dbo.EdiAsnPackage.labelnofrom, dbo.EdiAsnPackage.stacking, dbo.EdiAsnPackage.partId, dbo.EdiAsnPackage.orderno, dbo.EdiAsnPackage.supplierId,
                      dbo.EdiAsnPackage.milkDate, dbo.EdiAsnPackage.parentPackageId, dbo.EdiAsnPackage.parentPathIds, dbo.EdiAsnPackage.state, dbo.EdiAsnPackage.currentWhouseId,
                      dbo.EdiAsnPackage.currentDockPointId, dbo.EdiAsnPackage.currentUserId, dbo.EdiAsnPackage.currentCarId, dbo.EdiAsnPackage.currentCarTrailerId, dbo.EdiAsnPackage.isChecked,
                      dbo.EdiAsnPackage.checkedAt, dbo.EdiAsnPackage.checkUserId, dbo.EdiAsnPackage.checkCarId, dbo.EdiAsnPackage.checkCarTrailerId, dbo.EdiAsnPackage.lastDeliveryPackageRelationId,
                      dbo.EdiAsnPackage.sentAt, dbo.EdiAsnPackage.receivedAt, dbo.EdiAsnPackage.dataSourceType, dbo.EdiAsnPackage.ediAsnPositionId, dbo.EdiAsnPackage.createdAt,
                      dbo.EdiAsnPackage.updatedAt, dbo.EdiAsnPackage.dockPointId, dbo.EdiAsnPackage.delivDate, dbo.Part.Nr AS partNr, dbo.DockPoint.code AS dockPointCode, dbo.Whouse.nr AS whouseNr,
                      dbo.Whouse.name AS whouseName, dbo.Whouse.address AS whouseAddress, dbo.Supplier.name AS supplierName, dbo.Supplier.code AS supplierCode, dbo.Supplier.description AS supplierDesc,
                      dbo.Supplier.address AS supplierAddress, dbo.Supplier.city AS supplierCity, dbo.EdiAsnDeliveryNode.delnotedate, dbo.EdiAsnPackage.isSAPReceived, dbo.EdiAsnPackage.sapReceivedAt,
                      dbo.EdiAsnPackage.receiverId, dbo.Part.kltContent, dbo.Part.kltLength, dbo.Part.kltWidth, dbo.Part.kltHeight, dbo.Part.luContent, dbo.Part.luLength, dbo.Part.luWidth, dbo.Part.luHeight,
                      dbo.Part.grossWeight, dbo.Part.tareWeight, dbo.EdiAsnPackage.totalQty, dbo.EdiAsnTransport.isVerify
FROM         dbo.EdiAsnPackage LEFT OUTER JOIN
                      dbo.Part ON dbo.EdiAsnPackage.partId = dbo.Part.id LEFT OUTER JOIN
                      dbo.EdiAsnDeliveryNode ON dbo.EdiAsnPackage.ediDeliveryNodeId = dbo.EdiAsnDeliveryNode.id LEFT OUTER JOIN
                      dbo.EdiAsnTransport ON dbo.EdiAsnPackage.ediAsnTransportId = dbo.EdiAsnTransport.id LEFT OUTER JOIN
                      dbo.Supplier ON dbo.EdiAsnPackage.supplierId = dbo.Supplier.id LEFT OUTER JOIN
                      dbo.Whouse ON dbo.EdiAsnPackage.currentWhouseId = dbo.Whouse.id LEFT OUTER JOIN
                      dbo.DockPoint ON dbo.EdiAsnPackage.currentDockPointId = dbo.DockPoint.id
;
-- 三、驾驶员提货记录 DriverCheckedRecordDetailView
CREATE VIEW [dbo].[DriverCheckedRecordDetailView]
AS
SELECT     dbo.DriverCheckedRecord.id, dbo.DriverCheckedRecord.deliveryNodeId, dbo.DriverCheckedRecord.deliveryNodeCarId, dbo.DriverCheckedRecord.ediAsnTransportId,
                      dbo.DriverCheckedRecord.realTrayCount, dbo.DriverCheckedRecord.realPackageCount, dbo.DriverCheckedRecord.planTrayCount, dbo.DriverCheckedRecord.planPackageCount,
                      dbo.DriverCheckedRecord.createdAt, dbo.DriverCheckedRecord.creatorId, dbo.[User].nr AS driverNr, dbo.[User].name AS driverName, dbo.[User].phone AS driverPhone,
                      dbo.[User].roleType AS driverRoleType, dbo.Car.Nr AS carNr, dbo.CarTroop.name AS carTroopName, dbo.CarTroop.code AS carTroopCode, dbo.DeliveryNodeCar.carId,
                      dbo.DeliveryNodeCar.carTrailerId, dbo.CarTroop.id AS carTroopId, dbo.[User].id AS driverId, dbo.DeliveryNode.sourceWhouseId, dbo.DeliveryNode.destinationWhouseId,
                      SourceWhouse.nr AS sourceWhouseNr, SourceWhouse.name AS sourceWhouseName, DestinationWhouse.nr AS destinationWhouseNr,
                      DestinationWhouse.name AS destinationWhouseName
FROM         dbo.DriverCheckedRecord LEFT OUTER JOIN
                      dbo.DeliveryNode ON dbo.DriverCheckedRecord.deliveryNodeId = dbo.DeliveryNode.id LEFT OUTER JOIN
                      dbo.DeliveryNodeCar ON dbo.DriverCheckedRecord.deliveryNodeCarId = dbo.DeliveryNodeCar.id LEFT OUTER JOIN
                      dbo.Car ON dbo.DeliveryNodeCar.carId = dbo.Car.id LEFT OUTER JOIN
                      dbo.[User] ON dbo.DeliveryNodeCar.userId = dbo.[User].id LEFT OUTER JOIN
                      dbo.CarTroop ON dbo.[User].carTroopId = dbo.CarTroop.id LEFT OUTER JOIN
                      dbo.Whouse AS SourceWhouse ON SourceWhouse.id = dbo.DeliveryNode.sourceWhouseId LEFT OUTER JOIN
                      dbo.Whouse AS DestinationWhouse ON DestinationWhouse.id = dbo.DeliveryNode.destinationWhouseId

;
-- 四、收货单列表 DeliveryReceivedRecord
CREATE TABLE [dbo].[DeliveryReceivedRecord] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nr] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [carTroopId] int  NULL,
  [driverId] int  NULL,
  [carId] int  NULL,
  [carTrailerId] int  NULL,
  [toId] int  NULL,
  [receivedAt] datetime  NULL,
  [creatorId] int  NULL,
  [receiveType] int  NULL,
  [status] int DEFAULT ((100)) NULL,
  [note] varchar(5000) COLLATE Chinese_PRC_CI_AS  NULL,
  CONSTRAINT [PK_DeliveryReceivedRecord] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY],
  CONSTRAINT [FK_DeliveryReceivedRecord_Whouse] FOREIGN KEY ([toId]) REFERENCES [dbo].[Whouse] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT [FK_DeliveryReceivedRecord_CarTroop] FOREIGN KEY ([carTroopId]) REFERENCES [dbo].[CarTroop] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT [FK_DeliveryReceivedRecord_User] FOREIGN KEY ([driverId]) REFERENCES [dbo].[User] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT [FK_DeliveryReceivedRecord_Car] FOREIGN KEY ([carId]) REFERENCES [dbo].[Car] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT [FK_DeliveryReceivedRecord_Car1] FOREIGN KEY ([carId]) REFERENCES [dbo].[Car] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT [FK_DeliveryReceivedRecord_CarTrailer] FOREIGN KEY ([carTrailerId]) REFERENCES [dbo].[CarTrailer] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT [FK_DeliveryReceivedRecord_Creator] FOREIGN KEY ([creatorId]) REFERENCES [dbo].[User] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[DeliveryReceivedRecord] NOCHECK CONSTRAINT [FK_DeliveryReceivedRecord_Whouse]
GO

ALTER TABLE [dbo].[DeliveryReceivedRecord] SET (LOCK_ESCALATION = TABLE)

;
-- 五、运输报表TransportReportView
CREATE VIEW [dbo].[TransportReportView]
AS
SELECT     dbo.DeliveryReceivedEdiPackageRelation.id, dbo.DeliveryReceivedEdiPackageRelation.deliveryReceivedRecordId, dbo.DeliveryReceivedEdiPackageRelation.ediAsnPackageId,
                      dbo.DeliveryReceivedEdiPackageRelation.fromType, dbo.DeliveryReceivedEdiPackageRelation.fromId, dbo.DeliveryReceivedEdiPackageRelation.sendTime,
                      dbo.DeliveryReceivedEdiPackageRelation.status, dbo.DeliveryReceivedEdiPackageRelation.remark, dbo.DeliveryReceivedRecord.nr AS recordNr, dbo.DeliveryReceivedRecord.carTroopId,
                      dbo.DeliveryReceivedRecord.driverId, dbo.DeliveryReceivedRecord.carId, dbo.DeliveryReceivedRecord.carTrailerId, dbo.DeliveryReceivedRecord.toId, dbo.DeliveryReceivedRecord.receivedAt,
                      dbo.DeliveryReceivedRecord.creatorId, dbo.DeliveryReceivedRecord.receiveType, dbo.DeliveryReceivedRecord.status AS recordStatus, dbo.EdiAsnPackage.nr AS packageNr,
                      dbo.EdiAsnPackage.ediAsnTransportId, dbo.EdiAsnPackage.quantityperpack, dbo.EdiAsnPackage.quantitypack, dbo.EdiAsnPackage.supplierId, dbo.EdiAsnPackage.milkDate,
                      dbo.EdiAsnPackage.parentPackageId, dbo.EdiAsnPackage.dockPointId, dbo.EdiAsnPackage.delivDate, dbo.EdiAsnTransport.transportnumber AS transportNr,
                      dbo.EdiAsnTransport.arrivaldate AS asnArrivalDate, dbo.Car.Nr AS carNr, dbo.Car.carTypeId, dbo.CarType.name AS carTypeName, dbo.CarType.nr AS carTypeNr, Creator.nr AS creatorNr,
                      Creator.name AS creatorName, Creator.phone AS creatorPhone, dbo.[User].nr AS driverNr, dbo.[User].name AS driverName, dbo.[User].phone AS driverPhone, dbo.Whouse.nr AS toWhouseNr,
                      dbo.Whouse.address AS toWhouseAddress, dbo.Supplier.name AS supplierName, dbo.Supplier.code AS supplierCode, dbo.Supplier.description AS supplierDesc,
                      dbo.DockPoint.code AS dockPointCode, dbo.EdiAsnPackage.packagetype, dbo.Part.Nr, dbo.Part.kltContent, dbo.Part.kltLength, dbo.Part.kltWidth, dbo.Part.kltHeight, dbo.Part.luContent,
                      dbo.Part.luLength, dbo.Part.luWidth, dbo.Part.luHeight, dbo.Part.grossWeight, dbo.Part.tareWeight, dbo.EdiAsnPackage.checkedAt
FROM         dbo.DeliveryReceivedEdiPackageRelation LEFT OUTER JOIN
                      dbo.EdiAsnPackage ON dbo.DeliveryReceivedEdiPackageRelation.ediAsnPackageId = dbo.EdiAsnPackage.id LEFT OUTER JOIN
                      dbo.EdiAsnTransport ON dbo.EdiAsnPackage.ediAsnTransportId = dbo.EdiAsnTransport.id LEFT OUTER JOIN
                      dbo.Part ON dbo.EdiAsnPackage.partId = dbo.Part.id LEFT OUTER JOIN
                      dbo.Supplier ON dbo.EdiAsnPackage.supplierId = dbo.Supplier.id LEFT OUTER JOIN
                      dbo.DockPoint ON dbo.EdiAsnPackage.dockPointId = dbo.DockPoint.id LEFT OUTER JOIN
                      dbo.DeliveryReceivedRecord ON dbo.DeliveryReceivedEdiPackageRelation.deliveryReceivedRecordId = dbo.DeliveryReceivedRecord.id LEFT OUTER JOIN
                      dbo.[User] ON dbo.DeliveryReceivedRecord.driverId = dbo.[User].id LEFT OUTER JOIN
                      dbo.[User] AS Creator ON dbo.DeliveryReceivedRecord.creatorId = Creator.id LEFT OUTER JOIN
                      dbo.Whouse ON dbo.DeliveryReceivedRecord.toId = dbo.Whouse.id LEFT OUTER JOIN
                      dbo.Car ON dbo.DeliveryReceivedRecord.carId = dbo.Car.id LEFT OUTER JOIN
                      dbo.CarType ON dbo.Car.carTypeId = dbo.CarType.id

