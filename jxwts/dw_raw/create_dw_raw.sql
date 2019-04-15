/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/4/14 22:25:06                           */
/*==============================================================*/


drop table if exists dw_raw.dw_hub_car;

drop table if exists dw_raw.dw_hub_dockpoint;

drop table if exists dw_raw.dw_hub_edi_delivery_node;

drop table if exists dw_raw.dw_hub_edi_package;

drop table if exists dw_raw.dw_hub_edi_transport;

drop table if exists dw_raw.dw_hub_part;

drop table if exists dw_raw.dw_hub_user;

drop table if exists dw_raw.dw_hub_warehouse;

drop table if exists dw_raw.dw_link_edi_package;

drop table if exists dw_raw.dw_link_edi_package_moving_log;

/*==============================================================*/
/* User: dw_raw                                                 */
/*==============================================================*/
-- dw_raw.dw_hub_userdw_raw.dw_hub_userdw_raw.dw_hub_cardw_raw.dw_hub_carcreate user dw_raw;

/*==============================================================*/
/* Table: dw_hub_car                                            */
/*==============================================================*/
create table dw_raw.dw_hub_car
(
   h_car_hk             varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   car_nr               varchar(50) not null,
   primary key (h_car_hk),
   unique key uk_hub_car (car_nr)
);

/*==============================================================*/
/* Table: dw_hub_dockpoint                                      */
/*==============================================================*/
create table dw_raw.dw_hub_dockpoint
(
   h_dockpoint_hk       varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   dockpoint_nr         varchar(50) not null,
   primary key (h_dockpoint_hk),
   unique key uk_hub_dockpoint (dockpoint_nr)
);

/*==============================================================*/
/* Table: dw_hub_edi_delivery_node                              */
/*==============================================================*/
create table dw_raw.dw_hub_edi_delivery_node
(
   h_delivery_node_hk   varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   delivery_node_nr     varchar(50) not null,
   primary key (h_delivery_node_hk),
   unique key uk_hub_user (delivery_node_nr)
);

/*==============================================================*/
/* Table: dw_hub_edi_package                                    */
/*==============================================================*/
create table dw_raw.dw_hub_edi_package
(
   h_package_hk         varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   package_nr           varchar(50) not null,
   primary key (h_package_hk),
   unique key uk_hub_user (package_nr)
);

/*==============================================================*/
/* Table: dw_hub_edi_transport                                  */
/*==============================================================*/
create table dw_raw.dw_hub_edi_transport
(
   h_transport_hk       varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   transport_nr         varchar(50) not null,
   primary key (h_transport_hk),
   unique key uk_hub_user (transport_nr)
);

/*==============================================================*/
/* Table: dw_hub_part                                           */
/*==============================================================*/
create table dw_raw.dw_hub_part
(
   h_part_hk            varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   part_nr              varchar(50) not null,
   primary key (h_part_hk),
   unique key uk_hub_part (part_nr)
);

/*==============================================================*/
/* Table: dw_hub_user                                           */
/*==============================================================*/
create table dw_raw.dw_hub_user
(
   h_user_hk            varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   user_nr              varchar(50) not null,
   primary key (h_user_hk),
   unique key uk_hub_user (user_nr)
);

/*==============================================================*/
/* Table: dw_hub_warehouse                                      */
/*==============================================================*/
create table dw_raw.dw_hub_warehouse
(
   h_warehouse_hk       varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   warehouse_nr         varchar(50) not null,
   primary key (h_warehouse_hk),
   unique key uk_hub_warehouse (warehouse_nr)
);

/*==============================================================*/
/* Table: dw_link_edi_package                                   */
/*==============================================================*/
create table dw_raw.dw_link_edi_package
(
   l_package_hk         varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   h_package_hk         varchar(50) not null,
   h_delivery_node_hk   varchar(50) not null,
   h_transport_hk       varchar(50) not null,
   primary key (l_package_hk),
   unique key uk_hub_user (h_package_hk, h_delivery_node_hk, h_transport_hk)
);

/*==============================================================*/
/* Table: dw_link_edi_package_moving_log                        */
/*==============================================================*/
create table dw_raw.dw_link_edi_package_moving_log
(
   l_package_hk         varchar(50) not null,
   load_date            date,
   record_source        varchar(50),
   h_package_hk         varchar(50) not null,
   h_delivery_node_hk   varchar(50) not null,
   h_transport_hk       varchar(50) not null,
   package_moving_log_id int not null,
   primary key (l_package_hk),
   unique key uk_hub_user (h_package_hk, h_delivery_node_hk, h_transport_hk, package_moving_log_id)
);

alter table dw_raw.dw_link_edi_package_moving_log comment 'TODO: moving log 中,除了id阿字段,没有其他字段可以作为联合唯一键.';