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
alter table `item`  add column  `annotation_oid`  integer;
alter table `item`   add index fk_item_annotation (`annotation_oid`), add constraint fk_item_annotation foreign key (`annotation_oid`) references `annotation` (`oid`);
create index `idx_item_annotation` on `item`(`annotation_oid`);


