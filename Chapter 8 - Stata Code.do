

*Table 8.3.
*MAIN EFFECTS OF INFORMAL SOCIAL CONTROLS ON OFFENDING

nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC, irr exposure(Exposure_39)

*In-text report of relationship between ISC scale (as opposed to individual ISCs) and convictions.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC ISC_EAAdult, irr exposure(Exposure_39)


*INTERACTION MODELS.
*Warning - code removes data; do not save data once code for Table 8.4 has been run (or use 'Save As' instead). For each Table from Table 8.4-Table 8.7 you must run code for one...
*...Table at a time (i.e., run Table 8.4, re-open original dataset, run code for Table 8.5, repeat. 


*Table 8.4.
*Note - for the continuous x continuous interactions, the two variables being interacted must be the first two that are listed in order to correctly produce the plots.
*Interactions between ISC in adulthood and Youth Custody.

*Model 1. 
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Custody_Months_Cent c.EAAdultAx_Family_Relationships_R#c.Youth_Custody_Months_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Custody_Months_Cent=(-8/16) EAAdultAx_Family_Relationships_R=(0/1)) plot

*Model 2.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Custody_Months_Cent c.EAAdultAx_Living_Arrangements_RC#c.Youth_Custody_Months_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Custody_Months_Cent=(-8/16) EAAdultAx_Living_Arrangements_RC=(0/1)) plot

*Model 3.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Custody_Months_Cent c.EAAdultAx_Companion_Significant0#c.Youth_Custody_Months_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Custody_Months_Cent=(-8/16) EAAdultAx_Companion_Significant0=(0/1)) plot

*Model 4. 
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Custody_Months_Cent c.EAAdultAx_Academic_Vocational_S0#c.Youth_Custody_Months_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Custody_Months_Cent=(-8/16) EAAdultAx_Academic_Vocational_S0=(0/1)) plot

*Model 5.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Custody_Months_Cent c.EAAdultAx_Employment_Pattern_RC#c.Youth_Custody_Months_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Custody_Months_Cent=(-8/16) EAAdultAx_Employment_Pattern_RC=(0/1)) plot

*Model 6.
nbreg Convictions_Age39FU ISC_EAAdult_Cent Youth_Custody_Months_Cent c.ISC_EAAdult_Cent#c.Youth_Custody_Months_Cent ib2.Gender_RC i.Ethnicity_RC, irr exposure(Exposure_39)
*Code below creates top-left panel of Figure 8.3.
*Min/max for Adult ISC = -5.47/7.53.
*Min/max for Youth Custody = -8.71/46.26.
quietly margins, at(ISC_EAAdult_Cent=(-6(2)6))
marginsplot
quietly margins, at(Youth_Custody_Months_Cent=(-8.71(2)46.26))
marginsplot
quietly margins, at(ISC_EAAdult_Cent=(-6(2)6) Youth_Custody_Months_Cent=(-8.71(2)46.26)) saving(predictions, replace)
use predictions, clear
list _at1 _at2 _margin in 1/5
rename _at1 ISC 
rename _at2 Custody
rename _margin Pred_Con
list ISC Custody Pred_Con in 1/5, abbreviate(9)
twoway  (contour Pred_Con ISC Custody, ccuts(0(8)40)),                
          xlabel(-8(2)20)                                                
          ylabel(-6(2)8), angle(horizontal))                             
          xtitle("Months (Custody)")                                            
          ytitle("ISC (Count)")                                            
          ztitle("Predicted rate of convictions")                  
          title("Predicted rate of convictions by ISC and Incarceration")


*Table 8.5.
*Interactions between ISC in adulthood and Youth Individual-Level Risk.
*Note - for the continuous x continuous interactions, the two variables being interacted must be the first two that are listed in order to correctly produce the plots.


*Model 1. 
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Individual_Risk_Cent c.EAAdultAx_Family_Relationships_R#c.Youth_Individual_Risk_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Individual_Risk_Cent=(-8/10) EAAdultAx_Family_Relationships_R=(0/1)) plot

