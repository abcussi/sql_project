
SELECT g.matchid, g.player 
FROM goal g 
  WHERE g.teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game
where id=1012

SELECT go.player, go.teamid ,ga.stadium, ga.mdate
  FROM game ga JOIN goal go ON (ga.id=go.matchid)
where go.teamid='GER'

select ga.team1, ga.team2, go.player
from game ga
 join goal go
 on (ga.id = go.matchid)
where go.player like 'Mario%'

SELECT go.player, go.teamid, et.coach, go.gtime 
  FROM goal go
join eteam et
on (go.teamid = et.id)
 WHERE go.gtime<=10

select ga.mdate, et.teamname
from game ga
join eteam et
on (ga.team1=et.id)
where et.coach='Fernando Santos'

select go.player
from goal go
join game ga
on (go.matchid=ga.id)
where ga.stadium = 'National Stadium, Warsaw'

SELECT go.player
  FROM game ga JOIN goal go ON (go.matchid = ga.id) 
    WHERE go.teamid<>'GER' and (ga.team1='GER' OR ga.team2='GER')
group by go.player
order by ga.id

SELECT et.teamname, count(go.player)
  FROM eteam et JOIN goal go ON et.id=go.teamid
 group by et.teamname

select ga.stadium, count(go.player)
from game ga
join goal go
on ( ga.id= go.matchid)
group by ga.stadium

SELECT go.matchid, ga.mdate, count(go.player)
  FROM game ga JOIN goal go ON go.matchid = ga.id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by go.matchid

select go.matchid, ga.mdate, count(go.player)
from game ga
join goal go
on (ga.id=go.matchid)
where go.teamid='GER'
group by go.matchid

select A.mdate, A.team1, A.score1, B.team2, B.score2
from (select ga.id, ga.mdate, ga.team1, count(go.player) as 'score1'
from game ga
left join goal go
on (ga.id=go.matchid and ga.team1=go.teamid)
group by ga.id
) as A
join 
(select ga.id, ga.mdate, ga.team2, count(go.player) as 'score2'
from game ga
left join goal go
on (ga.id=go.matchid and ga.team2=go.teamid)
group by ga.id
) as B
on (A.id=B.id)
order by concat(A.mdate,''), A.id, A.team1, B.team2