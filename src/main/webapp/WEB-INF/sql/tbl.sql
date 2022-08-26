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
CREATE TABLE Notice (
                        noticeNo NUMBER,
                        noticeTitle VARCHAR2(255),
                        noticeContent VARCHAR2(255),
                        regdate date,
                        MEMNO NUMBER ,
                        constraint fk_noticememno foreign key (memno) references member(memno),
                        CONSTRAINT notice_pk PRIMARY KEY(noticeNo)
);


CREATE SEQUENCE notice_num INCREMENT BY 1;



-- 1:1문의
create table QNA (
                     qnaNo Number,
                     MEMNO Number,
                     nickname varchar2(20 BYTE),
                     category  varchar2(30),
                     qnaTitle VARCHAR2(255),
                     qnaContent VARCHAR2(300),
                     qnaDate date,
                     status NUMBER,
                     answerContent VARCHAR2(300),
                     CONSTRAINT qna_pk PRIMARY KEY(qnaNo),
                     CONSTRAINT memno_fk foreign KEY(MEMNO) references member,
                     constraint status_ck check (status = 1 or status = 0)
);


--기업 게시판
create table cboard (
     cbno NUMBER,
     memNo NUMBER,
     companyName VARCHAR(50),
     ctitle VARCHAR(100),
     content VARCHAR2(2000),
     cnstType VARCHAR2(50), --시공유형(종합,도배,,)
     space VARCHAR2(50), --공간(사무/오피스)
     area NUMBER, --시공면적
     cost VARCHAR2(50), --시공금액
     period VARCHAR(200), --시공기간
     regDate DATE DEFAULT SYSDATE,
     modDate DATE DEFAULT SYSDATE,
     phoneNum VARCHAR(100),
     email VARCHAR(100),
     address VARCHAR(100),
     PRIMARY KEY(cbno)
);

CREATE SEQUENCE cbno_seq START WITH 1 INCREMENT BY 1;

-- 기업 게시물 첨부파일 테이블
create table cb_attach (
fullName VARCHAR2(150) not null,
cbno NUMBER not null,
regDate DATE DEFAULT SYSDATE,
primary key (fullName)
);

--기업 게시물 첨부파일  참조키 설정
alter table cb_attach add constraint fk_cboard_attach
foreign key (cbno) references cboard (cbno) ON DELETE CASCADE;




--회원 게시판
create table board (
boardNo NUMBER,
id VARCHAR2(100),
nickname VARCHAR2(100),
memNo NUMBER,
title VARCHAR2(100),
regDate DATE,
modifiedDate DATE,
category VARCHAR2(100),
address VARCHAR2(100),
area NUMBER,
startDate DATE,
endDate DATE,
budget VARCHAR2(100),
part VARCHAR2(100),
require VARCHAR2(1000),
image VARCHAR2(100),
view_count NUMBER
);

CREATE SEQUENCE boardNo_seq START WITH 1 INCREMENT BY 1;

create table board_reply (
boardNo NUMBER,
replyno NUMBER,
replycontent VARCHAR2(1000),
nickname VARCHAR2(1000),
regdate DATE,
updatedate DATE
);

CREATE SEQUENCE replyNo_seq START WITH 1 INCREMENT BY 1;

create table board_attach (
boardNo NUMBER,
fullName VARCHAR2(1000),
regdate DATE
);
