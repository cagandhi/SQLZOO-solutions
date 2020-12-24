--1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--2
select name
from world
where continent = 'Europe'
and (gdp/population) > (select gdp/population from world where name = 'United Kingdom')

--3
select name, continent
from world
where continent in (select continent from world where name = 'Argentina' or name = 'Australia')
order by name

--4
select name, population
from world
where population > (select population from world where name = 'Canada') and population < (select population from world where name = 'Poland')

--5
select name, concat(round(population/(select population from world where name = 'Germany')*100), '%') as percentage
from world
where continent = 'Europe'

--6
SELECT name
  FROM world
 WHERE gdp > (SELECT max(gdp)
                           FROM world
                          WHERE gdp > 0 and continent = 'Europe')

--7
SELECT continent, name, area FROM world x
  WHERE area >= 
    (SELECT max(area) FROM world y
        WHERE y.continent=x.continent
          AND area>0)

--8
select continent, min(name)
from world
group by continent

--9
select name, continent, population
from world
where continent in (select continent from world group by continent having max(population)<=25000000)

--10
select name, continent
from world w1
where population > all(select 3*population from world w2 where w1.continent = w2.continent and w1.name <> w2.name)
