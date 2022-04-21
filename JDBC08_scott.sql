SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
/*
1	이호석	010-1111-1111
2	오이삭	010-2222-2222
3	임소민	010-3333-3333
4	김상기	010-4444-4444
5	한충희	010-5555-5555
6	박현수	010-6666-6666
30	정은정	010-3030-3030
31	김정용	010-3131-3131
*/

TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 잘렸습니다.

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>> 결과 없음

--○ CallaberStatement 실습을 위한 프로시저 작성
--   프로시저 명 : PRC_MEMBERINSERT
--   프로시저 기능 : TBL_MEMBER 테이블에 데이터를 입력하는 프로시저

CREATE OR REPLACE PROCEDURE PRC_MEMBERINSERT
(   VNAME   IN  TBL_MEMBER.NAME%TYPE
,   VTEL    IN  TBL_MEMBER.TEL%TYPE
)
IS
    -- 주요 변수 선언
    VSID    TBL_MEMBER.SID%TYPE;
    
BEGIN
    -- 기존 SID 의 최대값 얻어오기
    SELECT NVL(MAX(SID), 0) INTO VSID
    FROM TBL_MEMBER;
    
    -- 데이터 입력(INSERT 쿼리문 수행)
    INSERT INTO TBL_MEMBER(SID, NAME, TEL)
    VALUES((VSID+1), VNAME, VTEL);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_MEMBERINSERT이(가) 컴파일되었습니다.

-- ○ 확인
EXEC PRC_MEMBERINSERT('이호석', '010-1111-1111');

SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--==>> 1	이호석	010-1111-1111

-- ○ JDBC08 의 Test001 실행 후 확인
SELECT *
FROM TBL_MEMBER
ORDER BY SID;
/*
1	이호석	010-1111-1111
2	서민지	010-2222-2222
3	이연주	010-3333-3333
4	홍은혜	010-4444-4444
5	김태형	010-5555-5555
*/


-- ○ CallableStatement 실습을 위한 프로시저 작성
--    프로시저 명   : PRC_MEMBERSELECT
--    프로시저 기능 : TBL_MEMBER 테이블의 데이터를 읽어오는 프로시저
--    ※ 『SYS_REFCURSOR』 자료형을 이용하여 커서 다루기

CREATE OR REPLACE PROCEDURE PRC_MEMBERSELECT
( VRESULT   OUT SYS_REFCURSOR
)
IS
    -- 주요 변수 선언
BEGIN
    OPEN VRESULT FOR
        SELECT SID, NAME, TEL
        FROM TBL_MEMBER
        ORDER BY SID;
        
    -- COMMIT;    
    -- CLOSE VRESULT;
END;

--==>> Procedure PRC_MEMBERSELECT이(가) 컴파일되었습니다.














