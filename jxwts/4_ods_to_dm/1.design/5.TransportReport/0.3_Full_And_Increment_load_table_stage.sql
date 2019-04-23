# full load
INSERT INTO dm_jxwts.stage_transport_report SELECT
src.*
FROM
	dm_jxwts.stage_transport_report_view src
;



# increment load
REPLACE INTO dm_jxwts.stage_transport_report SELECT
src.*
FROM
	dm_jxwts.stage_transport_report_view src
WHERE
	src.received_at between  date('${loaddate-1}') and date('${loaddate}')
or src.created_at   between  date('${loaddate-1}') and date('${loaddate}')
or src.updated_at   between  date('${loaddate-1}') and date('${loaddate}')
;

#For Explain
EXPLAIN
REPLACE INTO dm_jxwts.stage_transport_report SELECT
src.*
FROM
	dm_jxwts.stage_transport_report_view src
WHERE
	src.received_at between  date('2018-07-01') and date('2018-08-01')
or src.created_at   between  date('2018-07-01') and date('2018-08-01')
or src.updated_at   between  date('2018-07-01') and date('2018-08-01')
;