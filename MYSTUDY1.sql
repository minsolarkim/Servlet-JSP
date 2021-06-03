--BBS(bulletin board system) : ���ڰԽ���
--2���� ���̺�(�Խñ�, ���)
--�Խñ� ���̺�(BBS_T)
CREATE TABLE BBS_T (
	B_IDX NUMBER(6) CONSTRAINT BBS_T_PK PRIMARY KEY,
	SUBJECT VARCHAR2(50), --������
	WRITER VARCHAR2(20), --�ۼ���
	CONTENT CLOB, --�۳���
	FILE_NAME VARCHAR2(50), --���� ����Ǵ� ���ϸ�
	ORI_NAME VARCHAR2(50), --���� ���ϸ�
	PWD VARCHAR2(20), --��ȣ
	WRITE_DATE DATE, --�ۼ��Ͻ�
	IP VARCHAR2(15), --�ۼ��� IP�ּ�
	HIT NUMBER(4) --��ȸ��
);

--�Խñۿ� ���� ���(COMMENT_T)
CREATE TABLE COMMENT_T (
	C_IDX NUMBER(6) CONSTRAINT COMM_T_PK PRIMARY KEY,
	WRITER VARCHAR2(20),
	CONTENT CLOB,
	PWD VARCHAR2(20),
	WRITE_DATE DATE,
	IP VARCHAR2(15),
	B_IDX NUMBER(6), --�Խñ� ��ȣ
	CONSTRAINT COMM_T_FK FOREIGN KEY (B_IDX) REFERENCES BBS_T(B_IDX)
);

--������ �߰�
CREATE SEQUENCE BBS_T_SEQ NOCACHE;
CREATE SEQUENCE COMMENT_T_SEQ NOCACHE;

--------------------------------------------
--�� ��� ��ȸ�� ���� ���� ����Ÿ �ۼ�
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ1','�׽���','�׽�Ʈ1-����','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ2','�׽���','�׽�Ʈ2-����','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ3','�׽���','�׽�Ʈ3-����','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ4','�׽���','�׽�Ʈ4-����','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ5','�׽���','�׽�Ʈ5-����','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ6','�׽���','�׽�Ʈ6-����','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ7','�׽���','�׽�Ʈ7-����','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ8','�׽���','�׽�Ʈ8-����','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ9','�׽���','�׽�Ʈ9-����','','','1234',sysdate,'127.0.0.1',0);
insert into bbs_t 
values (bbs_t_seq.nextval, '�׽�Ʈ10','�׽���','�׽�Ʈ10-����','','','1234',sysdate,'127.0.0.1',0);
commit;

INSERT INTO COMMENT_T
VALUES (COMMENT_T_SEQ.NEXTVAL, 'C�׽���', 'C-����1',
        '1234', SYSDATE, '127.0.0.1', 10);
INSERT INTO COMMENT_T
VALUES (COMMENT_T_SEQ.NEXTVAL, 'C�׽���', 'C-����2',
        '1234', SYSDATE, '127.0.0.1', 10); 
INSERT INTO COMMENT_T
VALUES (COMMENT_T_SEQ.NEXTVAL, 'C�׽���', 'C-����3',
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
 WHERE ROWNUM BETWEEN 4 AND 6 --�̷��Ե� ���� �� �ִ�? �ٵ� �߰� �� �� ������
;
--�̷��� �ϸ� ���ĵ� �����Ϳ� ��Ī(BBS)�ְ� ���ĵ� �����Ϳ� ROWNUM, �Ű�� ������  
--B_IDX�� �ݴ�� ��ȣ �Ű�����.
--ROWNUM�� Ư¡-> �� �տ������� �������� �� �������� �߰����� ������ ����
--�׷��� ROWNUM���� ��Ī �ٿ��༭ (R_NUM)
--SELECT ���� �� �־��ش� 
SELECT * 
    FROM (SELECT ROWNUM R_NUM, BBS.* 
            FROM (SELECT ROWNUM, B.*
            FROM BBS_T B
        ORDER BY B_IDX DESC
                )  BBS
         )
    WHERE R_NUM BETWEEN 4 AND 6 --�ٵ� �߰� �� �� ������
        ;
    --�� �� WHERE�� ROWNUM�ϸ� �� �ǰ� R_NUM - ��Ī ����� �߰��� ������ �� �� �ִ