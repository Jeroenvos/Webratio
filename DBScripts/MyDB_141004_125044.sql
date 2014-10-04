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
  primary key (`oid`)
);


-- Runner [ent1]
create table `runner` (
   `user_oid`  integer  not null,
   `name`  varchar(255),
   `birthdate`  date,
   `registrationdate`  date,
   `weigth`  double precision,
  primary key (`user_oid`)
);


-- RunnerGroup [ent2]
create table `runnergroup` (
   `oid`  integer  not null,
   `name`  varchar(255),
  primary key (`oid`)
);


-- Training Program [ent3]
create table `training_program` (
   `oid`  integer  not null,
   `title`  varchar(255),
   `difficultylevel`  integer,
  primary key (`oid`)
);


-- Training [ent4]
create table `training` (
   `oid`  integer  not null,
   `duration`  integer,
   `difficultylevel`  integer,
  primary key (`oid`)
);


-- TrainingExecution [ent5]
create table `trainingexecution` (
   `oid`  integer  not null,
   `executiondate`  date,
   `duration`  integer,
   `distance`  double precision,
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


-- RunnerBelongsToRunnerGroup [rel1]
create table `runnerbelongstorunnergroup` (
   `runner_oid`  integer not null,
   `runnergroup_oid`  integer not null,
  primary key (`runner_oid`, `runnergroup_oid`)
);
alter table `runnerbelongstorunnergroup`   add index fk_runnerbelongstorunnergroup (`runner_oid`), add constraint fk_runnerbelongstorunnergroup foreign key (`runner_oid`) references `runner` (`user_oid`);
alter table `runnerbelongstorunnergroup`   add index fk_runnerbelongstorunnergrou_2 (`runnergroup_oid`), add constraint fk_runnerbelongstorunnergrou_2 foreign key (`runnergroup_oid`) references `runnergroup` (`oid`);


-- RunnerAdministerRunnerGroup [rel2]
alter table `runnergroup`  add column  `runner_oid`  integer;
alter table `runnergroup`   add index fk_runnergroup_runner (`runner_oid`), add constraint fk_runnergroup_runner foreign key (`runner_oid`) references `runner` (`user_oid`);


-- RunnerEnrolledInTraining Program [rel3]
create table `runnerenrolledintraining_progr` (
   `runner_oid`  integer not null,
   `training_program_oid`  integer not null,
  primary key (`runner_oid`, `training_program_oid`)
);
alter table `runnerenrolledintraining_progr`   add index fk_runnerenrolledintraining_pr (`runner_oid`), add constraint fk_runnerenrolledintraining_pr foreign key (`runner_oid`) references `runner` (`user_oid`);
alter table `runnerenrolledintraining_progr`   add index fk_runnerenrolledintraining_2 (`training_program_oid`), add constraint fk_runnerenrolledintraining_2 foreign key (`training_program_oid`) references `training_program` (`oid`);


-- Training_Training Program [rel4]
alter table `training`  add column  `training_program_oid`  integer;
alter table `training`   add index fk_training_training_program (`training_program_oid`), add constraint fk_training_training_program foreign key (`training_program_oid`) references `training_program` (`oid`);


-- RunnerExecutesTrainingExecution [rel6]
alter table `trainingexecution`  add column  `runner_oid`  integer;
alter table `trainingexecution`   add index fk_trainingexecution_runner (`runner_oid`), add constraint fk_trainingexecution_runner foreign key (`runner_oid`) references `runner` (`user_oid`);


-- TrainingToExecution_Training [rel7]
alter table `trainingexecution`  add column  `training_oid`  integer;
alter table `trainingexecution`   add index fk_trainingexecution_training (`training_oid`), add constraint fk_trainingexecution_training foreign key (`training_oid`) references `training` (`oid`);


-- GEN FK: Runner --> User
alter table `runner`   add index fk_runner_user (`user_oid`), add constraint fk_runner_user foreign key (`user_oid`) references `user` (`oid`);


