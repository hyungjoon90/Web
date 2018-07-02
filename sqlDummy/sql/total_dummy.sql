--LEC_ROOM
-- 사용, 빔 만 있음
/*LEC_ROOM 강의실DB*/
truncate table LEC_ROOM;
insert into LEC_ROOM values (101,'사용',20);
insert into LEC_ROOM values (102,'빔',20);
insert into LEC_ROOM values (103,'빔',20);
insert into LEC_ROOM values (104,'빔',20);
insert into LEC_ROOM values (105,'빔',20);
insert into LEC_ROOM values (106,'빔',20);
insert into LEC_ROOM values (107,'빔',20);

--LEC_INFO
-- 강의상태는 1: 비공개 2: 공개 3: 진행중 4: 완료
/*LEC_INFO 강의DB*/
truncate table LEC_INFO;
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명1','아무개',sysdate,sysdate,20,'java','http://asd.com','임시내용1',2,101);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명2','아무개2',sysdate,sysdate,20,'web','http://asd.com','임시내용2',2,0);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명3','아무개3',sysdate,sysdate,20,'db','http://asd.com','임시내용3',2,0);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명4','아무개4',sysdate,sysdate,20,'java','http://asd.com','임시내용4',2,0);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명5','아무개5',sysdate,sysdate,20,'java','http://asd.com','임시내용5',2,0);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명6','아무개6',sysdate,sysdate,20,'web','http://asd.com','임시내용6',2,0);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명7','아무개7',sysdate,sysdate,20,'db','http://asd.com','임시내용7',2,0);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명8','아무개8',sysdate,sysdate,20,'java','http://asd.com','임시내용8',2,0);

select * from LEC_INFO;

/*MEMBER 계정DB
학생 : 0, 교사 : 1, 취업 : 2, 영업 : 3, 행정 : 4, 관리자 : 5, 임시 : 99 */
truncate table MEMBER
insert into MEMBER values ('stu01', '1234', '학생1', 123456, 'stu01@naver.com', 0, 18000);
insert into MEMBER values ('stu02', '1234', '학생2', 123456, 'stu02@naver.com', 0, 18000);
insert into MEMBER values ('stu03', '1234', '학생3', 123456, 'stu03@naver.com', 0, 18001);
insert into MEMBER values ('임시id', '1234', '강사1', 123456, 'tea00@naver.com', 1, 0);
insert into MEMBER values ('tea01', '1234', '강사2', 123456, 'tea01@naver.com', 1, 0);
insert into MEMBER values ('tea02', '1234', '강사3', 123456, 'tea01@naver.com', 1, 0);
insert into MEMBER values ('tea03', '1234', '강사4', 123456, 'tea00@naver.com', 1, 0);
insert into MEMBER values ('admin', '1234', '관리자', 123456, 'admin@naver.com', 5, 0);

/*LEC_AF_BBS 수강후기게시판*/
truncate table Lec_AF_BBS;
insert into LEC_AF_BBS values (LEC_AF_BBS_SEQ.nextval,'수강후기1','khj',sysdate,18000,'가나다라마바사아자차카타',0);
insert into Lec_af_bbs values (LEC_AF_BBS_SEQ.nextval,'수강후기2','khj',sysdate,18000,'가나다라마바사아자차카타',0);
insert into Lec_af_bbs values (LEC_AF_BBS_SEQ.nextval,'수강후기3','khj',sysdate,18000,'가나다라마바사아자차카타',0);
insert into Lec_af_bbs values (LEC_AF_BBS_SEQ.nextval,'수강후기4','khj',sysdate,18000,'가나다라마바사아자차카타',0);
insert into Lec_af_bbs values (LEC_AF_BBS_SEQ.nextval,'수강후기4','khj',sysdate,18001,'가나다라마바사아자차카타',0);
insert into Lec_af_bbs values (LEC_AF_BBS_SEQ.nextval,'수강후기4','khj',sysdate,18001,'가나다라마바사아자차카타',0);
insert into Lec_af_bbs values (LEC_AF_BBS_SEQ.nextval,'수강후기4','khj',sysdate,18001,'가나다라마바사아자차카타',0);

select * from LEC_AF_BBS;

