
select count(*)
from stops

select id
from stops
where name='Craiglockhart'

select s.id, s.name 
from route r
join stops s
on (r.stop=s.id)
where r.company='LRT'
and r.num='4'

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*)>1

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and 
stopb.name='London Road'

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 and b.stop=137
group by a.company, a.num

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
join stops sa
on (a.stop=sa.id)
join stops sb
on (b.stop=sb.id)
WHERE sa.name='Craiglockhart' and sb.name='Tollcross'
group by a.company, a.num

SELECT sa.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
join stops sa
on (a.stop=sa.id)
join stops sb
on (b.stop=sb.id)
WHERE sb.name='Craiglockhart'
order by a.num, a.pos

select ra.num, ra.company, ra.name2, rb.num, rb.company from
(SELECT sa.name, a.company, a.num, b.stop, sb.name as 'name2'
FROM route a JOIN route b ON
  (select a.company=b.company AND a.num=b.num)
join stops sa
on (a.stop=sa.id)
join stops sb
on (b.stop=sb.id)
WHERE sa.name='Craiglockhart'
order by a.num, a.pos) as ra
join
(SELECT sa.name, a.company, a.num, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
join stops sa
on (a.stop=sa.id)
join stops sb
on (b.stop=sb.id)
WHERE sa.name='Lochend'
order by a.num, a.pos) as rb
on (ra.stop=rb.stop)
order by ra.num, ra.name2, rb.num