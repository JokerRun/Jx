drop view if exists  dm_jxwts.delivery_received_record_view
;
create view
    dm_jxwts.delivery_received_record_view as
select
       ods_prod.deliveryreceivedrecord.id as id,
       ods_prod.deliveryreceivedrecord.nr as nr,
       ods_prod.deliveryreceivedrecord.cartroopid as car_troop_id,
       ods_prod.deliveryreceivedrecord.driverid as driver_id,
       ods_prod.deliveryreceivedrecord.carid as car_id,
       ods_prod.deliveryreceivedrecord.cartrailerid as car_trailer_id,
       ods_prod.deliveryreceivedrecord.toid as to_id,
       ods_prod.deliveryreceivedrecord.receivedat as received_at,
       ods_prod.deliveryreceivedrecord.creatorid as creator_id,
       ods_prod.deliveryreceivedrecord.receivetype as receive_type,
       ods_prod.deliveryreceivedrecord.status as status,
       ods_prod.deliveryreceivedrecord.note as note,

       ods_prod.cartroop.code as car_troop_code,
       driver.name as driver_name,
       ods_prod.car.nr as car_nr,
       ods_prod.cartrailer.nr as  car_trailer_nr,
       ods_prod.whouse.nr as whouse_nr,
        creator.name as creator
from
    ods_prod.deliveryreceivedrecord
    left outer join ods_prod.cartroop on ods_prod.cartroop.id =ods_prod.deliveryreceivedrecord.cartroopid
    left outer join ods_prod.user as driver on driver.id =ods_prod.deliveryreceivedrecord.driverid
    left outer join ods_prod.car on ods_prod.car.id =ods_prod.deliveryreceivedrecord.carid
    left outer join ods_prod.cartrailer on ods_prod.cartrailer.id =ods_prod.deliveryreceivedrecord.cartrailerid
    left outer join ods_prod.whouse on ods_prod.whouse.id =ods_prod.deliveryreceivedrecord.toid
    left outer join ods_prod.user as creator on creator.id =ods_prod.deliveryreceivedrecord.creatorid
