SELECT USER
FROM DUAL;
--==>> SCOTT

-- ○ 기존 실습에 이용했던 데이터들 정리
TRUNCATE TABLE TBL_SCORE;
--==>> Table TBL_SCORE이(가) 잘렸습니다.

-- ○ 기존 실습에 이용했던 시퀀스 제거
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ이(가) 삭제되었습니다.

-- ○ 시퀀스 다시 생성
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ이(가) 생성되었습니다.


-- ○ 쿼리문 준비

-- 1. 데이터 입력 쿼리문 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '이시우', 90, 80, 70);
-- 한줄 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '이시우', 90, 80, 70)
;
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_SCORE;
--==>> 1	이시우	90	80	70

COMMIT;
--==>> 커밋 완료.

-- 2. 리스트 출력 쿼리문 구성(총점, 평균, 석차 포함)
SELECT SID, NAME, KOR, ENG, MAT
     , (KOR + ENG + MAT) AS TOT
     , (KOR + ENG + MAT)/3 AS AVG
     , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
FROM TBL_SCORE
ORDER BY SID ASC;

-- 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE ORDER BY SID ASC
;
--==>> 1	이시우	90	80	70	240	80	1

-- 3. 인원 수 조회 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_SCORE;
--==>> 1

-- 한줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;

-- 4. 이름 검색 쿼리문 구성(총점, 평균, 석차가 포함된 리스트 형태로 조회)
SELECT SID, NAME, KOR, MAT, TOT, AVG, RANK
FROM
(
    SELECT SID, NAME, KOR, ENG, MAT
         , (KOR + ENG + MAT) AS TOT
         , (KOR + ENG + MAT)/3 AS AVG
         , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
    FROM TBL_SCORE
)    
WHERE NAME = '이시우';
--==>> 1	이시우	90	70	240	80	1  

-- 한줄 구성
SELECT SID, NAME, KOR, MAT, TOT, AVG, RANK FROM(SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE) WHERE NAME = '이시우'
;


-- 5. 번호 검색 쿼리문 구성
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

-- 한줄 구성
SELECT SID, NAME, KOR, MAT, TOT, AVG, RANK FROM(SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE) WHERE SID = 1
;
--==>> 1	이시우	90	70	240	80	1

-- 6. 데이터 수정 쿼리문 구성
UPDATE TBL_SCORE
SET NAME = '한충희', KOR=10, ENG=20, MAT=30
WHERE SID = 1;
--==>> 한 줄 구성
UPDATE TBL_SCORE SET NAME = '한충희', KOR=10, ENG=20, MAT=30 WHERE SID = 1
;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_SCORE;

COMMIT;
--==>> 커밋 완료.


-- 7. 데이터 삭제 쿼리문 구성
DELETE
FROM TBL_SCORE
WHERE SID = 1;

-- 한줄 구성
DELETE FROM TBL_SCORE WHERE SID = 1
;


