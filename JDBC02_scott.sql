SELECT USER
FROM DUAL;
--==>> SCOTT

TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �߷Ƚ��ϴ�.

SELECT *
FROM TBL_MEMBER;
--==>> ��� ����

CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

-- �� ������ �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '��ȣ��', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--> JAVA �� �� �� ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ, '��ȣ��', '010-1111-1111')
;

-- �� �ο� �� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--==>> 1

--> JAVA �� �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 1

-- �� ��ü ����Ʈ ��ȸ ������ ����
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--==>> 1	��ȣ��	010-1111-1111

--> JAVA �� �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>> 1	��ȣ��	010-1111-1111

-- �� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- �� ������ ������ ���� ��ȸ
SELECT LAST_NUMBER
FROM SEQ;


DESC SEQ;

DROP SEQUENCE MEMBERSEQ;


DELETE 
FROM TBL_MEMBER;
WHERE SID >= 2;

COMMIT;



