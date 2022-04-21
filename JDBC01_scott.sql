SELECT USER
FROM DUAL;
--==>> SCOTT

DROP TABLE TBL_MEMBER PURGE;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


-- �� �ǽ� ���̺� ����
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

-- �� ���� ������ �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1, 'ȫ�浿', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


-- �� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>> 1	ȫ�浿	010-1111-1111

-- �� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- �� �ڹٿ���  Test003.java ���� �� �ٽ� Ȯ��
SELECT *
FROM TBL_MEMBER;
/*
1	ȫ�浿	010-1111-1111
2	����	010-5693-4223
*/

UPDATE TBL_MEMBER
SET NAME = '�ֱ浿'
WHERE SID = 2;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

-- �� �ڹٿ���  Test004.java ���� �� �ٽ� Ȯ��
SELECT *
FROM TBL_MEMBER;
/*
1	ȫ�浿	010-1111-1111
2	�ֱ浿	010-5693-4223
3	������	010-3333-3333
4	���̻�	010-4444-4444
5	������	010-5555-5555
*/


-- �� ��ȸ ������ �غ�
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����(�ڹٿ����� ���ڿ��� �� �ٷ� �νĵ�)
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--> �����ݷ� ������ Ż����Ű�� ��������





