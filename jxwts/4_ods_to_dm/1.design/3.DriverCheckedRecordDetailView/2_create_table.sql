-- 通过试图选择生成视图对应的实体表
drop table if exists dm_jxwts.driver_checked_record_detail;
create table dm_jxwts.driver_checked_record_detail as
select
	*
from
	dm_jxwts.driver_checked_record_detail_view
limit 1
;
create unique index driver_checked_record_detail_id_uindex
	on driver_checked_record_detail (id);

create index idx_created_at
	on driver_checked_record_detail (created_at);

alter table driver_checked_record_detail
	add constraint driver_checked_record_detail_pk
		primary key (id);


