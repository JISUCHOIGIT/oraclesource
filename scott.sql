-- desc : 정보 출력

-- dept테이블 정보(부서정보-부서번호,부서명,위치)
DESC dept;

-- 사원정보(사원번호,사원명,직속상관의 사원번호,입사일,급여,부서번호)
desc emp;

-- 급여구간(등급,최저수당,최고급여)
desc salgrade;

-- 조회(SELECT) : 가장 많이 사용
-- SELECT 조회하고 싶은 열이름 나열
-- FROM 조회할 테이블명

-- CTRL+F7 쿼리문 정렬
SELECT
    deptno
FROM
    dept;

SELECT
    deptno,
    dname
FROM
    dept;
  
 -- dept 전체 조회 : *로 기재   
SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    emp;

SELECT
    empno,
    ename,
    deptno
FROM
    emp;

-- 중복 데이터 제거 SELECT DISTINCT
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
    
-- ALAIS(별칭) : 계산하면서 새로운 칼럼 as 별칭 추가 후 출력
-- as 별칭 : as 생략가능
SELECT
    ename           AS 사원명, -- as 추가
    sal             급여, --as 생략
    comm            AS "추가 수당", --공백 해결 위해 ""로 묶기
    sal * 12 + comm AS 연봉
FROM
    emp;
    
-- 원하는 순서로 출력 데이터를 정렬
-- order by 정렬할 열이름 [정렬옵션] //select 구문과 같이 사용

-- emp 테이블에서 ename,sal 조회할 때 sal 내림차순 조회
SELECT
    ename,
    sal
FROM
    emp
ORDER BY -- order by 정렬
    sal DESC; -- desc 내림차순
    
-- emp 테이블에서 ename,sal 조회할 때 sal 오름차순 조회
SELECT
    ename,
    sal
FROM
    emp
ORDER BY -- order by 정렬
    sal; -- 디폴트값이 오름차순, 명시 : ASC
    
-- EMP 테이블의 전체 열을 조회(부서번호는 오름차순이고, 급여의 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC, -- 부서번호 오름차순
    sal DESC; -- 급여 내림차순
    
-- 특정한 조건을 기준으로 데이터 조회
-- SELECT ~ FROM ~ WHERE 기준

SELECT
    *
FROM
    emp
WHERE
    deptno = 30;
    
-- 사원번호가 7782인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;
    
-- 부서번호가 30이고 사원직책이 SALESMAN인 사원 조회
-- 문자열 표현 : 홑따옴표 / 
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'salesman';
    
-- 사원번호가 7499이고 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;
    
-- 부서번호가 30 이거나, 사원직책이 CLERK인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
    
    
-- 연산자
-- 산술연산자
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;
    
-- 비교연산자(>,<,>=,<=)
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

-- 문자도 대소비교 연산자가 가능
-- ENAME 'F' 이상인 사원을 조회(사원 이름의 첫문자가 F와 같거나 뒤쪽인 것 조회)
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F'; --'F' 코드값으로 변환
    
-- 급여가 2500 이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

-- 직무가 MANAGER, SALESMAN, CLERK인 사원 조회
-- IN 연산자 : =의 의미와 같음
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' ); --or도 사용 가능
    
-- IN을 사용해서 부서번호가 10, 20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

-- job 'MANAGER' 아니고, 'SALESMAN' 아니고, 'CLERK' 아닌 사원 조회

SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job <> 'SALESMAN'
    AND job^= 'CLERK';
    
-- NOT + IN 조합
SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );
    
-- BETWEEN A AND B 연산자
-- ex) 급여가 2000 이상 3000 이하
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
    
-- NOT BETWEEN A AND B 연산자
-- ex) 급여가 2000 이상 3000 이하가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;
    

-- 등가비교연산자(같다: =, 같지않다 :!=, <>, ^=)
-- 급여가 3000이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;
    
-- 논리부정연산자 : NOT
SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;
    
-- Like 연산자와 와일드 카드( _ : 어떤 값이든 상관없이 단 한개의 문자 데이터
--                         % : 어떤 값이든 상관없고 길이와 상관없이 모든 문자 데이터)

-- 사원 이름이 S로 시작하는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원 이름의 두번째 글자가 L인 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원 이름에 AM이 들어 있는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원 이름에 AM이 들어 있지 않는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL / IS NOT NULL 연산자
-- IS NULL 연산자
-- COMM이 NULL인 사원 조회
-- NULL에는 = 사용 못함
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
    
--MGR이 NULL이 아닌 사원 조회
--IS NOT NULL
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;
    
-- 집합 연산자
-- union (합집합), minus(차집합), intersect(교집합)

-- deptno = 10 or deptno = 20 사원 조회 : union 사용
-- UNION(중복값 제거 함)
SELECT
    *
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    *
FROM
    emp
WHERE
    deptno = 20;

--UNION ALL(중복제거 안함) UNION ALL
SELECT
    ename,
    empno,
    job
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    ename,
    empno,
    job
FROM
    emp
WHERE
    deptno = 10;

-- MINUS 차집합
SELECT
    ename,
    empno,
    job,
    deptno
FROM
    emp
MINUS
SELECT
    ename,
    empno,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10;
    
-- INTERSECT
SELECT
    ename,
    empno,
    job,
    deptno
FROM
    emp
INTERSECT
SELECT
    ename,
    empno,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10;
    
    
-- [문제] 사원 이름(ENAME)이 S로 끝나는 사원 데이터를 출력한다.
SELECT
    ename
FROM
    emp
WHERE
    ename LIKE '%S';

-- [문제] 30번 부서(DEPTNO)에서 근무하고 있는 사원 중에 직책이(JOB)이
-- SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호를 출력한다.
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

-- [문제] 20번, 30번 부서에 근무하고 있는 사원 중 급여(SAL)가 2000 초과인
-- 사원을 다음 두 가지 방식의 SELECT 문을 사용하여 사원번호, 이름, 직책, 급여,
-- 부서번호를 출력하는 SQL 문을 작성해보시오.
-- 집합 연산자를 사용하지 않은 방식
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;
    
-- 집합 연산자를 사용한 방식
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000
MINUS
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

