ALTER TABLE JOB_INFO_BBS
	DROP
		CONSTRAINT FK_MEMBER_TO_JOB_INFO_BBS
		CASCADE;

ALTER TABLE LEC_NOTICE_BBS
	DROP
		CONSTRAINT FK_LEC_INFO_TO_LEC_NOTICE_BBS
		CASCADE;

ALTER TABLE LEC_NOTICE_BBS
	DROP
		CONSTRAINT FK_MEMBER_TO_LEC_NOTICE_BBS
		CASCADE;

ALTER TABLE MEMBER
	DROP
		CONSTRAINT FK_LEC_INFO_TO_MEMBER
		CASCADE;

ALTER TABLE LEC_INFO
	DROP
		CONSTRAINT FK_LEC_ROOM_TO_LEC_INFO
		CASCADE;

ALTER TABLE EMP_NOTICE_BBS
	DROP
		CONSTRAINT FK_MEMBER_TO_EMP_NOTICE_BBS
		CASCADE;

ALTER TABLE LEC_AF_BBS
	DROP
		CONSTRAINT FK_LEC_INFO_TO_LEC_AF_BBS
		CASCADE;

ALTER TABLE LEC_AF_BBS
	DROP
		CONSTRAINT FK_MEMBER_TO_LEC_AF_BBS
		CASCADE;

ALTER TABLE CONSULT_BBS
	DROP
		CONSTRAINT FK_LEC_INFO_TO_CONSULT_BBS
		CASCADE;

ALTER TABLE CONSULT_BBS
	DROP
		CONSTRAINT FK_MEMBER_TO_CONSULT_BBS
		CASCADE;

ALTER TABLE JOB_AF_BBS
	DROP
		CONSTRAINT FK_LEC_INFO_TO_JOB_AF_BBS
		CASCADE;

ALTER TABLE JOB_AF_BBS
	DROP
		CONSTRAINT FK_MEMBER_TO_JOB_AF_BBS
		CASCADE;

ALTER TABLE SCORE
	DROP
		CONSTRAINT FK_MEMBER_TO_SCORE
		CASCADE;

ALTER TABLE SCORE
	DROP
		CONSTRAINT FK_LEC_INFO_TO_SCORE
		CASCADE;

ALTER TABLE ATTEND
	DROP
		CONSTRAINT FK_MEMBER_TO_ATTEND
		CASCADE;

ALTER TABLE ATTEND
	DROP
		CONSTRAINT FK_LEC_INFO_TO_ATTEND
		CASCADE;

ALTER TABLE JOB_INFO_BBS
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE LEC_NOTICE_BBS
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE MEMBER
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE LEC_INFO
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE EMP_NOTICE_BBS
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE LEC_ROOM
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE LEC_AF_BBS
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE CONSULT_BBS
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE JOB_AF_BBS
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE SCORE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE ATTEND
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 취업정보 게시판 */
DROP TABLE JOB_INFO_BBS 
	CASCADE CONSTRAINTS;

/* 강의 공지사항 게시판 */
DROP TABLE LEC_NOTICE_BBS 
	CASCADE CONSTRAINTS;

/* 계정 */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* 강의 */
DROP TABLE LEC_INFO 
	CASCADE CONSTRAINTS;

/* 직원공지사항 게시판 */
DROP TABLE EMP_NOTICE_BBS 
	CASCADE CONSTRAINTS;

/* 강의실 */
DROP TABLE LEC_ROOM 
	CASCADE CONSTRAINTS;

/* 수강후기게시판 */
DROP TABLE LEC_AF_BBS 
	CASCADE CONSTRAINTS;

/* 상담게시판 */
DROP TABLE CONSULT_BBS 
	CASCADE CONSTRAINTS;

/* 취업현황 게시판 */
DROP TABLE JOB_AF_BBS 
	CASCADE CONSTRAINTS;

/* 성적 */
DROP TABLE SCORE 
	CASCADE CONSTRAINTS;

/* 출석 */
DROP TABLE ATTEND 
	CASCADE CONSTRAINTS;

