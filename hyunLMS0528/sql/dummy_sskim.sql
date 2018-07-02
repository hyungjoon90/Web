
truncate table LEC_ROOM;

insert into LEC_ROOM values (101,'사용',20);
insert into LEC_ROOM values (102,'빔',20);
insert into LEC_ROOM values (103,'빔',20);
insert into LEC_ROOM values (104,'빔',20);

truncate table LEC_INFO;

insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명1','아무개',sysdate,sysdate,20,'java',101);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명2','아무개2',sysdate,sysdate,20,'web',102);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명3','아무개3',sysdate,sysdate,20,'db',103);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명4','아무개4',sysdate,sysdate,20,'java',104);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명5','아무개5',sysdate,sysdate,20,'java',101);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명6','아무개6',sysdate,sysdate,20,'web',102);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명7','아무개7',sysdate,sysdate,20,'db',103);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명8','아무개8',sysdate,sysdate,20,'java',104);

truncate table MeMBER

insert into MEMBER values ('stu01', '1234', '학생1', 123456, 'stu01@naver.com', 0, 0);
insert into MEMBER values ('stu02', '1234', '학생2', 123456, 'stu02@naver.com', 0, 0);
insert into MEMBER values ('stu03', '1234', '학생3', 123456, 'stu03@naver.com', 0, 0);

insert into MEMBER values ('tea00', '1234', '강사1', 123456, 'tea00@naver.com', 1, 0);
insert into MEMBER values ('tea01', '1234', '강사2', 123456, 'tea01@naver.com', 1, 0);

insert into MEMBER values ('admin', '1234', '관리자', 123456, 'admin@naver.com', 5, 0);









SELECT NAME FROM MEMBER WHERE MEM_TYPE = 1 ORDER BY NAME DESC

SELECT * from LEC_INFO;
SELECT COUNT(*) AS TOT FROM LEC_INFO;

SELECT LEC_CODE, CLASS_NAME, TEACHER, OPEN_DATE, END_DATE, MAX_AB, KEYWORD, CLASSNO
FROM LEC_INFO WHERE LEC_CODE= 18001;



SELECT RN, CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD 
	FROM ( SELECT ROWNUM as rn, CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD 
		FROM( SELECT CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD FROM LEC_INFO ORDER BY LEC_CODE DESC) 
	WHERE rownum <= 5
) WHERE RN >= 2