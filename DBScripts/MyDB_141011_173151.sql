-- Task_Worker [rel1]
create table `task_worker` (
   `task_oid`  integer not null,
   `worker_oid`  integer not null,
  primary key (`task_oid`, `worker_oid`)
);
alter table `task_worker`   add index fk_task_worker_task (`task_oid`), add constraint fk_task_worker_task foreign key (`task_oid`) references `task` (`oid`);
alter table `task_worker`   add index fk_task_worker_worker (`worker_oid`), add constraint fk_task_worker_worker foreign key (`worker_oid`) references `worker` (`user_oid`);