/* 임시 테이블 */
DROP TABLE Temporary 
	CASCADE CONSTRAINTS;

/* 취업정보 게시판 */
CREATE TABLE JOB_INFO_BBS (
	NUM NUMBER NOT NULL, /* 글번호 */
	TITLE VARCHAR(150) NOT NULL, /* 제목 */
	ID VARCHAR2(50) NOT NULL, /* 아이디 */
	NALJA DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	COMPANY VARCHAR2(50) NOT NULL, /* 업체명 */
	HIRE_NUM NUMBER, /* 모집인원 */
	HIRE_TYPE VARCHAR2(50), /* 고용형태 */
	SAL NUMBER, /* 급여 */
	REGION VARCHAR2(50) NOT NULL, /* 근무지역 */
	QUALIFY VARCHAR2(50), /* 응시자격 */
	DUE_DATE DATE NOT NULL, /* 모집마감일 */
	EMAIL VARCHAR2(50), /* 이메일 */
	CONTENTS VARCHAR2(1500), /* 상세내용 */
	VIEW_NUM NUMBER /* 조회수 */
);

ALTER TABLE JOB_INFO_BBS
	ADD
		CONSTRAINT PK_JOB_INFO_BBS
		PRIMARY KEY (
			NUM
		);

/* 강의 공지사항 게시판 */
CREATE TABLE LEC_NOTICE_BBS (
	NUM NUMBER NOT NULL, /* 글번호 */
	TITLE VARCHAR(150) NOT NULL, /* 제목 */
	ID VARCHAR2(50) NOT NULL, /* 아이디 */
	NALJA DATE NOT NULL, /* 등록일 */
	LEC_CODE NUMBER NOT NULL, /* 강의코드 */
	CONTENTS VARCHAR2(1500) NOT NULL, /* 내용 */
	VIEW_NUM NUMBER /* 조회수 */
);

ALTER TABLE LEC_NOTICE_BBS
	ADD
		CONSTRAINT PK_LEC_NOTICE_BBS
		PRIMARY KEY (
			NUM
		);

/* 계정 */
CREATE TABLE MEMBER (
	ID VARCHAR2(50) NOT NULL, /* 아이디 */
	PASSWORD VARCHAR2(50) NOT NULL, /* 비밀번호 */
	NAME VARCHAR2(50) NOT NULL, /* 이름 */
	PHONE NUMBER NOT NULL, /* 핸드폰번호 */
	EMAIL VARCHAR2(40) NOT NULL, /* 이메일 */
	MEM_TYPE NUMBER, /* 계정유형 */
	LEC_CODE NUMBER /* 강의코드 */
);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			ID
		);

/* 강의 */
CREATE TABLE LEC_INFO (
	LEC_CODE NUMBER NOT NULL, /* 강의코드 */
	CLASS_NAME VARCHAR2(50) NOT NULL, /* 강의명 */
	TEACHER VARCHAR2(50) NOT NULL, /* 강사 */
	OPEN_DATE DATE NOT NULL, /* 개강일 */
	END_DATE DATE NOT NULL, /* 종강일 */
	MAX_AB NUMBER NOT NULL, /* 최대결석일 */
	KEYWORD VARCHAR2(30), /* 키워드 */
	CLASSNO NUMBER NOT NULL /* 강의실번호 */
);

ALTER TABLE LEC_INFO
	ADD
		CONSTRAINT PK_LEC_INFO
		PRIMARY KEY (
			LEC_CODE
		);

/* 직원공지사항 게시판 */
CREATE TABLE EMP_NOTICE_BBS (
	NUM NUMBER NOT NULL, /* 글번호 */
	TITLE VARCHAR2(150) NOT NULL, /* 제목 */
	CONTENTS VARCHAR2(1500) NOT NULL, /* 내용 */
	ID VARCHAR2(50) NOT NULL, /* 아이디 */
	NALJA DATE NOT NULL, /* 등록일 */
	VIEW_NUM NUMBER /* 조회수 */
);

