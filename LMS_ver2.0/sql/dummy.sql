insert into LEC_ROOM values (101,'사용',20);
insert into LEC_ROOM values (102,'사용',20);
insert into LEC_ROOM values (103,'사용',20);
insert into LEC_ROOM values (104,'사용',20);

insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명1','아무개',sysdate,sysdate,20,'java',101);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명2','아무개2',sysdate,sysdate,20,'web',102);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명3','아무개3',sysdate,sysdate,20,'db',103);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명4','아무개4',sysdate,sysdate,20,'java',104);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명5','아무개5',sysdate,sysdate,20,'java',101);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명6','아무개6',sysdate,sysdate,20,'web',102);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명7','아무개7',sysdate,sysdate,20,'db',103);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명8','아무개8',sysdate,sysdate,20,'java',104);


SELECT * from LEC_INFO;
SELECT COUNT(*) AS TOT FROM LEC_INFO;

SELECT LEC_CODE, CLASS_NAME, TEACHER, OPEN_DATE, END_DATE, MAX_AB, KEYWORD, CLASSNO
FROM LEC_INFO WHERE LEC_CODE= 18001;



SELECT RN, CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD 
	FROM ( SELECT ROWNUM as rn, CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD 
		FROM( SELECT CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD FROM LEC_INFO ORDER BY LEC_CODE DESC) 
	WHERE rownum <= 5
) WHERE RN >= 2