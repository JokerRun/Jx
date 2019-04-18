DROP VIEW if exists ods_jxwts.packageaccountreportview;
    
    
CREATE VIEW ods_jxwts.packageaccountreportview
AS
SELECT     ods_jxwts.EdiAsnDeliveryNode.delnotenumber AS asnDeliveryNodeNr, ods_jxwts.EdiAsnTransport.transportnumber AS asnTransportNr, ods_jxwts.EdiAsnTransport.arrivaldate AS asnArrivalDate, 
                      ods_jxwts.EdiAsnPackage.id, ods_jxwts.EdiAsnPackage.nr, ods_jxwts.EdiAsnPackage.ediAsnTransportId, ods_jxwts.EdiAsnPackage.ediDeliveryNodeId, ods_jxwts.EdiAsnPackage.internalid, ods_jxwts.EdiAsnPackage.parentid, 
                      ods_jxwts.EdiAsnPackage.quantityperpack, ods_jxwts.EdiAsnPackage.tara, ods_jxwts.EdiAsnPackage.itemnopackcustomer, ods_jxwts.EdiAsnPackage.itemnopacksupplier, ods_jxwts.EdiAsnPackage.ownership, 
                      ods_jxwts.EdiAsnPackage.recycling, ods_jxwts.EdiAsnPackage.batchno, ods_jxwts.EdiAsnPackage.klt, ods_jxwts.EdiAsnPackage.printflag, ods_jxwts.EdiAsnPackage.packagetype, ods_jxwts.EdiAsnPackage.delnotepositionid, 
                      ods_jxwts.EdiAsnPackage.quantitypack, ods_jxwts.EdiAsnPackage.labelnofrom, ods_jxwts.EdiAsnPackage.stacking, ods_jxwts.EdiAsnPackage.partId, ods_jxwts.EdiAsnPackage.orderno, ods_jxwts.EdiAsnPackage.supplierId, 
                      ods_jxwts.EdiAsnPackage.milkDate, ods_jxwts.EdiAsnPackage.parentPackageId, ods_jxwts.EdiAsnPackage.parentPathIds, ods_jxwts.EdiAsnPackage.state, ods_jxwts.EdiAsnPackage.currentWhouseId, 
                      ods_jxwts.EdiAsnPackage.currentDockPointId, ods_jxwts.EdiAsnPackage.currentUserId, ods_jxwts.EdiAsnPackage.currentCarId, ods_jxwts.EdiAsnPackage.currentCarTrailerId, ods_jxwts.EdiAsnPackage.isChecked, 
                      ods_jxwts.EdiAsnPackage.checkedAt, ods_jxwts.EdiAsnPackage.checkUserId, ods_jxwts.EdiAsnPackage.checkCarId, ods_jxwts.EdiAsnPackage.checkCarTrailerId, ods_jxwts.EdiAsnPackage.lastDeliveryPackageRelationId, 
                      ods_jxwts.EdiAsnPackage.sentAt, ods_jxwts.EdiAsnPackage.receivedAt, ods_jxwts.EdiAsnPackage.dataSourceType, ods_jxwts.EdiAsnPackage.ediAsnPositionId, ods_jxwts.EdiAsnPackage.createdAt, 
                      ods_jxwts.EdiAsnPackage.updatedAt, ods_jxwts.EdiAsnPackage.dockPointId, ods_jxwts.EdiAsnPackage.delivDate, ods_jxwts.Part.Nr AS partNr, ods_jxwts.DockPoint.code AS dockPointCode, ods_jxwts.Whouse.nr AS whouseNr, 
                      ods_jxwts.Whouse.name AS whouseName, ods_jxwts.Whouse.address AS whouseAddress, ods_jxwts.Supplier.name AS supplierName, ods_jxwts.Supplier.code AS supplierCode, ods_jxwts.Supplier.description AS supplierDesc, 
                      ods_jxwts.Supplier.address AS supplierAddress, ods_jxwts.Supplier.city AS supplierCity, ods_jxwts.EdiAsnDeliveryNode.delnotedate, ods_jxwts.EdiAsnPackage.isSAPReceived, ods_jxwts.EdiAsnPackage.sapReceivedAt, 
                      ods_jxwts.EdiAsnPackage.receiverId, ods_jxwts.Part.kltContent, ods_jxwts.Part.kltLength, ods_jxwts.Part.kltWidth, ods_jxwts.Part.kltHeight, ods_jxwts.Part.luContent, ods_jxwts.Part.luLength, ods_jxwts.Part.luWidth, ods_jxwts.Part.luHeight, 
                      ods_jxwts.Part.grossWeight, ods_jxwts.Part.tareWeight, ods_jxwts.EdiAsnPackage.totalQty, ods_jxwts.EdiAsnTransport.isVerify
FROM         ods_jxwts.EdiAsnPackage LEFT OUTER JOIN
                      ods_jxwts.Part ON ods_jxwts.EdiAsnPackage.partId = ods_jxwts.Part.id LEFT OUTER JOIN
                      ods_jxwts.EdiAsnDeliveryNode ON ods_jxwts.EdiAsnPackage.ediDeliveryNodeId = ods_jxwts.EdiAsnDeliveryNode.id LEFT OUTER JOIN
                      ods_jxwts.EdiAsnTransport ON ods_jxwts.EdiAsnPackage.ediAsnTransportId = ods_jxwts.EdiAsnTransport.id LEFT OUTER JOIN
                      ods_jxwts.Supplier ON ods_jxwts.EdiAsnPackage.supplierId = ods_jxwts.Supplier.id LEFT OUTER JOIN
                      ods_jxwts.Whouse ON ods_jxwts.EdiAsnPackage.currentWhouseId = ods_jxwts.Whouse.id LEFT OUTER JOIN
                      ods_jxwts.DockPoint ON ods_jxwts.EdiAsnPackage.currentDockPointId = ods_jxwts.DockPoint.id
;
