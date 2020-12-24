--1
SELECT id, title
 FROM movie
 WHERE yr=1962

--2
select yr 
from movie 
where title='Citizen Kane'

--3
select id, title, yr
from movie 
where title like '%Star Trek%'
order by yr

--4
select id
from actor
where name='Glenn Close'

--5
select id
from movie
where title='Casablanca'

--6
select name
from casting join actor on actorid=id
where movieid=11768

--7
select name
from casting join actor on actorid=id
where movieid=(select id from movie where title='Alien')

--8
select title
from movie m join casting on m.id=movieid join actor on actor.id=actorid
where name='Harrison Ford'

--9
select title
from movie m join casting on m.id=movieid join actor on actor.id=actorid
where name='Harrison Ford' and ord <> 1

--10
select title, name
from movie 
join casting on movie.id=movieid 
join actor on actor.id=actorid
where yr=1962 and ord = 1

--11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--12
select title, name
from movie JOIN casting ON movie.id=movieid
        JOIN actor ON actorid=actor.id
where movieid in (select distinct movie.id
from movie JOIN casting ON movie.id=movieid
        JOIN actor ON actorid=actor.id
where name='Julie Andrews')
and ord=1

--13
select name
from actor join casting on actor.id=actorid
where ord=1
group by name
having count(movieid)>=15
order by name

--14
select title, count(actorid)
from movie join casting on movie.id=movieid
where yr=1978
group by movieid, title
order by count(actorid) desc, title

--15
select name 
from actor join casting on actor.id=actorid
where name <> 'Art Garfunkel' and movieid in (select movieid
from casting
where actorid=(select id from actor where name='Art Garfunkel'))
