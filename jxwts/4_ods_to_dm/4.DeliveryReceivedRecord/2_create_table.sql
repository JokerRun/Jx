-- 通过试图选择生成视图对应的实体表
drop table if exists dm_jxwts.DriverCheckedRecord;
create table dm_jxwts.deliveryreceivedrecord as
select
	*
from
	dm_jxwts.deliveryreceivedrecordView
limit 1
;
