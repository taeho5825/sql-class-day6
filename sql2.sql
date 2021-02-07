DROP DATABASE s1;

CREATE DATABASE s1;

USE s1;

CREATE TABLE t_order(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userNo INT(5) NOT NULL,
productNo INT(5) NOT NULL
);

CREATE TABLE t_user(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userId CHAR(200) NOT NULL,
userPw CHAR(200) NOT NULL,
userName CHAR(50) NOT NULL,
addr CHAR(200) NOT NULL
);

CREATE TABLE t_product(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
pname CHAR(100) NOT NULL,
price INT(10) NOT NULL
);


INSERT INTO t_product
SET pName = '운동화',
price = 1000000;

INSERT INTO t_product
SET pName = '코트',
price = 100000;

INSERT INTO t_product
SET pName = '반바지',
price = 30000;

INSERT INTO t_product
SET pName = '스커트',
price = 15000;

INSERT INTO t_product
SET pName = '코트',
price = 100000;

INSERT INTO t_product
SET pName = '티셔츠',
price = 9000;

INSERT INTO t_product
SET pName = '운동화',
price = 200000;

INSERT INTO t_product
SET pName = '모자',
price = 30000;



INSERT INTO t_user
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
addr = '런던';

INSERT INTO t_user
SET userId = 'user2',
userPw = 'pass2',
userName = '설현',
addr = '서울';

INSERT INTO t_user
SET userId = 'user3',
userPw = 'pass3',
userName = '원빈',
addr = '대전';

INSERT INTO t_user
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
addr = '대구';

INSERT INTO t_user
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
addr = '부산';

INSERT INTO t_user
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
addr = '울산';


INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 2,
productNo = 2;

INSERT INTO t_order
SET userNo = 3,
productNo = 3;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 5,
productNo = 5;

INSERT INTO t_order
SET userNo = 6,
productNo = 6;

INSERT INTO t_order
SET userNo = 6,
productNo = 7;

INSERT INTO t_order
SET userNo = 1,
productNo = 5;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 5,
productNo = 8;

SELECT * FROM t_order;
SELECT * FROM t_user;
SELECT * FROM t_product;

# 1. 손흥민의 주문 개수는? 3
SELECT * 
FROM t_order;
DESC t_user;

SELECT *
FROM t_order
WHERE userNo = 1;

SELECT id
FROM t_user
WHERE userName = '손흥민';

# 2. 손흥민이 산 상품은? 운동화, 코트
SELECT *
FROM t_order
WHERE userNo = 1;

SELECT *
FROM t_product;

DESC t_product;

SELECT *
FROM t_product
WHERE id = 1 OR id = 5;

# 3. 스커트를 산 사람은? 송혜교
DESC t_product;

SELECT id
FROM t_product
WHERE pname = '스커트';

SELECT userNo
FROM t_order
WHERE productNo = 4;

SELECT userName
FROM t_user
WHERE id = 4;

# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? 손흥민(user1) 3개
SELECT *
FROM t_order
ORDER BY userNo;

SELECT userId, userName
FROM t_user
WHERE id = 1;

# 5. 소지섭이 사용한 총 금액은? 130,000
SELECT id
FROM t_user
WHERE userName = '소지섭';

SELECT *
FROM t_order
WHERE userNo = 5;

SELECT price
FROM t_product
WHERE id = 5 OR id = 8;


# 테이블 2개를 합쳐서 보는 방법 : JOIN
SELECT *
FROM t_user;

# 기본 JOIN. 카르테시언 곱 
SELECT *
FROM t_order
INNER JOIN t_user
ON t_order.userNo = t_user.id;

SELECT *
FROM t_order
INNER JOIN t_user
ON t_order.userNo = t_user.id
INNER JOIN t_product
ON t_order.productNo = t_product.id;

# 1. 손흥민의 주문 개수는? 3
#집계함수

SELECT COUNT(*)
FROM t_order
INNER JOIN t_user
ON t_order.userNo = t_user.id
WHERE t_user.userName = '손흥민';

