-- zerock 계정으로 
create table member(
    memno Number,
    nickname varchar2(20),
    id varchar2(20),
    phoneNum varchar2(50),
    email varchar2(100),
    pw varchar2(20),
    name varchar2(10),
    address varchar2(100),
    companyno varchar2(50),
    birth varchar2(100),
    rank number,
    constraint pk_memno primary key(memno)
);

