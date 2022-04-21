SELECT USER
FROM DUAL;
--==>> 

-- �� �ǽ� ���̺� ����
CREATE TABLE TBL_SCORE
( SID   NUMBER
, NAME  VARCHAR2(30)
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
);
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


-- �� �������� �߰�(SID �÷��� PK �������� �߰�)
ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID);
--==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.

-- �� �������� �߰�(KOR, ENG, MAT �÷��� CK �������� �߰�)
ALTER TABLE TBL_SCORE
ADD ( CONSTRAINT SCORE_KOR_CK CHECK (KOR BETWEEN 0 AND 100) 
    , CONSTRAINT SCORE_ENG_CK CHECK (ENG BETWEEN 0 AND 100)
    , CONSTRAINT SCORE_MAT_CK CHECK (MAT BETWEEN 0 AND 100) );
--==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.

-- �� ������ ����
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.

INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '����', 90, 80, 70)
;

SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;

SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE
;


