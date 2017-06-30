/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/6/6 15:56:59                            */
/*==============================================================*/


drop table if exists sys_logs;

drop table if exists sys_parameter;

drop table if exists sys_resource;

drop table if exists sys_user;

drop table if exists sys_user_permission;

drop table if exists use_building;

drop table if exists use_equipment;

drop table if exists use_household;

drop table if exists use_household_room;

drop table if exists use_resident_area;

drop table if exists use_resident_user;

/*==============================================================*/
/* Table: sys_logs                                              */
/*==============================================================*/
create table sys_logs
(
   id                   varchar(32) not null,
   userName             varchar(20) not null,
   optType              varchar(20) not null,
   optDate              datetime not null,
   logDetail            text,
   ip                   varchar(32),
   optModule            varchar(64) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: sys_parameter                                         */
/*==============================================================*/
create table sys_parameter
(
   id                   varchar(32) not null,
   paraName             varchar(64) not null,
   paraCnName           varchar(64) not null,
   paraValue            varchar(64) not null,
   createTime           datetime not null,
   remark               varchar(200),
   isValid              char(2) not null comment '10-是
            20-否',
   primary key (id)
);

/*==============================================================*/
/* Table: sys_resource                                          */
/*==============================================================*/
create table sys_resource
(
   id                   varchar(32) not null,
   resName              varchar(30) not null,
   resPath              varchar(100) not null,
   parentId             varchar(32) not null,
   resIcon              varchar(100),
   resDesc              varchar(200),
   resSort              int,
   resOpen              char(2) comment '10 - 是
            20 - 否',
   state                char(2) not null comment '10 - 正常
            20 - 禁用',
   primary key (id)
);

/*==============================================================*/
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user
(
   id                   varchar(32) not null,
   userName             varchar(20) not null,
   loginName            varchar(20) not null,
   password             varchar(20) not null,
   salt                 varchar(32) not null,
   mobile               varchar(20),
   userType             char(2) not null comment '10:管理员
            20物业管理员',
   userIcon             text,
   createTime           datetime not null,
   lastTime             datetime,
   state                char(2) not null comment '10 - 正常
            20 - 禁用',
   primary key (id)
);

/*==============================================================*/
/* Table: sys_user_permission                                   */
/*==============================================================*/
create table sys_user_permission
(
   userId               varchar(32) not null,
   resourceId           varchar(32) not null comment '10-是
            20-否',
   primary key (userId, resourceId)
);

/*==============================================================*/
/* Table: use_building                                          */
/*==============================================================*/
create table use_building
(
   id                   varchar(32) not null,
   residentId           varchar(32) not null,
   buildingName         int not null,
   floorNumber          int not null,
   houseNumber          int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: use_equipment                                         */
/*==============================================================*/
create table use_equipment
(
   id                   varchar(32) not null,
   equipmentId          varchar(20) not null,
   equipmentName        varchar(50) not null,
   equipmentType        char(2) not null comment '10 - 围墙机
            20 - 单元机',
   residentId           varchar(32) not null,
   buildingId           varchar(32) not null,
   unitName             int not null,
   clientId             varchar(40),
   clientPwd            varchar(40),
   state                char(2) not null comment '10 - 正常
            20 - 禁用',
   primary key (id)
);

/*==============================================================*/
/* Table: use_household                                         */
/*==============================================================*/
create table use_household
(
   id                   varchar(32) not null,
   name                 varchar(20) not null,
   mobile               varchar(11) not null,
   password             varchar(40) not null,
   clientId             varchar(40),
   clientPwd            varchar(40),
   state                char(2) not null comment '10 - 正常
            20 - 禁用',
   primary key (id)
);

/*==============================================================*/
/* Table: use_household_room                                    */
/*==============================================================*/
create table use_household_room
(
   id                   varchar(32) not null,
   householdId          varchar(32) not null,
   residentId           varchar(32) not null,
   buildingId           varchar(32) not null,
   unitName             int,
   roomNumber           varchar(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: use_resident_area                                     */
/*==============================================================*/
create table use_resident_area
(
   id                   varchar(32) not null,
   residentName         varchar(50) not null,
   residentNo           char(6) not null,
   province             varchar(50) not null,
   city                 varchar(50) not null,
   area                 varchar(50) not null,
   address              varchar(100) not null,
   primary key (id),
   unique key AK_Key_2 (residentNo)
);

/*==============================================================*/
/* Table: use_resident_user                                     */
/*==============================================================*/
create table use_resident_user
(
   id                   varchar(32) not null,
   residentId           varchar(32) not null,
   userId               varchar(32) not null,
   primary key (id)
);

