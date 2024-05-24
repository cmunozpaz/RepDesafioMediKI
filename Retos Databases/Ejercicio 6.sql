select id, name into #Personajes from TPersonaje 

select id, description into #DescripcionesPersonajes from TPersonaje 


SELECT 
    p.name AS NombrePersonaje,
    dp.id ,
    dp.description,
    (LEN(dp.description) - LEN(REPLACE(dp.description, p.name, ''))) / LEN(p.name) AS ConteoPersonaje
into #PersonajesEnDescripcion
FROM 
    #DescripcionesPersonajes dp
CROSS APPLY 
    #Personajes p
WHERE 
    dp.description IS NOT NULL;


select pd.nombrePersonaje, 
sum(convert(int,ConteoPersonaje)) as NumeroVeces from #PersonajesEnDescripcion pd 
group by NombrePersonaje



drop table #Personajes
drop table #DescripcionesPersonajes
drop table #PersonajesEnDescripcion