ALTER TABLE EMP_NOTICE_BBS
	ADD
		CONSTRAINT PK_EMP_NOTICE_BBS
		PRIMARY KEY (
			NUM
		);

/* 강의실 */
CREATE TABLE LEC_ROOM (
	CLASSNO NUMBER NOT NULL, /* 강의실번호 */
	CLASS_USING VARCHAR2(10) NOT NULL, /* 강의실사용여부 */
	MAX_NUM NUMBER NOT NULL /* 최대수용수 */
);

ALTER TABLE LEC_ROOM
	ADD
		CONSTRAINT PK_LEC_ROOM
		PRIMARY KEY (
			CLASSNO
		);

/* 수강후기게시판 */
CREATE TABLE LEC_AF_BBS (
	NUM NUMBER NOT NULL, /* 글번호 */
	TITLE VARCHAR2(150) NOT NULL, /* 제목 */
	ID VARCHAR2(50) NOT NULL, /* 아이디 */
	NALJA DATE NOT NULL, /* 등록일 */
	LEC_CODE NUMBER NOT NULL, /* 강의코드 */
	CONTENTS VARCHAR2(1500) NOT NULL, /* 내용 */
	VIEW_NUM NUMBER /* 조회수 */
);

ALTER TABLE LEC_AF_BBS
	ADD
		CONSTRAINT PK_LEC_AF_BBS
		PRIMARY KEY (
			NUM
		);

/* 상담게시판 */
CREATE TABLE CONSULT_BBS (
	NUM NUMBER NOT NULL, /* 글번호 */
	NAME VARCHAR2(50) NOT NULL, /* 신청자 */
	TITLE VARCHAR2(150) NOT NULL, /* 제목 */
	NALJA DATE NOT NULL, /* 등록일 */
	ID VARCHAR2(50), /* 아이디 */
	GEN VARCHAR2(5) NOT NULL, /* 성별 */
	EMAIL VARCHAR2(50), /* 이메일 */
	PHONE NUMBER NOT NULL, /* 핸드폰번호 */
	PURPOSE VARCHAR2(50) NOT NULL, /* 수강목적 */
	LEC_CODE NUMBER NOT NULL, /* 강의코드 */
	CONTENTS VARCHAR2(1500), /* 내용 */
	ANSWER VARCHAR2(1500), /* 답변내용 */
	VIEW_NUM NUMBER /* 조회수 */
);

ALTER TABLE CONSULT_BBS
	ADD
		CONSTRAINT PK_CONSULT_BBS
		PRIMARY KEY (
			NUM
		);

/* 취업현황 게시판 */
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

ALTER TABLE JOB_AF_BBS
	ADD
		CONSTRAINT PK_JOB_AF_BBS
		PRIMARY KEY (
			NUM
		);

/* 성적 */
CREATE TABLE SCORE (
	ID VARCHAR2(50) NOT NULL, /* 아이디 */
	NAME VARCHAR2(9) NOT NULL, /* 수강생명 */
	JAVA NUMBER, /* JAVA */
	DB NUMBER, /* DataBase */
	WEB NUMBER, /* Web */
	TOT NUMBER, /* 합계 */
	LEC_CODE NUMBER NOT NULL /* 강의코드 */
);

ALTER TABLE SCORE
	ADD
		CONSTRAINT PK_SCORE
		PRIMARY KEY (
			ID
		);

/* 출석 */
CREATE TABLE ATTEND (
	ID VARCHAR2(50) NOT NULL, /* 아이디 */
	NAME VARCHAR2(9) NOT NULL, /* 수강생명 */
	NALJA DATE NOT NULL, /* 날짜 */
	IN_DATE DATE, /* 입실시간 */
	OUT_DATE DATE, /* 퇴실시간 */
	STATE VARCHAR2(12), /* 출석상태 */
	LEC_CODE NUMBER NOT NULL /* 강의코드 */
);

ALTER TABLE ATTEND
	ADD
		CONSTRAINT PK_ATTEND
		PRIMARY KEY (
			ID
		);

/* 임시 테이블 */
CREATE TABLE Temporary (
	WRITTER VARCHAR2(50) NOT NULL /* 글쓴이 */
);

