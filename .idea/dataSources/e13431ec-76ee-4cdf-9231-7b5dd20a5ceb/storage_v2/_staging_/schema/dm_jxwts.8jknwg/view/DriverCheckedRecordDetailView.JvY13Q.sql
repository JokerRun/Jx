explain
select `dcd`.`id`               AS `id`,
       `u`.`name`               AS `drivername`,
       `u`.`nr`                 AS `driverNr`,
       `troop`.`name`           AS `carTroopName`,
       `ods_prod`.`car`.`Nr`    AS `carNr`,
       `trailer`.`nr`           AS `carTrailerNr`,
       `house`.`name`           AS `sourceWhouseName`,
       `house_two`.`name`       AS `destinationWhouseName`,
       `dcd`.`planTrayCount`    AS `planTrayCount`,
       `dcd`.`planPackageCount` AS `planPackageCount`,
       `dcd`.`realTrayCount`    AS `realTrayCount`,
       `dcd`.`realPackageCount` AS `realPackageCount`,
       `dcd`.`createdAt`        AS `createdAt`
from ((((((((`ods_prod`.`drivercheckedrecord` `dcd` left join `ods_prod`.`deliverynode` `node` on ((`dcd`.`deliveryNodeId` = `node`.`id`))) left join `ods_prod`.`deliverynodecar` `nodeCar` on ((`dcd`.`deliveryNodeCarId` = `nodeCar`.`id`))) left join `ods_prod`.`car` on ((`ods_prod`.`car`.`id` = `nodeCar`.`carId`))) left join `ods_prod`.`cartrailer` `trailer` on ((`nodeCar`.`carTrailerId` = `trailer`.`id`))) left join `ods_prod`.`user` `u` on ((`u`.`id` = `nodeCar`.`userId`))) left join `ods_prod`.`cartroop` `troop` on ((`troop`.`id` = `u`.`carTroopId`))) left join `ods_prod`.`whouse` `house` on ((`house`.`id` = `node`.`sourceWhouseId`)))
         left join `ods_prod`.`whouse` `house_two` on ((`house_two`.`id` = `node`.`destinationWhouseId`)));

