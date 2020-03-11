
SELECT id, title
 FROM movie
 WHERE yr=1962

select yr
from movie 
where title='Citizen Kane'

select id, title, yr
from movie
where title like '%Star Trek%'
order by yr

select id
from actor
where name='Glenn Close'

select id
from movie
where title='Casablanca'

select a.name
from actor a
join casting c
on (c.actorid=a.id)
where c.movieid=11768

select a.name
from actor a
join casting c
on (c.actorid=a.id)
where c.movieid=(select id
from movie
where title='Alien')

select m.title
from movie m
join casting c
on (m.id=c.movieid)
join actor a
on (c.actorid=a.id)
where a.name='Harrison Ford'

select m.title
from movie m
join casting c
on (m.id=c.movieid)
join actor a
on (c.actorid=a.id)
where a.name='Harrison Ford'
and c.ord<>1

select m.title, a.name
from movie m
join casting c
on (m.id=c.movieid)
join actor a
on (c.actorid=a.id)
where m.yr=1962 and c.ord=1

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

select m.title, a.name
from movie m
join casting c
on (m.id=c.movieid)
join actor a
on (c.actorid=a.id)
where m.id in ( 
select m.id
from movie m
join casting c
on (m.id=c.movieid)
join actor a
on (c.actorid=a.id)
where a.name='Julie Andrews'
)
and c.ord=1

select a.name
from actor a
join casting c
on (a.id=c.actorid)
where c.ord=1
group by a.name
having count(c.ord)>=15
order by a.name

select m.title, count(c.actorid)
from movie m
join casting c
on (m.id=c.movieid)
where yr=1978
group by m.title
order by count(c.actorid) desc, title

select a.name
from movie m
join casting c
on (m.id=c.movieid)
join actor a
on (c.actorid=a.id)
where m.id in (
select m.id
from movie m
join casting c
on (m.id=c.movieid)
join actor a
on (c.actorid=a.id)
where a.name='Art Garfunkel'
)
and a.name<>'Art Garfunkel'