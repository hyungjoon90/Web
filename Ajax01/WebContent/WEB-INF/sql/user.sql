create table guest30(
	idx number primary key,
	id varchar2(30),
	pw varchar2(30)
);

create sequence guest30_seq;

insert into guest30 values(guest30_seq.nextval,'admin','1234');
insert into guest30 values(guest30_seq.nextval,'guest','1111');
insert into guest30 values(guest30_seq.nextval,'user1','1111');