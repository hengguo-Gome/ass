/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/8/27 10:59:40                           */
/*==============================================================*/


drop table if exists ass_user;

drop table if exists data_record;

drop table if exists device_manage;

drop table if exists menu;

drop table if exists message;

drop table if exists role;

drop table if exists role_resource;

drop table if exists user_info_msg;

drop table if exists user_role;

drop table if exists user_tag;

/*==============================================================*/
/* Table: ass_user                                              */
/*==============================================================*/
create table ass_user
(
   user_id              varchar(64) not null,
   person_name          varchar(20),
   username             varchar(50),
   password             varchar(64),
   phone                varchar(20),
   type                 tinyint,
   create_time          timestamp,
   primary key (user_id)
);

/*==============================================================*/
/* Table: data_record                                           */
/*==============================================================*/
create table data_record
(
   id                   varchar(64) not null,
   xml_content          longtext,
   interface_type       varchar(64),
   create_time          timestamp,
   direction            varchar(10),
   result_content       varchar(1000),
   sender               varchar(50),
   receiver             varchar(50),
   message_id           varchar(64),
   date_send            timestamp,
   primary key (id)
);

/*==============================================================*/
/* Table: device_manage                                         */
/*==============================================================*/
create table device_manage
(
   id                   varchar(64) not null,
   user_id              varchar(64),
   phone                varchar(20),
   sn_no                varchar(64),
   client_version       varchar(60),
   os_info              varchar(40),
   device_info          varchar(40),
   access_token         varchar(64),
   status               tinyint,
   create_time          timestamp,
   primary key (id)
);

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu
(
   menu_id              varchar(64) not null,
   menu_name            varchar(100),
   parent_id            varchar(64),
   menu_url             varchar(100),
   create_time          timestamp,
   primary key (menu_id)
);

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   id                   varchar(64) not null,
   title                varchar(100),
   content              varchar(255),
   msg_time             timestamp,
   send_time            timestamp,
   type                 tinyint,
   rend_user_id         varchar(64),
   primary key (id)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   role_id              varchar(64) not null,
   role_name            varchar(100),
   create_time          timestamp,
   primary key (role_id)
);

/*==============================================================*/
/* Table: role_resource                                         */
/*==============================================================*/
create table role_resource
(
   role_id              varchar(64) not null,
   resource_id          varchar(64) not null,
   primary key (role_id, resource_id)
);

/*==============================================================*/
/* Table: user_info_msg                                         */
/*==============================================================*/
create table user_info_msg
(
   baidu_user_id        varchar(64) not null,
   devicetoken          varchar(80),
   user_id              varchar(64),
   device_type          tinyint,
   primary key (baidu_user_id)
);

/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   user_id              varchar(64) not null,
   role_id              varchar(64) not null,
   primary key (user_id, role_id)
);

/*==============================================================*/
/* Table: user_tag                                              */
/*==============================================================*/
create table user_tag
(
   id                   varchar(64) not null,
   baidu_user_id        varchar(64),
   tag_name             varchar(64),
   primary key (id)
);

alter table device_manage add constraint FK_Reference_5 foreign key (user_id)
      references ass_user (user_id) on delete restrict on update restrict;

alter table message add constraint FK_Reference_8 foreign key (rend_user_id)
      references ass_user (user_id) on delete restrict on update restrict;

alter table role_resource add constraint FK_Reference_3 foreign key (resource_id)
      references menu (menu_id) on delete restrict on update restrict;

alter table role_resource add constraint FK_Reference_4 foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

alter table user_info_msg add constraint FK_Reference_6 foreign key (user_id)
      references ass_user (user_id) on delete restrict on update restrict;

alter table user_role add constraint FK_Reference_1 foreign key (user_id)
      references ass_user (user_id) on delete restrict on update restrict;

alter table user_role add constraint FK_Reference_2 foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

alter table user_tag add constraint FK_Reference_7 foreign key (baidu_user_id)
      references user_info_msg (baidu_user_id) on delete restrict on update restrict;
      
drop table if exists hx_install_order;

/*==============================================================*/
/* Table: hx_install_order                                      */
/*==============================================================*/
create table hx_install_order
(
   azd01                varchar(64) not null,
   khmc                 varchar(60),
   lxdz                 varchar(200),
   lxdh                 varchar(30),
   qtdh                 varchar(30),
   spfl01               varchar(20),
   spflmc               varchar(100),
   ppb01                varchar(20),
   ppbmc                varchar(100),
   spbm                 varchar(20),
   spmc                 varchar(100),
   dzbm01               varchar(20),
   bmmc                 varchar(200),
   yysj                 timestamp,
   pwdsj                timestamp,
   hzrq                 timestamp,
   azwd01               varchar(20),
   wdmc                 varchar(100),
   gsxx01               varchar(20),
   gsmc                 varchar(200),
   thdh                 varchar(20),
   wb_gsxx01            varchar(20),
   wb_gsmc              varchar(200),
   sjly                 varchar(20),
   njtm                 varchar(100),
   wjtm                 varchar(100),
   primary key (azd01)
);

drop table if exists hx_worker;

/*==============================================================*/
/* Table: hx_worker                                             */
/*==============================================================*/
create table hx_worker
(
   czy01                varchar(60),
   ryxx01               varchar(20),
   ryxm                 varchar(80),
   czymm                varchar(40),
   gsxx01               varchar(10),
   bm01                 varchar(30),
   azwd01               varchar(12),
   wdmc                 varchar(80),
   qsrq                 date,
   zzrq                 date,
   zt                   tinyint,
   ccrq                 date,
   zxbj                 varchar(10)
);



