SELECT USER
FROM DUAL;
--==>> SCOTT

-- �� ���� �ǽ��� �̿��ߴ� �����͵� ����
TRUNCATE TABLE TBL_SCORE;
--==>> Table TBL_SCORE��(��) �߷Ƚ��ϴ�.

-- �� ���� �ǽ��� �̿��ߴ� ������ ����
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.

-- �� ������ �ٽ� ����
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.


-- �� ������ �غ�

-- 1. ������ �Է� ������ ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '�̽ÿ�', 90, 80, 70);
-- ���� ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '�̽ÿ�', 90, 80, 70)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_SCORE;
--==>> 1	�̽ÿ�	90	80	70

COMMIT;
--==>> Ŀ�� �Ϸ�.

-- 2. ����Ʈ ��� ������ ����(����, ���, ���� ����)
SELECT SID, NAME, KOR, ENG, MAT
     , (KOR + ENG + MAT) AS TOT
     , (KOR + ENG + MAT)/3 AS AVG
     , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
FROM TBL_SCORE
ORDER BY SID ASC;

-- �� �� ����
SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE ORDER BY SID ASC
;
--==>> 1	�̽ÿ�	90	80	70	240	80	1

-- 3. �ο� �� ��ȸ ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_SCORE;
--==>> 1

-- ���� ����
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;

-- 4. �̸� �˻� ������ ����(����, ���, ������ ���Ե� ����Ʈ ���·� ��ȸ)
SELECT SID, NAME, KOR, MAT, TOT, AVG, RANK
FROM
(
    SELECT SID, NAME, KOR, ENG, MAT
         , (KOR + ENG + MAT) AS TOT
         , (KOR + ENG + MAT)/3 AS AVG
         , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
    FROM TBL_SCORE
)    
WHERE NAME = '�̽ÿ�';
--==>> 1	�̽ÿ�	90	70	240	80	1  

-- ���� ����
SELECT SID, NAME, KOR, MAT, TOT, AVG, RANK FROM(SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE) WHERE NAME = '�̽ÿ�'
;


-- 5. ��ȣ �˻� ������ ����
SELECT SID, NAME, KOR, MAT, TOT, AVG, RANK
FROM
(
    SELECT SID, NAME, KOR, ENG, MAT
         , (KOR + ENG + MAT) AS TOT
         , (KOR + ENG + MAT)/3 AS AVG
         , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
    FROM TBL_SCORE
)    
WHERE SID = 1;

-- ���� ����
SELECT SID, NAME, KOR, MAT, TOT, AVG, RANK FROM(SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE) WHERE SID = 1
;
--==>> 1	�̽ÿ�	90	70	240	80	1

-- 6. ������ ���� ������ ����
UPDATE TBL_SCORE
SET NAME = '������', KOR=10, ENG=20, MAT=30
WHERE SID = 1;
--==>> �� �� ����
UPDATE TBL_SCORE SET NAME = '������', KOR=10, ENG=20, MAT=30 WHERE SID = 1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_SCORE;

COMMIT;
--==>> Ŀ�� �Ϸ�.


-- 7. ������ ���� ������ ����
DELETE
FROM TBL_SCORE
WHERE SID = 1;

-- ���� ����
DELETE FROM TBL_SCORE WHERE SID = 1
;


