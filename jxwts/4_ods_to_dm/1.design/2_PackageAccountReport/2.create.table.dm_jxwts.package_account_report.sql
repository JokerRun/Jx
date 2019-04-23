-- 通过试图选择生成视图对应的实体表
drop table if exists dm_jxwts.package_account_report;
create table dm_jxwts.package_account_report as
select
	*
from
	dm_jxwts.package_account_report_view
limit 1
;

create index idx_created_at on package_account_report (created_at, asn_created_at);

create index idx_package_transport_dn_nr
	on package_account_report (asn_package_nr, asn_transport_nr, asn_delivery_node_nr);
create unique index package_account_report_id_uindex
	on package_account_report (id);
alter table package_account_report
	add constraint package_account_report_pk
		primary key (id);

