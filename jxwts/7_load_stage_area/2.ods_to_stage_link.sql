insert into stage_area.stage_edi_package
SELECT
 @rownum := @rownum + 1 AS load_seq,
 md5( CONCAT_WS( ',', package.nr,position.positionId,  deliverynode.delnotenumber, transport.transportnumber ) ) AS l_package_hk,
 '${load_date}' AS load_date,
 'erp.wctz.package' AS record_source,
 md5(
 CONCAT_WS(
 ',',
 package.nr,
 package.ediAsnTransportId,
 package.ediDeliveryNodeId,
 package.internalid,
 package.parentid,
 package.quantityperpack,
 package.tara,
 package.itemnopackcustomer,
 package.itemnopacksupplier,
 package.ownership,
 package.recycling,
 package.batchno,
 package.klt,
 package.printflag,
 package.packagetype,
 package.delnotepositionid,
 package.quantitypack,
 package.labelnofrom,
 package.stacking,
 package.partId,
 package.orderno,
 package.supplierId,
 package.milkDate,
 package.parentPackageId,
 package.parentPathIds,
 package.state,
 package.currentWhouseId,
 package.currentDockPointId,
 package.currentUserId,
 package.currentCarId,
 package.currentCarTrailerId,
 package.isChecked,
 package.checkedAt,
 package.checkUserId,
 package.checkCarId,
 package.checkCarTrailerId,
 package.lastDeliveryPackageRelationId,
 package.sentAt,
 package.receivedAt,
 package.dataSourceType,
 package.ediAsnPositionId,
 package.createdAt,
 package.updatedAt,
 package.dockPointId,
 package.delivDate,
 package.isSAPReceived,
 package.sapReceivedAt,
 package.receiverId,
 package.totalQty,
 package.id
 )
 ) AS hash_diff,
 md5( package.nr ) AS h_package_hk,
 md5( position.positionId ) AS h_position_hk,
 md5( deliverynode.delnotenumber ) AS h_delivery_node_hk,
 md5( transport.transportnumber ) AS h_transport_hk,
 package.nr,
 package.ediAsnTransportId,
 package.ediDeliveryNodeId,
 package.internalid,
 package.parentid,
 package.quantityperpack,
 package.tara,
 package.itemnopackcustomer,
 package.itemnopacksupplier,
 package.ownership,
 package.recycling,
 package.batchno,
 package.klt,
 package.printflag,
 package.packagetype,
 package.delnotepositionid,
 package.quantitypack,
 package.labelnofrom,
 package.stacking,
 package.partId,
 package.orderno,
 package.supplierId,
 package.milkDate,
 package.parentPackageId,
 package.parentPathIds,
 package.state,
 package.currentWhouseId,
 package.currentDockPointId,
 package.currentUserId,
 package.currentCarId,
 package.currentCarTrailerId,
 package.isChecked,
 package.checkedAt,
 package.checkUserId,
 package.checkCarId,
 package.checkCarTrailerId,
 package.lastDeliveryPackageRelationId,
 package.sentAt,
 package.receivedAt,
 package.dataSourceType,
 package.ediAsnPositionId,
 package.createdAt,
 package.updatedAt,
 package.dockPointId,
 package.delivDate,
 package.isSAPReceived,
 package.sapReceivedAt,
 package.receiverId,
 package.totalQty,
 package.id
FROM
 ( SELECT @rownum := 0 ) r,
 ods_jxwts.ediasnpackage package
 LEFT JOIN ods_jxwts.ediasntransport transport ON package.ediasntransportId = transport.id
 LEFT JOIN ods_jxwts.ediasndeliverynode deliverynode ON package.ediDeliveryNodeId = deliverynode.id
 LEFT JOIN ods_jxwts.ediasnposition position ON package.delnotepositionid = position.id

;

insert into stage_area.stage_edi_package_moving_log
SELECT
 @rownum := @rownum + 1 AS load_seq,
 md5( CONCAT_WS( ',',package.nr,position.positionId,delivery.delnotenumber,transport.transportnumber,warehouse.nr,car.Nr,us.nr,user.nr) ) AS l_package_moving_log_hk,
 '${load_date}' AS load_date,
 'erp.wctz.package' AS record_source,
 md5(
 CONCAT_WS(',',moving.packageId,moving.whouseId,moving.carId,moving.driverId,moving.creatorId,moving.createdAt,moving.actionType,moving.relationId,moving.id)) AS hash_diff,
 moving.id as package_moving_log_id,
 md5( package.nr) AS h_package_hk,
 md5( position.positionId) AS h_position_hk,
 md5( delivery.delnotenumber) AS h_delivery_note_hk,
 md5( transport.transportnumber) AS h_transport_hk,
 md5( warehouse.nr) AS h_whouse_hk,
 md5( car.Nr ) AS h_car_hk,
 md5( us.nr ) AS h_driver_hk,
 md5( user.nr ) AS h_creator_hk,
 moving.packageId,moving.whouseId,moving.carId,moving.driverId,moving.creatorId,moving.createdAt,moving.actionType,moving.relationId,moving.id
FROM
 ( SELECT @rownum := 0 ) r,
 ods_jxwts.ediasnpackagemovinglog moving
 left join ods_jxwts.ediasnpackage package on moving.packageId=package.id
 left join ods_jxwts.whouse warehouse on moving.whouseId=warehouse.id
 left join ods_jxwts.car car on moving.carId=car.id
 left join ods_jxwts.user us on moving.driverId=us.id
 left join ods_jxwts.user user on moving.creatorId=user.id
 left join ods_jxwts.deliveryreceivededipackagerelation relation on moving.relationId=relation.id
 left join ods_jxwts.ediasntransport transport on package.ediAsnTransportId=transport.id
 left join ods_jxwts.ediasndeliverynode delivery on package.ediDeliveryNodeId=delivery.id
 left join ods_jxwts.ediasnposition position on package.ediAsnPositionId=position.id


