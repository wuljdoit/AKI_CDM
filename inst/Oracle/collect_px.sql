/********************************************************************************/
/*@file collect_px.sql
/*
/*in: AKI_onsets
/*
/*params: &&PCORNET_CDM, @server
/*
/*out: AKI_PX
/*
/*action: query
/********************************************************************************/
select distinct
       pat.PATID
      ,pat.ENCOUNTERID
      --,px.ENC_TYPE
      ,px.PX
      ,px.PX_TYPE
      ,px.PX_SOURCE
      ,px.PX_DATE
      ,round(px.PX_DATE-pat.ADMIT_DATE) DAYS_SINCE_ADMIT
--      ,px.PPX
from AKI_onsets pat
left join &&PCORNET_CDM.PROCEDURES@server px
on pat.PATID = px.PATID
where px.PX_DATE between pat.ADMIT_DATE-365 and
                         pat.ADMIT_DATE-1  
order by pat.PATID, pat.ENCOUNTERID, px.PX_DATE desc


