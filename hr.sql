-- hr(오라클 연습용 계정)
-- soctt가 가지고 있는 정보의 원본

-- [문제1] employees 테이블 전체 내용 조회
SELECT
    *
FROM
    employees;

-- [문제2] employees 테이블의 first_name, last_name, job_id 조회
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;
    
-- [문제3] employees 테이블의 모든 열을 조회
-- employee_id : empno
-- manager_id : mgr
-- department_id : deptno
-- 위 3개의 열은 별칭을 붙여서 조회
-- 조회할 때 부서번호 기준으로 내림차순으로 정렬하되 부서 번호가 같다면
-- 사원 이름(First_name)을 기준으로 오름차순 정렬
desc employees;

SELECT
    employee_id   AS empno,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    commission_pct,
    manager_id    AS mgr,
    department_id AS deptno
FROM
    employees
ORDER BY
    department_id DESC,
    first_name ASC;
    

-- [문제4] 사원번호가 176인 사원의 last_name과 deptno 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    employee_id = 176;

-- [문제5] 연봉이 12,000 이상 되는 직원들의 last_name과 salary 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;

-- [문제6] 연봉이 5000 ~ 12000 범위 사이가 아닌 사원들 조회
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary < 5000
    OR salary > 12000;

-- [문제7] 20번 혹은 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 DEPARTMENT_ID 조회
-- 후, LAST_NAME의 오름차순, DEPARTMENT_ID의 오름차순으로 정렬
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
ORDER BY
    last_name ASC,
    department_id ASC;


-- [문제8] 커미션을 받는 모든 사원들의 LAST_NAME,SALARY,COMMISSION_PCT를 조회한다.
-- 연봉의 내림차순, COMMISSION_PCT의 내림차순 정렬
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct DESC;


-- [문제9] 연봉이 2500, 3500, 7000이 아니며, 직업이 SA_REP, ST_CLERK인 사원 조회
-- 전체 정보 조회
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );


-- [문제10] '2008-02-20' ~ '2008-05-01' 사이에 고용된 사원들의 LAST_NAME,EMPLOYEE_ID,HIRE_DATE
-- 조회, HIRE_DATE 의 내림차순으로 정렬
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2008-02-20' AND '2008-05-01'
ORDER BY
    hire_date DESC;


-- [문제11] '2004'년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE를 조회하여
-- 입사일 기준으로 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2004-01-01'
    AND hire_date <= '2004-12-31'
ORDER BY
    hire_date;

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date;
    
    
  
-- [문제12] '2004'년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE를 조회하여
-- 입사일 기준으로 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%' --LIKE로도 가능
ORDER BY
    hire_date;

-- [문제13] LAST_NAME에 U가 포함되는 사원들의 사번 및 LAST_NAME 조회
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%U%';


-- [문제14] LAST_NAME에 네번째 글자가 A인 사원들의 사번 및 LAST_NAME 조회
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '___A%';

-- [문제15] LAST_NAME에 A 혹은 E인 사원들의 사번 및 LAST_NAME 조회
-- LAST_NAME 오름차순 출력
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%A%'
    OR last_name LIKE '%E%'
ORDER BY
    last_name ASC;
    
-- [문제16] LAST_NAME에 A와 E인 사원들의 사번 및 LAST_NAME 조회
-- LAST_NAME 오름차순 출력
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%A%E'
    OR last_name LIKE '%E%A'
ORDER BY
    last_name ASC;

--[문제] 매니저가 없는 사원들의 LAST_NAME,JOB_ID 조회
SELECT
    last_name,
    job_id,
    manager_id
FROM
    employees;

--[문제] ST_CLERK인 JOB_ID를 가진 사원이 없는 부서 ID 조회
-- 단, 부서번호가 NULL인 값은 제외한다.
SELECT
    department_id
FROM
    employees
WHERE
    job_id NOT IN ( 'ST_CLERK' ) -- NOT IN
    AND department_id IS NOT NULL;

--[문제] COMMISION_PCT가 널이 아닌 사원들 중에서 COMMISION = SALARY * COMMISION_PCT를
--구하여, EMPLOYEE_ID,FIRST_NAME,JOB_ID와 함께 출력
SELECT
    employee_id,
    first_name,
    job_id,
    salary * commission_pct AS commison -- COMMISION = SALARY * COMMISION_PCT 이렇게 처리
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
    
-- [문제] FIRST_NAME이 CURTIS인 사람의 FIRST_NAME,LAST_NAME,PHONE_NUMBER,JOB_ID조회
-- 단, JOB_ID의 결과는 소문자로 출력하기
SELECT
    first_name,
    last_name,
    phone_number,
    job_id
FROM
    employees
WHERE
    first_name = 'CURTIS';

