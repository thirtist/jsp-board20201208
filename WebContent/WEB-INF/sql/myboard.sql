 DROP TABLE member;
 CREATE TABLE member (
     memberid VARCHAR2(50) PRIMARY KEY,
     name VARCHAR2(50) NOT NULL,
     password VARCHAR2(10) NOT NULL,
     regdate DATE NOT NULL
 );
 
 SELECT * FROM member;

CREATE TABLE article (
    article_no NUMBER GENERATED AS IDENTITY,
    writer_id VARCHAR2(50) NOT NULL,
    writer_name VARCHAR2(50) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnd NUMBER,
    PRIMARY KEY (article_no)
);

CREATE TABLE article_content (
    article_no NUMBER PRIMARY KEY,
    content VARCHAR2(4000)
);