-- [문제] NOT BETWEEN A AND B 연산자를 쓰지 않고, 급여(SAL) 열 값이
-- 2000 이상 3000 이하 범위 이외의 값을 가진 데이터만 출력하도록 SQL 문을 작성하시오.
SELECT
    *
FROM
    emp
WHERE
    sal < 2000
    OR sal > 3000;

-- [문제] 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000 사이가
-- 아닌 사원 이름, 사원번호, 급여, 부서번호를 출력하는 SQL문을 작성
SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;


-- [문제] 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER, CLERK인 사원
-- 중에서 사원 이름의 두 번째 글자가 L이 아닌 사원의 정보를 출력하는 SQL문을 작성
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    
    
-- 오라클 함수
-- 대소문자 변경 : UPPER(), LOWER(), INTICAP()

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;
    
    
-- DUAL : SYS가 소유하는 테이블
--        임시 연산이나 함수의 결과값 확인하는 용도
    
    
-- 문자열 길이 : LENGTH / 문자열 바이트 수 반환 : LENGTHB
SELECT
    length('한글'),
    lengthb('한글'),
    length('AB'),
    lengthb('AB')
FROM
    dual;

SELECT
    ename,
    length(ename)
FROM
    dual;
    
-- [실습] 직책 이름이 6글자 이상인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;
    
-- 문자열 추출 : substr(원본데이터,시작위치,[추출길이])
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;
    
-- [문제] emp 테이블의 모든 사원 이름을 세번째 글자부터 끝까지 출력
-- ename, 추출문자열 출력
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;
    
-- 문자열 데이터 안에서 특정 문자 위치 찾기: 
-- instr(문자열데이터, 위치를 찾으려고 부분 문자, 시작위치, 시작위치에서 찾으려는 문자 몇번째인지 지정)

SELECT
    instr('Hello Oracle', 'l')       AS instr1,
    instr('Hello Oracle', 'l', 5)    AS instr2,
    instr('Hello Oracle', 'l', 2, 2) AS instr2
FROM
    dual;

-- 사원 이름에 S가 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 's') > 0; --있다면 1부터 존재함으로 0보다 큼을 조건
    
-- 특정문자를 다른 문자로 변경 : replace(원본,찾는문자,바꿀문자)
SELECT
    '010-1234-5678'                   AS replace_before,
    replace('010-1234-5678', '-', '') AS replace1,
    replace('010-1234-5678', '-')     AS replace2
FROM
    dual;
    
-- 문자열 연결 : CONCAT(문자1,문자2)
SELECT
    concat(empno, ename)
FROM
    emp;

SELECT
    concat(empno, concat(';', ename)) --CONCAT 이중
FROM
    emp;
    
-- 문자열 연결 : ||
SELECT
    empno || ename
FROM
    emp;

SELECT
    empno
    || ':'
    || ename
FROM
    emp;
    
-- 특정 문자열 제거(아무것도 안주면 공백제거) : TRIM(),LTIM(),RTRIM()
SELECT
    '    이것이    ',
    TRIM('    이것이    '),
    ltrim('    이것이    '),
    rtrim('    이것이    ')
FROM
    dual;
    
    
--3.21
--숫자함수
--round() : 반올림, trunc() : 버림,
--ceil() : 지정된 숫자보다 큰 정수 중에서 가장 작은 정수
--floor() : 지정된 숫자보다 작은 정수 중에서 가장 큰 정수
--mod(): 나머지

SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round1,
    round(1234.5678, 1)   AS round2,
    round(1234.5678, 2)   AS round3,
    round(1234.5678, - 1) AS round4, --소수점 기준으로 왼쪽으로 1칸 반올림
    round(1234.5678, - 2) AS round5  --소수점 기준으로 왼쪽으로 2칸 반올림
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc1,
    trunc(1234.5678, 1)   AS trunc2,
    trunc(1234.5678, 2)   AS trunc3,
    trunc(1234.5678, - 1) AS trunc4, --소수점 기준으로 왼쪽으로 1칸 반올림
    trunc(1234.5678, - 2) AS trunc5  --소수점 기준으로 왼쪽으로 2칸 반올림
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;
    
-- 날짜 함수 : 연산이 가능함 +1.-1
-- sysdate, current_date, current_timestamp
SELECT
    sysdate,
    current_date,
    current_timestamp
FROM
    dual;

SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrw
FROM
    dual;
    
-- add_months() : 몇 개월 이후 날짜 구하기
SELECT
    sysdate,
    add_months(sysdate, 3) --3개월 뒤
FROM
    dual;
    
-- 입사 20주년이 되는 사원들 조회
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;
    
-- 현재 날짜를 기준으로 입사 45년 미만인 사원
SELECT
    *
FROM
    emp
WHERE
    sysdate < add_months(hiredate, 540);
    
-- months_between(날짜1, 날짜2) : 두 날짜 데이터 간의 날짜 차이를 개월 수로 출력
SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(sysdate, hiredate)        AS months1,
    months_between(sysdate, hiredate)        AS months2,
    trunc(months_between(sysdate, hiredate)) AS month3
FROM
    emp;
      
-- next_day() : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
-- last_day() : 특정 날짜가 속한 달의 마지막 날짜 출력
SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;
    
-- 형변환 함수
SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'SMITH';

desc emp;  
--
SELECT
    empno,
    ename,
    'abcd' + empno
FROM
    emp
WHERE
    ename = 'SMITH';
    
-- TO_CHAR() : 숫자, 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환

SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜
FROM
    dual;

SELECT
    to_char(sysdate, 'MM')    AS mm, --월을 2자리로 표현
    to_char(sysdate, 'MON')   AS mon, -- + '월'
    to_char(sysdate, 'MONTH') AS month, -- + '월'
    to_char(sysdate, 'DD')    AS dd,
    to_char(sysdate, 'DY')    AS dy,
    to_char(sysdate, 'DAY')   AS day
FROM
    dual;

