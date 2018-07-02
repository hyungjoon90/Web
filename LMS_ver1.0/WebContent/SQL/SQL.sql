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

/* ������� �Խ��� */
DROP TABLE JOB_INFO_BBS 
	CASCADE CONSTRAINTS;

/* ���� �������� �Խ��� */
DROP TABLE LEC_NOTICE_BBS 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE LEC_INFO 
	CASCADE CONSTRAINTS;

/* ������������ �Խ��� */
DROP TABLE EMP_NOTICE_BBS 
	CASCADE CONSTRAINTS;

/* ���ǽ� */
DROP TABLE LEC_ROOM 
	CASCADE CONSTRAINTS;

/* �����ı�Խ��� */
DROP TABLE LEC_AF_BBS 
	CASCADE CONSTRAINTS;

/* ���Խ��� */
DROP TABLE CONSULT_BBS 
	CASCADE CONSTRAINTS;

/* �����Ȳ �Խ��� */
DROP TABLE JOB_AF_BBS 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE SCORE 
	CASCADE CONSTRAINTS;

/* �⼮ */
DROP TABLE ATTEND 
	CASCADE CONSTRAINTS;


/* ������� �Խ��� */
CREATE TABLE JOB_INFO_BBS (
	NUM NUMBER NOT NULL, /* �۹�ȣ */
	TITLE VARCHAR(150) NOT NULL, /* ���� */
	ID VARCHAR2(50) NOT NULL, /* ���̵� */
	NALJA DATE DEFAULT sysdate NOT NULL, /* ����� */
	COMPANY VARCHAR2(50) NOT NULL, /* ��ü�� */
	HIRE_NUM NUMBER, /* �����ο� */
	HIRE_TYPE VARCHAR2(50), /* �������� */
	SAL VARCHAR2(50), /* �޿� */
	REGION VARCHAR2(50) NOT NULL, /* �ٹ����� */
	QUALILFY VARCHAR2(50), /* �����ڰ� */
	DUE_DATE DATE NOT NULL, /* ���������� */
	EMAIL VARCHAR2(50), /* �̸��� */
	CONTENTS VARCHAR2(1500), /* �󼼳��� */
	VIEW_NUM NUMBER /* ��ȸ�� */
);

ALTER TABLE JOB_INFO_BBS
	ADD
		CONSTRAINT PK_JOB_INFO_BBS
		PRIMARY KEY (
			NUM
		);

/* ���� �������� �Խ��� */
CREATE TABLE LEC_NOTICE_BBS (
	NUM NUMBER NOT NULL, /* �۹�ȣ */
	TITLE VARCHAR(150) NOT NULL, /* ���� */
	ID VARCHAR2(50) NOT NULL, /* ���̵� */
	NALJA DATE NOT NULL, /* ����� */
	LEC_CODE NUMBER NOT NULL, /* �����ڵ� */
	CONTENTS VARCHAR2(1500) NOT NULL, /* ���� */
	VIEW_NUM NUMBER /* ��ȸ�� */
);

ALTER TABLE LEC_NOTICE_BBS
	ADD
		CONSTRAINT PK_LEC_NOTICE_BBS
		PRIMARY KEY (
			NUM
		);

/* ���� */
CREATE TABLE MEMBER (
	ID VARCHAR2(50) NOT NULL, /* ���̵� */
	PASSWORD VARCHAR2(50) NOT NULL, /* ��й�ȣ */
	NAME VARCHAR2(50) NOT NULL, /* �̸� */
	PHONE VARCHAR2(30) NOT NULL, /* �ڵ�����ȣ */
	EMAIL VARCHAR2(40) NOT NULL, /* �̸��� */
	MEM_TYPE NUMBER, /* �������� */
	LEC_CODE NUMBER /* �����ڵ� */
);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			ID
		);

/* ���� */
CREATE TABLE LEC_INFO (
	LEC_CODE NUMBER NOT NULL, /* �����ڵ� */
	CLASS VARCHAR2(50) NOT NULL, /* ���Ǹ� */
	TEACHER VARCHAR2(50) NOT NULL, /* ���� */
	OPEN_DATE DATE NOT NULL, /* ������ */
	END_DATE DATE NOT NULL, /* ������ */
	MAX_AB NUMBER NOT NULL, /* �ִ�Ἦ�� */
	KEYWORD VARCHAR2(30), /* Ű���� */
	CLASSNO NUMBER NOT NULL /* ���ǽǹ�ȣ */
);

ALTER TABLE LEC_INFO
	ADD
		CONSTRAINT PK_LEC_INFO
		PRIMARY KEY (
			LEC_CODE
		);

/* ������������ �Խ��� */
CREATE TABLE EMP_NOTICE_BBS (
	NUM NUMBER NOT NULL, /* �۹�ȣ */
	TITLE VARCHAR2(150) NOT NULL, /* ���� */
	CONTENTS VARCHAR2(1500) NOT NULL, /* ���� */
	ID VARCHAR2(50) NOT NULL, /* ���̵� */
	NALJA DATE NOT NULL, /* ����� */
	VIEW_NUM NUMBER /* ��ȸ�� */
);

