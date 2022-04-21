SELECT USER
FROM DUAL;
--==>> SCOTT

TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 잘렸습니다.

SELECT *
FROM TBL_MEMBER;
--==>> 결과 없음

CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ이(가) 생성되었습니다.

-- ○ 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '이호석', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.


--> JAVA 용 한 줄 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ, '이호석', '010-1111-1111')
;

-- ○ 인원 수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--==>> 1

--> JAVA 용 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 1

-- ○ 전체 리스트 조회 쿼리문 구성
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--==>> 1	이호석	010-1111-1111

--> JAVA 용 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>> 1	이호석	010-1111-1111

-- ○ 커밋
COMMIT;
--==>> 커밋 완료.

-- ○ 시퀀스 마지막 숫자 조회
SELECT LAST_NUMBER
FROM SEQ;


DESC SEQ;

DROP SEQUENCE MEMBERSEQ;


DELETE 
FROM TBL_MEMBER;
WHERE SID >= 2;

COMMIT;



