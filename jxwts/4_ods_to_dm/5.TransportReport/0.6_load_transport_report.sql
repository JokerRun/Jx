INSERT INTO dm_jxwts.transport_report SELECT
src.*
FROM
	dm_jxwts.transport_report_view src
WHERE
	src.receivedAt >= '2018-08-01 00:00:00'
	AND src.id not in ( SELECT tgt.id FROM  dm_jxwts.stage_transport_report tgt )
;
