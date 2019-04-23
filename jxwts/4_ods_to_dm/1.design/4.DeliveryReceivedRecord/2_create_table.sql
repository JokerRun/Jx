-- 通过试图选择生成视图对应的实体表
drop table if exists dm_jxwts.delivery_received_record;
create table dm_jxwts.delivery_received_record as
select
	*
from
	dm_jxwts.delivery_received_record_view
limit 1
;
