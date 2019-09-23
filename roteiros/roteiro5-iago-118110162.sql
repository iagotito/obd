-- Q1
SELECT COUNT (e)
FROM employee AS e
WHERE e.sex = 'F';

-- Q2
SELECT AVG (e.salary)
FROM employee AS e 
WHERE e.sex = 'M' AND e.address LIKE '%TX';

-- Q3
SELECT e.superssn AS ssn_supervisor, COUNT (e.ssn) AS qtd_supervisionados
FROM employee AS e 
GROUP BY e.superssn
ORDER BY qtd_supervisionados;

-- Q4
SELECT s.fname AS nome_supervisor, COUNT(*) AS qtd_supervisionados
FROM employee AS s INNER JOIN employee AS e ON s.ssn = e.superssn
GROUP BY s.fname
ORDER BY qtd_supervisionados;

-- Q5
SELECT s.fname AS nome_supervisor, COUNT(*) AS qtd_supervisionados
FROM employee AS s RIGHT OUTER JOIN employee AS e ON s.ssn = e.superssn
GROUP BY s.fname
ORDER BY qtd_supervisionados;

-- Q6
SELECT MIN (qtd) AS qtd
FROM (SELECT COUNT (w.essn) AS qtd
      FROM works_on AS w 
      GROUP BY w.pno) AS qtds;

-- Q7


-- Q8
SELECT w.pno AS num_proj, AVG (e.salary) AS media_sal
FROM employee AS e, works_on AS w 
WHERE w.essn = e.ssn
GROUP BY num_proj;

-- Q9
SELECT w.pno AS num_proj, p.pname AS proj_nome, AVG (e.salary) AS media_sal
FROM employee AS e, works_on AS w, project AS p
WHERE w.essn = e.ssn AND p.pnumber = w.pno
GROUP BY num_proj, proj_nome;
