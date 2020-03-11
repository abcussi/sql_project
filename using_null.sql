
select name from teacher
where dept is null

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

select name, coalesce(mobile,  '07986 444 2266')
from teacher

SELECT teacher.name, coalesce(dept.name, 'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

select count(id), count(mobile)
from teacher

select d.name, count(t.id)
from teacher t
right join
dept d
on (t.dept=d.id)
group by d.name

select name, CASE WHEN dept=1 or dept=2 THEN 'Sci'
       ELSE 'Art'
  END 
from teacher

select name, CASE WHEN dept=1 or dept=2 THEN 'Sci'
WHEN dept=3 THEN 'Art'
       ELSE 'None'
  END 
from teacher