/*LEC_NOTICE_BBS 강의공지사항게시판*/
truncate table LEC_NOTICE_BBS;
insert into LEC_NOTICE_BBS values (LEC_NOTICE_BBS_SEQ.nextval,'제목1','아이디1',sysdate,18000,'내용내용내용내용내용',0);
insert into LEC_NOTICE_BBS values (LEC_NOTICE_BBS_SEQ.nextval,'제목2','아이디2',sysdate,18000,'내용내용내용내용내용',0);
insert into LEC_NOTICE_BBS values (LEC_NOTICE_BBS_SEQ.nextval,'제목3','아이디3',sysdate,18000,'내용내용내용내용내용',0);
insert into LEC_NOTICE_BBS values (LEC_NOTICE_BBS_SEQ.nextval,'제목4','아이디4',sysdate,18000,'내용내용내용내용내용',0);
insert into LEC_NOTICE_BBS values (LEC_NOTICE_BBS_SEQ.nextval,'제목5','아이디5',sysdate,18001,'내용내용내용내용내용',0);
insert into LEC_NOTICE_BBS values (LEC_NOTICE_BBS_SEQ.nextval,'제목6','아이디6',sysdate,18001,'내용내용내용내용내용',0);


/*JOB_INFO_BBS 취업정보게시판*/
truncate table JOB_INFO_BBS;
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목1','임시',SYSDATE,'삼성',	100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목2','임시',SYSDATE,'2성', 100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용2',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목3','임시',SYSDATE,'3성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용3',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목4','임시3',SYSDATE,'4성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용4',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목5','임시3',SYSDATE,'5성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용5',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목6','임시3',SYSDATE,'6성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용6',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목7','임시3',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용7',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목8','임시',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용8',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목9','임시',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용9',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목10','임시',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용10',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목11','임시',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용11',0);


--insert 서브쿼리 test
insert into lec_notice_bbs values (LEC_NOTICE_BBS_SEQ.nextval,'제목7','임시id',sysdate,
				(select lec_code from MEMBER where id='임시id'), 'test', 0);
				
				--강의게시판 selectAll 테스트
select rownum as rn, A.num, A.title, A.id, A.nalja, A.view_num from 
				(select num, title, id, nalja, view_num, lec_code from lec_notice_bbs order by num) A 
				where A.lec_code=(select lec_code from MEMBER where id='임시id')
				order by rn desc;
				
/*Attend 출석DB*/
truncate table Attend;
INSERT INTO ATTEND values(
   'stu01', TO_DATE('2018/02/06', 'yyyy/mm/dd'), (select name from MEMBER where id='stu01'), TO_DATE('2018/02/06 9:42:25', 'yyyy/mm/dd HH24:MI:SS'), 
   TO_DATE('2018/02/06 18:30:25', 'yyyy/mm/dd HH24:MI:SS'), '지각', (select lec_code from MEMBER where id='stu01')  
);
INSERT INTO ATTEND values(
   'stu01', TO_DATE('2018/02/07', 'yyyy/mm/dd'), (select name from MEMBER where id='stu01'), TO_DATE('2018/02/07 9:30:25', 'yyyy/mm/dd HH24:MI:SS'), 
   TO_DATE('2018/02/07 18:30:25', 'yyyy/mm/dd HH24:MI:SS'), '출석', (select lec_code from MEMBER where id='stu01')  
);
INSERT INTO ATTEND values(
   'stu01', TO_DATE('2018/02/08', 'yyyy/mm/dd'), (select name from MEMBER where id='stu01'), null, 
   null, '결석', (select lec_code from MEMBER where id='stu01')  
);
INSERT INTO ATTEND values(
   'stu01', TO_DATE('2018/02/09', 'yyyy/mm/dd'), (select name from MEMBER where id='stu01'), TO_DATE('2018/02/09 9:30:25', 'yyyy/mm/dd HH24:MI:SS'), 
   TO_DATE('2018/02/09 18:30:25', 'yyyy/mm/dd HH24:MI:SS'), '출석', (select lec_code from MEMBER where id='stu01')  
);
INSERT INTO ATTEND values(
   'stu01', TO_DATE('2018/02/10', 'yyyy/mm/dd'), (select name from MEMBER where id='stu01'), null, 
   null, '결석', (select lec_code from MEMBER where id='stu01')  
);
INSERT INTO ATTEND values(
   'stu01', TO_DATE('2018/02/11', 'yyyy/mm/dd'), (select name from MEMBER where id='stu01'), null, 
   null, '결석', (select lec_code from MEMBER where id='stu01')  
);
INSERT INTO ATTEND values(
   'stu01', TO_DATE('2018/02/12', 'yyyy/mm/dd'), (select name from MEMBER where id='stu01'), null, 
   null, '결석', (select lec_code from MEMBER where id='stu01')  
);
INSERT INTO ATTEND values(
   'stu02', TO_DATE('2018/02/09', 'yyyy/mm/dd'), (select name from MEMBER where id='stu02'), TO_DATE('2018/02/09 9:50:25', 'yyyy/mm/dd HH24:MI:SS'), 
   TO_DATE('2018/02/09 18:30:25', 'yyyy/mm/dd HH24:MI:SS'), '지각', (select lec_code from MEMBER where id='stu02')  
);

