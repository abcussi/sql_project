
SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC

SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party

SELECT yr,party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000021'
ORDER BY party,yr

SELECT constituency, party, votes, RANK() OVER (partition BY constituency ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY posn, constituency

select constituency, party from
(SELECT constituency, party, votes, RANK() OVER (partition BY constituency ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY posn, constituency) as temp
where posn=1

select party, count(*) from
(SELECT party, RANK() OVER (partition BY constituency ORDER BY votes DESC) as posn
  FROM ge 
 WHERE LEFT(constituency, 1)='S'
   AND yr  = 2017) as temp
where posn=1
group by party