 DROP TABLE member;
 CREATE TABLE member (
     memberid VARCHAR2(50) PRIMARY KEY,
     name VARCHAR2(50) NOT NULL,
     password VARCHAR2(10) NOT NULL,
     regdate DATE NOT NULL
 );
 
 SELECT * FROM member;

SELECT * FROM member WHERE ROWNUM=1 ORDER BY REGDATE DESC;

DROP TABLE article;
CREATE TABLE article (
    article_no NUMBER GENERATED AS IDENTITY,
    writer_id VARCHAR2(50) NOT NULL,
    writer_name VARCHAR2(50) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnt NUMBER,
    PRIMARY KEY (article_no)
);

ALTER table article rename column read_cnd to read_cnt
;

SELECT * FROM article;
SELECT COUNT(*) FROM article;
SELECT * FROM article_Content;

CREATE TABLE article_content (
    article_no NUMBER PRIMARY KEY,
    content VARCHAR2(4000)
);


--page 처리
SELECT count(*) FROM article;
INSERT INTO article (writer_id, Writer_name, title, regdate, moddate, read_cnt)
VALUES ('a', 'a', 'a', sysdate, sysdate, 0); --일단 여러페이지나오게 더미 데이터 넣음
COMMIT;
--article_no를 반대로 정렬시키고 ROW_NUMBER()를 부여함
SELECT article_no, title, ROW_NUMBER() OVER (ORDER BY article_no DESC) rn FROM article ORDER BY article_no DESC;

SELECT * FROM (
SELECT article_no, title, ROW_NUMBER() OVER (ORDER BY article_no DESC) rn FROM article
)
WHERE rn BETWEEN 1 AND 5;

SELECT rn, article_no, writer_id, writer_name, title, regdate, moddate, read_cnt 
FROM (SELECT article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, ROW_NUMBER()
OVER (ORDER BY article_no DESC) rn FROM article ) WHERE rn BETWEEN 1 AND 5;
