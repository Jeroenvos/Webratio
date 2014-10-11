-- Requester_Item [rel2]
alter table `item`  add column  `requester_oid`  integer;
alter table `item`   add index fk_item_requester (`requester_oid`), add constraint fk_item_requester foreign key (`requester_oid`) references `requester` (`user_oid`);


