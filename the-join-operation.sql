--1
SELECT matchid, player 
FROM goal 
  WHERE teamid = 'GER'

--2
SELECT id,stadium,team1,team2
  FROM game
where id=1012

--3
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
where teamid = 'GER'

--4
select team1,team2,player
from game JOIN goal ON (id=matchid)
where player like 'Mario%'

--5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10

--6
select mdate, teamname
from game join eteam ON (team1=eteam.id)
where coach='Fernando Santos'

--7
select player
from goal join game on matchid=id
where stadium='National Stadium, Warsaw'

--8
SELECT distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' and teamid=team2) or (team2='GER' and teamid=team1)

--9
SELECT teamname, count(matchid)
  FROM eteam JOIN goal ON id=teamid
 group BY teamname

--10
select stadium, count(*)
from game join goal on id=matchid
group by stadium

--11
SELECT matchid,mdate, count(*)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid, mdate

--12
select matchid, mdate, count(*)
from game join goal on matchid=id
where (team1='GER' or team2='GER') and teamid='GER'
group by matchid, mdate
having count(*)>0

--13
SELECT mdate, team1,
  sum(case when teamid=team1 then 1 else 0 end) as score1,
  team2,
  sum(case when teamid=team2 then 1 else 0 end) as score2
from game left join goal ON id = matchid
group by mdate, matchid, team1, team2
order by mdate, matchid, team1, team2;
