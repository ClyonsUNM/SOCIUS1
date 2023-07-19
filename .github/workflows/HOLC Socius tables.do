clear
clear matrix
capture log close

log using "...Socius tables.log", replace



use "...HOLC and NNCS2_Socius", clear

//////////////////////////////////////////
***table 1 descriptives: tract variables
/////////////////////////////////////////

sum t_bg2rd  t_hr2rd i.INTERVAL2010_1 INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 i.nraceth_new2  t_lnpo22 t_frbr2 t_lgloanhu t_pvac2 t_f4ro10 t_m5242 t_homeown2 t_dsdc2 if INTERVAL2010 !=. &  t_f4ro10 !=. &  t_disd40 !=. & t_bg2rd !=., d

//////////////////////////////////////
***TABLE 2
***VIOLENCE (homicide and robbery)
/////////////////////////////////////

**T2M1 baseline
menbreg t_hr2rd  ib1.INTERVAL2010 if   t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T2M2 adding 1940 and contemporary controls
menbreg t_hr2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T2M3 adding tract segregation to model 2
menbreg t_hr2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T2M4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_hr2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T2M5 adding disadvantage to model 2
menbreg t_hr2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if   t_f4ro10 !=. & t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T2M6 "full" model
menbreg t_hr2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

//////////////////////////////////
***TABLE 3
***BURGARLY
/////////////////////////////////

**T3M1 baseline
menbreg t_bg2rd  ib1.INTERVAL2010 if   t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T3M2 adding 1940 and contemporary controls
menbreg t_bg2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T3M3 adding tract segregation to model 2
menbreg t_bg2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T3M4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_bg2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T3M5 adding disadvantage to model 2
menbreg t_bg2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if   t_f4ro10 !=. & t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**T3M6 "full" model
menbreg t_bg2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects




//////////////////////////
***
***SUPPLEMENTAl ANALYSES***
***
***///////////////////////



////////////***S1: USING HOLC CONTINUOUS MEASURE (INSTEAD OF INTERVAL/ORDINAL)//////////////////////

***S1a: VIOLENCE, HOLC Continuous

**S1aM1 baseline
menbreg t_hr2rd  hrs2010 if   t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

**S1aM2 adding 1940 and contemporary controls
menbreg t_hr2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

**S1aM3 adding tract segregation to model 2
menbreg t_hr2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

**S1aM4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_hr2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

**S1aM5 adding disadvantage to model 2
menbreg t_hr2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. & t_disd40 !=., exp (t_pop102)|| city_id:

**S1aM6 "full" model
menbreg t_hr2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:



***S1b: BURGLARY, HOLC Continuous

*S1bM1 baseline
menbreg t_bg2rd  hrs2010 if   t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

*S1bM2 adding 1940 and contemporary controls
menbreg t_bg2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

*S1bM3 adding tract segregation to model 2
menbreg t_bg2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

*S1bM4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_bg2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

**S1bM5 adding disadvantage to model 2
menbreg t_bg2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_f4ro10 !=. & t_disd40 !=., exp (t_pop102)|| city_id:

**S1bM6 "full" model
menbreg t_bg2rd  hrs2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:




////////***S2. INCLUDING TRACTS THAT WERE NOT MAPPED (BUT IN CITIES THAT HAD AT LEAST SOME MAPPING)
***reference is GREENLINED tracts (interval ==1), 0 = not mapped, 2 = blue, 3 = yellow, 4 = red ////////////////////

***S2a: VIOLENCE

*S2aM1 baseline
menbreg t_hr2rd  ib1.INTERVAL2010_1 if  city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2aM2 adding 1940 and contemporary controls
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2aM3 adding tract segregation to model 2
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2aM4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

**S2aM5 adding disadvantage to model 2
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. & t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

**S2aM6 "full" model
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects


***S2b: BURGLARY

*S2bM1 baseline
menbreg t_bg2rd  ib1.INTERVAL2010_1 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2bM2 adding 1940 and contemporary controls
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2bM3 adding tract segregation to model 2
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2bM4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

**S2bM5 adding disadvantage to model 2
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. & t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

**S2bM6 "full" model
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects


//////////***S2LA: EXCLUDING LA: Because Los Angeles alone accounts for over 42% of all non-mapped cases, models in this section replicate S2 excluding LA tracts////// 

***S2aLA: VIOLENCE

