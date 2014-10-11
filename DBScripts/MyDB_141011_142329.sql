-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `name`  varchar(255),
   `birthdate`  date,
   `registrationdate`  date,
  primary key (`oid`)
);


-- Annotation [ent10]
create table `annotation` (
   `oid`  integer  not null,
   `label`  varchar(255),
   `confidence`  integer,
  primary key (`oid`)
);


-- Annotation Campaign [ent11]
create table `annotation_campaign` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `budget`  double precision,
   `status`  bit,
  primary key (`oid`)
);


-- Requester [ent12]
create table `requester` (
   `user_oid`  integer  not null,
   `budget`  double precision,
  primary key (`user_oid`)
);


-- TaskExecution [ent14]
create table `taskexecution` (
   `oid`  integer  not null,
   `duration`  time,
   `executiontime`  datetime,
   `accuracy`  double precision,
  primary key (`oid`)
);


-- Task [ent6]
create table `task` (
   `oid`  integer  not null,
   `title`  varchar(255),
   `description`  varchar(255),
   `reward`  double precision,
   `maxexecutiontime`  time,
   `expiration`  datetime,
  primary key (`oid`)
);


-- Worker [ent7]
create table `worker` (
   `user_oid`  integer  not null,
   `accuracyscore`  double precision,
  primary key (`user_oid`)
);


-- Skill [ent8]
create table `skill` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Item [ent9]
create table `item` (
   `oid`  integer  not null,
   `title`  varchar(255),
   `caption`  varchar(255),
   `imageurl`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Item_Annotation [rel11]
alter table `item`  add column  `annotation_oid`  integer;
alter table `item`   add index fk_item_annotation (`annotation_oid`), add constraint fk_item_annotation foreign key (`annotation_oid`) references `annotation` (`oid`);


-- Requester_Annotation Campaign [rel12]
alter table `annotation_campaign`  add column  `requester_oid`  integer;
alter table `annotation_campaign`   add index fk_annotation_campaign_request (`requester_oid`), add constraint fk_annotation_campaign_request foreign key (`requester_oid`) references `requester` (`user_oid`);


-- Task_Annotation Campaign [rel13]
alter table `task`  add column  `annotation_campaign_oid`  integer;
alter table `task`   add index fk_task_annotation_campaign (`annotation_campaign_oid`), add constraint fk_task_annotation_campaign foreign key (`annotation_campaign_oid`) references `annotation_campaign` (`oid`);


-- TaskExecution_Worker [rel14]
alter table `taskexecution`  add column  `worker_oid`  integer;
alter table `taskexecution`   add index fk_taskexecution_worker (`worker_oid`), add constraint fk_taskexecution_worker foreign key (`worker_oid`) references `worker` (`user_oid`);


-- Item_Task [rel5]
create table `item_task` (
   `item_oid`  integer not null,
   `task_oid`  integer not null,
  primary key (`item_oid`, `task_oid`)
);
alter table `item_task`   add index fk_item_task_item (`item_oid`), add constraint fk_item_task_item foreign key (`item_oid`) references `item` (`oid`);
alter table `item_task`   add index fk_item_task_task (`task_oid`), add constraint fk_item_task_task foreign key (`task_oid`) references `task` (`oid`);


-- Worker_Task [rel6]
alter table `taskexecution`  add column  `task_oid`  integer;
alter table `taskexecution`   add index fk_taskexecution_task (`task_oid`), add constraint fk_taskexecution_task foreign key (`task_oid`) references `task` (`oid`);


-- Skill_Task [rel7]
create table `skill_task` (
   `skill_oid`  integer not null,
   `task_oid`  integer not null,
  primary key (`skill_oid`, `task_oid`)
);
alter table `skill_task`   add index fk_skill_task_skill (`skill_oid`), add constraint fk_skill_task_skill foreign key (`skill_oid`) references `skill` (`oid`);
alter table `skill_task`   add index fk_skill_task_task (`task_oid`), add constraint fk_skill_task_task foreign key (`task_oid`) references `task` (`oid`);


-- Skill_Worker [rel8]
create table `skill_worker` (
   `skill_oid`  integer not null,
   `worker_oid`  integer not null,
  primary key (`skill_oid`, `worker_oid`)
);
alter table `skill_worker`   add index fk_skill_worker_skill (`skill_oid`), add constraint fk_skill_worker_skill foreign key (`skill_oid`) references `skill` (`oid`);
alter table `skill_worker`   add index fk_skill_worker_worker (`worker_oid`), add constraint fk_skill_worker_worker foreign key (`worker_oid`) references `worker` (`user_oid`);


-- GEN FK: Requester --> User
alter table `requester`   add index fk_requester_user (`user_oid`), add constraint fk_requester_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: Worker --> User
alter table `worker`   add index fk_worker_user (`user_oid`), add constraint fk_worker_user foreign key (`user_oid`) references `user` (`oid`);


