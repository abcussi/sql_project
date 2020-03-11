
SELECT SUM(population)
FROM world

select continent
from world
group by continent

select sum(gdp)
from world
where continent='Africa'

select SUM(1)
from world
where area>=1000000

select SUM(population)
from world
where name in ('Estonia', 'Latvia', 'Lithuania')

select continent, SUM(1)
from world
group by continent

select continent, sum(1)
from world
where population >=10000000
group by continent

select continent
from world
group by continent
having sum(population)>=100000000