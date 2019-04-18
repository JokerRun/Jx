SELECT
	log.`id` AS `id`,
	log.`action_type` AS `action_type`,
	log.`arrival_date` AS `arrival_date`,
	log.`car_nr` AS `car_nr`,
	log.`created_at` AS `created_at`,
	log.`creator_name` AS `creator_name`,
	log.`delnote_number` AS `delnote_number`,
	log.`dockpoint_code` AS `dockpoint_code`,
	log.`driver_name` AS `driver_name`,
	log.`driver_phone` AS `driver_phone`,
	log.`edi_asn_package_nr` AS `edi_asn_package_nr`,
	log.`part_nr` AS `part_nr`,
	log.`quantity_perpack` AS `quantity_perpack`,
	log.`supplier_code` AS `supplier_code`,
	log.`supplier_id` AS `supplier_id`,
	log.`transport_nr` AS `transport_nr`,
	log.`whouse_nr` AS `whouse_nr` 
FROM
	dm_jxwts.`package_moving_log` log
WHERE
	log.`created_at` BETWEEN date( '2018-07-01' ) AND date( '2018-07-31' )