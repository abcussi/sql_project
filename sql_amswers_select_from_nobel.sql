
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

select yr, subject
from nobel
where winner = 'Albert Einstein'

select winner
from nobel
where yr>=2000 and subject='Peace'

select yr, subject, winner
from nobel
where yr>=1980 and yr <=1989 and subject='Literature'

Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama*/
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')


select winner
from nobel
where winner like 'John%'

select yr, subject, winner
from nobel
where (yr=1980 and subject='Physics')
or (yr=1984 and subject='Chemistry')

select yr, subject, winner
from nobel
where subject not in ('Chemistry','Medicine')
and yr=1980

select yr, subject, winner
from nobel
where (subject='Medicine' and yr<1910)
or (subject='Literature' and yr>=2004)

select * from nobel
where winner = 'PETER GRÜNBERG'

select * from nobel where winner = "EUGENE O'NEILL"

select winner, yr, subject
from nobel
where winner like 'Sir%'
order by yr DESC, winner

select winner, subject 
from (SELECT winner, subject, subject IN ('Physics','Chemistry') as 'last'
  FROM nobel
 WHERE yr=1984) as A
ORDER BY last, subject,winner

select winner, yr, subject 
from ((select winner, yr, subject, 1 as temp
from nobel
where winner like'Sir%' 
order by yr desc
limit 1)
UNION 
(select winner, yr, subject, 2 as temp
from nobel
where winner like 'Sir%'
order by winner)) as C