create table guest02(
	sabun number primary key,
	name varchar2(30),
	nalja date,
	pay number(4)
);

create sequence guest02_seq;

insert into guest02 values(guest02_seq.nextval,'test1',sysdate,1000);
insert into guest02 values(guest02_seq.nextval,'test2',sysdate,2000);
insert into guest02 values(guest02_seq.nextval,'test3',sysdate,3000);
insert into guest02 values(guest02_seq.nextval,'test4',sysdate,4000);

select * from GUEST02;
