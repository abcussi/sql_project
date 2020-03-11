
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia'limit 1)

select name
from world
where continent='Europe' 
and gdp/population > (select gdp/population 
from world 
where name ='United Kingdom')

select name, continent
from world where continent in (select continent
from world where name in ('Argentina','Australia'))
order by name

select name, population 
from world
where population > (select population
from world
where name='Canada' limit 1)
and population < (select population
from world
where name='Poland' limit 1)

select name, 
concat(round(population*100/(select population
from world
where name='Germany' limit 1), 0), '%')
from world
where continent='Europe'

select name
from world
where gdp is not null
and gdp > ALL(select gdp
from world 
where
gdp is not null
 and continent='Europe')

SELECT x.continent, x.name, x.area FROM world x
  WHERE x.area >= ALL
    (SELECT y.area FROM world y
        WHERE y.continent=x.continent)
order by x.name

select x.continent, x.name
from world x
where x.name = (select y.name 
from world y
where y.continent=x.continent
order by name 
limit 1)

select name, continent, population
from world
where continent in 
(
select x.continent
from world x
where (
select count(*)
from world y
where y.continent=x.continent
and y.population>25000000
)=0
)

select x.name, x.continent
from world x
where (
select count(*)
from world y
where y.name<>x.name
and y.continent=x.continent
and y.population*3 >=x.population limit 1
)=0