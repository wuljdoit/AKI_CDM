/*******************************************************************************/
/*@file cohort_enc_SCr.sql
/*
/*in: All_Scr_eGFR, AKI_Initial
/*       
/*out: AKI_Scr_eGFR
/*
/*action: write
/********************************************************************************/
create table AKI_Scr_eGFR as
select scr.* from All_Scr_eGFR scr
where exists (select 1 from AKI_Initial aki where scr.ENCOUNTERID = aki.ENCOUNTERID)