ALTER TABLE JOB_INFO_BBS
	ADD
		CONSTRAINT FK_MEMBER_TO_JOB_INFO_BBS
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE LEC_NOTICE_BBS
	ADD
		CONSTRAINT FK_LEC_INFO_TO_LEC_NOTICE_BBS
		FOREIGN KEY (
			LEC_CODE
		)
		REFERENCES LEC_INFO (
			LEC_CODE
		);

ALTER TABLE LEC_NOTICE_BBS
	ADD
		CONSTRAINT FK_MEMBER_TO_LEC_NOTICE_BBS
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT FK_LEC_INFO_TO_MEMBER
		FOREIGN KEY (
			LEC_CODE
		)
		REFERENCES LEC_INFO (
			LEC_CODE
		);

ALTER TABLE LEC_INFO
	ADD
		CONSTRAINT FK_LEC_ROOM_TO_LEC_INFO
		FOREIGN KEY (
			CLASSNO
		)
		REFERENCES LEC_ROOM (
			CLASSNO
		);

ALTER TABLE EMP_NOTICE_BBS
	ADD
		CONSTRAINT FK_MEMBER_TO_EMP_NOTICE_BBS
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE LEC_AF_BBS
	ADD
		CONSTRAINT FK_LEC_INFO_TO_LEC_AF_BBS
		FOREIGN KEY (
			LEC_CODE
		)
		REFERENCES LEC_INFO (
			LEC_CODE
		);

ALTER TABLE LEC_AF_BBS
	ADD
		CONSTRAINT FK_MEMBER_TO_LEC_AF_BBS
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE CONSULT_BBS
	ADD
		CONSTRAINT FK_LEC_INFO_TO_CONSULT_BBS
		FOREIGN KEY (
			LEC_CODE
		)
		REFERENCES LEC_INFO (
			LEC_CODE
		);

ALTER TABLE CONSULT_BBS
	ADD
		CONSTRAINT FK_MEMBER_TO_CONSULT_BBS
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE JOB_AF_BBS
	ADD
		CONSTRAINT FK_LEC_INFO_TO_JOB_AF_BBS
		FOREIGN KEY (
			LEC_CODE
		)
		REFERENCES LEC_INFO (
			LEC_CODE
		);

ALTER TABLE JOB_AF_BBS
	ADD
		CONSTRAINT FK_MEMBER_TO_JOB_AF_BBS
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE SCORE
	ADD
		CONSTRAINT FK_MEMBER_TO_SCORE
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE SCORE
	ADD
		CONSTRAINT FK_LEC_INFO_TO_SCORE
		FOREIGN KEY (
			LEC_CODE
		)
		REFERENCES LEC_INFO (
			LEC_CODE
		);

ALTER TABLE ATTEND
	ADD
		CONSTRAINT FK_MEMBER_TO_ATTEND
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE ATTEND
	ADD
		CONSTRAINT FK_LEC_INFO_TO_ATTEND
		FOREIGN KEY (
			LEC_CODE
		)
		REFERENCES LEC_INFO (
			LEC_CODE
		);

drop SEQUENCE LEC_CODE;
drop SEQUENCE JOB_INFO_BBS_SEQ;
drop SEQUENCE JOB_AF_BBS_SEQ;
drop SEQUENCE LEC_NOTICE_BBS_SEQ;
drop SEQUENCE EMP_NOTICE_BBS_SEQ;
drop SEQUENCE LEC_AF_BBS_SEQ;
drop SEQUENCE CONSULT_BBS_SEQ;		
		
CREATE SEQUENCE LEC_CODE START WITH 18000;
CREATE SEQUENCE JOB_INFO_BBS_SEQ;
CREATE SEQUENCE JOB_AF_BBS_SEQ;
CREATE SEQUENCE LEC_NOTICE_BBS_SEQ;
CREATE SEQUENCE EMP_NOTICE_BBS_SEQ;
CREATE SEQUENCE LEC_AF_BBS_SEQ;
CREATE SEQUENCE CONSULT_BBS_SEQ;