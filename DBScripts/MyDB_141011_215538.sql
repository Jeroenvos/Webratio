-- Annotation [ent10]
create table `annotation` (
   `oid`  integer  not null,
   `label`  varchar(255),
   `confidence`  integer,
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


-- Item_Annotation [rel11]
alter table `annotation`  add column  `oid`  integer;
alter table `annotation`   add index fk_annotation_item (`oid`), add constraint fk_annotation_item foreign key (`oid`) references `item` (`oid`);


-- Requester_Item [rel2]
alter table `item`  add column  `requester_oid`  integer;
alter table `item`   add index fk_item_requester (`requester_oid`), add constraint fk_item_requester foreign key (`requester_oid`) references `requester` (`user_oid`);


-- Item_Task [rel5]
create table `item_task` (
   `item_oid`  integer not null,
   `task_oid`  integer not null,
  primary key (`item_oid`, `task_oid`)
);
alter table `item_task`   add index fk_item_task_item (`item_oid`), add constraint fk_item_task_item foreign key (`item_oid`) references `item` (`oid`);
alter table `item_task`   add index fk_item_task_task (`task_oid`), add constraint fk_item_task_task foreign key (`task_oid`) references `task` (`oid`);