*S2aLAM1 baseline
menbreg t_hr2rd  ib1.INTERVAL2010_1 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=. & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2aLAM2 adding 1940 and contemporary controls
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=. & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2aLAM3 adding tract segregation to model 2
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=. & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2aLAM4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_disd40 !=. & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

**S2aLAM5 adding disadvantage to model 2
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. & t_disd40 !=. & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

**S2aLAM6 "full" model
menbreg t_hr2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_disd40 !=.  & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects


***S2b: BURGLARY

*S2bLAM1 baseline
menbreg t_bg2rd  ib1.INTERVAL2010_1 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=.  & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2bLAM2 adding 1940 and contemporary controls
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=.  & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2bLAM3 adding tract segregation to model 2
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. &  t_disd40 !=.  & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

*S2bLAM4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_disd40 !=.  & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

**S2bLAM5 adding disadvantage to model 2
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_f4ro10 !=. & t_disd40 !=. & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects

**S2bLAM6 "full" model
menbreg t_bg2rd  ib1.INTERVAL2010_1 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if city_mapped==1 & t_disd40 !=.  & city_id != 46, exp (t_pop102)|| city_id:

margins i.INTERVAL2010_1, atmeans
pwcompare i.INTERVAL2010_1, pveffects



/////////////***S3: WITHOUT 1940 DATA///////////////////////////

***S3a: VIOLENCE 

**S3aM1 baseline
menbreg t_hr2rd  ib1.INTERVAL2010 if   t_f4ro10 !=. , exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3aM2 adding contemporary controls
menbreg t_hr2rd  ib1.INTERVAL2010 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3aM3 adding tract segregation to model 2
menbreg t_hr2rd  ib1.INTERVAL2010 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. , exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3aM4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_hr2rd  ib1.INTERVAL2010 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2, exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3aM5 adding disadvantage to model 2
menbreg t_hr2rd  ib1.INTERVAL2010 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. , exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3aM6 "full" model
menbreg t_hr2rd  ib1.INTERVAL2010 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 , exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects



***S3b: BURGARLY

**S3bM1 baseline
menbreg t_bg2rd  ib1.INTERVAL2010 if t_f4ro10 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3bM2 adding  contemporary controls
menbreg t_bg2rd  ib1.INTERVAL2010 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3bM3 adding tract segregation to model 2
menbreg t_bg2rd  ib1.INTERVAL2010 i.nraceth_new2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3bM4 adding loans, vacancy, foreclosures, homeowners to model 2
menbreg t_bg2rd  ib1.INTERVAL2010 t_lnpo22 t_frbr2 t_m5242 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 , exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3bM5 adding disadvantage to model 2
menbreg t_bg2rd  ib1.INTERVAL2010 t_lnpo22 t_frbr2 t_m5242 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S3bM6 "full" model
menbreg t_bg2rd  ib1.INTERVAL2010 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 , exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects


////////////S4: WHITE-BLACK INEQUALITY in HOMEOWNERSHIP//
** t_wbho2: white-black inequality in home ownership/////////////////////////////////

**S4a: Violence

**S4a1: adding White-Black inequality in homeownership to model 2 of Table 2

menbreg t_hr2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_wbho2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S4a2: adding White-Black inequality in homeownership and poverty to model 6 of Table 2

menbreg t_hr2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_wbho2 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S4b: Burglary

**S4b1: adding White-Black inequality in homeownership to model 2 of Table 3

menbreg t_bg2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_wbho2 t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if  t_f4ro10 !=. &  t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**S4b2: adding White-Black inequality in homeownership to model 6 of Table 3

menbreg t_bg2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_wbho2 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

margins i.INTERVAL2010, atmeans
pwcompare i.INTERVAL2010, pveffects

**/////////////S5: 1930 vs 1940 DATA/////////////////////
**notes: only 5 cities have enough data from both the 1930 and 1940 censuses to compare results; housing values measured differently for 1930 and 1940, so not used here; concentrated disadvantage index alpha too low, so just using 
**variables separately; multilevel models are no longer supported with these data, so we run NBREG models with clustered SE, and omitt city-level variables
**can use the fistat estimates losely to compare the models that use 1930 vs. 1940 variables

**S5a1: baseline model for violence

nbreg t_hr2rd  i.INTERVAL2010  t_lnpo22  if  t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat


**S5a2_40: adding controls for 1940 census and contemporary tract conditions