SELECT
    to_char(sysdate, 'HH24:MI:SS')      AS hh24miss, --24시간제 // 오후2 : 14시
    to_char(sysdate, 'HH24:MI:SS AM')   AS hh24miss_am,
    to_char(sysdate, 'HH24:MI:SS P.M.') AS hhmiss_pm,
    to_char(sysdate, 'HH12:MI:SS')      AS hh24miss -- 12시간제
FROM
    dual;

SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;

-- 9 : 숫자 한자리를 의미함
SELECT
    to_number('1,300', '999,999') + to_number('1,500', '999,999') --,는 수식안해줌
FROM
    dual;

SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$
FROM
    emp;

SELECT
    TO_DATE('2022-03-22', 'YYYY-MM-DD') AS date1,
    TO_DATE('20220322', 'YYYY-MM-DD')   AS date2
FROM
    dual;

DESC EMP;

-- 1981년 6월 1일 이후에 입사한 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('19810601', 'YYYY-MM-DD');
    
-- NULL 처리 함수
-- null 경우 더하기해서 값 출력 불가
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm -- 숫자
FROM
    emp;

desc emp;

-- NVL(NULL값 열, NULL인경우 사용할 값)
SELECT
    empno,
    ename,
    sal,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;
    
-- NVL2(NULL값 열,NULL이 아닐 경우 사용할 값, NULL인경우 사용할 값)
SELECT
    empno,
    ename,
    sal,
    nvl2(comm, 'O', 'X'),
    sal + nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;
    
-- DECODE 함수와 CASE문
-- DECODE(대상이 될 열혹은 데이터,
-- 조건1, 조건1과 일치시 반환할 결과
-- 조건2, 조건2과 일치시 반환할 결과
-- 조건1~조건N까지 만족 안할 때 반환할 결과
-- )
-- JOB에 따라 비율을 다르게 준 다음 연산
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upasal
FROM
    emp;
   
-- case when then   
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upasal
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE --job열값 삭제 가능
        WHEN comm IS NULL THEN
            '해당사항없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당:' || comm
    END AS comm_text
FROM
    emp;
    
-- [실습] emp테이블에서 월 평균 근무일수 21.5일
-- 하루급여(day_pay), 시급(time_pay)
-- day_pay 소수점 셋째자리에서 버리기
-- time_pay 소수점 둘째자리에서 반올림

SELECT
    empno,
    ename,
    sal,
    trunc((sal / 21.5), 2)     AS day_pay,
    round((sal / 21.5 / 8), 1) AS time_pay
FROM
    emp;
    
-- emp 테이블에서 입사일 기준으로 3개월이 지난 후 첫 월요일에 정직원이 됨
-- 정직원이 된 날짜 구하기
-- 추가수당을 조회할 때 null 인 경우는 N/A로 출력
SELECT
    empno,
    ename,
    next_day(add_months(hiredate, 3), '월요일'),
    nvl(to_char(comm), 'N/A') --comm이 숫자타입으로 문자타입으로 변환해야
FROM
    emp;

SELECT
    nvl(comm, 'N/A') -- comm이 숫자타입으로 n/a 글자타입으로 에러발생
FROM
    emp;

SELECT
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일'),
    nvl(to_char(comm), 'N/A') AS comm-- comm을 문자로 변환 후 
FROM
    emp;
    
-- [문제] emp 테이블의 mgr 기준으로 출력
-- mgr 존재하지 않으면 0000
-- mgr 75인 경우 : 5555
-- mgr 76인 경우 : 6666
-- mgr 77인 경우 : 7777
-- mgr 78인 경우 : 8888
-- 그 외 원래대로 mgr 출력
SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555', --substr 문자열 추출
           '76', '6666', '77', '7777', '78',
           '8888', substr(to_char(mgr), 1)) AS chg_mgr
FROM
    emp;
    
--case
SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '78' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;
    
-- 다중행 함수
-- sum(), count(), max(), min(),avg()

-- 추가수당 합계
SELECT
    SUM(comm)
FROM
    emp;

SELECT
    SUM(DISTINCT sal), --DINSTINC중복은 빼고 구하기
    SUM(sal) --
FROM
    emp;
    
-- emp 테이블의 사원 수 출력
SELECT
    COUNT(*) --채워져있는 comm 갯수 세기 , NULL은 제외
FROM
    emp;
    
-- NULL 포함 모두 세줌
SELECT
    COUNT(*)
FROM
    emp
WHERE
    deptno = 30;
    
-- 급여의 최대값
SELECT
    MAX(sal)
FROM
    emp;

SELECT
    MIN(sal)
FROM
    emp;

-- 부서번호가 20번인 사원 중 제일 오래된 입사일 구하기
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;

-- 부서번호가 20번인 사원 중 제일 최근 입사일 구하기
SELECT
    MAX(hiredate)
FROM
    emp
WHERE
    deptno = 20;
    
-- 부서번호가 30번인 사원들의 급여 평균 출력
SELECT
    round(AVG(sal))
FROM
    emp
WHERE
    deptno = 30;
    
-- 부서별 평균 급여 출력 : gruop by
SELECT
    deptno,
    AVG(sal) -- ORA-00937: not a single-group group function
FROM
    emp;

-- group by : 결과값을 원하는 열로 묶어 출력
SELECT
    deptno,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;

-- 부서별, 직책별 급여 평균 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

-- group by : select 절에 group by 절에 포함안되는 열을 사용 불가
SELECT
    ename,
    deptno,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;
    
-- gropu by ~ having : 그룹을 잡을 때 조건을 주는 경우

-- 각 부서의 직책별 평균 급여를 구하되, 평균 급여가 2000이상인 그룹만 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000;
    
-- where : 출력 대상 행을 제한
-- having : 그룹화된 대상을 제한

-- emp 테이블의 부서별 직책의 평균급여가 500이상인, 사원들의 부서번호, 직책,
-- 평균급여가 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 500
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    AVG(sal) >= 500
GROUP BY
    deptno,
    job;

SELECT     ------------ ⑤
    deptno,
    job,
    AVG(sal)
FROM       ------ ①
    emp
WHERE      ------ ②
    sal <= 3000
GROUP BY   ------ ③
    deptno,
    job
HAVING     ------ ④
    AVG(sal) >= 2000
ORDER BY   ----------- ⑥
    deptno,
    job;