select * from ATTEND;
--count(decode()) 테스트
select count(decode(state,'지각','1')) as late,count(decode(state,'결석','1')) as absent from ATTEND group by id having id='stu01';

--한 학생의 출결 조회 : 이름,날짜,입실,퇴실,출결상태, 지각횟수,결석횟수
select  A.name, A.nalja, to_char(A.in_date,'HH24:MI:SS') as in_date, to_char(A.out_date,'HH24:MI:SS') as out_date, A.state, 
	(select count(decode(state,'지각','1')) from ATTEND group by id having id='stu01') as late ,
	(select count(decode(state,'결석','1')) from Attend group by id having id='stu01') as absent  
	from attend A where A.id='stu01' order by nalja desc;

/*SCORE 성적DB*/
truncate table SCORE;
insert into SCORE values ('stu01','학생1',90,80,50,220,18000);	
insert into SCORE values ('stu03','학생3',100,100,100,300,18000);	
insert into SCORE values ('stu02','학생2',40,60,50,150,18001);	


/*LEC_ROOM 강의실DB*/
truncate table LEC_ROOM;
insert into LEC_ROOM values (101,'사용',20);
insert into LEC_ROOM values (102,'빔',20);
insert into LEC_ROOM values (103,'빔',20);
insert into LEC_ROOM values (104,'빔',20);

/*LEC_INFO 강의DB*/
truncate table LEC_INFO;
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명1','아무개',sysdate,sysdate,20,'java',101);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명2','아무개2',sysdate,sysdate,20,'web',102);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명3','아무개3',sysdate,sysdate,20,'db',103);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명4','아무개4',sysdate,sysdate,20,'java',104);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명5','아무개5',sysdate,sysdate,20,'java',101);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명6','아무개6',sysdate,sysdate,20,'web',102);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명7','아무개7',sysdate,sysdate,20,'db',103);
insert into LEC_INFO values (LEC_CODE_SEQ.nextval,'테스트명8','아무개8',sysdate,sysdate,20,'java',104);

/*MEMBER 계정DB*/
truncate table MeMBER
insert into MEMBER values ('stu01', '1234', '학생1', 123456, 'stu01@naver.com', 0, 0);
insert into MEMBER values ('stu02', '1234', '학생2', 123456, 'stu02@naver.com', 0, 0);
insert into MEMBER values ('stu03', '1234', '학생3', 123456, 'stu03@naver.com', 0, 0);
insert into MEMBER values ('tea00', '1234', '강사1', 123456, 'tea00@naver.com', 1, 0);
insert into MEMBER values ('tea01', '1234', '강사2', 123456, 'tea01@naver.com', 1, 0);
insert into MEMBER values ('admin', '1234', '관리자', 123456, 'admin@naver.com', 5, 0);

/*JOB_INFO_BBS 취업정보 게시판*/
truncate table JOB_INFO_BBS;
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목1','임시',SYSDATE,'삼성',	100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목2','임시',SYSDATE,'2성', 100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용2',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목3','임시',SYSDATE,'3성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용3',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목4','임시3',SYSDATE,'4성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용4',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목5','임시3',SYSDATE,'5성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용5',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목6','임시3',SYSDATE,'6성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용6',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목7','임시3',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용7',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목8','임시',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용8',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목9','임시',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용9',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목10','임시',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용10',0);
INSERT INTO JOB_INFO_BBS VALUES (
	JOB_INFO_BBS_SEQ.NEXTVAL,'제목11','임시',SYSDATE,'7성',100,'계약직',2000,'서울','-',SYSDATE+10,'123@COM','상세모집내용11',0);