nbreg t_hr2rd  i.INTERVAL2010  t_pcblk40 t_pcrenter40 t_pcnoRAD t_lnpo22 t_frbr2 t_m5242 if  t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat

**S5a2_30: adding controls for 1930 census and contemporary tract conditions

nbreg t_hr2rd  i.INTERVAL2010  t_pcblk30 t_pcrenter30 t_pcnoRAD30 t_lnpo22 t_frbr2 t_m5242 if  t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat

**S5a3_40
**Full model with 1940 data

nbreg t_hr2rd  i.INTERVAL2010  t_pcblk40 t_pcrenter40 t_pcnoRAD t_lnpo22  t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_prnt2 t_dsdc2 if t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat

**S5a3_30
**Full model with 1930 data

nbreg t_hr2rd  i.INTERVAL2010  t_pcblk30 t_pcrenter30 t_pcnoRAD30 t_lnpo22  t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_prnt2 t_dsdc2 if t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat


**S5b1: baseline model for burglary

nbreg t_bg2rd  i.INTERVAL2010  t_lnpo22  if  t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat


**S5a2_40: adding controls for 1940 census and contemporary tract conditions

nbreg t_bg2rd  i.INTERVAL2010  t_pcblk40 t_pcrenter40 t_pcnoRAD t_lnpo22 t_frbr2 t_m5242 if  t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat

**S5a2_30: adding controls for 1930 census and contemporary tract conditions

nbreg t_bg2rd  i.INTERVAL2010  t_pcblk30 t_pcrenter30 t_pcnoRAD30 t_lnpo22 t_frbr2 t_m5242 if  t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat

**S5a3_40
**Full model with 1940 data

nbreg t_bg2rd  i.INTERVAL2010  t_pcblk40 t_pcrenter40 t_pcnoRAD t_lnpo22  t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_prnt2 t_dsdc2 if t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat

**S5a3_30
**Full model with 1930 data

nbreg t_bg2rd  i.INTERVAL2010  t_pcblk30 t_pcrenter30 t_pcnoRAD30 t_lnpo22  t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_prnt2 t_dsdc2 if t_f4ro10 !=. &  t_disd30 !=., exp (t_pop102)
fitstat




//////////S6: ADDITIONAL TESTS///////////////

**Violence Models 1 and 2: does HOLC contribute to model fit? LRTEST for nested models

**S6a1: full model 6
menbreg t_hr2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estimate store fullvio


**S6a2: full model 6 without HOLC
menbreg t_hr2rd  t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=. & INTERVAL2010 !=., exp (t_pop102)|| city_id:

lrtest fullvio


**Violence Models 3 and 4: Does HOLC "matter more" than historical census controls? Compare BIC/AIC across non-nested models

**S6a3: model with  HOLC but not 1940 Census
menbreg t_hr2rd  ib1.INTERVAL2010  t_lnpo22 t_frbr2 t_m5242  c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

**S6a4: model with  1940 Census but not HOLC
menbreg t_hr2rd  t_disd40 t_pcblk40 t_medhv40 t_lnpo22  t_lnpo22 t_frbr2 t_m5242 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estat ic


**Burglary Models 1 and 2: does HOLC contribute to model fit? LRTEST for nested models

**S6b1: full model 6
menbreg t_bg2rd  ib1.INTERVAL2010 t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estimate store fullburg

**S6b2: full model 6 without HOLC
menbreg t_bg2rd  t_disd40 t_pcblk40 t_medhv40 t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=. & INTERVAL2010 !=., exp (t_pop102)|| city_id:

lrtest fullburg


**Burglary Models 3 and 4: Does HOLC "matter more" than historical census controls? Compare BIC/AIC across non-nested models

**S6b3: model with  HOLC but not 1940 Census
menbreg t_bg2rd  ib1.INTERVAL2010  t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estat ic

**S6b4: model with  1940 Census but not HOLC
menbreg t_bg2rd  t_disd40 t_pcblk40 t_medhv40 t_lnpo22  t_lnpo22 t_frbr2 t_m5242 i.nraceth_new2 t_lgloanhu t_pvac2 t_f4ro10 t_homeown2 t_dsdc2 c_pop082 c_pblk2 c_phisp2 c_dsdc2 c_pmov52 c_pvac2 c_dswb12 c_south2 c_west2 if t_disd40 !=., exp (t_pop102)|| city_id:

estat ic







