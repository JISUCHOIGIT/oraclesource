-- sql 구문은 대소문자를 구분하지 않음(단, 비밀번호는 구별함)
-- scott / TIGER
-- ctrl + f7 : 소문자 -> 대문자 변환 후 sql 키워드 출력(가독성)


-- hr 사용자의 비밀번호 변경

ALTER USER hr IDENTIFIED BY hr
    ACCOUNT UNLOCK; -- rock된 계정 풀림

-- 오라클 데이터베이스 특징
-- 테이블, 인덱스, 뷰... 여러가지 객체가 사용자별로 생성되고 관리
-- 사용자 == 스키마(데이터베이스 구조 범위)

-- 사용자 생성 create IDENTIFIED BY
-- create user 아이디 IDENTIFIED BY 비밀번호;

-- 3/24
create user test1 IDENTIFIED BY 12345;

-- 권한 부여
grant create 권한명 to 사용자
-- user TEST1 lacks CREATE SESSION privilege; logon denied
grant create session to test1;
-- table 생성 권한 부처
grant create table to test1;

-- 롤(여러권한들을 묶어놓은 개념)
-- 여러 권한들을 한꺼번에 줌
-- resource : 시퀀스, table, trigger..객체 생성할 수 있는 권한이 모여 있음
-- connect : create session이 들어 있음
grant resource,connect to test1;


-- 사용자 비밀번호 변경 alter ~ identified by
alter user test1 IDENTIFIED BY 54321;

-- 사용자 삭제 : cmd 창 닫고 삭제
drop user test1 cascade;

-- 수업중 사용할 생성자
create user javadb IDENTIFIED BY 12345;
grant resource,connect to javadb;

-- scott에게 view 생성 권한 부여
grant create view to scott;