*Model 2.
*sig interaction.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Individual_Risk_Cent c.EAAdultAx_Living_Arrangements_RC#c.Youth_Individual_Risk_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Individual_Risk_Cent=(-8/10) EAAdultAx_Living_Arrangements_RC=(0/1)) plot

*Model 3.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Individual_Risk_Cent c.EAAdultAx_Companion_Significant0#c.Youth_Individual_Risk_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Individual_Risk_Cent=(-8/10) EAAdultAx_Companion_Significant0=(0/1)) plot

*Model 4.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Individual_Risk_Cent c.EAAdultAx_Academic_Vocational_S0#c.Youth_Individual_Risk_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Individual_Risk_Cent=(-8/10) EAAdultAx_Academic_Vocational_S0=(0/1)) plot

*Model 5.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Individual_Risk_Cent c.EAAdultAx_Employment_Pattern_RC#c.Youth_Individual_Risk_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Individual_Risk_Cent=(-8/10) EAAdultAx_Employment_Pattern_RC=(0/1)) plot

*Model 6.
nbreg Convictions_Age39FU ISC_EAAdult_Cent Youth_Individual_Risk_Cent c.ISC_EAAdult_Cent#c.Youth_Individual_Risk_Cent ib2.Gender_RC i.Ethnicity_RC, irr exposure(Exposure_39)
*Code below creates top-right panel of Figure 8.3.
*Min/max for Adult ISC = -5.47/7.53.
*Min/max for YouthIndividual Risk = -7.77/15.23.
quietly margins, at(ISC_EAAdult_Cent=(-6(2)6))
marginsplot
quietly margins, at(Youth_Individual_Risk_Cent=(-7.77(2)15.23))
marginsplot
quietly margins, at(ISC_EAAdult_Cent=(-6(2)6) Youth_Individual_Risk_Cent=(-7.77(2)15.23)) saving(predictions, replace)
use predictions, clear
list _at1 _at2 _margin in 1/5
rename _at1 ISC
rename _at2 Individual_Risk 
rename _margin Pred_Con
list ISC Individual_Risk Pred_Con in 1/5, abbreviate(9)
twoway  (contour Pred_Con ISC Individual_Risk, ccuts(0(8)40)),                
          xlabel(-6(2)8)                                                
          ylabel(-6(2)10), angle(horizontal))                             
          xtitle("Months (Custody)")                                            
          ytitle("ISC (Count)")                                            
          ztitle("Predicted rate of convictions")                  
          title("Predicted rate of convictions by ISC and Incarceration")		  


*Table 8.6.
*Interactions between ISC in adulthood and Family-Level Risk.
*Note - for the continuous x continuous interactions, the two variables being interacted must be the first two that are listed in order to correctly produce the plots.

*Model 1. 
*sig interaction.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Family_Risk_Cent c.EAAdultAx_Family_Relationships_R#c.Youth_Family_Risk_Cent, irr exposure(Exposure_39)

*Model 2. 
*sig interaction.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Family_Risk_Cent c.EAAdultAx_Living_Arrangements_RC#c.Youth_Family_Risk_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Family_Risk_Cent=(-2/5) EAAdultAx_Living_Arrangements_RC=(0/1)) plot

*Model 3. 
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Family_Risk_Cent c.EAAdultAx_Companion_Significant0#c.Youth_Family_Risk_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Family_Risk_Cent=(-2/5) EAAdultAx_Companion_Significant0=(0/1)) plot

*Model 4.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Family_Risk_Cent c.EAAdultAx_Academic_Vocational_S0#c.Youth_Family_Risk_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Family_Risk_Cent=(-2/5) EAAdultAx_Academic_Vocational_S0=(0/1)) plot

