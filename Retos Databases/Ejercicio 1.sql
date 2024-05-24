--select * from TPersonaje

SELECT Race, Gender, COUNT(Gender) AS GenderCount
into #RaceGenderCount
FROM TPersonaje
GROUP BY Race, Gender

select Race, convert(int,0) M , convert(int,0) F
into #tablaBase
from #RaceGenderCount
Group by Race

update #tablaBase
set M = rg.GenderCount
from #tablaBase tb
inner join #RaceGenderCount rg
on tb.race = rg.race
where rg.gender = 'Male'

update #tablaBase
set F = rg.GenderCount
from #tablaBase tb
inner join #RaceGenderCount rg
on tb.race = rg.race
where rg.gender = 'Female'


select * from #tablaBase

drop table #RaceGenderCount
drop table #tablaBase

