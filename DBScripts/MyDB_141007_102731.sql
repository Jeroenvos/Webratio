-- User [User]
alter table `user`  add column  `registrationdate`  date;
alter table `user`  add column  `birthdate`  date;


-- TaskExecution [ent14]
alter table `taskexecution`  add column  `executiontime`  datetime;


-- Task [ent6]
alter table `task`  add column  `maxexecutiontime`  time;


-- Worker [ent7]
alter table `worker`  add column  `accuracyscore`  double precision;


-- Item [ent9]
alter table `item`  add column  `imageurl`  varchar(255);