*Model 5.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC Youth_Family_Risk_Cent c.EAAdultAx_Employment_Pattern_RC#c.Youth_Family_Risk_Cent, irr exposure(Exposure_39)
quietly margins, at(Youth_Family_Risk_Cent=(-2/5) EAAdultAx_Employment_Pattern_RC=(0/1)) plot

*Model 6.
nbreg Convictions_Age39FU ISC_EAAdult_Cent Youth_Family_Risk_Cent c.ISC_EAAdult_Cent#c.Youth_Family_Risk_Cent ib2.Gender_RC i.Ethnicity_RC, irr exposure(Exposure_39)
*Code below creates bottom-left panel of Figure 8.3.
*Min/max for Adult ISC = -5.47/7.53.
*Min/max for Family Risk = -2.71/8.18.
quietly margins, at(ISC_EAAdult_Cent=(-6(2)6))
marginsplot
quietly margins, at(Youth_Family_Risk_Cent=(-2.71(1)8.18))
marginsplot
quietly margins, at(ISC_EAAdult_Cent=(-6(2)6) Youth_Family_Risk_Cent=(-2.71(1)8.18)) saving(predictions, replace)
use predictions, clear
list _at1 _at2 _margin in 1/5
rename _at1 ISC
rename _at2 Family_Risk 
rename _margin Pred_Con
list ISC Family_Risk Pred_Con in 1/5, abbreviate(9)
twoway  (contour Pred_Con ISC Family_Risk, ccuts(0(10)40)),                
          xlabel(-6(2)8)                                                
          ylabel(-6(2)10), angle(horizontal))                             
          xtitle("Months (Custody)")                                            
          ytitle("ISC (Count)")                                            
          ztitle("Predicted rate of convictions")                  
          title("Predicted rate of convictions by ISC and Incarceration")		  
		  
*Table 8.7.
*Interactions between ISC in adulthood and ISC in adolescence.
*Note - for the continuous x continuous interactions, the two variables being interacted must be the first two that are listed in order to correctly produce the plots.

*Model 1. 
*sig interaction.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC ISC_FirstYouth_Cent c.EAAdultAx_Family_Relationships_R#c.ISC_FirstYouth_Cent, irr exposure(Exposure_39)
quietly margins, at(ISC_FirstYouth_Cent=(-4.5/5) EAAdultAx_Family_Relationships_R=(0/1)) plot

*Model 2.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC ISC_FirstYouth_Cent c.EAAdultAx_Living_Arrangements_RC#c.ISC_FirstYouth_Cent, irr exposure(Exposure_39)
quietly margins, at(ISC_FirstYouth_Cent=(-4.5/5) EAAdultAx_Living_Arrangements_RC=(0/1)) plot

*Model 3. 
*sig interaction.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC ISC_FirstYouth_Cent c.EAAdultAx_Companion_Significant0#c.ISC_FirstYouth_Cent, irr exposure(Exposure_39)
quietly margins, at(ISC_FirstYouth_Cent=(-4.5/5) EAAdultAx_Companion_Significant0=(0/1)) plot

*Model 4.
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC ISC_FirstYouth_Cent c.EAAdultAx_Academic_Vocational_S0#c.ISC_FirstYouth_Cent, irr exposure(Exposure_39)
quietly margins, at(ISC_FirstYouth_Cent=(-4.5/5) EAAdultAx_Academic_Vocational_S0=(0/1)) plot

*Model 5.
*Mistake in table - family relationship is not significant per Stata output. Copy/paste error from Model 1.  
nbreg Convictions_Age39FU ib2.Gender_RC i.Ethnicity_RC EAAdultAx_Family_Relationships_R EAAdultAx_Living_Arrangements_RC EAAdultAx_Companion_Significant0 EAAdultAx_Academic_Vocational_S0 EAAdultAx_Employment_Pattern_RC ISC_FirstYouth_Cent c.EAAdultAx_Employment_Pattern_RC#c.ISC_FirstYouth_Cent, irr exposure(Exposure_39)
quietly margins, at(ISC_FirstYouth_Cent=(-4.5/5) EAAdultAx_Employment_Pattern_RC=(0/1)) plot