-- [실습1]
-- 부서별, 평균급여, 최고급여, 최저급여, 사원수 출력
-- 평균급여는 소수점제외 round
SELECT
    deptno,
    round(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(deptno)   AS cnt
FROM
    emp
GROUP BY
    deptno;

--[실습2]
-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 사원수 출력
SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;
    
-- [문제] 사원들의 입사연도를 기준으로 부서별 인원수 출력
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)                  AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;

--JOIN
-- 데이터가 여러개의 테이블에 나뉘어 저장함

--1) 내부조인 : 일치하는 칼럼을 기준으로 값 가져오기
-- column ambiguously defined
SELECT
    e.empno,
    e.ename,
    e.deptno,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno;
   
-- 표준문법(inner 생략가능) 
SELECT
    e.empno,
    e.ename,
    e.deptno,
    dname,
    loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno;
    
-- 부서번호가 일치하는 사원들의 정보 출력
-- 급여가 3000 이상자만 출력
SELECT
    e.deptno,
    d.dname,
    e.empno,
    e.ename
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno
                         AND sal >= 3000;

-- 부서번호가 일치하는 사원들의 정보 출력
-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사원 출력

SELECT
    e.deptno,
    e.empno,
    e.ename,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal <= 2500
    AND e.empno <= 9999;

SELECT
    e.deptno,
    e.empno,
    e.ename,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
                   AND e.sal <= 2500
                   AND e.empno <= 9999;

-- emp, salgrade 조인 : 비등가 조인 (값이 완전히 같은형태X, 범위사이에 있는)
SELECT
    *
FROM
    salgrade;

SELECT
    empno,
    ename,
    job,
    sal,
    comm,
    deptno,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal; 


-- 자기자신 테이블 조인 : 셀프조인
SELECT
    *
FROM
    emp;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;


-- outer join(외부조인) : 일치하지 않은 것도 가져오는거
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;
    
    
-- [문제] 각 부서별 평균급여, 최대급여, 최소급여, 사원수 출력
-- 부서코드, 부서명, 평균급여, 최대급여, 최소급여, 사원수
SELECT
    d.deptno,
    d.dname,
    floor(AVG(sal)),
    MAX(sal),
    MIN(sal),
    COUNT(*)
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    d.dname;

-- [문제] 모든 부서정보와 사원 정보를 출력(부서번호의 오름차순, 사원번호 오름차순)
-- 부서번호, 부서명, 사원번호, 사원명, 직책, 급여
-- 모든 : outer join
SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
FROM
    emp  e
    RIGHT OUTER JOIN dept d ON e.deptno = d.deptno
ORDER BY
    d.deptno,
    e.empno;

-- 세 개의 테이블 조인
SELECT
    e1.empno,
    e2.empno,
    e3.empno
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;
  
-- [문제] 모든 부서정보, 사원정보, 급여등급정보, 각 사원의 직속 상관의 정보 부서번호,
-- 사원번호 출력
SELECT
    d.deptno,
    d.dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    e1.deptno AS deptno_1,
    s.losal,
    s.hisal,
    s.grade,
    e2.empno  AS mgr_empno,
    e2.ename  AS mgr_ename
FROM
    emp      e1
    RIGHT OUTER JOIN dept     d ON e1.deptno = d.deptno
    LEFT OUTER JOIN salgrade s ON e1.sal BETWEEN s.losal AND s.hisal
    LEFT OUTER JOIN emp      e2 ON e1.mgr = e2.empno
ORDER BY
    d.deptno,
    e1.empno;

-- 3.22    
-- 서브쿼리 : 쿼리문 안에 또다른 쿼리문 존재
-- select 조회할 열
-- from 테이블명
-- where 조건식(select 조회할 열 from 테이블명 where 조건식)

-- JONES 사원의 급여보다 높은 급여를 받는 사원 조회

-- JONES 사원의 급여
SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES'; -- 2975


-- 서브쿼리 예시문
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );
    
-- ALLEN 사원의 추가수당보다 많은 추가수당을 받는 사원정보
SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );
    
-- 'WARD' 보다 빨리 입사한 사원정보 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );
    
-- 실행결과가 하나로 나오는 단일행 서브쿼리 사용연산자
-- >, <=, =, <=, <, <>, ~=, !=

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는
-- 사원정보와 소속부서 정보를 조회
SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        d.deptno = 20
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );
    
    
-- 실행 결과가 여러개로 나오는 다중행 서브쿼리 사용 연산자
-- IN, ANY(SOME), ALL, EXISTS

-- 각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력
-- IN : 메인쿼리의 데이터가 서브쿼리 결과 중 하나라도 일치한 데이터가 있다면 TRUE
SELECT
    *
FROM
    emp
WHERE
    sal IN ( -- = : 실행결과가 하나로 나오는 곳에서만 사용 가능
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );
   
-- ANY(SOME) : 서브쿼리가 반환한 여러 결과 값 중에서 메인쿼리의 조건식 중 하나라도
-- TRUE 라면 메인쿼리 조건식을 TRUE로 반환
-- IN == ANY (크다 작다일 경우 사용)
SELECT
    *
FROM
    emp
WHERE
    sal = ANY ( -- IN == ANY
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- 각 부서별 최고 급여보다 작은 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal < ANY ( -- IN == ANYSELECT
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력  

SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT DISTINCT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

-- ALL : 서브쿼리가 반환한 여러 결과 값을 메인쿼리의 조건식이 모두 만족시 true
-- 30번 부서 사원들의 최소 급여보다 적은 급여를 받는 사원 정보 출력 
SELECT
    *
FROM
    emp
WHERE
    sal < ALL (
        SELECT DISTINCT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

-- 다중열 서브쿼리

-- 자신의 부서 내에서 최고 연봉과 동일한 급여를 받는 사원 출력
-- 2개 colmm이면 where 2개로 뽑기
SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- From 절에 사용하는 서브쿼리(인라인뷰)
SELECT
    e10.empno,
    e10.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;



-- [문제] 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진
-- 사원정보, 부서정보를 출력(NOT IN)
SELECT
    e.empno,
    e.ename,
    e.job,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 10
    AND job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            e.deptno = 30
    );

-- [문제] 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의
-- 사원정보, 급여, 등급 정보를 출력
-- EMPNO, ENAME, SAL, GRADE 출력
-- MAX() 쓰는 형태
SELECT
    empno,
    ename,
    sal,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );

-- MAX() 안쓰는 형태
SELECT
    empno,
    ename,
    sal
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );

