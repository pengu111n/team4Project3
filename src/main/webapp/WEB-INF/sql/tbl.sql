-- zerock 계정으로 
create table member(
    memno Number,
    nickname varchar2(20),
    id varchar2(100),
    phoneNum varchar2(50),
    email varchar2(100) unique,
    pw varchar2(100),
    name varchar2(100),
    address varchar2(100),
    companyno varchar2(50),
    birth varchar2(100),
    rank number,
    auth number  DEFAULT 0,
    constraint pk_memno primary key(memno)
);

create SEQUENCE memNo_seq INCREMENT by 1;

create table authEmail(
    email varchar2(100),
    authkey varchar2(100),
    constraint fk_email foreign key (email) references member(email)
    on delete cascade
);

create table member_img(
    fullName varchar2(200),
    memno Number,
    constraint fk_Memno foreign key(memno) references member(memno)
    on delete cascade
)