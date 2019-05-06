-- 按计划每月导出上个月deliveryreceivedrecord报表：
select id,
       nr,
       car_troop_id,
       driver_id,
       car_id,
       car_trailer_id,
       to_id,
       received_at,
       creator_id,
       receive_type,
       status,
       note,
       car_troop_code,
       driver_name,
       car_nr,
       car_trailer_nr,
       whouse_nr,
       creator
from dm_jxwts.delivery_received_record src
where src.received_at
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);

-- 按计划每月导出上个月drivercheckedrecorddetail报表：
select *
from dm_jxwts.driver_checked_record_detail src
where src.created_at
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);

-- 按计划每月导出上个月package_account_report报表：
select
asn_transport_nr as "运输单编号",
asn_delivery_node_nr as "发货单编号",
milk_date as "ASN发货时间",
asn_package_nr as "标签号",
state as "状态",
is_sap_received as "SAP状态",
part_nr as "零件号",
total_qty as "件数",
valumem as "体积",
weightt as "重量",
supplier_desc as "供应商简称",
supplier_code as "供应商代码",
asn_arrival_date as "ASN到货时间",
milk_date as "ASN发货时间",
created_at as "ASN同步时间",
received_at as "收货时间",
receiver_name as "收货扫描人",
receiver_phone as "联系方式",
whouse_nr as "仓库",
dockpoint_code as "卸货口"
from dm_jxwts.package_account_report src
where src.created_at
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);

-- 按计划每月导出上个月报表：
select
transport_nr as "运输单编号",
delnote_number as "发货单编号",
edi_asn_package_nr as "标签号",
part_nr as "零件号",
quantity_perpack as "件数",
supplier_code as "供应商代码",
dockpoint_code as "卸货口",
arrival_date as "ASN到货时间",
whouse_nr as "操作仓库",
action_type as "操作类型",
created_at as "操作时间",
creator_name as "操作员",
car_nr as "运输车辆",
driver_name as "司机",
driver_phone as "联系方式"
from dm_jxwts.package_moving_log src
where src.created_at
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);



-- 按计划每月导出上个月报表：
select
       record_nr as "佳轩承运单号",
car_trrop_name as "运输车队",
car_nr as "运输车辆",
car_type_nr as "车型",
driver_name as "司机",
driver_phone as "联系方式",
transport_nr as "ASN运输单号",
supplier_desc as "供应商",
from_type_str as "来源地类型",
from_nr as "来源地",
to_whousenr as "目的地",
dockpoint_code as "卸货口",
tray_count as "托数",
single_package_count as "箱数",
checked_at as "司机扫描时间",
received_at as "收货时间"
from dm_jxwts.transport_report src
where src.received_at
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);