-- DML(데이터 조작어 : 삽입, 삭제, 수정) = 변화가 일어남
-- COMMIT(커밋) : 데이터베이스에 최종 반영, 
-- ROLLBACK(롤백) : 지금 반영된걸 취소

-- DEPT 테이블의 데이터를 추출해서 DEPT_TEMP 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

-- insert(삽입)
-- insert into 테이블명(열이름..)
-- values(데이터..)

-- 문자,날짜 데이터는 '' 사용
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

SELECT
    *
FROM
    dept_temp;

-- 필드명 생략 가능
-- 테이블의 colmm 맞추기
INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

INSERT INTO dept_temp (
    deptno,
    dname
) VALUES (
    70,
    'NETWORK'
);

--INSERT INTO DEPT_TERM
--VALUES(800,'NETWORK','BUSAN');

INSERT INTO dept_temp VALUES (
    80,
    'NETWORK',
    NULL
);

SELECT
    *
FROM
    dept_temp;

-- EMP 테이블의 구조만 복사해서 새로운 테이블 생성
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

SELECT
    *
FROM
    emp_temp;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    '홍길동',
    'MANAGER',
    NULL,
    '2021-01-05',
    5000,
    1000,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    8888,
    '성춘향',
    'MANAGER',
    9999,
    sysdate,
    4000,
    500,
    20
);

-- EMP 테이블 부서번호가 20번인 사원들만 EMP_TEMP 삽입
INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
        emp
    WHERE
        deptno = 20;

SELECT
    *
FROM
    emp_temp;

ROLLBACK;

COMMIT;


-- EMP 테이블에서 SALGRADE 테이블을 참조하여 등급이 1인 사원을 
-- EMP_TEMP 추가하고 싶을때
INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
             emp e
        JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
    WHERE
        s.grade = 1;

SELECT
    *
FROM
    emp_temp;

COMMIT;

-- 수정
-- update 테이블명
-- set 변경할 열 = 값, 변경할 열 = 값
-- [where] 선택

SELECT
    *
FROM
    dept_temp;

-- loc를 seoul로 변경
-- where 없으면 모두 변경
UPDATE dept_temp
SET
    loc = 'SEOUL';

ROLLBACK;
    
-- DEPTNO = 50인 경우에 LOC = 'BUSAN' 변경
UPDATE dept_temp
SET
    loc = 'BUSAN'
WHERE
    deptno = 50;

ROLLBACK;

-- EMP_TEMP 사원 중 SAL 3000이하인 사원만 COMM 300으로 수정
UPDATE emp_temp
SET
    comm = 300
WHERE
    sal <= 3000;

SELECT
    *
FROM
    emp_temp;

COMMIT;
    
-- UPDATE 서브쿼리
-- DEPT 테이블에서 부서번호가 40번인 부서명과 지역 추출

UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 40
    );

SELECT
    *
FROM
    dept_temp;

ROLLBACK;

-- dname이 operations인 부서번호 추출 : dept
-- 추출된 부서번호와 일치하는 부서번호의 지역을 'seoul'변경
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept
        WHERE
            dname = 'OPERATIONS'
    );

SELECT
    *
FROM
    dept_temp;

COMMIT;

-- 삭제
-- DELETE [FROM]
-- [WHERE]

-- job이 analyst인 사원 삭제
DELETE FROM emp_temp
WHERE
    job = 'ANALYST';

DELETE FROM emp_temp
WHERE
    ename = 'JAMES';

DELETE emp_temp;

SELECT
    *
FROM
    emp_temp;

-- EMP = 7369인 사원의 SAL 1500으로 변경
UPDATE emp_temp
SET
    sal = 1500
WHERE
    empno = 7369;

-- EMP_TEMP에서 급여등급이 3이고, 20번 부서의 사원만 삭제
-- 서브쿼리 형태
DELETE FROM emp_temp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 emp_temp e
            JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
                s.grade = 3
            AND e.deptno = 20
    );

ROLLBACK;

SELECT
    *
FROM
    emp_temp;

COMMIT;

SELECT
    *
FROM
    dept_temp;

ROLLBACK;

SELECT
    *
FROM
    dept_term;

COMMIT;


-- [문제] EXAM_EMP 생성
CREATE TABLE exam_emp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;
            
-- [문제] EXAM_DEPT 생성
CREATE TABLE exam_dept
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            1 <> 1;

-- [문제] EXAM_SALGRADE 생성        
CREATE TABLE exam_salgrade
    AS
        SELECT
            *
        FROM
            salgrade
        WHERE
            1 <> 1;

SELECT
    *
FROM
    exam_emp;

SELECT
    *
FROM
    exam_dept;

SELECT
    *
FROM
    exam_salgrade;

--
SELECT
    *
FROM
    exam_emp;

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST-USER1',
    'MANAGER',
    7788,
    '2016-01-02',
    4500,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7202,
    'TEST-USER2',
    'CLERK',
    7201,
    '2016-02-21',
    1800,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7203,
    'TEST-USER3',
    'ANALYST',
    7201,
    '2016-04-11',
    3400,
    NULL,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7204,
    'TEST-USER4',
    'SALESMAN',
    7201,
    '2016-05-31',
    2700,
    300,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7205,
    'TEST-USER5',
    'CLERK',
    7201,
    '2016-02-21',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7206,
    'TEST-USER6',
    'CLERK',
    7201,
    '2016-09-08',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7207,
    'TEST-USER7',
    'LECTURE',
    7201,
    '2016-10-28',
    2300,
    NULL,
    80
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7208,
    'TEST-USER8',
    'STUDENT',
    7201,
    '2016-03-09',
    1200,
    NULL,
    80
);

