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
------------
--11g는 GENERATED AS IDENTITY를 못쓰니 시퀀스로 써야함
CREATE SEQUENCE reply_seq;
CREATE TABLE replay (
    replyid NUMBER GENERATED AS IDENTITY,
    memberid VARCHAR2(50) NOT NULL,
    article_no NUMBER NOT NULL,
    body VARCHAR2(1000) NOT NULL,
    regdata DATE NOT NULL
);
INSERT INTO replay (replyid, memberid, article_no, body, regdate)
VALUES (reply_seq.nextVal, ' ', 0,  ' ', SYSDATE);


------------
DROP TABLE reply;
CREATE TABLE reply (
    replyid NUMBER GENERATED AS IDENTITY,
    memberid VARCHAR2(50) NOT NULL,
    article_no NUMBER NOT NULL,
    body VARCHAR2(1000) NOT NULL,
    regdate DATE NOT NULL,
    PRIMARY KEY (replyid)
);
INSERT INTO reply (memberid, article_no, body, regdate)
VALUES (' ', 0, ' ', SYSDATE);

SELECT * FROM reply;

SELECT replyid, memberid, article_no, body, regdate
FROM reply
WHERE article_no = 85
ORDER BY replyid DESC;

SELECT replyid, memberid, article_no, body, regdate FROM reply WHERE article_no = 85 ORDER BY replyid DESC;


----------------------------
--myboardproject--
--테이블 생성
CREATE TABLE member_mbp (
    id VARCHAR2(50) PRIMARY KEY,
    nickname VARCHAR2(50) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    regdate DATE NOT NULL,
    name VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    passwordquestion VARCHAR2(50) NOT NULL,
    passwordanswer VARCHAR2(50) NOT NULL
);
--테이블 컬럼 추가
ALTER TABLE member_mbp ADD (auth VARCHAR2(50) DEFAULT 9);
ALTER TABLE member_mbp ADD (auth_table VARCHAR2(50) DEFAULT null);
--테이블 컬럼 변경
UPDATE member_mbp SET auth = null;
ALTER TABLE member_mbp MODIFY (auth VARCHAR2(50) DEFAULT 'user');
ALTER TABLE member_mbp MODIFY (auth VARCHAR2(50));
ALTER TABLE member_mbp MODIFY (email VARCHAR2(50) UNIQUE);
--테이블 컬럼 삭제
ALTER TABLE member_mbp DROP COLUMN auth_table;
--admin데이터 입력
INSERT INTO member_mbp VALUES ('admin2', 'thirtist', 1234, SYSDATE, '박철수', 'thirtist@naver.com', '좋아하는숫자', 30, DEFAULT);
DELETE member_mbp WHERE id = 'admin2';
--admin행 auth컬럼 수정
UPDATE member_mbp SET auth = 'admin' WHERE id = 'admin';
UPDATE member_mbp SET auth = 'user';
UPDATE member_mbp SET auth = null;
--AUTH행을 없애기로 결정
ALTER TABLE member_mbp DROP COLUMN AUTH;

--SELECT BY ID--
SELECT * FROM member_mbp WHERE id='1';
SELECT * FROM member_mbp;

SELECT * FROM user_constraints WHERE table_name = 'MEMBER_MBP';
DESC member_mbp;

commit;


--board만들것 이전거 참조--
SELECT * FROM article;
SELECT * FROM article_content;
DESC article_content;
DESC article;
SELECT * FROM user_constraints WHERE table_name = 'ARTICLE_CONTENT';
SELECT WRITER_ID FROM article GROUP BY WRITER_ID;
SELECT * FROM reply;
--board만들기
CREATE TABLE board(
    boardkey NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    boardname VARCHAR2(30) NOT NULL,

    articleNo NUMBER,
    pretitle VARCHAR2(15),
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(4000),

    user_id VARCHAR2(50) NOT NULL,
    user_nickname VARCHAR2(50) NOT NULL,
    
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnt NUMBER DEFAULT 0
    
);
DROP TABLE board;
CREATE TABLE board_like(
    boardkey NUMBER UNIQUE,
    boardlike VARCHAR2(50)
);
CREATE TABLE board_auth(
    boardname VARCHAR2(30),
    id VARCHAR2(50)
);
commit;

SELECT * FROM board;
--게시판 만들기
INSERT INTO board 
(BOARDNAME, articleNo ,PRETITLE, TITLE, CONTENT, USER_ID, USER_NICKNAME, REGDATE, MODDATE) VALUES 
('애니메이션', 애니메이션_sequence.nextval,'[임시]', '무슨무슨게시판이 신설되었습니다', 
'게시판이 신설되었습니다', 'admin', '[운영자]', SYSDATE, SYSDATE);
--게시판목록 불러오기
SELECT boardname FROM BOARD GROUP BY boardname ORDER BY boardname;
--게시판이름으로 삭제하기 
DELETE board WHERE boardname = '가나';
--게시글번호최신이위로나오게정렬하기
SELECT * FROM BOARD WHERE boardname = '테스트' ORDER BY ARTICLENO DESC;

--게시판개별시퀀스만들기
SELECT * FROM user_sequences;
CREATE SEQUENCE test_sequence;
DROP SEQUENCE TEST_SEQUENCE;

SELECT * FROM board;
--게시판 보드키로 지우기
DELETE FROM board WHERE boardkey = 23;
commit;

-- paging처리 --
SELECT * FROM board WHERE BOARDNAME = '애니메이션' ORDER BY ARTICLENO DESC;

-- 1.BETWEEN으로 범위지정하는거 틀을 만들기
SELECT articleno, t1.* FROM board t1 WHERE articleno BETWEEN 3 and 5;
-- 2. ROWNUM을 만들어서 ARTICLE NO와 역순으로 순서맞추기
SELECT ROWNUM rn, boardKey, boardName, articleno, preTitle, title, CONTENT, user_id, user_nickName, regDate, moddate, read_cnt 
FROM (SELECT * FROM board WHERE BOARDNAME = '애니메이션' ORDER BY ARTICLENO) ORDER BY rn DESC;

-- 3. 1과 2를 합치기 (순서정렬조금수정함)
SELECT rn, boardKey, boardName, articleno, preTitle, title, CONTENT, user_id, user_nickName, regDate, moddate, read_cnt FROM 
(SELECT ROWNUM rn, boardKey, boardName, articleno, preTitle, title, CONTENT, user_id, user_nickName, regDate, moddate, read_cnt 
FROM (SELECT * FROM board WHERE BOARDNAME = '애니메이션' ORDER BY ARTICLENO DESC) ORDER BY rn )
WHERE rn BETWEEN 11 and 20;

--총 게시물수 알아보기
SELECT COUNT(*) FROM board WHERE boardname = '애니메이션';

--reply 테이블 만들기--
CREATE TABLE reply_mbp(
    replykey NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    parentreplykey NUMBER,
    boardkey NUMBER,
    user_nickName VARCHAR2(50),
    reply VARCHAR2(500),
    regdate DATE NOT NULL,
    moddate DATE NOT NULL
);
DROP TABLE reply_mbp;
SELECT * FROM reply_mbp ORDER BY REGDATE DESC;
commit;
