CREATE TABLE MEMBER 
(
  MEMNO NUMBER 
, NICKNAME VARCHAR2(20 BYTE) 
, ID VARCHAR2(20 BYTE) NOT NULL 
, PHONENUM INT NOT NULL
, EMAIL VARCHAR2(100 BYTE) unique
, PW VARCHAR2(20 BYTE)
, NAME VARCHAR2(10 BYTE)
, ADDRESS VARCHAR2(100 BYTE)
, COMPANYNO VARCHAR2(50 BYTE)
, BIRTH varchar2(100)
, RANK INT
, auth number DEFAULT 0
, fullName varchar2(200),
sessionkey VARCHAR(50) default 'none',
sessionlimit TIMESTAMP,
constraint pk_memno primary key(memno)

);
drop table member;

create table authEmail(
    email varchar2(100),
    authkey varchar2(100),
    constraint fk_email foreign key (email) references member(email)
    on delete cascade
);


UPDATE MEMBER SET sessionkey ='Y';


-- 공지 create table
/*
CREATE TABLE Notice (
                        noticeNo NUMBER,
                        memNo NUMBER,
                        noticeTitle VARCHAR2(255),
                        noticeContent VARCHAR2(255),
                        regdate date,

                        CONSTRAINT notice_pk PRIMARY KEY(noticeNo)
);

CREATE SEQUENCE notice_num INCREMENT BY 1;


-- 1:1문의
create table QNA (
                     qnaNo Number,
                     memNo Number,
                     nickname varchar2(20),
                     qnaTitle VARCHAR2(255),
                     qnaContent VARCHAR2(300),
                     qnaDate date,
                     answerDate date,
                     status VARCHAR2(10),

                     CONSTRAINT QNA_pk PRIMARY KEY(qnaNo),
                     constraint status_ck check (status = 1 or status = 0)
);

CREATE SEQUENCE qna_ID INCREMENT BY 1;

  */