-- [문제] 50번 부서에서 근무하는 사원들의 평균 급여보다 많은 급여를 받고 있는
-- 사원들의 부서번호 70번으로 변경

SELECT
    *
FROM
    exam_emp;

UPDATE exam_emp
SET
    deptno = 70
WHERE
    sal > (
        SELECT
            AVG(sal)
        FROM
            exam_emp
        WHERE
            deptno = 50
    );

SELECT
    *
FROM
    exam_emp;

-- [문제] 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다 늦게 입사한 사원들
-- 의 급여를 10% 인상하고 80번 부서로 변경
UPDATE exam_emp
SET
    sal = sal * 1.1,
    deptno = 80
WHERE
    hiredate > (
        SELECT
            MIN(hiredate)
        FROM
            exam_emp
        WHERE
            deptno = 60
    );
    
-- [문제] 급여등급이 5인 사원 삭제
DELETE FROM exam_emp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 exam_emp e
            JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
            s.grade = 5
    );

SELECT
    *
FROM
    exam_emp;

COMMIT;

-- 3/24
-- 트랜잭션 : 관계형 데이터베이스에서 하나의 작업 또는 밀접하게 관련되어 있는
-- 작업수행을 위해 나눌 수 없는 최소 수행 단위

CREATE TABLE dept_tcl
    AS
        SELECT
            *
        FROM
            dept;
        
select * from dept_tcl;

-- 트랜잭션과 관련있는 명령어
insert into dept_tcl values(50,'DATABASE','SEOUL');
UPDATE DEPT_TCL SET LOC='BUSAN' WHERE DEPTNO=40;
DELETE FROM DEPT_TCL WHERE DNAME='RESEARCH';

------------------------- 하나의 트랜잭션

ROLLBACK;

COMMIT;

-- 세션(SESSION) : 어떤 활동을 위한 시간이나 기간
-- 데이터베이스 세션 : 데이터베이스 접속을 시작으로 여러 데이터베이스에서 작업을 수행한 후 접속 종료
-- 하나의 세션 안에 트랜잭션 존재

delete from dept_tcl where deptno = 50;
commit;

update dept_tcl set loc='SEOUL'
where deptno = 30;

commit;

-- DDL(데이터 정의어) : 객체 생성(CREATE), 변경(ALTER), 삭제(DROP)

-- 테이블 생성
--CREATE TABLE 테이블명(
--    열이름 자료형,
--    열이름 자료형,
--    열이름 자료형,
--    열이름 자료형);

-- 테이블명 규칙
-- 문자로 시작
-- 같은 사용자 소유의 테이블명 중복 불가
-- 영문자(한글 가능), 특수문자 가능($,#,_)
-- SQL 키워드(SELECT, DELETE...)는 테이블명 사용 불가
-- 자료형 : 숫자, 문자, 날짜 ... 등

-- 자료형
-- 문자 : 
-- CHAR(n) - 고정길이 ex) NAME CHAR(10); NAME이라는 칸에 10개의 글자를 허용 => 3개를 넣어도 10을 잡음
-- *VACHAR2(n) -- 가변길이 ex) NAME VARCHAR2(10); => 3개를 넣으면 3만 잡음 => 메모리 유연성이 좋음
-- NCHAR(n) -- 고정길이(유니코드) ex) NAME NCHAR(10); 한글/영어 모두 10개의 문자
-- NVARCHAR(n) -- 가변길이(유니코드) 

-- 숫자형
-- *NUMBER(숫자1,숫자2) : 숫자1(자릿수), 숫자2)(소수점자릿수)
-- ex) empno number(4) : 숫자로 4자리 허용
--     price number(7,2) : 숫자로 7자리 허용되는데 소수점이 들어온다면 2자리 허용
--     job number : 저장 데이터 크기에 맞게 자동 조절

-- 날짜형
-- DATE : 년,월,일,시,분,초
-- *TIMESTAMP : 년,월,일,시,분,초 + 밀리초 입력가능

-- 테이블 생성
-- 구조 직접 설계
CREATE TABLE EMP_DDL ( --TABLE : 객체
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2));

DROP TABLE EMP_DDL;

-- 다른 테이블 구조 이용해서 생성(데이터까지 포함)
-- CTRL C CTRL V
CREATE TABLE EMP_DDL AS SELECT * FROM EMP;

-- 다른 테이블 구조만 이용해서 생성
CREATE TABLE EMP_DDL1 AS SELECT * FROM EMP WHERE 1<>1;

-- 테이블 변경 : ALTER

SELECT * FROM EMP_DDL;

-- 열(컬럼) 추가 : ALTER ~ ADD
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);
SELECT * FROM EMP_DDL;

-- 열 이름을 변경 : ALTER ~ RENAME
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;

-- 열 자료형 변경 : ALTER ~ MODIFY
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);
DESC EMP_DDL;

-- 데이터가 삽입되어 있을 때는 데이터의 길이가 맞지 않는다면 변경 불가
-- ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(3);

-- 열 삭제 : ALTER ~ DROP COLUMN 명
ALTER TABLE EMP_DDL DROP COLUMN TEL;
DESC EMP_DDL;

-- 테이블 명 변경 : RENAME ~ TO ~
RENAME EMP_DDL TO EMP_RENAME;

-- 테이블 삭제 : DROP
DROP TABLE EMP_RENAME;

-- 실습1
CREATE TABLE EMP_HW (
    ID CHAR(8),
    NAME NVARCHAR2(10),
    ADDR NCHAR(50),
    NATION CHAR(4),
    EMAIL VARCHAR2(50),
    AGE NUMBER(7,2));

DROP TABLE EMP_HW;

CREATE TABLE EMP_HW (
    ID CHAR(8),
    NAME VARCHAR2(10),
    ADDR VARCHAR2(50),
    NATION CHAR(4),
    EMAIL VARCHAR2(50),
    AGE NUMBER(7,2));

-- BIGO 열 추가하기
-- 가변형 문자열, 길이 20 ALTER ADD
ALTER TABLE EMP_HW ADD BIGO VARCHAR2(20);
DESC EMP_HW;