INSERT INTO ATTEND values(
	'test123', TO_DATE('2018/05/29', 'yyyy/mm/dd'), '111', TO_DATE('8:30:25', 'HH24:MI:SS'), 
	TO_DATE('18:30:25', 'HH24:MI:SS'), '출석', 18001  
);
	
	


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



/*JOB_AF_BBS dummy 취업현황게시판*/
/* 취업현황 게시판
CREATE TABLE JOB_AF_BBS (
	NUM NUMBER NOT NULL, /* 글번호 */
	TITLE VARCHAR2(100) NOT NULL, /* 제목 */
	CONTENTS VARCHAR2(1500) NOT NULL, /* 내용 */
	NALJA DATE NOT NULL, /* 등록일 */
	COMPANY VARCHAR2(30), /* 취업 업체명 */
	ID VARCHAR2(50) NOT NULL, /* 아이디 */
	VIEW_NUM NUMBER, /* 조회수 */
	LEC_CODE NUMBER NOT NULL, /* 강의코드 */
	FIELD VARCHAR2(50), /* 취업 분야 */
	NAME VARCHAR2(50) NOT NULL /* 취업자명 */
);
*/
truncate table JOB_AF_BBS;
insert into JOB_AF_BBS values(JOB_AF_BBS_SEQ.nextval,'title1','contents1',sysdate,'company1','user1',0,1111,'java','user1');
insert into JOB_AF_BBS values(JOB_AF_BBS_SEQ.nextval,'title2','contents2',sysdate,'company2','user2',0,1111,'java','user2');
insert into JOB_AF_BBS values(JOB_AF_BBS_SEQ.nextval,'title3','contents3',sysdate,'company3','user3',0,1111,'java','user3');
insert into JOB_AF_BBS values(JOB_AF_BBS_SEQ.nextval,'title4','contents4',sysdate,'company4','user4',0,1111,'java','user4');
insert into JOB_AF_BBS values(JOB_AF_BBS_SEQ.nextval,'title5','contents5',sysdate,'company5','user5',0,1111,'java','user5');
insert into JOB_AF_BBS values(JOB_AF_BBS_SEQ.nextval,'title6','contents6',sysdate,'company6','user6',0,1111,'java','user6');
insert into JOB_AF_BBS values(JOB_AF_BBS_SEQ.nextval,'title7','contents7',sysdate,'company7','user7',0,1111,'java','user7');

/*emp_notice_bbs dummy 직원게시판*/
/* 
CREATE TABLE EMP_NOTICE_BBS (
	NUM NUMBER NOT NULL, /* 글번호 */
	TITLE VARCHAR2(150) NOT NULL, /* 제목 */
	CONTENTS VARCHAR2(1500) NOT NULL, /* 내용 */
	ID VARCHAR2(50) NOT NULL, /* 아이디 */
	NALJA DATE NOT NULL, /* 등록일 */
	VIEW_NUM NUMBER /* 조회수 */
);
*/
truncate table EMP_NOTICE_BBS;
insert into EMP_NOTICE_BBS values(EMP_NOTICE_BBS_SEQ.nextval,'title1','contents1','user1',sysdate,0);
insert into EMP_NOTICE_BBS values(EMP_NOTICE_BBS_SEQ.nextval,'title2','contents2','user2',sysdate,0);
insert into EMP_NOTICE_BBS values(EMP_NOTICE_BBS_SEQ.nextval,'title3','contents3','user3',sysdate,0);
insert into EMP_NOTICE_BBS values(EMP_NOTICE_BBS_SEQ.nextval,'title4','contents4','user4',sysdate,0);
insert into EMP_NOTICE_BBS values(EMP_NOTICE_BBS_SEQ.nextval,'title5','contents5','user5',sysdate,0);
insert into EMP_NOTICE_BBS values(EMP_NOTICE_BBS_SEQ.nextval,'title6','contents6','user6',sysdate,0);
insert into EMP_NOTICE_BBS values(EMP_NOTICE_BBS_SEQ.nextval,'title7','contents7','user7',sysdate,0);

