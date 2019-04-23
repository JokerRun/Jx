-- 通过试图选择生成视图对应的实体表
drop table if exists dm_jxwts.stage_transport_report;
create table dm_jxwts.stage_transport_report as
select
	*
from
	dm_jxwts.stage_transport_report_view
limit  1
;


create index idx_record_transport_package_nr
    on stage_transport_report (record_nr, transport_nr, package_nr);

create index idx_rexeived_created_updated_at
on stage_transport_report (received_at, created_at, updated_at);

create unique index stage_transport_report_id_uindex
on stage_transport_report (id);

alter table stage_transport_report
add constraint stage_transport_report_pk
primary key (id);