-- BIGO 열 크기 30 변경 ALTER MODIFY
ALTER TABLE EMP_HW MODIFY BIGO VARCHAR2(30);

-- BIGO 열 이름 REMARK로 변경 ALTER RENAME COLUMN TO
ALTER TABLE EMP_HW RENAME COLUMN BIGO TO REAMRK;

-- 제약조건(테이블의 특정 열에 지정)
-- 입력,수정,삭제 영향을 주는 부분  => 데이터의 무결성(정확성,일관성) 유지

-- 1) NOT NULL : 지정한 열에 NULL을 허용하지 않음
-- 2) UNIQUE : 지정한 열이 유일한 값을 가져야 함(NULL 제외)
-- 3) PRIMARY KEY : 지정한 열이 유일값이면 NULL이 아님(하나만 지정)
-- 4) FOREIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
-- 5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능

-- NOT NULL 제약조건
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL, --NULL이면 안된다
    TEL VARCHAR2(20));

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD, TEL)
VALUES('TEST_ID_01',NULL,'010-1234-5678');

INSERT INTO TABLE_NOTNULL(LOGIN_ID, TEL)
VALUES('TEST_ID_01','010-1234-5678');

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD)
VALUES('TEST_ID_01','12345');

UPDATE TABLE_NOTNULL
SET LOGIN_PWD = NULL
WHERE LOGIN_ID = 'TEST_ID_01';

-- SCOTT가 사용한 모든 제약조건 확인
-- CONSTRAINT_NAME : SYS는 ORACLE에서 만든 이름
SELECT * FROM USER_CONSTRAINTS;

-- 제약조건명 지정
-- CONSTRAINT 제약조건명
CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPWD_NN NOT NULL, --NULL이면 안된다
    TEL VARCHAR2(20));

-- TABLE_NOTNULL TEL 칼럼을 NOT NULL 제약 조건 추가
DESC TABLE_NOTNULL;
SELECT * FROM TABLE_NOTNULL;
ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL);

UPDATE TABLE_NOTNULL
SET TEL = '010-1234-5678'
WHERE LOGIN_ID='TEST_ID_01';

-- 제약조건 이름 변경
ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT TBLNN2_LGNID_NN TO TBLNN2_ID_NN;

-- 제약조건 삭제
ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBLNN2_ID_NN;

-- 2) UNIQUE : 지정한 열이 유일한 값을 가져야 함(NULL 제외)
CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
VALUES('TEST_ID_01','12345','010-1234-5678');

-- UNIQUE CONSTRAINT VIOLATED
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
VALUES('TEST_ID_01','54321','010-5678-1234'); --ID는 UNIQUE인데 중복되서 ERROR

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
VALUES(NULL,'54321','010-5678-1234');

-- UNIQUE 제약조건 이름 지정
CREATE TABLE TABLE_UNIQUE2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPWD_NN NOT NULL, 
    TEL VARCHAR2(20)
);

-- TABLE_UNIQUE2의 TEL UNIQUE 제약 조건 추가
ALTER TABLE TABLE_UNIQUE2 MODIFY(TEL UNIQUE);

-- 3) PRIMARY KEY : 지정한 열이 유일값이면 NULL이 아님(하나만 지정)
-- NOT NULL + UNIQUE
-- ** 각 행을 식별하는 용도

CREATE TABLE TABLE_PK(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));
    
INSERT INTO TABLE_PK VALUES('TEST_01','PW01','010-1234-5678');

-- unique constraint (SCOTT.SYS_C007037) violated
-- NOT NULL은 만족
INSERT INTO TABLE_PK VALUES('TEST_01','PW01','010-1234-5678');

-- table can have only one primary key
CREATE TABLE TABLE_PK2(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) PRIMARY KEY,
    TEL VARCHAR2(20));
    
CREATE TABLE TABLE_PK2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LGNID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLPK2_LGNPWD_NN NOT NULL,
    TEL VARCHAR2(20));    
    
-- 제약조건 지정시 다른 방식
CREATE TABLE TABLE_CON(
    COL1 VARCHAR2(20),
    COL2 VARCHAR2(20),
    PRIMARY KEY(COL1),
    CONSTRAINT TBLCON_UNQ UNIQUE(COL2));

-- 4) FOREIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
CREATE TABLE DEPT_FK(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(20),
    LOC VARCHAR2(13));

CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));

-- parent key not found
-- DEPT_FK(DEPTNO)) 값이 없다
-- 외래키는 부모 - 자식 개념
INSERT INTO EMP_FK(EMPNO,ENAME,DEPTNO)
VALUES(7899,'HONG',20);

-- 외래키 수행순서
-- 부모테이블에 데이터가 먼저 삽입되어야 함
-- 자식테이블 데이터 삽입
INSERT INTO DEPT_FK VALUES(10,'DATABASE','SEOUL');
INSERT INTO EMP_FK(EMPNO,ENAME,DEPTNO)
VALUES(7899,'HONG',10);

-- child record found
DELETE FROM DEPT_FK WHERE DEPTNO = 10;

-- 외래키 삭제 수행 순서
-- 자식 테이블에 해당하는 데이터 삭제
-- 부모 테이블에 해당하는 데이터 삭제 
DELETE FROM EMP_FK WHERE DEPTNO = 10; -- 자식
DELETE FROM DEPT_FK WHERE DEPTNO = 10; -- 부모

-- 부모 데이터를 삭제할 때 참조하고 있는 데이터도 함께 삭제
-- 부모 데이터를 삭제할 때 참조하고 있는 데이터를  null 로 수정
CREATE TABLE DEPT_FK2(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK2_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(20),
    LOC VARCHAR2(13));

-- ON DELETE CASCADE : 열 데이터 삭제시 참조 데이터 함께 삭제 
CREATE TABLE EMP_FK2(
    EMPNO NUMBER(4) CONSTRAINT EMPFK2_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK2_DEPTNO_FK REFERENCES DEPT_FK2(DEPTNO)
    ON DELETE CASCADE);

INSERT INTO DEPT_FK2 VALUES(10,'DATABASE','SEOUL');
INSERT INTO EMP_FK2(EMPNO,ENAME,DEPTNO)
VALUES(7899,'HONG',10);

