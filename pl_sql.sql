-- PL / SQL
-- SQL 만으로는 구현이 어렵거나 구현 불가능한 작업들을 수행하기 위해서
-- 제공하는 프로그래밍 언어

-- 키워드
-- DECLARE(선언부) : 변수,삼수,커서 등을 선언(선택)
-- BEGIN(실행부) : 조건문,반복문,SELECT,DML(U,D,I), 함수 등을 정의(필수)
-- EXCEPTION(예외처리부) : 오류(예외상황) 해결(선택)

-- 실행 결과를 화면에 출력
SET SERVEROUTPUT ON;

-- Hello 출력
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Hello! PL/SQL');
END;
/

DECLARE
    -- 변수선언
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/


DECLARE
    -- 상수선언
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;


-- 변수의 기본값 지정
DECLARE
    -- 상수선언
    V_DEPNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPNO : ' || V_DEPNO);
END;
/

-- NOT NULL 지정
DECLARE
    -- 상수선언
    V_DEPNO NUMBER(2) NOT NULL := 10;
--    V_DEPNO NUMBER(2) NOT NULL DEFAULT 20;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPNO : ' || V_DEPNO);
END;
/

-- IF 조건문
-- IF ~ THEN
-- IF ~ THEN ~ ELSE
-- IF ~ THEN ~ ELSIF

-- V_NUMBER 변수 선언하고 13 값을 할당한 뒤 해당변수가 홀,짝 출력
DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER,2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('홀수');
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER,2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('홀수');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('짝수');
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER := 87;
BEGIN
    IF V_NUMBER >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A 학점');
    ELSIF V_NUMBER >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B 학점');
    ELSIF V_NUMBER >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C 학점');
    ELSIF V_NUMBER >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('D 학점');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('F 학점');
    END IF;
END;
/

-- CASE ~ WITH
DECLARE
    V_SCORE NUMBER := 77;
BEGIN 
    CASE TRUNC(V_SCORE/10)
    WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A 학점');
    WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('B 학점');
    WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('C 학점');
    WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('D 학점');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F 학점');
    END CASE;
END;
/

-- 반복문
-- LOOP ~ END LOOP
-- WHILE LOOP ~ END LOOP
-- FOR LOOP
-- Cursor FOR LOOP


DECLARE
    v_deptno NUMBER := 0;
BEGIN
    LOOP
        dbms_output.put_line('현재 V_DEPTNO : ' || v_deptno);
        v_deptno := v_deptno + 1;
        EXIT WHEN v_deptno > 4;
    END LOOP;
END;
/

DECLARE
    v_deptno NUMBER := 0;
BEGIN
    WHILE v_deptno < 4 LOOP
        dbms_output.put_line('현재 V_DEPTNO : ' || v_deptno);
        v_deptno := v_deptno + 1;
    END LOOP;
END;
/


-- 시작값..종료값 : 반복문을 통해서 시작값 ~ 종료값을 사용
BEGIN
    FOR i IN 0..4 LOOP
        dbms_output.put_line('현재 i : ' || i);
    END LOOP;
END;
/

BEGIN
    FOR i IN REVERSE 0..4 LOOP
        dbms_output.put_line('현재 i : ' || i);
    END LOOP;
END;
/

-- 숫자 1~10까지 출력(홀수만)

BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 1 THEN
            dbms_output.put_line('i : ' || i);
        END IF;
    END LOOP;
END;
/


-- 변수 타입 선언시 특정 테이블의 컬럼 값 참조

DECLARE
    v_deptno dept.deptno%TYPE := 50;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/

-- 변수 타입 선언시 특정 테이블의 하나의 컬럼이 아닌 행 구조 전체 참조

DECLARE
    v_dept_row dept%ROWTYPE;
BEGIN
    SELECT deptno, dname, loc INTO v_dept_row
    FROM dept
    WHERE deptno=40;
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
END;
/