*Model 6. 
nbreg Convictions_Age39FU ISC_EAAdult_Cent ISC_FirstYouth_Cent c.ISC_EAAdult_Cent#c.ISC_FirstYouth_Cent ib2.Gender_RC i.Ethnicity_RC, irr exposure(Exposure_39)
*Code below creates bottom-right panel of Figure 8.3.
*Min/max for Adult ISC = -5.47/7.53.
*Min/max for Youth ISC = -4.44/9.56.
quietly margins, at(ISC_EAAdult_Cent=(-6(2)6))
marginsplot
quietly margins, at(ISC_FirstYouth_Cent=(-4.44(1)9.56))
marginsplot
quietly margins, at(ISC_EAAdult_Cent=(-6(2)6) ISC_FirstYouth_Cent=(-4.44(1)9.56)) saving(predictions, replace)
use predictions, clear
list _at1 _at2 _margin in 1/5
rename _at1 ISC_Adult
rename _at2 ISC_Youth 
rename _margin Pred_Con
list ISC_Adult ISC_Youth Pred_Con in 1/5, abbreviate(9)
twoway  (contour Pred_Con ISC_Adult ISC_Youth, ccuts(0(8)40)),                
          xlabel(-6(2)8)                                                
          ylabel(-6(2)10), angle(horizontal))                             
          xtitle("Months (Custody)")                                            
          ytitle("ISC (Count)")                                            
          ztitle("Predicted rate of convictions")                  
          title("Predicted rate of convictions by ISC and Incarceration")
		  


*TABLE 8.8.

*Cross-lagged dynamic panel models; full ISC scale. Justified to Tx as exogenous b/c convictions did not predict ISC. 
*REPLICATING THE BM2018 MODEL--THE FULL ISC SCALE WAS NOT LAGGED. 

*Model 1. 
*Baseline - no interactions - CLEARED.
xtset Code_ wave
xtdpdml convictionsln isc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof

*Model 2.
*Custody interaction - CLEARED.
xtset Code_ wave
xtdpdml convictionsln isc isc_youthcustodylngmc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof

*Model 3.
*Individual-risk interaction - CLEARED.
xtset Code_ wave
xtdpdml convictionsln isc isc_youthindrgmc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof

*Model 4.
*Family-risk interaction - CLEARED.
xtset Code_ wave
xtdpdml convictionsln isc isc_youthfamrgmc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof

*Model 5.
*ISC interaction - CLEARED.
xtset Code_ wave
xtdpdml convictionsln isc isc_youthiscgmc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof


*TABLE 8.9.

*Cross-lagged dynamic panel models; full ISC scale. Justified to Tx as exogenous b/c convictions did not predict ISC. 
*THE FULL ISC SCALE WAS LAGGED. CONTRASTS WITH THE BM2018 MODEL.

*Baseline - no interactions - CLEARED.
xtset Code_ wave
xtdpdml convictionsln l.isc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof

*Custody interaction - CLEARED.
xtset Code_ wave
xtdpdml convictionsln l.isc l.isc_youthcustodylngmc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof 

*Individual-risk interaction - CLEARED.
xtset Code_ wave
xtdpdml convictionsln l.isc l.isc_youthindrgmc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof

*Family-risk interaction - NOT CLEARED.
xtset Code_ wave
xtdpdml convictionsln l.isc l.isc_youthfamrgmc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof 
*Won't converge - STD RESULTS IN CLEARED.
xtdpdml convictionsln l.isc l.isc_youthfamrgmc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof std

*ISC interaction - CLEARED.
xtset Code_ wave
xtdpdml convictionsln l.isc l.isc_youthiscgmc, pre(exposure) inv(youth_custody_ln ycrna_final_indr ycrna_final_famr ycrna_final_isc) fiml gof





	
	
	
	
		
	
	
	