drop view if exists  dm_jxwts.deliveryreceivedrecordview
;
create view
    dm_jxwts.deliveryreceivedrecordview as
select
       ods_prod.deliveryreceivedrecord.id,
       ods_prod.deliveryreceivedrecord.nr,
       ods_prod.deliveryreceivedrecord.carTroopId,
       ods_prod.deliveryreceivedrecord.driverId,
       ods_prod.deliveryreceivedrecord.carId,
       ods_prod.deliveryreceivedrecord.carTrailerId,
       ods_prod.deliveryreceivedrecord.toId,
       ods_prod.deliveryreceivedrecord.receivedAt,
       ods_prod.deliveryreceivedrecord.creatorId,
       ods_prod.deliveryreceivedrecord.receiveType,
       ods_prod.deliveryreceivedrecord.status,
       ods_prod.deliveryreceivedrecord.note,

       ods_prod.cartroop.code as cartroopCode,
       driver.name as driverName,
       ods_prod.car.nr as carNr,
       ods_prod.cartrailer.nr as  cartrailernr,
       ods_prod.whouse.nr as whouseNr,
        creator.name as creator
from
    ods_prod.deliveryreceivedrecord
    left outer join ods_prod.cartroop on ods_prod.cartroop.id =ods_prod.deliveryreceivedrecord.carTroopId
    left outer join ods_prod.user as driver on driver.id =ods_prod.deliveryreceivedrecord.driverId
    left outer join ods_prod.car on ods_prod.car.id =ods_prod.deliveryreceivedrecord.carId
    left outer join ods_prod.cartrailer on ods_prod.cartrailer.id =ods_prod.deliveryreceivedrecord.carTrailerId
    left outer join ods_prod.whouse on ods_prod.whouse.id =ods_prod.deliveryreceivedrecord.toId
    left outer join ods_prod.user as creator on creator.id =ods_prod.deliveryreceivedrecord.creatorId
