--1
select count(distinct id) 
from stops

--2
select id 
from stops 
where name='Craiglockhart'

--3
select id, name
from stops join route on id=stop
where company='LRT' and num=4
order by pos

--4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*)>1

--5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149

--6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name='London Road'

--7
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.id=115 and stopb.id=137

--8
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name='Tollcross'

--9
SELECT distinct stopb.name, b.company, b.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'

--10
SELECT a.num, a.company, stopa.name, b.num, b.company
FROM route a
JOIN route b ON (a.num = b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart'
AND stopb.name = 'Lochend'
