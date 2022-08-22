-- zerock 계정으로 



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