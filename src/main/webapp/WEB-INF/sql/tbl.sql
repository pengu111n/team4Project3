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