-- [문제] 부서번호가 60,70,80,90인 사원들의 EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID
-- JOB_ID 조회하기. 단 JOB_ID가 IT_PROG인 사원의 경우 프로그래머로 변경하여 출력
SELECT
    first_name,
    last_name,
    phone_number,
    replace(job_id, 'IT_PROG', '프로그래머')
FROM
    employees
WHERE
    department_id IN ( 60, 70, 80, 90 );

-- [문제] JOB_ID가 AD_PRESS, PU_CLERK인 사원들의 EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID
-- JOB_ID 조회하기, 단 사원명은 FIRST_NAME과 LAST_NAME을 연결하여 출력
SELECT
    concat(first_name, concat('', last_name)),
    job_id,
    department_id
FROM
    employees
WHERE
    job_id IN ( 'AD_PRESS', 'PU_CLERK' );

SELECT
    employee_id,
    first_name
    || ''
    || last_name,
    job_id,
    department_id
FROM
    employees
WHERE
    job_id IN ( 'AD_PRESS', 'PU_CLERK' );
    
-- [문제] 부서 ID가 80인 사원에 대해서 서로 다른 세율 적용
-- 2000미만 ~ 0%, 4000미만 9%, 6000미만 20%,
-- 8000미만 30%, 10,000미만 40%, 12,000미만 42%,
-- 14,000 미만 44%, 나머지 45%

SELECT
    last_name,
    decode(trunc(salary / 2000), 0, 0.001, 1, 0.09,
           2, 0.20, 3, 0.30, 4,
           0.54, 6, 0.55, 0.45) AS tax_rate
FROM
    employees
WHERE
    department_id = 80;
        
-- [문제] 회사 내의 최대 연봉 및 최소 연봉 차 출력
SELECT
    MAX(salary) - MIN(salary) AS salarydiffer
FROM
    employees;


-- [문제] 매니저로 근무하는 사원들의 총 숫자 출력
SELECT
    COUNT(DISTINCT manager_id) -- distinct 중복제거
FROM
    employees;

-- [문제] 부서별 직원수를 구하여, 부서번호의 오름차순으로 출력
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;

-- [문제] 부서별 급여의 평균 연봉 출력(부서번호별 오름차순)
SELECT
    department_id,
    round(AVG(salary))
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;

-- [문제] 동일한 직업을 가진 사원들의 수 출력
SELECT DISTINCT
    job_id,
    COUNT(employee_id)
FROM
    employees
GROUP BY
    job_id
ORDER BY
    job_id;

--[실습] 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기(employees 셀프조인)


SELECT
    e1.employee_id,
    e1.hire_date AS 내입사일,
    e1.manager_id,
    e2.hire_date AS 매니저입사일
FROM
         employees e1
    JOIN employees e2 ON e1.manager_id = e2.employee_id
WHERE
    e1.hire_date < e2.hire_date
ORDER BY
    e1.employee_id;

--[실습] 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, last_name, department_id, city
-- 출력(employees, departments, locations 테이블 조인)
SELECT
    employee_id,
    last_name,
    d.department_id,
    city
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations   l ON d.location_id = l.location_id
WHERE
    city LIKE 'T%';

--[실습] 위치 ID가 1700인 사원들의 employee_id, last_name, department_id, salary
-- 출력(employees, departments 조인)
SELECT
    employee_id,
    last_name,
    e.department_id,
    salary
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    d.location_id = 1700;

--[실습] 각 부서별 평균 연봉(소수점 2자리까지), 사원 수 조회
-- department_name, location_id, sal_avg, cnt 출력
--(employees, departments 조인)

SELECT
    department_name,
    location_id,
    round(AVG(salary), 2) AS sal_avg,
    COUNT(employee_id)    AS cnt
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
GROUP BY
    department_name,
    location_id;

--[실습] Exeutive 부서에 근무하는 모든 사원들의 department_id, last_name, job_id 출력
--(employees, departments 조인)
SELECT
    e.department_id,
    e.last_name,
    e.job_id
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    d.department_name = 'Executive';

--[실습] 기존의 직업을 여전히 가지고 있는 사원들의 employee_id, job_id 출력
--job_history 내부 조인
select e.employee_id, e.job_id from employees e join job_histroy j ON e.employee_id = j.employee_id
from e.employee_id =
j.employee_id;

--[실습] 각 사원별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이
--department_id, last_name, salary, hire_date 출력
--employees 셀프 조인
SELECT DISTINCT
    e2.department_id,
    e2.last_name,
    e2.salary,
    e2.hire_date
FROM
         employees e1
    JOIN employees e2 ON e1.department_id = e2.department_id
WHERE
        e1.hire_date < e2.hire_date
    AND e1.salary < e2.salary
ORDER BY
    e2.department_id;
    
    
-- index
create table indextbl as select distinct first_name, last_name, hire_date from employees;

select * from indextbl;

select * from indextbl where first_name = 'jack';

create index idx_indexttbl_firstname on indextbl(first_name);



































