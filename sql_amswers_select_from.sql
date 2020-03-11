
SELECT name, continent, population FROM world

SELECT name FROM world
WHERE population >= 200000000

select name, gdp/population as 'per capita GDP'
from world
where population >= 200000000

select name, population/1000000 as 'populations'
from world
where continent = 'South America'

select name, population
from world
where name in ('France','Germany','Italy')

select name
from world
where name like '%United%'

select name, population, area
from world
where population > 250000000 or area > 3000000

select name, population, area
from world
where population > 250000000 xor area > 3000000

select name, ROUND(population/1000000,2) as 'population', ROUND(gdp/1000000000, 2) as 'gdp'
from world
where continent='South America' 

select name, ROUND((gdp/population)/1000,0)*1000
from world
where gdp >=1000000000000

SELECT name, capital
  FROM world
WHERE LENGTH(name) = LENGTH(capital)

SELECT name, capital
FROM world
where LEFT(name,1) = LEFT(capital,1) and name <> capital

SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'