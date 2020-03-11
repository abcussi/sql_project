
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score>=100

SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
AND score<50

SELECT subject ,sum(response)
  FROM nss
 WHERE question='Q22'
   AND subject in ('(8) Computer Science','(H) Creative Arts and Design')
group by subject

SELECT subject, sum(A_STRONGLY_AGREE*response/100)
  FROM nss
 WHERE question='Q22'
   AND subject in ('(8) Computer Science','(H) Creative Arts and Design')
group by subject

SELECT subject, ROUND(sum(A_STRONGLY_AGREE*response)/sum(response))
  FROM nss
 WHERE question='Q22'
   AND subject in ('(8) Computer Science','(H) Creative Arts and Design')
group by subject

SELECT institution,round(sum(score*response)/sum(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
group by institution
ORDER BY institution

SELECT institution,sum(sample), 
sum(case when subject='(8) Computer Science' then sample else 0 end)
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
group by institution