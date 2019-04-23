# 全量写入dm_jxwts.delivery_received_record
INSERT INTO dm_jxwts.delivery_received_record SELECT
src.*
FROM
	dm_jxwts.delivery_received_record_view src

;





