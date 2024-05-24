select * into #Principal from TPersonaje
--##########################BILLION#####################################################################
---------------------------BillionKi--------------------------------------------
--select 'BillionKi'
select id,ki
into #BillionKi
from TPersonaje where ki like '%Billion%';
--************************************************************************************************
--************************************************************************************************
WITH BillionExtraidoKi AS (
    SELECT
	    id,
		ki,
		CASE 
        WHEN ki like '%Billion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraKi,
		REPLACE(Ki, ' Billion', '') AS BillionKi
    FROM 
        #BillionKi
)
select * into #BillionExtraidoKi from BillionExtraidoKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 BillionKi,
 TieneLaPlabraKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(BillionKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleBillionKi
into #BillionExtraidoEsConvertibleKi
FROM 
    #BillionExtraidoKi;
--************************************************************************************************
--************************************************************************************************
WITH BillionExtraidoConverNoPalabraNoKi AS (
    SELECT
	id,
	 BillionKi,
     TieneLaPlabraKi,
	 es_convertibleBillionKi,
        CAST(REPLACE(BillionKi, '.', '') AS NUMERIC(38, 0)) AS KifinalKiFF
    FROM 
        #BillionExtraidoEsConvertibleKi
		where es_convertibleBillionKi = 'False' and TieneLaPlabraKi = 'False'
)
select * into #BillionExtraidoConverNoPalabraNoKi from BillionExtraidoConverNoPalabraNoKi;

--************************************************************************************************
--************************************************************************************************
WITH BillionExtraidoConverSiPalabraSiKi AS (
    SELECT
	id,
	 BillionKi,
     TieneLaPlabraKi,
	 es_convertibleBillionKi,
         KifinalTT = convert(numeric(36,2),Billionki) * 1000000000
    FROM 
        #BillionExtraidoEsConvertibleKi
		where es_convertibleBillionKi = 'True' and TieneLaPlabraKi = 'True'
)
select * into #BillionExtraidoConverSiPalabraSiKi from BillionExtraidoConverSiPalabraSiKi;
--************************************************************************************************
--************************************************************************************************
select 
id,	
name,	
ki,
KiFinal = convert(numeric(36,2),0),
maxKi,	
MaxKiFinal = convert(numeric(36,2),0),
race,	gender,	description,	image,	affiliation,	deletedAt
into #FinalPrincipal
from #Principal

update #FinalPrincipal
set KiFinal = n.KifinalKiFF
from #FinalPrincipal p
inner join #BillionExtraidoConverNoPalabraNoKi n
on p.id = n.id


update #FinalPrincipal
set KiFinal = n.KifinalTT
from #FinalPrincipal p
inner join #BillionExtraidoConverSiPalabraSiKi n
on p.id = n.id
-------------------------------------------------------------------------------------------------------
---------------------------BillionMaxKi--------------------------------------------
--select 'BillionMaxKi'
select id,MaxKi
into #BillionMaxKi
from TPersonaje where MaxKi like '%Billion%';
--************************************************************************************************
--************************************************************************************************
WITH BillionExtraidoMaxKi AS (
    SELECT
	    id,
		Maxki,
		CASE 
        WHEN Maxki like '%Billion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraMaxKi,
		REPLACE(MaxKi, ' Billion', '') AS BillionMaxKi
    FROM 
        #BillionMaxKi
)
select * into #BillionExtraidoMaxKi from BillionExtraidoMaxKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 BillionMaxKi,
 TieneLaPlabraMaxKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(BillionMaxKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleBillionMaxKi
into #BillionExtraidoEsConvertibleMaxKi
FROM 
    #BillionExtraidoMaxKi;
--************************************************************************************************
--************************************************************************************************

--************************************************************************************************
--************************************************************************************************
WITH BillionExtraidoConverNoPalabraNoMaxKi AS (
    SELECT
	id,
	 BillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleBillionMaxKi,
        CAST(REPLACE(BillionMaxKi, '.', '') AS NUMERIC(38, 0)) AS MaxKifinalFF
    FROM 
        #BillionExtraidoEsConvertibleMaxKi
		where es_convertibleBillionMaxKi = 'False' and TieneLaPlabraMaxKi = 'False'
)
select * into #BillionExtraidoConverNoPalabraNoMaxKi from BillionExtraidoConverNoPalabraNoMaxKi;
--************************************************************************************************
--************************************************************************************************
WITH BillionExtraidoConverSiPalabraSiMaxKi AS (
    SELECT
	id,
	 BillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleBillionMaxKi,
         MaxKifinalTT = convert(numeric(36,2),BillionMaxki) * 1000000000
    FROM 
        #BillionExtraidoEsConvertibleMaxKi
		where es_convertibleBillionMaxKi = 'True' and TieneLaPlabraMaxKi = 'True'
)
select * into #BillionExtraidoConverSiPalabraSiMaxKi from BillionExtraidoConverSiPalabraSiMaxKi;
--************************************************************************************************
--************************************************************************************************
update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalFF
from #FinalPrincipal p
inner join #BillionExtraidoConverNoPalabraNoMaxKi n
on p.id = n.id


update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalTT
from #FinalPrincipal p
inner join #BillionExtraidoConverSiPalabraSiMaxKi n
on p.id = n.id
--##########################FINAL BILLION#####################################################################

--########################## TRILLIO N#####################################################################
---------------------------TrillionKi--------------------------------------------
--select 'TrillionKi'
select id,ki
into #TrillionKi
from TPersonaje where ki like '%Trillion%';
--************************************************************************************************
--************************************************************************************************
WITH TrillionExtraidoKi AS (
    SELECT
	    id,
		ki,
		CASE 
        WHEN ki like '%Trillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraKi,
		REPLACE(Ki, ' Trillion', '') AS TrillionKi
    FROM 
        #TrillionKi
)
select * into #TrillionExtraidoKi from TrillionExtraidoKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 TrillionKi,
 TieneLaPlabraKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(TrillionKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleTrillionKi
into #TrillionExtraidoEsConvertibleKi
FROM 
    #TrillionExtraidoKi;
--************************************************************************************************
--************************************************************************************************
WITH TrillionExtraidoConverNoPalabraNoKi AS (
    SELECT
	id,
	 TrillionKi,
     TieneLaPlabraKi,
	 es_convertibleTrillionKi,
        CAST(REPLACE(TrillionKi, '.', '') AS NUMERIC(38, 0)) AS KifinalKiFF
    FROM 
        #TrillionExtraidoEsConvertibleKi
		where es_convertibleTrillionKi = 'False' and TieneLaPlabraKi = 'False'
)
select * into #TrillionExtraidoConverNoPalabraNoKi from TrillionExtraidoConverNoPalabraNoKi;
--************************************************************************************************
--************************************************************************************************
WITH TrillionExtraidoConverSiPalabraSiKi AS (
    SELECT
	id,
	 TrillionKi,
     TieneLaPlabraKi,
	 es_convertibleTrillionKi,
         KifinalTT = convert(numeric(36,2),Trillionki) * 1000000000000
    FROM 
        #TrillionExtraidoEsConvertibleKi
		where es_convertibleTrillionKi = 'True' and TieneLaPlabraKi = 'True'
)
select * into #TrillionExtraidoConverSiPalabraSiKi from TrillionExtraidoConverSiPalabraSiKi;
--************************************************************************************************
--************************************************************************************************

update #FinalPrincipal
set KiFinal = n.KifinalKiFF
from #FinalPrincipal p
inner join #TrillionExtraidoConverNoPalabraNoKi n
on p.id = n.id


update #FinalPrincipal
set KiFinal = n.KifinalTT
from #FinalPrincipal p
inner join #TrillionExtraidoConverSiPalabraSiKi n
on p.id = n.id



---------------------------TrillionMaxKi--------------------------------------------
--select 'TrillionMaxKi'
select id,MaxKi
into #TrillionMaxKi
from TPersonaje where MaxKi like '%Trillion%';
--************************************************************************************************
--************************************************************************************************
WITH TrillionExtraidoMaxKi AS (
    SELECT
	    id,
		Maxki,
		CASE 
        WHEN Maxki like '%Trillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraMaxKi,
		REPLACE(MaxKi, ' Trillion', '') AS TrillionMaxKi
    FROM 
        #TrillionMaxKi
)
select * into #TrillionExtraidoMaxKi from TrillionExtraidoMaxKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 TrillionMaxKi,
 TieneLaPlabraMaxKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(TrillionMaxKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleTrillionMaxKi
into #TrillionExtraidoEsConvertibleMaxKi
FROM 
    #TrillionExtraidoMaxKi;
--************************************************************************************************
--************************************************************************************************

--************************************************************************************************
--************************************************************************************************
WITH TrillionExtraidoConverNoPalabraNoMaxKi AS (
    SELECT
	id,
	 TrillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleTrillionMaxKi,
        CAST(REPLACE(TrillionMaxKi, '.', '') AS NUMERIC(38, 0)) AS MaxKifinalFF
    FROM 
        #TrillionExtraidoEsConvertibleMaxKi
		where es_convertibleTrillionMaxKi = 'False' and TieneLaPlabraMaxKi = 'False'
)
select * into #TrillionExtraidoConverNoPalabraNoMaxKi from TrillionExtraidoConverNoPalabraNoMaxKi;
--************************************************************************************************
--************************************************************************************************
WITH TrillionExtraidoConverSiPalabraSiMaxKi AS (
    SELECT
	id,
	 TrillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleTrillionMaxKi,
         MaxKifinalTT = convert(numeric(36,2),TrillionMaxki) * 1000000000000
    FROM 
        #TrillionExtraidoEsConvertibleMaxKi
		where es_convertibleTrillionMaxKi = 'True' and TieneLaPlabraMaxKi = 'True'
)
select * into #TrillionExtraidoConverSiPalabraSiMaxKi from TrillionExtraidoConverSiPalabraSiMaxKi;
--************************************************************************************************
--************************************************************************************************
update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalFF
from #FinalPrincipal p
inner join #TrillionExtraidoConverNoPalabraNoMaxKi n
on p.id = n.id


update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalTT
from #FinalPrincipal p
inner join #TrillionExtraidoConverSiPalabraSiMaxKi n
on p.id = n.id
--##########################FINAL TRILLION#####################################################################

--########################## Quadrillion QUADRILLION N#####################################################################
---------------------------QuadrillionKi--------------------------------------------
--select 'TrillionKi'
select id,ki
into #QuadrillionKi
from TPersonaje where ki like '%Quadrillion%';
--************************************************************************************************
--************************************************************************************************
WITH QuadrillionExtraidoKi AS (
    SELECT
	    id,
		ki,
		CASE 
        WHEN ki like '%Quadrillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraKi,
		REPLACE(Ki, ' Quadrillion', '') AS QuadrillionKi
    FROM 
        #QuadrillionKi
)
select * into #QuadrillionExtraidoKi from QuadrillionExtraidoKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 QuadrillionKi,
 TieneLaPlabraKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(QuadrillionKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleQuadrillionKi
into #QuadrillionExtraidoEsConvertibleKi
FROM 
    #QuadrillionExtraidoKi;
--***********************************************************************************************
--************************************************************************************************
WITH QuadrillionExtraidoConverNoPalabraNoKi AS (
    SELECT
	id,
	 QuadrillionKi,
     TieneLaPlabraKi,
	 es_convertibleQuadrillionKi,
        CAST(REPLACE(QuadrillionKi, '.', '') AS NUMERIC(38, 0)) AS KifinalKiFF
    FROM 
        #QuadrillionExtraidoEsConvertibleKi
		where es_convertibleQuadrillionKi = 'False' and TieneLaPlabraKi = 'False'
)
select * into #QuadrillionExtraidoConverNoPalabraNoKi from QuadrillionExtraidoConverNoPalabraNoKi;
--************************************************************************************************
--************************************************************************************************
WITH QuadrillionExtraidoConverSiPalabraSiKi AS (
    SELECT
	id,
	 QuadrillionKi,
     TieneLaPlabraKi,
	 es_convertibleQuadrillionKi,
         KifinalTT = convert(numeric(36,2),Quadrillionki) * 1000000000000000
    FROM 
        #QuadrillionExtraidoEsConvertibleKi
		where es_convertibleQuadrillionKi = 'True' and TieneLaPlabraKi = 'True'
)
select * into #QuadrillionExtraidoConverSiPalabraSiKi from QuadrillionExtraidoConverSiPalabraSiKi;
--************************************************************************************************
--************************************************************************************************

update #FinalPrincipal
set KiFinal = n.KifinalKiFF
from #FinalPrincipal p
inner join #QuadrillionExtraidoConverNoPalabraNoKi n
on p.id = n.id


update #FinalPrincipal
set KiFinal = n.KifinalTT
from #FinalPrincipal p
inner join #QuadrillionExtraidoConverSiPalabraSiKi n
on p.id = n.id

---------------------------QuadrillionMaxKi--------------------------------------------
--select 'QuadrillionMaxKi'
select id,MaxKi
into #QuadrillionMaxKi
from TPersonaje where MaxKi like '%Quadrillion%';
--************************************************************************************************
--************************************************************************************************
WITH QuadrillionExtraidoMaxKi AS (
    SELECT
	    id,
		Maxki,
		CASE 
        WHEN Maxki like '%Quadrillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraMaxKi,
		REPLACE(MaxKi, ' Quadrillion', '') AS QuadrillionMaxKi
    FROM 
        #QuadrillionMaxKi
)
select * into #QuadrillionExtraidoMaxKi from QuadrillionExtraidoMaxKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 QuadrillionMaxKi,
 TieneLaPlabraMaxKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(QuadrillionMaxKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleQuadrillionMaxKi
into #QuadrillionExtraidoEsConvertibleMaxKi
FROM 
    #QuadrillionExtraidoMaxKi;
--************************************************************************************************
--************************************************************************************************

--************************************************************************************************
--************************************************************************************************
WITH QuadrillionExtraidoConverNoPalabraNoMaxKi AS (
    SELECT
	id,
	 QuadrillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleQuadrillionMaxKi,
        CAST(REPLACE(QuadrillionMaxKi, '.', '') AS NUMERIC(38, 0)) AS MaxKifinalFF
    FROM 
        #QuadrillionExtraidoEsConvertibleMaxKi
		where es_convertibleQuadrillionMaxKi = 'False' and TieneLaPlabraMaxKi = 'False'
)
select * into #QuadrillionExtraidoConverNoPalabraNoMaxKi from QuadrillionExtraidoConverNoPalabraNoMaxKi;
--************************************************************************************************
--************************************************************************************************
WITH QuadrillionExtraidoConverSiPalabraSiMaxKi AS (
    SELECT
	id,
	 QuadrillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleQuadrillionMaxKi,
         MaxKifinalTT = convert(numeric(36,2),QuadrillionMaxki) * 1000000000000000
    FROM 
        #QuadrillionExtraidoEsConvertibleMaxKi
		where es_convertibleQuadrillionMaxKi = 'True' and TieneLaPlabraMaxKi = 'True'
)
select * into #QuadrillionExtraidoConverSiPalabraSiMaxKi from QuadrillionExtraidoConverSiPalabraSiMaxKi;
--************************************************************************************************
--************************************************************************************************
update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalFF
from #FinalPrincipal p
inner join #QuadrillionExtraidoConverNoPalabraNoMaxKi n
on p.id = n.id


update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalTT
from #FinalPrincipal p
inner join #QuadrillionExtraidoConverSiPalabraSiMaxKi n
on p.id = n.id


--##########################  Quintillion QUINTILLION N#####################################################################
---------------------------QuintillionKi--------------------------------------------
--select 'TrillionKi'
select id,ki
into #QuintillionKi
from TPersonaje where ki like '%Quintillion%';
--************************************************************************************************
--************************************************************************************************
WITH QuintillionExtraidoKi AS (
    SELECT
	    id,
		ki,
		CASE 
        WHEN ki like '%Quintillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraKi,
		REPLACE(Ki, ' Quintillion', '') AS QuintillionKi
    FROM 
        #QuintillionKi
)
select * into #QuintillionExtraidoKi from QuintillionExtraidoKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 QuintillionKi,
 TieneLaPlabraKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(QuintillionKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleQuintillionKi
into #QuintillionExtraidoEsConvertibleKi
FROM 
    #QuintillionExtraidoKi;
--************************************************************************************************
--************************************************************************************************
WITH QuintillionExtraidoConverNoPalabraNoKi AS (
    SELECT
	id,
	 QuintillionKi,
     TieneLaPlabraKi,
	 es_convertibleQuintillionKi,
        CAST(REPLACE(QuintillionKi, '.', '') AS NUMERIC(38, 0)) AS KifinalKiFF
    FROM 
        #QuintillionExtraidoEsConvertibleKi
		where es_convertibleQuintillionKi = 'False' and TieneLaPlabraKi = 'False'
)
select * into #QuintillionExtraidoConverNoPalabraNoKi from QuintillionExtraidoConverNoPalabraNoKi;
--************************************************************************************************
--************************************************************************************************
WITH QuintillionExtraidoConverSiPalabraSiKi AS (
    SELECT
	id,
	 QuintillionKi,
     TieneLaPlabraKi,
	 es_convertibleQuintillionKi,
         KifinalTT = convert(numeric(36,2),Quintillionki) * 1000000000000000000
    FROM 
        #QuintillionExtraidoEsConvertibleKi
		where es_convertibleQuintillionKi = 'True' and TieneLaPlabraKi = 'True'
)
select * into #QuintillionExtraidoConverSiPalabraSiKi from QuintillionExtraidoConverSiPalabraSiKi;
--************************************************************************************************
--************************************************************************************************

update #FinalPrincipal
set KiFinal = n.KifinalKiFF
from #FinalPrincipal p
inner join #QuintillionExtraidoConverNoPalabraNoKi n
on p.id = n.id


update #FinalPrincipal
set KiFinal = n.KifinalTT
from #FinalPrincipal p
inner join #QuintillionExtraidoConverSiPalabraSiKi n
on p.id = n.id

---------------------------QuintillionMaxKi--------------------------------------------
--select 'QuintillionMaxKi'
select id,MaxKi
into #QuintillionMaxKi
from TPersonaje where MaxKi like '%Quintillion%';
--************************************************************************************************
--************************************************************************************************
WITH QuintillionExtraidoMaxKi AS (
    SELECT
	    id,
		Maxki,
		CASE 
        WHEN Maxki like '%Quintillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraMaxKi,
		REPLACE(MaxKi, ' Quintillion', '') AS QuintillionMaxKi
    FROM 
        #QuintillionMaxKi
)
select * into #QuintillionExtraidoMaxKi from QuintillionExtraidoMaxKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 QuintillionMaxKi,
 TieneLaPlabraMaxKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(QuintillionMaxKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleQuintillionMaxKi
into #QuintillionExtraidoEsConvertibleMaxKi
FROM 
    #QuintillionExtraidoMaxKi;
--************************************************************************************************
--************************************************************************************************

--************************************************************************************************
--************************************************************************************************
WITH QuintillionExtraidoConverNoPalabraNoMaxKi AS (
    SELECT
	id,
	 QuintillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleQuintillionMaxKi,
        CAST(REPLACE(QuintillionMaxKi, '.', '') AS NUMERIC(38, 0)) AS MaxKifinalFF
    FROM 
        #QuintillionExtraidoEsConvertibleMaxKi
		where es_convertibleQuintillionMaxKi = 'False' and TieneLaPlabraMaxKi = 'False'
)
select * into #QuintillionExtraidoConverNoPalabraNoMaxKi from QuintillionExtraidoConverNoPalabraNoMaxKi;
--************************************************************************************************
--************************************************************************************************
WITH QuintillionExtraidoConverSiPalabraSiMaxKi AS (
    SELECT
	id,
	 QuintillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleQuintillionMaxKi,
         MaxKifinalTT = convert(numeric(36,2),QuintillionMaxki) * 1000000000000000000
    FROM 
        #QuintillionExtraidoEsConvertibleMaxKi
		where es_convertibleQuintillionMaxKi = 'True' and TieneLaPlabraMaxKi = 'True'
)
select * into #QuintillionExtraidoConverSiPalabraSiMaxKi from QuintillionExtraidoConverSiPalabraSiMaxKi;
--************************************************************************************************
--************************************************************************************************
update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalFF
from #FinalPrincipal p
inner join #QuintillionExtraidoConverNoPalabraNoMaxKi n
on p.id = n.id


update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalTT
from #FinalPrincipal p
inner join #QuintillionExtraidoConverSiPalabraSiMaxKi n
on p.id = n.id

--##########################FINAL Quintillion #####################################################################

--##########################  Sextillion SEXTILLION N#####################################################################
---------------------------QuintillionKi--------------------------------------------
--select 'SextillionKi'
select id,ki
into #SextillionKi
from TPersonaje where ki like '%Sextillion%';
--************************************************************************************************
--************************************************************************************************
WITH SextillionExtraidoKi AS (
    SELECT
	    id,
		ki,
		CASE 
        WHEN ki like '%Sextillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraKi,
		REPLACE(Ki, ' Sextillion', '') AS SextillionKi
    FROM 
        #SextillionKi
)
select * into #SextillionExtraidoKi from SextillionExtraidoKi
 --************************************************************************************************
 --************************************************************************************************
  SELECT
 id,
 SextillionKi,
 TieneLaPlabraKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(SextillionKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleSextillionKi
into #SextillionExtraidoEsConvertibleKi
FROM 
    #SextillionExtraidoKi;
--************************************************************************************************
--************************************************************************************************
WITH SextillionExtraidoConverNoPalabraNoKi AS (
    SELECT
	id,
	 SextillionKi,
     TieneLaPlabraKi,
	 es_convertibleSextillionKi,
        CAST(REPLACE(SextillionKi, '.', '') AS NUMERIC(38, 0)) AS KifinalKiFF
    FROM 
        #SextillionExtraidoEsConvertibleKi
		where es_convertibleSextillionKi = 'False' and TieneLaPlabraKi = 'False'
)
select * into #SextillionExtraidoConverNoPalabraNoKi from SextillionExtraidoConverNoPalabraNoKi;
--************************************************************************************************
--************************************************************************************************
WITH SextillionExtraidoConverSiPalabraSiKi AS (
    SELECT
	id,
	 SextillionKi,
     TieneLaPlabraKi,
	 es_convertibleSextillionKi,
         KifinalTT = convert(numeric(36,2),Sextillionki) * 1000000000000000000000
    FROM 
        #SextillionExtraidoEsConvertibleKi
		where es_convertibleSextillionKi = 'True' and TieneLaPlabraKi = 'True'
)
select * into #SextillionExtraidoConverSiPalabraSiKi from SextillionExtraidoConverSiPalabraSiKi;
--************************************************************************************************
--************************************************************************************************

update #FinalPrincipal
set KiFinal = n.KifinalKiFF
from #FinalPrincipal p
inner join #SextillionExtraidoConverNoPalabraNoKi n
on p.id = n.id


update #FinalPrincipal
set KiFinal = n.KifinalTT
from #FinalPrincipal p
inner join #SextillionExtraidoConverSiPalabraSiKi n
on p.id = n.id

---------------------------SextillionMaxKi--------------------------------------------
--select 'SextillionMaxKi'
select id,MaxKi
into #SextillionMaxKi
from TPersonaje where MaxKi like '%Sextillion%';
--************************************************************************************************
--************************************************************************************************
WITH SextillionExtraidoMaxKi AS (
    SELECT
	    id,
		Maxki,
		CASE 
        WHEN Maxki like '%Sextillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraMaxKi,
		REPLACE(MaxKi, ' Sextillion', '') AS SextillionMaxKi
    FROM 
        #SextillionMaxKi
)
select * into #SextillionExtraidoMaxKi from SextillionExtraidoMaxKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 SextillionMaxKi,
 TieneLaPlabraMaxKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(SextillionMaxKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleSextillionMaxKi
into #SextillionExtraidoEsConvertibleMaxKi
FROM 
    #SextillionExtraidoMaxKi;
--************************************************************************************************
--************************************************************************************************

--************************************************************************************************
--************************************************************************************************
WITH SextillionExtraidoConverNoPalabraNoMaxKi AS (
    SELECT
	id,
	 SextillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleSextillionMaxKi,
        CAST(REPLACE(SextillionMaxKi, '.', '') AS NUMERIC(38, 0)) AS MaxKifinalFF
    FROM 
        #SextillionExtraidoEsConvertibleMaxKi
		where es_convertibleSextillionMaxKi = 'False' and TieneLaPlabraMaxKi = 'False'
)
select * into #SextillionExtraidoConverNoPalabraNoMaxKi from SextillionExtraidoConverNoPalabraNoMaxKi;
--************************************************************************************************
--************************************************************************************************
WITH SextillionExtraidoConverSiPalabraSiMaxKi AS (
    SELECT
	id,
	 SextillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleSextillionMaxKi,
         MaxKifinalTT = convert(numeric(36,2),SextillionMaxki) * 1000000000000000000000
    FROM 
        #SextillionExtraidoEsConvertibleMaxKi
		where es_convertibleSextillionMaxKi = 'True' and TieneLaPlabraMaxKi = 'True'
)
select * into #SextillionExtraidoConverSiPalabraSiMaxKi from SextillionExtraidoConverSiPalabraSiMaxKi;
--************************************************************************************************
--************************************************************************************************
update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalFF
from #FinalPrincipal p
inner join #SextillionExtraidoConverNoPalabraNoMaxKi n
on p.id = n.id


update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalTT
from #FinalPrincipal p
inner join #SextillionExtraidoConverSiPalabraSiMaxKi n
on p.id = n.id

--##########################FINAL Sextillion #####################################################################
--FINAL FINAL

update #FinalPrincipal
set maxKi = '37.4 septillion'
where maxki like '%septllion%'


--##########################  Septillion SEPTILLION N#####################################################################
---------------------------SeptillionKi--------------------------------------------
--select 'SextillionKi'
select id,ki
into #SeptillionKi
from #FinalPrincipal where ki like '%Septillion%';
--************************************************************************************************
--************************************************************************************************
WITH SeptillionExtraidoKi AS (
    SELECT
	    id,
		ki,
		CASE 
        WHEN ki like '%Septillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraKi,
		REPLACE(Ki, ' Septillion', '') AS SeptillionKi
    FROM 
        #SeptillionKi
)
select * into #SeptillionExtraidoKi from SeptillionExtraidoKi
 --************************************************************************************************
 --************************************************************************************************
  SELECT
 id,
 SeptillionKi,
 TieneLaPlabraKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(SeptillionKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleSeptillionKi
into #SeptillionExtraidoEsConvertibleKi
FROM 
    #SeptillionExtraidoKi;
--************************************************************************************************
--************************************************************************************************
WITH SeptillionExtraidoConverNoPalabraNoKi AS (
    SELECT
	id,
	 SeptillionKi,
     TieneLaPlabraKi,
	 es_convertibleSeptillionKi,
        CAST(REPLACE(SeptillionKi, '.', '') AS NUMERIC(38, 0)) AS KifinalKiFF
    FROM 
        #SeptillionExtraidoEsConvertibleKi
		where es_convertibleSeptillionKi = 'False' and TieneLaPlabraKi = 'False'
)
select * into #SeptillionExtraidoConverNoPalabraNoKi from SeptillionExtraidoConverNoPalabraNoKi;
--************************************************************************************************
--************************************************************************************************
WITH SeptillionExtraidoConverSiPalabraSiKi AS (
    SELECT
	id,
	 SeptillionKi,
     TieneLaPlabraKi,
	 es_convertibleSeptillionKi,
         KifinalTT = convert(numeric(36,2),Septillionki) * 1000000000000000000000000
    FROM 
        #SeptillionExtraidoEsConvertibleKi
		where es_convertibleSeptillionKi = 'True' and TieneLaPlabraKi = 'True'
)
select * into #SeptillionExtraidoConverSiPalabraSiKi from SeptillionExtraidoConverSiPalabraSiKi;
--************************************************************************************************
--************************************************************************************************

update #FinalPrincipal
set KiFinal = n.KifinalKiFF
from #FinalPrincipal p
inner join #SeptillionExtraidoConverNoPalabraNoKi n
on p.id = n.id


update #FinalPrincipal
set KiFinal = n.KifinalTT
from #FinalPrincipal p
inner join #SeptillionExtraidoConverSiPalabraSiKi n
on p.id = n.id

---------------------------SeptillionMaxKi--------------------------------------------
--select 'SeptillionMaxKi'
select id,MaxKi
into #SeptillionMaxKi
from #FinalPrincipal where MaxKi like '%Septillion%';
--************************************************************************************************
--************************************************************************************************
WITH SeptillionExtraidoMaxKi AS (
    SELECT
	    id,
		Maxki,
		CASE 
        WHEN Maxki like '%Septillion%'THEN 'True'
        ELSE 'False' end TieneLaPlabraMaxKi,
		REPLACE(MaxKi, ' Septillion', '') AS SeptillionMaxKi
    FROM 
        #SeptillionMaxKi
)
select * into #SeptillionExtraidoMaxKi from SeptillionExtraidoMaxKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 SeptillionMaxKi,
 TieneLaPlabraMaxKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(SeptillionMaxKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleSeptillionMaxKi
into #SeptillionExtraidoEsConvertibleMaxKi
FROM 
    #SeptillionExtraidoMaxKi;
--************************************************************************************************
--************************************************************************************************

--************************************************************************************************
--************************************************************************************************
WITH SeptillionExtraidoConverNoPalabraNoMaxKi AS (
    SELECT
	id,
	 SeptillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleSeptillionMaxKi,
        CAST(REPLACE(SeptillionMaxKi, '.', '') AS NUMERIC(38, 0)) AS MaxKifinalFF
    FROM 
        #SeptillionExtraidoEsConvertibleMaxKi
		where es_convertibleSeptillionMaxKi = 'False' and TieneLaPlabraMaxKi = 'False'
)
select * into #SeptillionExtraidoConverNoPalabraNoMaxKi from SeptillionExtraidoConverNoPalabraNoMaxKi;
--************************************************************************************************
--************************************************************************************************
WITH SeptillionExtraidoConverSiPalabraSiMaxKi AS (
    SELECT
	id,
	 SeptillionMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleSeptillionMaxKi,
         MaxKifinalTT = convert(numeric(36,2),SeptillionMaxki) * 1000000000000000000000000
    FROM 
        #SeptillionExtraidoEsConvertibleMaxKi
		where es_convertibleSeptillionMaxKi = 'True' and TieneLaPlabraMaxKi = 'True'
)
select * into #SeptillionExtraidoConverSiPalabraSiMaxKi from SeptillionExtraidoConverSiPalabraSiMaxKi;
--************************************************************************************************
--************************************************************************************************
update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalFF
from #FinalPrincipal p
inner join #SeptillionExtraidoConverNoPalabraNoMaxKi n
on p.id = n.id


update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalTT
from #FinalPrincipal p
inner join #SeptillionExtraidoConverSiPalabraSiMaxKi n
on p.id = n.id;

--##########################FINAL SEPTILLION#####################################################################
--##########################  Googolplex Googleplex N#####################################################################
---------------------------GoogolplexKi--------------------------------------------
--select 'SextillionKi'
select id,ki
into #GoogolplexKi
from #FinalPrincipal where ki like '%Googolplex%';
--************************************************************************************************
--************************************************************************************************
WITH GoogolplexExtraidoKi AS (
    SELECT
	    id,
		ki,
		CASE 
        WHEN ki like '%Googolplex%'THEN 'True'
        ELSE 'False' end TieneLaPlabraKi,
		REPLACE(Ki, ' Googolplex', '') AS GoogolplexKi
    FROM 
        #GoogolplexKi
)
select * into #GoogolplexExtraidoKi from GoogolplexExtraidoKi
 --************************************************************************************************
 --************************************************************************************************
  SELECT
 id,
 GoogolplexKi,
 TieneLaPlabraKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(GoogolplexKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleGoogolplexKi
into #GoogolplexExtraidoEsConvertibleKi
FROM 
    #GoogolplexExtraidoKi;

--************************************************************************************************
--************************************************************************************************
WITH GoogolplexExtraidoConverNoPalabraNoKi AS (
    SELECT
	id,
	 GoogolplexKi,
     TieneLaPlabraKi,
	 es_convertibleGoogolplexKi,
        CAST(REPLACE(GoogolplexKi, '.', '') AS NUMERIC(38, 0)) AS KifinalKiFF
    FROM 
        #GoogolplexExtraidoEsConvertibleKi
		where es_convertibleGoogolplexKi = 'False' and TieneLaPlabraKi = 'False'
)
select * into #GoogolplexExtraidoConverNoPalabraNoKi from GoogolplexExtraidoConverNoPalabraNoKi;
--************************************************************************************************
--************************************************************************************************
WITH GoogolplexExtraidoConverSiPalabraSiKi AS (
    SELECT
	id,
	 GoogolplexKi,
     TieneLaPlabraKi,
	 es_convertibleGoogolplexKi,
         KifinalTT = convert(numeric(36,2),Googolplexki) * 1000000000000000000000000000000
    FROM 
        #GoogolplexExtraidoEsConvertibleKi
		where es_convertibleGoogolplexKi = 'True' and TieneLaPlabraKi = 'True'
)
select * into #GoogolplexExtraidoConverSiPalabraSiKi from GoogolplexExtraidoConverSiPalabraSiKi;
--************************************************************************************************
--************************************************************************************************

update #FinalPrincipal
set KiFinal = n.KifinalKiFF
from #FinalPrincipal p
inner join #GoogolplexExtraidoConverNoPalabraNoKi n
on p.id = n.id


update #FinalPrincipal
set KiFinal = n.KifinalTT
from #FinalPrincipal p
inner join #GoogolplexExtraidoConverSiPalabraSiKi n
on p.id = n.id

---------------------------GoogolplexMaxKi--------------------------------------------
--select 'GoogolplexMaxKi'
select id,MaxKi
into #GoogolplexMaxKi
from #FinalPrincipal where MaxKi like '%Googolplex%';
--************************************************************************************************
--************************************************************************************************
WITH GoogolplexExtraidoMaxKi AS (
    SELECT
	    id,
		Maxki,
		CASE 
        WHEN Maxki like '%Googolplex%'THEN 'True'
        ELSE 'False' end TieneLaPlabraMaxKi,
		REPLACE(MaxKi, ' Googolplex', '') AS GoogolplexMaxKi
    FROM 
        #GoogolplexMaxKi
)
select * into #GoogolplexExtraidoMaxKi from GoogolplexExtraidoMaxKi
 --************************************************************************************************
 --************************************************************************************************
 SELECT
 id,
 GoogolplexMaxKi,
 TieneLaPlabraMaxKi,
    CASE 
        WHEN TRY_CONVERT(NUMERIC(18, 2), REPLACE(REPLACE(GoogolplexMaxKi, ',', ''), ',', '.')) IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS es_convertibleGoogolplexMaxKi
into #GoogolplexExtraidoEsConvertibleMaxKi
FROM 
    #GoogolplexExtraidoMaxKi;
--************************************************************************************************
--************************************************************************************************

--************************************************************************************************
--************************************************************************************************
WITH GoogolplexExtraidoConverNoPalabraNoMaxKi AS (
    SELECT
	id,
	 GoogolplexMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleGoogolplexMaxKi,
        CAST(REPLACE(GoogolplexMaxKi, '.', '') AS NUMERIC(38, 0)) AS MaxKifinalFF
    FROM 
        #GoogolplexExtraidoEsConvertibleMaxKi
		where es_convertibleGoogolplexMaxKi = 'False' and TieneLaPlabraMaxKi = 'False'
)
select * into #GoogolplexExtraidoConverNoPalabraNoMaxKi from GoogolplexExtraidoConverNoPalabraNoMaxKi;
--************************************************************************************************
--************************************************************************************************
WITH GoogolplexExtraidoConverSiPalabraSiMaxKi AS (
    SELECT
	id,
	 GoogolplexMaxKi,
     TieneLaPlabraMaxKi,
	 es_convertibleGoogolplexMaxKi,
         MaxKifinalTT = convert(numeric(36,2),GoogolplexMaxki) *  1000000000000000000000000000000
    FROM 
        #GoogolplexExtraidoEsConvertibleMaxKi
		where es_convertibleGoogolplexMaxKi = 'True' and TieneLaPlabraMaxKi = 'True'
)
select * into #GoogolplexExtraidoConverSiPalabraSiMaxKi from GoogolplexExtraidoConverSiPalabraSiMaxKi;
--************************************************************************************************
--************************************************************************************************
update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalFF
from #FinalPrincipal p
inner join #GoogolplexExtraidoConverNoPalabraNoMaxKi n
on p.id = n.id


update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalTT
from #FinalPrincipal p
inner join #GoogolplexExtraidoConverSiPalabraSiMaxKi n
on p.id = n.id;


--Quitar los puntos en ki pasar a kiFinal
WITH kiFinalSinPuntos AS (
    SELECT
	id,
        CAST(REPLACE(ki, '.', '') AS NUMERIC(38, 0)) AS KifinalSinPunto
    FROM #FinalPrincipal
        where ki not like '%Billion%' and  ki not like '%Trillion%' and ki not like '%Quadrillion%' 
		and ki not like '%Quintillion%'  and ki not like '%Sextillion%'  and ki not like '%Septillion%'   
		and ki not like '%unknown%' and ki not like '%Googolplex%' and ki not like '%,%' 
)
select * into #kiFinalSinPuntos from kiFinalSinPuntos;

WITH kiFinalSinComa AS (
    SELECT
	id,
        CAST(REPLACE(ki, ',', '') AS NUMERIC(38, 0)) AS KifinalSinComa
    FROM #FinalPrincipal
        where ki not like '%Billion%' and  ki not like '%Trillion%' and ki not like '%Quadrillion%' 
		and ki not like '%Quintillion%'  and ki not like '%Sextillion%'  and ki not like '%Septillion%'   
		and ki not like '%unknown%' and ki not like '%Googolplex%' and ki not like '%.%' 
)
select * into #kiFinalSinComa from kiFinalSinComa;

-------------------------------------------------------------------------------------------------------------------------------
--Quitar los puntos en Maxki pasar a MaxKiFinal
WITH MaxKiFinalSinPuntos AS (
    SELECT
	id,
        CAST(REPLACE(Maxki, '.', '') AS NUMERIC(38, 0)) AS MaxKifinalSinPunto
    FROM #FinalPrincipal
        where Maxki not like '%Billion%' and  Maxki not like '%Trillion%' and Maxki not like '%Quadrillion%' 
		and Maxki not like '%Quintillion%'  and Maxki not like '%Sextillion%'  and Maxki not like '%Septillion%'   
		and Maxki not like '%unknown%' and Maxki not like '%Googolplex%' and Maxki not like '%,%' 
)
select * into #MaxKiFinalSinPuntos from MaxKiFinalSinPuntos;

WITH MaxkiFinalSinComa AS (
    SELECT
	id,
        CAST(REPLACE(Maxki, ',', '') AS NUMERIC(38, 0)) AS MaxKifinalSinComa
    FROM #FinalPrincipal
        where Maxki not like '%Billion%' and  Maxki not like '%Trillion%' and Maxki not like '%Quadrillion%' 
		and Maxki not like '%Quintillion%'  and Maxki not like '%Sextillion%'  and Maxki not like '%Septillion%'   
		and Maxki not like '%unknown%' and Maxki not like '%Googolplex%' and Maxki not like '%.%' 
)
select * into #MaxkiFinalSinComa from MaxkiFinalSinComa;

update #FinalPrincipal
set KiFinal = n.KifinalSinPunto
from #FinalPrincipal p
inner join #kiFinalSinPuntos n
on p.id = n.id

update #FinalPrincipal
set KiFinal = n.KifinalSinComa
from #FinalPrincipal p
inner join #kiFinalSinComa n
on p.id = n.id


update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalSinPunto
from #FinalPrincipal p
inner join #MaxKiFinalSinPuntos n
on p.id = n.id

update #FinalPrincipal
set MaxKiFinal = n.MaxKifinalSinComa
from #FinalPrincipal p
inner join #MaxkiFinalSinComa n
on p.id = n.id

--select * from TPersonaje

select 	
name
,race	
,KiFinal as Ki
into #MasPoderosoPorRaza
from #FinalPrincipal
Group by name, race, KiFinal




SELECT 
    mppr1.name, 
    mppr1.race, 
    mppr1.ki
FROM 
    #MasPoderosoPorRaza mppr1
INNER JOIN 
    (SELECT 
        race, 
        min(ki) as MaxKi
     FROM 
        #MasPoderosoPorRaza
     GROUP BY 
        race) mppr2
ON 
    mppr1.race = mppr2.race AND mppr1.ki = mppr2.MaxKi
	where mppr1.race = 'God'
	order by  
    mppr1.ki desc




--************************************************************************************************
--************************************************************************************************

drop table #BillionKi
drop table #BillionExtraidoKi
drop table #BillionExtraidoEsConvertibleKi
drop table #BillionExtraidoConverNoPalabraNoKi
drop table #BillionExtraidoConverSiPalabraSiKi

drop table #BillionMaxKi
drop table #BillionExtraidoMaxKi
drop table #BillionExtraidoEsConvertibleMaxKi
drop table #BillionExtraidoConverNoPalabraNoMaxki
drop table #BillionExtraidoConverSiPalabraSiMaxKi

drop table #TrillionKi
drop table #TrillionExtraidoKi
drop table #TrillionExtraidoEsConvertibleKi
drop table #TrillionExtraidoConverNoPalabraNoKi
drop table #TrillionExtraidoConverSiPalabraSiKi

drop table #TrillionMaxKi
drop table #TrillionExtraidoMaxKi
drop table #TrillionExtraidoEsConvertibleMaxKi
drop table #TrillionExtraidoConverNoPalabraNoMaxki
drop table #TrillionExtraidoConverSiPalabraSiMaxKi

drop table #QuadrillionKi
drop table #QuadrillionExtraidoKi
drop table #QuadrillionExtraidoEsConvertibleKi
drop table #QuadrillionExtraidoConverNoPalabraNoKi
drop table #QuadrillionExtraidoConverSiPalabraSiKi

drop table #QuadrillionMaxKi
drop table #QuadrillionExtraidoMaxKi
drop table #QuadrillionExtraidoEsConvertibleMaxKi
drop table #QuadrillionExtraidoConverNoPalabraNoMaxki
drop table #QuadrillionExtraidoConverSiPalabraSiMaxKi

drop table #QuintillionKi
drop table #QuintillionExtraidoKi
drop table #QuintillionExtraidoEsConvertibleKi
drop table #QuintillionExtraidoConverNoPalabraNoKi
drop table #QuintillionExtraidoConverSiPalabraSiKi

drop table #QuintillionMaxKi
drop table #QuintillionExtraidoMaxKi
drop table #QuintillionExtraidoEsConvertibleMaxKi
drop table #QuintillionExtraidoConverNoPalabraNoMaxki
drop table #QuintillionExtraidoConverSiPalabraSiMaxKi

drop table #SextillionKi
drop table #SextillionExtraidoKi
drop table #SextillionExtraidoEsConvertibleKi
drop table #SextillionExtraidoConverNoPalabraNoKi
drop table #SextillionExtraidoConverSiPalabraSiKi

drop table #SextillionMaxKi
drop table #SextillionExtraidoMaxKi
drop table #SextillionExtraidoEsConvertibleMaxKi
drop table #SextillionExtraidoConverNoPalabraNoMaxki
drop table #SextillionExtraidoConverSiPalabraSiMaxKi

drop table #SeptillionKi
drop table #SeptillionExtraidoKi
drop table #SeptillionExtraidoEsConvertibleKi
drop table #SeptillionExtraidoConverNoPalabraNoKi
drop table #SeptillionExtraidoConverSiPalabraSiKi

drop table #SeptillionMaxKi
drop table #SeptillionExtraidoMaxKi
drop table #SeptillionExtraidoEsConvertibleMaxKi
drop table #SeptillionExtraidoConverNoPalabraNoMaxki
drop table #SeptillionExtraidoConverSiPalabraSiMaxKi

drop table #kiFinalSinPuntos
drop table #kiFinalSinComa
drop table #MaxkiFinalSinComa
drop table #MaxKiFinalSinPuntos

drop table #GoogolplexKi
drop table #GoogolplexExtraidoKi
drop table #GoogolplexExtraidoEsConvertibleKi
drop table #GoogolplexExtraidoConverNoPalabraNoKi
drop table #GoogolplexExtraidoConverSiPalabraSiKi
	
drop table #GoogolplexMaxKi
drop table #GoogolplexExtraidoMaxKi
drop table #GoogolplexExtraidoEsConvertibleMaxKi
drop table #GoogolplexExtraidoConverNoPalabraNoMaxki
drop table #GoogolplexExtraidoConverSiPalabraSiMaxKi

drop table #Principal
drop table #FinalPrincipal

drop table #MasPoderosoPorRaza