# 2. 손흥민이 산 상품은? 운동화, 코트 dintinct - 중복행 제거
SELECT *
FROM t_user;

SELECT p.*
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
WHERE u.userName = '손흥민'
ORDER BY p.id;

# 3. 스커트를 산 사람은? 송혜교 GROUP BY - 중복행 제거
SELECT u.userName
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
WHERE p.pname = '스커트'
GROUP BY u.userName;

# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? max(), min()
SELECT u.userid, u.userName, COUNT(*) cnt
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
GROUP BY userName
ORDER BY cnt DESC
LIMIT 1;

# 5. 소지섭이 사용한 총 금액은? count() - 행의 개수, 행의 값을 다 더해주는 거 - sum()
SELECT SUM(p.price)
FROM t_order o 
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
WHERE u.userName = '소지섭';

#합구하기
SELECT SUM(price)
FROM t_product;

#최댓값 구하기
SELECT MAX(price)
FROM t_product;

#최솟값 구하기
SELECT MIN(price)
FROM t_product;

#평균값 구하기
SELECT AVG(price)
FROM t_product;

#--------------------------------------------------------
DROP DATABASE IF EXISTS scott;

CREATE DATABASE scott;

USE scott;

CREATE TABLE DEPT (
    DEPTNO DECIMAL(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13),
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP (
    EMPNO DECIMAL(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR DECIMAL(4),
    HIREDATE DATE,
    SAL DECIMAL(7,2),
    COMM DECIMAL(7,2),
    DEPTNO DECIMAL(2),
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE ( 
    GRADE TINYINT,
    LOSAL SMALLINT,
    HISAL SMALLINT 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

SELECT *
FROM emp; # 직원/사원 테이블 -empno : 사번 ename : 사원명, 
            # job : 직책, MGR: 상사의 사번, HIREDATE : 입사일
            # sal : 급여, comm : 수당(커미션), deptno : 부서번호

SELECT *
FROM dept; # 부서 테이블 deptno : 부서번호, dname : 부서명, 
            #loc : 부서위치

SELECT *
FROM salgrade; # 급여 테이블 grade : 급여등급, losal : 
                #등급별 최저 급여 라인, hisal 등급별 최고 급여 라인

#1. 사원 테이블의 모든 레코드를 조회하시오.
SELECT *
FROM emp;

#2. 사원명과 입사일을 조회하시오.
SELECT ENAME, HIREDATE
FROM emp;

#3. 사원번호와 이름을 조회하시오.
SELECT EMPNO, ENAME
FROM emp;

#4. 사원테이블에 있는 직책의 목록을 조회하시오. (hint : distinct, group by)
#clerk salesman manager analyst president
SELECT DISTINCT JOB
FROM emp; 
 

#5. 총 사원수를 구하시오. (hint : count) 14
SELECT COUNT(ENAME)
FROM emp;

#6. 부서번호가 10인 사원을 조회하시오. ACCOUNTING
SELECT *
FROM dept
WHERE DEPTNO = 10;

#7. 월급여가 2500이상 되는 사원을 조회하시오.
#JONES BLAKE SCOTT KING FORD
SELECT *
FROM emp
WHERE SAL >= 2500;

#8. 이름이 'KING'인 사원을 조회하시오.
SELECT *
FROM emp
WHERE ENAME = 'KING';

#9. 사원들 중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회하시오. (hint : like)
# SMITH : 7369 SCOTT : 7788
SELECT ENAME, EMPNO
FROM emp
WHERE ENAME LIKE 'S%';

#10. 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오. (hint : like)
# SMITH : 7369, MARTIN : 7654, SCOTT : 7788, TURNER : 7844
SELECT ENAME, EMPNO
FROM emp
WHERE ENAME LIKE '%T%';

#11. 커미션이 300, 500, 1400 인 사원의 사번,이름,커미션을 조회하시오. (hint : OR, in )
#ALLEN : 300, WARD : 500, MARTIN : 1400
SELECT ENAME, EMPNO, COMM
FROM emp
WHERE COMM = 300 OR COMM = 500 OR COMM = 1400;

#12. 월급여가 1200 에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오. (hint : AND, between)
#MARTIN 7654 1400
SELECT ENAME, EMPNO, COMM
FROM emp
WHERE COMM >= 1200 AND COMM <= 3500;

#13. 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오. 
# BLAKE 7698 MANAGER 30
SELECT ENAME, EMPNO, JOB, DEPTNO
FROM emp
WHERE JOB = 'MANAGER' AND DEPTNO = 30;

#14. 부서번호가 30인 아닌 사원의 사번,이름,부서번호를 조회하시오. (not)
SELECT ENAME, EMPNO, DEPTNO
FROM emp
WHERE DEPTNO != 30;

#15. 커미션이 300, 500, 1400 이 모두 아닌 사원의 사번,이름,커미션을 조회하시오. (hint : not in)
SELECT ENAME, EMPNO, COMM
FROM emp
WHERE COMM NOT IN(300, 500, 1400);

#16. 이름에 S가 포함되지 않는 사원의 사번,이름을 조회하시오. (hint : not like)
SELECT ENAME, EMPNO
FROM emp
WHERE ENAME NOT LIKE('%S%');

#17. 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회하시오. (hint : not, between)
SELECT ENAME, EMPNO, COMM
FROM emp
WHERE COMM < 1200 OR COMM > 3700;

#18. 직속상사가 NULL 인 사원의 이름과 직급을 조회하시오. (hint : is null, is not null)
SELECT ENAME, JOB
FROM emp
WHERE MGR IS NULL;

#19. 부서별 평균월급여를 구하는 쿼리 (hint : group by, avg())
SELECT deptno, AVG(sal) `avg`
FROM emp
GROUP BY deptno;

#20. 부서별 전체 사원수와 커미션을 받는 사원들의 수를 구하는 쿼리 (hint : group by, count())
SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno;

SELECT deptno, COUNT(*)
FROM emp
WHERE comm IS NOT NULL AND comm != 0;
GROUP BY deptno;

# -> 한번에 null과 0값 구분
SELECT deptno, COUNT(*), COUNT(IF(comm = 0, NULL, comm)) ccnt
FROM emp
GROUP BY deptno;

#21. 부서별 최대 급여와 최소 급여를 구하는 쿼리 (hint : group by, min(), max())
SELECT MAX(sal)
FROM emp;

SELECT MIN(sal)
FROM emp;

#22. 부서별로 급여 평균 (단, 부서별 급여 평균이 2000 이상만) (hint : group by, having)
SELECT deptno, AVG(sal) `avg`
FROM emp
GROUP BY deptno
HAVING `avg` >= 2000;

#23. 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 구하라. 단, 평균값이 2000 이상인 레코드만 구하라. (hint : group by, having)
SELECT deptno, AVG(sal) sal_avg
FROM emp
WHERE sal >= 1000
GROUP BY deptno
HAVING sal_avg >= 2000;

#24. 사원명과 부서명을 조회하시오. (hint : inner join)


#25. 이름,월급여,월급여등급을 조회하시오. (hint : inner join, between)
SELECT ename, sal, grade, losal, hisal
FROM emp
INNER JOIN salgrade
ON sal >= losal AND sal < hisal;

SELECT *
FROM salgrade;

#26. 이름,부서명,월급여등급을 조회하시오. 


#27. 이름,직속상사이름을 조회하시오. (hint : self join)
SELECT e1.ename, e2.ename
FROM emp e1
INNER JOIN emp e2
ON e1.mgr = e2.empno;

# -> 확인 사항
SELECT ename 
FROM emp
WHERE empno = 7566;

#28. 이름,직속상사이름을 조회하시오.(단 직속 상사가 없는 사람도 직속상사 결과가 null값으로 나와야 함) (hint : outer join)
###외부OUTER 조인. A LEFT JOIN B는 조인 조건에 만족하지 못하더라도 왼쪽 테이블 A의 행을 나타내고 싶을 때 사용한다. 반대로 A RIGHT JOIN B는 조인 조건에 만족하지 못하더라도 오른쪽 테이블 B의 행을 나타내고 싶을 때

SELECT e1.ename, e2.ename
FROM emp e1
LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno;


#---------------------------------------------------
#사원들 중 이름이 s로 시작하는 사원의 사원번호와 이름을 조회하시오 (hint like)
SELECT *
FROM emp
WHERE ename LIKE = '%S%';

#커미션이 300, 500, 1400 인 사원의 사번, 이름, 커미션을 조회하시오(hint : OR, in)
SELECT *
FROM emp
WHERE comm = 300 OR comm = 500 OR comm = 1400;

SELECT *
FROM emp
WHERE comm IN (300, 500, 1400);

#월 급여가 1200에서 3500 사이의 사원의 사번, 이름, 월급여를 조회하시오(hint : AND, between)
SELECT *
FROM emp
WHERE sal > 1200 AND sal < 3500;

SELECT *
FROM emp
WHERE sal BETWEEN 1200 AND 3500;

#커미션이 300, 500, 1400 이 모두 아닌 사원의 사번, 이름, 커미션을 조회하시오(hint : not in)
SELECT *
FROM emp
WHERE comm != 300 AND comm != 500 AND comm != 1400;

SELECT *
FROM emp
WHERE NOT (comm = 300 OR comm = 500 OR comm = 1400);

SELECT *
FROM emp
WHERE NOT comm IN (300, 500, 1400);

#직속상사가 null 인 사원의 이름과 직급을 조회하시오(hint : is null, is not null)
SELECT *
FROM emp
WHERE mgr IS NULL;

SELECT COUNT(comm)
FROM emp;

#부서별로 급여 평균(단, 부서별 급여 평균이 2000 이상만) (hint: group by, having)
SELECT deptno, AVG(sal) `avg`
FROM emp
GROUP BY deptno
HAVING `avg` >= 2000;

# 사원명 'JONES'가 속한 부서명을 조회하시오. 단일값, 행단위 1-n
SELECT *
FROM emp
WHERE ename = 'jones';

SELECT *
FROM dept
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'jones');

# 10번 부서에서 근무하는 사원의 이름과 10번 부서의 부서명을 조회하시오(hint: sub query)

SELECT ename
    FROM(
        SELECT ename, deptno
        FROM emp
        WHERE deptno = 10
    ) a;
    
SELECT ename, deptno
FROM emp
WHERE deptno = 10;

# --------------------------------- 2번째 문제 ----------------------------

#29. 이름,부서명을 조회하시오.단, 사원테이블에 부서번호가 40에 속한 사원이 없지만 부서번호 40인 부서명도 출력되도록 하시오. (hint : outer join)

#30. 부서번호가 30번인 사원들의 이름, 직급, 부서번호, 부서위치를 조회하시오. (hint : outer join)

#31. DALLAS에서 근무하는 사원의 이름,직급,부서번호,부서명을 조회하시오.

#32. 이름에 A 가 들어가는 사원의 이름,부서명을 조회하시오.

#33. 이름, 직급, 월급여, 월급여등급을 조회하시오.

#34. ALLEN과 같은 부서에 근무하는 사원의 이름, 부서번호를 조회하시오.

#서브 쿼리는 SELECT 문 안에서 ()로 둘러싸인 SELECT 문을 말하며 쿼리문의 결과를 메인 쿼리로 전달하기 위해 사용된다.
#사원명 'JONES'가 속한 부서명을 조회하시오.
#부서번호를 알아내기 위한 쿼리가 서브 쿼리로 사용되고, 이 서브쿼리는 단 하나의 결과값을 얻기 때문에 단일 행 서브 쿼리라 한다.

#35. 10번 부서에서 근무하는 사원의 이름과 10번 부서의 부서명을 조회하시오. (hint : sub query)

#36. 평균 월급여보다 더 많은 월급여를 받은 사원의 사원번호,이름,월급여 조회하시오. (hint : sub query)

#37. 부서번호가 10인 사원중에서 최대급여를 받는 사원과 동일한 급여를 받는 사원의 사원번호, 이름을 조회하시오. (hint : sub query)