DELETE FROM DEPT_FK2 WHERE DEPTNO = 10;

SELECT * FROM EMP_FK2;
    
-- ON DELETE SET NULL : 열 데이터 삭제시 참조 데이터를 NULL로 수정  
CREATE TABLE DEPT_FK3(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK3_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(20),
    LOC VARCHAR2(13));    
    
CREATE TABLE EMP_FK3(
    EMPNO NUMBER(4) CONSTRAINT EMPFK3_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK3_DEPTNO_FK REFERENCES DEPT_FK3(DEPTNO)
    ON DELETE SET NULL);    
    
INSERT INTO DEPT_FK3 VALUES(10,'DATABASE','SEOUL');
INSERT INTO EMP_FK3(EMPNO,ENAME,DEPTNO)
VALUES(7899,'HONG',10);

DELETE FROM DEPT_FK3 WHERE DEPTNO = 10;

SELECT * FROM DEPT_FK3; 
SELECT * FROM EMP_FK3;    

-- 5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능
CREATE TABLE TBL_CHECK(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LGNID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LGNPWD_CK CHECK(LENGTH(LOGIN_PWD) > 3),
    TEL VARCHAR2(20));

-- check constraint (SCOTT.TBLCK_LGNPWD_CK) violated
INSERT INTO TBL_CHECK
VALUES ('TEST_ID1','123','010-1234-5678');

INSERT INTO TBL_CHECK
VALUES ('TEST_ID1','1234','010-1234-5678');


-- 기본값 지정 : DEFAULT

CREATE TABLE TBL_DEFAULT(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBL_LGNID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) default '1234', --기본값으로 1234
    TEL VARCHAR2(20));

INSERT INTO tbl_default
VALUES ('TEST_ID1',null,'010-1234-5678');

select * from tbl_default;

INSERT INTO tbl_default(login_id,tel)
VALUES ('TEST_ID2','010-1234-5678');

-- [실습1] dept_const 테이블 생성
create table dept_const(
    deptno number(2) constraint deptconst_deptno_pk primary key,
    dname varchar2(14) constraint deptconst_deptno_unq unique,
    loc varchar2(13) constraint deptconst_loc_nn not null);

--create table emp_const(
--    deptno number(2),
--    dname varchar2(14),
--    loc varchar2(13),
--    constraint deptconst_deptno_pk primary key(deptno),
--    constraint deptconst_deptno_unq unique(dname),
--    constraint deptconst_loc_nn not null(loc));
    
create table emp_const(
    empno number(2) constraint empconst_empno_pk primary key,
    ename varchar2(10) constraint empconst_ename_nn not null,
    job varchar2(9),
    tel varchar2(20) constraint empconst_tel_unq unique,
    hiredate date,
    sal number(7,2) constraint empconst_sal_chk check(sal between 1000 and 9999), --between A and B
    comm number(7,2),
    deptno number(2) constraint empconst_deptno_fk REFERENCES dept_const(deptno));    
    
-- 시퀀스(sequence) : 규칙에 따라 순번을 생성
-- create sequence 시퀀스이름
-- 1씩 증가

create sequence dept_seq;

create table dept_sequence as select * from dept where 1<>1;

select * from dept_sequence;

insert into dept_sequence(deptno,dname,loc)
values(dept_seq.nextval,'DATABASE','SEOUL'); --nextval

-- 가장 마지막으로 생성된 시퀀스 확인
select dept_seq.currval from dual;

--시퀀스 삭제
drop sequence dept_seq;

-- 얼마씩 증가할거냐
create sequence dept_seq
increment by 10 -- 시퀀스에서 생성할 번호의 증가값
start with 10 -- 시퀀스에서 생성할 번호의 시작값
maxvalue 90 -- 시퀀스에서 생성할 번호의 최대값
minvalue 0 -- 시퀀스에서 생성할 번호의 최소값
nocycle -- 시퀀스에서 생성한 번호가 최댓값에 도달할 경우 다시 시작할 것인가 여부(cycle or nocycle)
cache 2; -- 시퀀스가 생성할 번호를 메모리에 미리 할당해 놓은 수를 지정

insert into dept_sequence(deptno,dname,loc)
values(dept_seq.nextval,'DATABASE','SEOUL');

select * from dept_sequence;

-- 시퀀스 수정
alter sequence dept_seq increment by 3 maxvalue 99 cycle;


-- 뷰(view) : 가상 테이블
--            하나 이상의 테이블을 조회하는 select 문을 저장한 객체
--            편리성 - select문의 복잡도를 완화
--            보완성 - 테이블의 특정 열을 노출하고 싶지 않은 경우

-- 생성
create view vm_emp20 as (select empno,ename,job,deptno from emp where deptno=20);

select * from vm_emp20;
   
--insert
insert into vm_emp20(empno,ename,job,deptno)
values(8000,'TEST','MANAGER',20)

-- view와 원본테이블 연결 여부
-- 원본 테이블도 변화
select * from emp;

-- 생성된 뷰들의 속성 확인하기
select *
from user_updatable_columns
where table_name = 'VM_EMP20';
    
-- 뷰 생성시 원본 데이터 수정 불가하도록 작성
-- WITH READ ONLY : 뷰의 열람
create view vm_emp_read as select empno, ename, job from emp with read only;
select *
from user_updatable_columns
where table_name = 'VM_EMP_READ';

insert into vm_emp_read(empno,ename,job)
values(8001,'TEST','MANAGER');

-- 뷰 삭제
drop view vm_emp20;


-- 인덱스 : 빠른 검색
-- 인덱스 사용 여부에 따라 table full scan, index scan
-- 인덱스 없으면 table full scan

-- scott가 가지고 있는 인덱스 확인하기
select * from user_indexes; -- pk 설정된 값들은 인덱스로 사용됨

-- 인덱스 생성
-- create index 인덱스명 on 테이블명(열이름1 asc, 열이름2 desc,...)
create index idx_emp_sal on emp(sal);

-- index가 설정된 컬럼 조회
select * from user_ind_columns;
select * from emp;

select * from emp where deptno=20;

-- index 삭제
drop index idx_emp_sal;











    