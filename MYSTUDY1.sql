--BBS(bulletin board system) : 전자게시판
--2개의 테이블(게시글, 댓글)
--게시글 테이블(BBS_T)
CREATE TABLE BBS_T (
	B_IDX NUMBER(6) CONSTRAINT BBS_T_PK PRIMARY KEY,
	SUBJECT VARCHAR2(50), --글제목
	WRITER VARCHAR2(20), --작성자
	CONTENT CLOB, --글내용
	FILE_NAME VARCHAR2(50), --실제 저장되는 파일명
	ORI_NAME VARCHAR2(50), --원본 파일명
	PWD VARCHAR2(20), --암호
	WRITE_DATE DATE, --작성일시
	IP VARCHAR2(15), --작성자 IP주소
	HIT NUMBER(4) --조회수
);

--게시글에 대한 댓글(COMMENT_T)
CREATE TABLE COMMENT_T (
	C_IDX NUMBER(6) CONSTRAINT COMM_T_PK PRIMARY KEY,
	WRITER VARCHAR2(20),
	CONTENT CLOB,
	PWD VARCHAR2(20),
	WRITE_DATE DATE,
	IP VARCHAR2(15),
	B_IDX NUMBER(6), --게시글 번호
	CONSTRAINT COMM_T_FK FOREIGN KEY (B_IDX) REFERENCES BBS_T(B_IDX)
);

--시퀀스 추가
CREATE SEQUENCE BBS_T_SEQ NOCACHE;
CREATE SEQUENCE COMMENT_T_SEQ NOCACHE;

--------------------------------------------
--글 목록 조회를 위한 샘플 데이타 작성
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트1','테스터','테스트1-내용','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트2','테스터','테스트2-내용','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트3','테스터','테스트3-내용','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트4','테스터','테스트4-내용','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트5','테스터','테스트5-내용','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트6','테스터','테스트6-내용','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트7','테스터','테스트7-내용','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트8','테스터','테스트8-내용','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트9','테스터','테스트9-내용','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '테스트10','테스터','테스트10-내용','','','1234',sysdate,'127.0.0.1',0);
commit;

INSERT INTO COMMENT_T
VALUES (COMMENT_T_SEQ.NEXTVAL, 'C테스터', 'C-내용1',
        '1234', SYSDATE, '127.0.0.1', 10);
INSERT INTO COMMENT_T
VALUES (COMMENT_T_SEQ.NEXTVAL, 'C테스터', 'C-내용2',
        '1234', SYSDATE, '127.0.0.1', 10); 
INSERT INTO COMMENT_T
VALUES (COMMENT_T_SEQ.NEXTVAL, 'C테스터', 'C-내용3',
        '1234', SYSDATE, '127.0.0.1', 10); 
COMMIT;        
-------------------
SELECT ROWNUM, B.*
    FROM BBS_T B
    ORDER BY B_IDX DESC
    ;
-------------------
SELECT ROWNUM R_NUM, BBS.* 
    FROM (SELECT ROWNUM, B.*
    FROM BBS_T B
    ORDER BY B_IDX DESC
    )  BBS
-- WHERE ROWNUM <= 3
 WHERE ROWNUM BETWEEN 4 AND 6 --이렇게도 해줄 수 있다? 근데 중간 값 못 가져옴
;
--이렇게 하면 정렬된 데이터에 별칭(BBS)주고 정렬된 데이터에 ROWNUM, 매겼기 때문에  
--B_IDX의 반대로 번호 매겨진다.
--ROWNUM의 특징-> 맨 앞에서부터 가져오는 건 괜찮은데 중간에서 가졍기 힘듦
--그래서 ROWNUM에도 별칭 붙여줘서 (R_NUM)
--SELECT 문에 또 넣어준다 
SELECT * 
    FROM (SELECT ROWNUM R_NUM, BBS.* 
            FROM (SELECT ROWNUM, B.*
            FROM BBS_T B
        ORDER BY B_IDX DESC
                )  BBS
         )
    WHERE R_NUM BETWEEN 4 AND 6 --근데 중간 값 못 가져옴
        ;
    --이 때 WHERE에 ROWNUM하면 안 되고 R_NUM - 별칭 써줘야 중간값 가지고 올 수 있다