-- 커서(CURSOR)
-- SELECT,DELETE,UPDATE,INSERT SQL 문 실행시 해당 SQL문을 처리하는 정보를
-- 저장한 메모리 공간

-- SELECT INTO 방식 : 결과값이 하나일 때 사용가능
-- 결과값이 몇 개인지 알 수 없을 경우 CURSOR 사용

-- 1) 명시적 커서
-- declare : 커서 선언
-- open : 커서 열기
-- fetch : 커서에서 읽어온 데이터 사용
-- close : 커서 닫기

DECLARE
    -- 커서 데이터를 입력할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO,DNAME,LOC
        FROM DEPT
        WHERE DEPTNO=40;
BEGIN
    -- 커서 열기
    OPEN c1;
    
    -- 읽어온 데이터 사용
    FETCH c1 INTO V_DEPT_ROW;
    
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
    
    -- 커서 닫기
    CLOSE c1;
    
END;
/


-- 여러 행이 조회되는 경우

DECLARE
    -- 커서 데이터를 입력할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO,DNAME,LOC
        FROM DEPT;
BEGIN
    -- 커서 열기
    OPEN c1;
    
    LOOP
        -- 읽어온 데이터 사용
        FETCH c1 INTO V_DEPT_ROW;
        
        -- 커서에서 더이상 읽어올 행이 없을 때 까지
        EXIT WHEN c1%NOTFOUND;
        
        
        dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
        dbms_output.put_line('DNAME : ' || v_dept_row.dname);
        dbms_output.put_line('LOC : ' || v_dept_row.loc);
    END LOOP;
    
    
    -- 커서 닫기
    CLOSE c1;
    
END;
/

-- Cursor for ~ loop
DECLARE   
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO,DNAME,LOC
        FROM DEPT;
BEGIN 
    
    FOR c1_rec IN c1 LOOP        
        dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno
        || ' DNAME : ' || v_dept_row.dname
        || ' LOC : ' || v_dept_row.loc);
    END LOOP;
        
END;
/

--2022.03.28
CREATE PROCEDURE pro_noparam
IS 
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN 
    V_ENAME := 'SCOTT';
    dbms_output.put_line('V_EMPNO : ' || V_EMPNO);
    dbms_output.put_line('V_ENAME : '||V_ENAME);
END;
/

-- 프로시저 실행
EXECUTE pro_noparam;

--다른 PL/SQL 블록에서 프로시저 실행
BEGIN 
    pro_noparam;
END;
/

--(인자 들어오는 개념과 같음)
--프로시저 작성 시 파라미터가 존재하는 경우
-- IN : 기본값 - 생략가능

CREATE OR REPLACE PROCEDURE pro_noparam_in
(
    param1 IN NUMBER,
    param2 NUMBER,
    param3 NUMBER := 3,
    param4 NUMBER DEFAULT 4
)
IS    
BEGIN 
    dbms_output.put_line('param1 : '||param1);
    dbms_output.put_line('param2 : '||param2);
    dbms_output.put_line('param3 : '||param3);
    dbms_output.put_line('param4 : '||param4);
END;
/

EXECUTE pro_param_in(1,2);

EXECUTE pro_param_in(5,6,7,8);

--오류 : 매소드 호출시 개수 안맞춘거랑 같음
EXECUTE pro_param_in(1);

--OUT 모드
--이름만 호출하면 사용 가능
CREATE OR REPLACE PROCEDURE pro_noparam_out
(
    in_empno IN EMP.EMPNO%TYPE,
    out_ename OUT EMP.ENANE%TYPE,
    out_sal OUT EMP.SAL%TYPE
)
IS    
BEGIN 
    SELECT enamem sal INTO out_ename, out_sal
    From emp
    WHERE empno = in_empno;
END;
/

DECLARE 
   V_ENAME EMP.ENAME%TYPE;
   V_SAL EMP.SAL%TYPE;