ALTER TABLE EMP_NOTICE_BBS
	ADD
		CONSTRAINT PK_EMP_NOTICE_BBS
		PRIMARY KEY (
			NUM
		);

/* ���ǽ� */
CREATE TABLE LEC_ROOM (
	CLASSNO NUMBER NOT NULL, /* ���ǽǹ�ȣ */
	USING VARCHAR2(10) NOT NULL, /* ���ǽǻ�뿩�� */
	MAX_NUM NUMBER NOT NULL /* �ִ����� */
);

ALTER TABLE LEC_ROOM
	ADD
		CONSTRAINT PK_LEC_ROOM
		PRIMARY KEY (
			CLASSNO
		);

/* �����ı�Խ��� */
CREATE TABLE LEC_AF_BBS (
	NUM NUMBER NOT NULL, /* �۹�ȣ */
	TITLE VARCHAR2(150) NOT NULL, /* ���� */
	ID VARCHAR2(50) NOT NULL, /* ���̵� */
	NALJA DATE NOT NULL, /* ����� */
	LEC_CODE NUMBER NOT NULL, /* �����ڵ� */
	CONTENTS VARCHAR2(1500) NOT NULL, /* ���� */
	VIEW_NUM NUMBER /* ��ȸ�� */
);

ALTER TABLE LEC_AF_BBS
	ADD
		CONSTRAINT PK_LEC_AF_BBS
		PRIMARY KEY (
			NUM
		);

/* ���Խ��� */
CREATE TABLE CONSULT_BBS (
	NUM NUMBER NOT NULL, /* �۹�ȣ */
	TITLE VARCHAR2(150) NOT NULL, /* ���� */
	NALJA DATE NOT NULL, /* ����� */
	ID VARCHAR2(50) NOT NULL, /* ���̵� */
	GEN VARCHAR2(5) NOT NULL, /* ���� */
	EMAIL VARCHAR2(50), /* �̸��� */
	PHONE VARCHAR2(30) NOT NULL, /* �ڵ�����ȣ */
	PURPOSE VARCHAR2(50) NOT NULL, /* �������� */
	LEC_CODE NUMBER NOT NULL, /* �����ڵ� */
	CONTENTS VARCHAR2(1500), /* ���� */
	ANSWER VARCHAR2(1500), /* �亯���� */
	VIEW_NUM NUMBER /* ��ȸ�� */
);

ALTER TABLE CONSULT_BBS
	ADD
		CONSTRAINT PK_CONSULT_BBS
		PRIMARY KEY (
			NUM
		);

/* �����Ȳ �Խ��� */
CREATE TABLE JOB_AF_BBS (
	NUM NUMBER NOT NULL, /* �۹�ȣ */
	TITLE VARCHAR2(100) NOT NULL, /* ���� */
	CONTENTS VARCHAR2(1500) NOT NULL, /* ���� */
	NALJA DATE NOT NULL, /* ����� */
	COMPANY VARCHAR2(30), /* ��� ��ü�� */
	ID VARCHAR2(50) NOT NULL, /* ���̵� */
	VIEW_NUM NUMBER, /* ��ȸ�� */
	LEC_CODE NUMBER NOT NULL, /* �����ڵ� */
	FIELD VARCHAR2(50) /* ��� �о� */
);

ALTER TABLE JOB_AF_BBS
	ADD
		CONSTRAINT PK_JOB_AF_BBS
		PRIMARY KEY (
			NUM
		);

/* ���� */
CREATE TABLE SCORE (
	ID VARCHAR2(50) NOT NULL, /* ���̵� */
	NAME VARCHAR2(9) NOT NULL, /* �������� */
	JAVA NUMBER, /* JAVA */
	DB NUMBER, /* DataBase */
	WEB NUMBER, /* Web */
	TOT NUMBER, /* �հ� */
	LEC_CODE NUMBER NOT NULL /* �����ڵ� */
);

ALTER TABLE SCORE
	ADD
		CONSTRAINT PK_SCORE
		PRIMARY KEY (
			ID
		);

/* �⼮ */
CREATE TABLE ATTEND (
	ID VARCHAR2(50) NOT NULL, /* ���̵� */
	NAME VARCHAR2(9) NOT NULL, /* �������� */
	CLASS VARCHAR2(30) NOT NULL, /* ���Ǹ� */
	NALJA DATE NOT NULL, /* ��¥ */
	IN_TIME DATE, /* �Խǽð� */
	OUT_TIME DATE, /* ��ǽð� */
	STATE VARCHAR2(12), /* �⼮���� */
	LEC_CODE NUMBER NOT NULL /* �����ڵ� */
);

ALTER TABLE ATTEND
	ADD
		CONSTRAINT PK_ATTEND
		PRIMARY KEY (
			ID
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