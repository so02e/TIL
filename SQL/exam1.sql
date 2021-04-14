SELECT * FROM emp;

SELECT empno, ename FROM emp WHERE empno = 7839;

SELECT * FROM emp WHERE sal > 2000;

SELECT hiredate, date_FORMAT(hiredate, '%Y') FROM emp;

SELECT * FROM emp WHERE date_FORMAT(hiredate, '%Y') = '1982';

SELECT CURDATE();

SELECT CURTIME();

SELECT NOW();

SELECT DATE_FORMAT(NOW(), '%y%m%d');

SELECT DATE_FORMAT(NOW(), '%y-%m-%d');

SELECT DATE_FORMAT(NOW(), '%y년 %m월 %d일');

SELECT DATE_FORMAT(NOW(), '%Y');

SELECT DATE_FORMAT(NOW(), '%m');

SELECT DATE_FORMAT(NOW(), '%d');

SELECT DATE_FORMAT(NOW(), '%H:%M');

SELECT DATE_FORMAT(NOW(), '%H:%i:%S');
-- AWS 서버 시간이 출력되기 때문에 현재시각과는 차이가 있게 출력된다.