BIGIN
   pro_param_out(7369,V_ENAME,V_SAL);
   DBMS_OUTPUT.PUT_LINE('ennme : '||V_ENAME);
   DBMS_OUTPUT.PUT_LINE('sal : '||V_SAL);
END;
/

--IN OUT 모드
CREATE OR REPLACE PROCEDURE pro_noparam_in_out
(
    in_out_no IN OUT NUMBER
)
IS    
BEGIN 
    in_out_no := in_out_no *2;
END;
/

DECLARE
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.SAL%TYPE;
BEGIN
    PRO_PARAM_OUT(7369,V_ENAME,V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : || V_ENAME');
    DBMS_OUTPUT.PUT_LINE('SAL : || V_SAL');
END;
/

-- IN OUT 모드
CREATE OR REPLACE PROCEDURE PRO_PARAM_IN_OUT
(   
    IN_OUT_NO IN OUT NUMBER
)
IS
BEGIN
 IN_OUT_NO := IN_OUNT_NO * 2;
 
END;
/

DECLARE
    NO NUMBER;
BEGIN
    NO := 5;
    PRO_PARAM_IN_OUT(NO);
    DBMS_OUTPUT.PUT_LINE('NO : '|| NO);
END;
/

-- 트리거 
-- DML 트리거
-- CREATE OR REPALCE TRIGGER 트리거이름
-- BEFORE || AFTER
-- DECLARE
-- END

CREATE TABLE EMP_TRG AS SELECT * FROM EMP;

-- EMP_TRG INSERT (주말에 사원정보 추가시 에러), UPDATE, DELETE

CREATE OR REPLACE TRIGGER EMP_TRG_WEEKDEND
BEFORE
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN 
    IF TO_CHAR(SYSDATE,'DY') IN ('토','일') THEN
        IF INSERTING THEN
            RAISE_APPLICATION_ERROR(-30000,'주말 사원정보 추가 불가');
        ELSIF UPDATING THEN
            RAISE_APPLICATION_ERROR(-30001,'주말 사원정보 수정 불가');
        ELSIF DELETING THEN
            RAISE_APPLICATION_ERROR(-30002,'주말 사원정보 삭제 불가');
        ELSE
            RAISE_APPLICATION_ERROR(-30003,'주말 사원정보 변경 불가');
        END IF;
END;
/

UPDATE EMP_TRG
SET SAL = 3500
WHERE EMPNO = 7369;

DELETE FROM EMP_TRG WHERE EMPNO = 7369;

-- 트리거 발생 저장 테이블 생성
CREATE TABLE EMP_TRG_LOG(
    TABELNAME VARCHAR2(20), -- DML이 수행된 테이블 이름
    DML_TYPE VARCHAR2(10), -- DML 명령어 종류
    EMPNO NUMBER(4), -- DML 대상이 된 사원번호
    USER_NAME VARCHAR2(30), -- DML을 수행한 USER명
    CHANGE_DATE DATE); -- DML 시도 날짜

CREATE OR REPLACE TRIGGER EMP_TRG_WEEKDLOG
AFTER
INSERT OR UPDATE OR DELETE ON EMP_TRG
FOR EACH ROW -- 영향 받는 모든 행별 실행
BEGIN 
  
        IF INSERTING THEN
           INSERT INTO EMP_TRG_LOG
           VALUES('EMP_TRG','INSERT', :NEW.EMPNO, SYS_CONTEXT('USERENV','SESSION_USER'),SYSDATE);
        ELSIF UPDATING THEN
           INSERT INTO EMP_TRG_LOG
           VALUES('EMP_TRG','UPDATE', :OLD.EMPNO, SYS_CONTEXT('USERENV','SESSION_USER'),SYSDATE);
        ELSIF DELETING THEN
           INSERT INTO EMP_TRG_LOG
           VALUES('EMP_TRG','LELETE', :OLD.EMPNO, SYS_CONTEXT('USERENV','SESSION_USER'),SYSDATE);
        END IF;
END;
/








