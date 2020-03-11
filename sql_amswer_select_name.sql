
SELECT name FROM world
  WHERE name LIKE 'Y%'

SELECT name FROM world
  WHERE name LIKE '%y'

SELECT name FROM world
  WHERE name LIKE '%x%'

SELECT name FROM world
  WHERE name LIKE '%land'

SELECT name FROM world
  WHERE name LIKE 'c%ia'

SELECT name FROM world
  WHERE name LIKE '%oo%'

SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

SELECT name FROM world
 WHERE name LIKE '%o__o%'

SELECT name FROM world
 WHERE name LIKE '____'

SELECT name
  FROM world
 WHERE name = capital

SELECT name
  FROM world
 WHERE capital = concat(name, ' City')

SELECT capital, name
  FROM world
 WHERE capital like concat('%', name, '%')

SELECT capital, name
  FROM world
 WHERE capital like concat('%', name, '%') && capital <> name

select name, REPLACE(capital, name, '')
FROM world
 WHERE capital like concat('%', name, '%') && capital <> name