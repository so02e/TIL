SELECT * 
FROM edu04db.emp;



SELECT *
FROM edu04db.emp
ORDER BY sal;



SELECT *
FROM edu04db.emp
ORDER BY sal DESC;



SELECT * 
FROM edu04db.emp
ORDER BY hiredate;



SELECT * 
FROM edu04db.emp
ORDER BY hiredate DESC;




SELECT * 
FROM edu04db.emp
WHERE deptno = 30;



SELECT ename, sal, deptno 
FROM edu04db.emp
WHERE empno = 7900;




SELECT ename, sal, deptno 
FROM edu04db.emp
WHERE ename = 'JONES';




SELECT ename, sal, deptno 
FROM edu04db.emp
WHERE ename = 'jones';




SELECT ename, sal, deptno 
FROM edu04db.emp
WHERE ename = 'J%';



SELECT ename, sal, deptno 
FROM edu04db.emp
WHERE ename like 'J%';




SELECT ename, sal, deptno 
FROM edu04db.emp
WHERE ename LIKE '%O%';




SELECT ename, sal, deptno 
FROM edu04db.emp
WHERE ename LIKE '%O__';





SELECT ename, sal, hiredate 
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981';




SELECT ename, sal, date_format(hiredate, '%Y') 
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981';





SELECT ename 직원명, sal 급여, date_format(hiredate, '%Y') "입사 년도"
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981';




SELECT ename 직원명, job 직무, date_format(hiredate, '%Y') "입사 년도"
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981'


AND job = 'manager';


SELECT ename 직원명, job 직무, date_format(hiredate, '%Y') "입사 년도", deptno "부서 번호"
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981'
AND job = 'manager'
AND deptno = 20;




SELECT *
FROM edu04db.emp
WHERE deptno = 10
OR deptno = 20;




SELECT *
FROM edu04db.emp
WHERE deptno IN (10,20);




SELECT *
FROM edu04db.emp
WHERE sal >= 2000
AND sal <= 3000;



SELECT *
FROM edu04db.emp
WHERE sal BETWEEN 2000 AND 3000;




SELECT deptno, SUM(sal) 
FROM edu04db.emp
GROUP BY deptno;




SELECT deptno, SUM(sal) 
FROM edu04db.emp
GROUP BY deptno
HAVING SUM(sal) > 10000;




SELECT deptno "부서번호", SUM(sal) "부서별 급여합"
FROM edu04db.emp
GROUP BY deptno;




SELECT deptno "부서번호", MAX(sal) "부서별 최대급여"
FROM edu04db.emp
GROUP BY deptno;




SELECT deptno "부서번호", job 직무, MAX(sal) "부서별 직무별 급여 평균"
FROM edu04db.emp
GROUP BY deptno, job;



SELECT job, COUNT(*)
FROM edu04db.emp
WHERE deptno = 30
GROUP BY job;




SELECT job, COUNT(*)
FROM edu04db.emp
WHERE deptno = 30
GROUP BY job
HAVING COUNT(*) > 2;




SELECT ename, sal 
FROM edu04db.emp
ORDER BY sal DESC;

 
 

SELECT ename, concat(sal, '원') 
FROM edu04db.emp
ORDER BY sal DESC;




SELECT ename, concat(format(sal, 0), '원') 
FROM edu04db.emp
ORDER BY sal DESC;



SELECT job
FROM edu04db.emp;



SELECT distinct job
FROM edu04db.emp;



SELECT ename
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981';


SELECT ename
FROM edu04db.emp
WHERE deptno = 10;



SELECT ename
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981'
UNION all
select ename
FROM edu04db.emp
WHERE deptno = 10;



SELECT ename
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981'
UNION
SELECT ename
FROM edu04db.emp
WHERE deptno = 10;



SELECT ename
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981'
INTERSECT
SELECT ename
FROM edu04db.emp
WHERE deptno = 10;



SELECT ename
FROM edu04db.emp
WHERE date_format(hiredate, '%Y') = '1981'
EXCEPT
SELECT ename
FROM edu04db.emp
WHERE deptno = 10;



SELECT ename, '근무중'
FROM edu04db.emp;



SELECT ename, '근무중', 100, NOW()
FROM edu04db.emp;




SELECT ename, sal, sal*12
FROM edu04db.emp;



SELECT *
FROM edu04db.emp
ORDER BY sal DESC
LIMIT 1;



SELECT *
FROM edu04db.emp
ORDER BY sal DESC
LIMIT 7;




SELECT *
FROM edu04db.emp
ORDER BY sal DESC
LIMIT 5 OFFSET 0; 




SELECT *
FROM edu04db.emp
ORDER BY sal DESC
LIMIT 3 OFFSET 3; 