-- 通过试图选择生成视图对应的实体表
drop table if exists dm_jxwts.DriverCheckedRecordDetail;
create table dm_jxwts.DriverCheckedRecordDetail as
select
	*
from
	dm_jxwts.DriverCheckedRecordDetailView
limit 1
;
