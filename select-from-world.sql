--1
SELECT name, continent, population FROM world

--2
SELECT name
  FROM world
 WHERE population > 200000000

--3
select name, GDP/population 
from world
where population > 200000000

--4
select name, population/1000000
from world 
where continent='South America'

--5
select name, population
from world
where name in ('France', 'Germany', 'Italy')

--6
select name
from world
where name like '%United%'

--7
select name, population, area
from world
where area > 3000000 or population > 250000000

--8
select name, population, area
from world
where (area > 3000000 and population <= 250000000) 
or (area <= 3000000 and population > 250000000)

--9
select name, round(population/1000000,2) as population, round(GDP/1000000000,2) as gdp
from world
where continent='South America'

--10
select name, round(GDP/population, -3)
from world
where GDP > 1000000000000

--11
SELECT name, capital
  FROM world
 WHERE length(name) = length(capital)

--12
select name, capital
from world
where name <> capital and left(name, 1) = left(capital, 1)

--13
SELECT name
   FROM world
WHERE (lower(name) LIKE '%a%' 
       and lower(name) LIKE '%e%' 
       and lower(name) LIKE '%i%' 
       and lower(name) LIKE '%o%' 
       and lower(name) LIKE '%u%')
  AND replace(lower(name), ' ', '') = lower(name)
