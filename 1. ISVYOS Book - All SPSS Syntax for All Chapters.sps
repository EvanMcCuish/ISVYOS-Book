* Encoding: UTF-8.

****************************************************************CHAPTER 3****************************************************************.

*Table 3.2 - Demogs.
T-TEST GROUPS=Gender(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=Age
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES= Gender BY  Ethnicity_RC
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW COLUMN 
  /COUNT ROUND CELL.

*Table 3.2 - Risk Factors.

CROSSTABS
  /TABLES= Gender BY Attend_School SkipDay_Early Street_Drug_User_RC LeftHome_Early KickedHome_Early Cons_OppSex_Early Sex_Abuse Phys_Abuse
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

T-TEST GROUPS=Gender(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=  SchoolChange SubstanceUse_Versatility.SCALE Family_Dysfunction.SCALE Positive_Self_Identity.SCALE Positive_Other_Identity.SCALE PCL_ProRated
  /CRITERIA=CI(.95).

*Table 3.2 - Juvenile Justice.

T-TEST GROUPS=Gender(1 2)
  /MISSING=ANALYSIS
  /VARIABLES= Youth_Convictions Youth_Custody  Conviction_Age_Onset  
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES= Gender BY Any_Violent_Conviction_Youth JSO
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*Figure 3.2 (Partial).
*Gang Interview and Foster Care Interview Descriptives not shown as contained in a separate dataset that cannot be shared at this point due to nature of data.

FREQUENCIES VARIABLES=Has_D1 Has_MACI Has_CAPP Has_PCL Has_EXIT Has_APSD
  /ORDER=ANALYSIS.

*Figure 3.3.
FREQUENCIES VARIABLES= Age_Coding Adolescence Early_Adulthood Full_Adulthood Mature_Adulthood
Age_Bracket No_Search YouthSealed FullRecord_Sealed NoName_CS#
  /ORDER=ANALYSIS.


****************************************************************CHAPTER 4****************************************************************.


*Table 4.1.

FREQUENCIES VARIABLES= Chronic_Youth_50P Chronic_EA_50P Chronic_FA_50P Chronic_MA_50P
  /ORDER=ANALYSIS.

MEANS TABLES=Youth_Convictions BY Chronic_Youth_50P
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=Emerging_Adulthood_Convictions BY Chronic_EA_50P
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=Full_Adulthood_Convictions BY Chronic_FA_50P
  /CELLS=MEAN COUNT STDDEV.

   MEANS TABLES=Mature_Adulthood_Convictions BY Chronic_MA_50P
  /CELLS=MEAN COUNT STDDEV.


MEANS TABLES=Youth_Custody BY Chronic_Youth_50P
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=Emerging_Adulthood_Custody BY Chronic_EA_50P
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=Full_Adulthood_Custody BY Chronic_FA_50P
  /CELLS=MEAN COUNT STDDEV.


MEANS TABLES=Mature_Adulthood_Custody BY Chronic_MA_50P
  /CELLS=MEAN COUNT STDDEV.


*Table 4.2a.

CROSSTABS
  /TABLES=DCT_Adolescence BY DCT_EA
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Table 4.2b.
CROSSTABS
  /TABLES=DCT_EA BY DCT_FA
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Table 4.2c.
CROSSTABS
  /TABLES=DCT_FA BY DCT_MA
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.



*Figure 4.1.

*DIFFERENCES IN PREVALENCE OF CONVICTIONS ACROSS COHORTS.

CROSSTABS
  /TABLES=COHORT BY C12_RC C13_RC C14_RC C15_RC C16_RC C17_RC C18_RC C19_RC C20_RC C21_RC C22_RC 
    C23_RC C24_RC C25_RC C26_RC C27_RC C28_RC C29_RC C30_RC C31_RC C32_RC C33_RC C34_RC C35_RC C36_RC 
    C37_RC C38_RC C39_RC C40_RC
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*DIFFERENCES IN PREVALENCE OF INCARCERATION ACROSS COHORTS.
MEANS TABLES= Custody_Days_12_RC Custody_Days_13_RC Custody_Days_14_RC Custody_Days_15_RC Custody_Days_16_RC Custody_Days_17_RC Custody_Days_18_RC
Custody_Days_19_RC Custody_Days_20_RC Custody_Days_21_RC Custody_Days_22_RC Custody_Days_23_RC Custody_Days_24_RC Custody_Days_25_RC
Custody_Days_26_RC Custody_Days_27_RC Custody_Days_28_RC Custody_Days_29_RC Custody_Days_30_RC Custody_Days_31_RC Custody_Days_32_RC
Custody_Days_33_RC Custody_Days_34_RC Custody_Days_35_RC Custody_Days_36_RC Custody_Days_37_RC Custody_Days_38_RC Custody_Days_39_RC Custody_Days_40_RC BY COHORT
  /CELLS=MEAN COUNT STDDEV.

*Figure 4.2.

*Figure created by plotting the average convictions and the average incarceration of those defined by chronic offending. Values produced in the syntax for Table 4.1.

*Figure 4.3
*Required creating a new dataset for each age-stage identifying (0/1) whether a given participant had "X" number of convictions in that particular age-stage.
*Each probability reflected in each of the graphs for the respective age-stages.
*Convert percentages to probabilities and then plot in Excel. 

*Adolescence.
FREQUENCIES VARIABLES= Y1 Y2 Y3 Y4 Y5 Y6 Y7 Y8 Y9 Y10  Y11 Y12 Y13 Y14 Y15 Y16 Y17 Y18 Y19 Y20 Y21 Y22 Y23 Y24 Y25
Y26 Y27 Y28 Y29 Y30
  /ORDER=ANALYSIS.

*Emerging Adulthood.
FREQUENCIES VARIABLES= EA1 EA2 EA3 EA4 EA5 EA6 EA7 EA8 EA9 EA10  EA11 EA12 EA13 EA14 EA15 EA16 EA17 EA18 EA19 EA20 EA21 EA22 EA23 EA24 EA25
  /ORDER=ANALYSIS.

*Full Adulthood.
FREQUENCIES VARIABLES= FA1 FA2 FA3 FA4 FA5 FA6 FA7 FA8 FA9 FA10  FA11 FA12 FA13 FA14 FA15 FA16 FA17 FA18 FA19 FA20 FA21 FA22 FA23 
  /ORDER=ANALYSIS.

*Mature Adulthood.
FREQUENCIES VARIABLES= MA1 MA2 MA3 MA4 MA5 MA6 MA7 MA8 MA9 MA10  MA11 MA12 MA13 MA14 MA15 MA16 MA17 MA18 MA19 MA20 MA21 MA22 
  /ORDER=ANALYSIS.


*Data Reported in Text (No Table/Figure).

*PREVALENCE OF INCURRING A CONVICTION ACROSS DIFFERENT AGE-STAGES.
CROSSTABS
  /TABLES=COHORT BY Any_Youth_Conviction Any_Emerging_Adulthood_Conviction Any_Full_Adulthood_Conviction 
    Any_Mature_Adulthood_Conviction
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*PREVALENCE OF INCARCERATION WITHIN DIFFERENT AGE STAGES, COMPARED ACROSS COHORTS.
CROSSTABS
  /TABLES=COHORT BY Any_Youth_Incarceration Any_Emerging_Adulthood_Incarceration Any_Full_Adulthood_Incarceration 
    Any_Mature_Adulthood_Incarceration
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*INSTANCES WHERE YOUTH WAS INCARCERATED BUT NOT CONVICTED IN A GIVEN AGE-STAGE.

  CROSSTABS
  /TABLES= Any_Youth_Conviction Any_Emerging_Adulthood_Conviction 
    Any_Full_Adulthood_Conviction Any_Mature_Adulthood_Conviction
       BY  Any_Youth_Incarceration Any_Emerging_Adulthood_Incarceration Any_Full_Adulthood_Incarceration 
    Any_Mature_Adulthood_Incarceration
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*LOOKING AT AVERAGE AGE OF ONSET ACROSS INDIVIDUALS DEPENDING ON WHERE CONVICTION WAS PRESENT OR ABSENT AT A PARTICULAR AGE-STAGE.
T-TEST GROUPS=Any_Emerging_Adulthood_Conviction(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=Conviction_Age_Onset
  /CRITERIA=CI(.95).

T-TEST GROUPS=Any_Full_Adulthood_Conviction(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=Conviction_Age_Onset
  /CRITERIA=CI(.95).

T-TEST GROUPS=Any_Mature_Adulthood_Conviction(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=Conviction_Age_Onset
  /CRITERIA=CI(.95).


*COMPARING STABILITY OF CHRONIC OFFENDING BETWEEN ADOLESCENCE AND FULL ADULTHOOD.

CROSSTABS
  /TABLES=DCT_Adolescence BY DCT_FA
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW COLUMN
  /COUNT ROUND CELL.

*COMPARING STABILITY OF CHRONIC OFFENDING BETWEEN ADOLESCENCE AND MATURE ADULTHOOD.


CROSSTABS
  /TABLES=DCT_Adolescence BY DCT_MA
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW COLUMN
  /COUNT ROUND CELL.

*COUNTS OF HAVING CHRONIC OFFENDING AT MULTIPLE AGE-STAGES.


FREQUENCIES VARIABLES= Total_Chronicity First_Three_Chronicity DCT_Adolescence DCT_EA DCT_FA DCT_MA  /ORDER=ANALYSIS.



*CORRELATION BETWEEN CONVICTION FREQUENCY AND CONVICTION VERSATILITY.
*Looked at correlations within each age stage (e.g., match youth versatility to youth convictions, EA versatility to EA convictions, etc.
CORRELATIONS
  /VARIABLES=Youth_Versatility EA_Versatility FA_Versatility MA_Versatility Youth_Convictions Total_EA_Convictions Total_FA_Convictions 
    Total_MA_Convictions
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

*CORRELATION BETWEEN CONVICTION FREQUENCY AND INCARCERATION.
*Looked at correlations within each age stage (e.g., match youth INCARCERATION to youth convictions, EA INCARCERATION to EA convictions, etc.
CORRELATIONS
  /VARIABLES= Youth_Custody Emerging_Adulthood_Custody Full_Adulthood_Custody Mature_Adulthood_Custody Youth_Convictions Total_EA_Convictions Total_FA_Convictions 
    Total_MA_Convictions
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

*ALL INFORMATION FROM THE DURATION SECTION OF THE CHAPTER. 

DESCRIPTIVES VARIABLES=Incarceration_Onset Conviction_Age_Onset Earliest_Onset
Age_Last_CJS_MA Age_Last_Conviction_MA Age_Last_Incarceration_MA CC_Duration_Convictions_MA CC_Duration_Incarceration_MA
CC_Duration_Longest_MA
  /STATISTICS=MEAN STDDEV MIN MAX.

*Reported correlation of -.434; actually -.413.
CORRELATIONS
  /VARIABLES=  CC_Duration_Convictions_MA 
Conviction_Age_Onset
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=   CC_Duration_Longest_MA
Total_MA_Custody 
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

****************************************************************CHAPTER 5****************************************************************.
*See Stata Code for Trajectory models and Excel Sheet for BIC values for all trajectories. 

*Table 5.1.
*OCC values produced directly by Stata, see screenshots.
FREQUENCIES VARIABLES= EA_5Grp_Traj FA_4Grp_Traj MA_5Grp_Traj  /ORDER=ANALYSIS.

MEANS TABLES= EA_G1PP EA_G2PP EA_G3PP EA_G4PP EA_G5PP BY EA_5Grp_Traj
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES= FA_G1PP FA_G2PP FA_G3PP FA_G4PP  BY FA_4Grp_Traj
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES= MA_G1PP MA_G2PP MA_G3PP MA_G4PP MA_G5PP BY MA_5Grp_Traj
  /CELLS=MEAN COUNT STDDEV.


*Table 5.2.

ONEWAY Conviction_Age_Onset  Total_EA_Convictions BY EA_5Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

CROSSTABS
  /TABLES=EA_5Grp_Traj BY Chronic_Offending_12to23 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


ONEWAY Conviction_Age_Onset Total_FA_Convictions BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

CROSSTABS
  /TABLES=FA_4Grp_Traj BY Chronic_Offending_12to29 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


ONEWAY Conviction_Age_Onset Total_MA_Convictions BY MA_5Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

CROSSTABS
  /TABLES=MA_5Grp_Traj BY Chronic_Offending_12to35.V2
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.



*Table 5.3.
*MA Custody reflects number of days incarcerated. To convert to months incarcerated, values were divided by 30. 
ONEWAY Total_MA_Custody MA_Versatility Total_Violent_Convictions_MA Total_Weapon_Convictions_MA
    CC_Duration_Convictions_MA CC_Duration_Longest_MA BY MA_5Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

CROSSTABS
  /TABLES=MA_5Grp_Traj BY Any_SO Homicide_Offender_RC MA_Persistence_Conviction MA_Persistence_CJS 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*Table 5.4 - Used the Full Adulthood Only dataset.
*FILTERS USED WHEN VARIABLE WAS NOT SIGNIFICANT - USED TO CHECK TO SEE IF IT WAS SIG SPECIFICALLY FOR MALE PARTICIPANTS/FEMALE PARTICIPANTS.

*DEMOGRAPHICS.

CROSSTABS
  /TABLES=Gender_RC Ethnicity_RC Cohort BY FA_4Grp_Traj
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS= COUNT ROW  
  /COUNT ROUND CELL.


*SCHOOL BEHAVIORAL PROBLEMS

ONEWAY School_Behvaioral_Problems.SCALE BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).


*To Filter Males.

USE ALL.
COMPUTE filter_$=(Gender_RC = 1).
VARIABLE LABELS filter_$ 'Gender_RC = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

ONEWAY School_Behvaioral_Problems.SCALE BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

*Filter Off. 
FILTER OFF.
USE ALL.
EXECUTE.

*SUBSTANCE USE.

ONEWAY SubstanceUse_Versatility.SCALE BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

*To Filter Males.

USE ALL.
COMPUTE filter_$=(Gender_RC = 1).
VARIABLE LABELS filter_$ 'Gender_RC = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

ONEWAY SubstanceUse_Versatility.SCALE BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

*Filter Off. 
FILTER OFF.
USE ALL.
EXECUTE.

*To Filter Females.

USE ALL.
COMPUTE filter_$=(Gender_RC = 2).
VARIABLE LABELS filter_$ 'Gender_RC = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


ONEWAY SubstanceUse_Versatility.SCALE BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

*Filter Off. 
FILTER OFF.
USE ALL.
EXECUTE.


CROSSTABS
  /TABLES=Street_Drug_User_RC BY FA_4Grp_Traj
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW  
  /COUNT ROUND CELL.


*SELF-REPORTED OFFENDING.

ONEWAY SelfReport_OffendingVersatility.SCALE BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

*FAMILY DYSFUNCTION.

CROSSTABS
  /TABLES=Foster BY FA_4Grp_Traj
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW COLUMN 
  /COUNT ROUND CELL.

ONEWAY BioFam_Dysfunction.SCALE
BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).


*IDENTITY.

ONEWAY Positive_Self_Identity.SCALE Positive_Other_Identity.SCALE
BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).

ONEWAY Mental_HealthTotal 
BY FA_4Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI T2 ALPHA(0.05).


*Figures 5.2-5.4 created through Stata code for performing SPGM. 



*FIGURE 5.5.
MEANS TABLES=Pred_C12 Pred_C13 Pred_C14 Pred_C15 Pred_C16 Pred_C17 Pred_C18 Pred_C19 Pred_C20 
    Pred_C21 Pred_C22 Pred_C23 Pred_C24 Pred_C25 Pred_C26 Pred_C27 Pred_C28 Pred_C29 Pred_C30 Pred_C31 
    Pred_C32 Pred_C33 Pred_C34 Pred_C35 BY MA_5Grp_Traj
  /CELLS=MEAN COUNT STDDEV.





****************************************************************CHAPTER 6****************************************************************.
*See SAS Code/Excel Sheets for LCA models. 

*Table 6.1.
*Male analyses for coefficients above the diagonal; female analyses for coefficients below. 

*To Filter Males.

USE ALL.
COMPUTE filter_$=(Gender_RC = 1).
VARIABLE LABELS filter_$ 'Gender_RC = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=School_Behvaioral_Problems.SCALE Early_School_Behvaioral_Problems.SCALE
SubstanceUse_Versatility.SCALE SubstanceUse_VersatilityEARLY.SCALE
Trouble_Home_Versatility.SCALE
Fighting_Versatility.SCALE Fighting_Versatility_Early.SCALE
Self_Report_Delinquency_Versatility.SCALE SRD_Early.SCALE SRD_12up.SCALE
SelfReport_OffendingVersatility.SCALE SRO_Versatility_Early.SCALE SRO_Versatility_12Up.SCALE
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

*Filter Off. 
FILTER OFF.
USE ALL.
EXECUTE.

*To Filter Females.

USE ALL.
COMPUTE filter_$=(Gender_RC = 2).
VARIABLE LABELS filter_$ 'Gender_RC = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=School_Behvaioral_Problems.SCALE Early_School_Behvaioral_Problems.SCALE
SubstanceUse_Versatility.SCALE SubstanceUse_VersatilityEARLY.SCALE
Trouble_Home_Versatility.SCALE
Fighting_Versatility.SCALE Fighting_Versatility_Early.SCALE
Self_Report_Delinquency_Versatility.SCALE SRD_Early.SCALE SRD_12up.SCALE
SelfReport_OffendingVersatility.SCALE SRO_Versatility_Early.SCALE SRO_Versatility_12Up.SCALE
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

*Filter Off. 
FILTER OFF.
USE ALL.
EXECUTE.

*Table 6.2.

CROSSTABS
  /TABLES=Gender_RC BY SBP_LCA SubstanceUse_LCA Home_LCA_3grp Agg_LCA_4grp
  Early_SRD_LCA Late_SRD_LCA4 Early_SRO_3grp_LCA Late_SRO_4grp_LCA
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*Table 6.3.
*To Filter Males.

USE ALL.
COMPUTE filter_$=(Gender_RC = 1).
VARIABLE LABELS filter_$ 'Gender_RC = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

  CROSSTABS
  /TABLES= SBP_LCA SubstanceUse_LCA Home_LCA_3grp Agg_LCA_4grp Early_SRD_LCA Late_SRD_LCA4
  Early_SRO_3grp_LCA Late_SRO_4grp_LCA 
        BY EA_5Grp_Traj
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

*Filter Off. 
FILTER OFF.
USE ALL.
EXECUTE.

*Figure 6.1-Figure 6.10 created from SAS LCA Code.

*Figure 6.11.
*The last two columns in Figure 6.11 created by taking the average probability of endorsement for each motivation-type. 
*Reactive Motivations Across the Sample.
DESCRIPTIVES VARIABLES=Gen_Fight_Anger Gen_Fight_Argue Gen_Fight_Confrontation Gen_Fight_Mouthingoff Gen_Fight_Mood
Gen_Fight_Disrespect Gen_Fight_LookWrong Gen_Fight_High Gen_Fight_Drunk
  /STATISTICS=MEAN STDDEV MIN MAX.

*Instrumental Motivations Across the Sample.

DESCRIPTIVES VARIABLES=Gen_Fight_Anger Gen_Fight_Argue Gen_Fight_Confrontation Gen_Fight_Mouthingoff Gen_Fight_Mood
Gen_Fight_Disrespect Gen_Fight_LookWrong Gen_Fight_High Gen_Fight_Drunk
  /STATISTICS=MEAN STDDEV MIN MAX.

*Aggression - Reactive Motivations Across Latent Classes.

  CROSSTABS
  /TABLES= Gen_Fight_Wantsomething Gen_Fight_GetBack Gen_Fight_Respect Gen_Fight_Fun Gen_Fight_Gang BY Agg_LCA_4grp
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT COLUMN
  /COUNT ROUND CELL.


*Aggression - Instrumental Motivations Across Latent Classes.
  CROSSTABS
  /TABLES= Gen_Fight_Wantsomething Gen_Fight_GetBack Gen_Fight_Respect Gen_Fight_Fun Gen_Fight_Gang BY Agg_LCA_4grp
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

*Figure 6.12-Figure 6.13 created from SAS LCA Code.

*Figure 6.14.
*The last two columns in Figure 6.14 created by taking the average probability of endorsement for each motivation-type. 
*Reactive Motivations for Crime Across the Sample.
DESCRIPTIVES VARIABLES=CrimeInvolve_Control CrimeInvolve_Angry CrimeInvolve_Drug CrimeInvolve_Alcohol
  /STATISTICS=MEAN STDDEV MIN MAX.

*Instrumental Motivations for Crime Across the Sample.

DESCRIPTIVES VARIABLES=CrimeInvolve_Money CrimeInvolve_Leader CrimeInvolve_GoodAtIt CrimeInvolve_Gang CrimeInvolve_Status
  /STATISTICS=MEAN STDDEV MIN MAX.

*SRO - Reactive Motivations Across Latent Classes.

  CROSSTABS
  /TABLES= CrimeInvolve_Control CrimeInvolve_Angry CrimeInvolve_Drug CrimeInvolve_Alcohol BY Late_SRO_4grp_LCA
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

*SRO - Instrumental Across Latent Classes. 
 CROSSTABS
  /TABLES= CrimeInvolve_Money CrimeInvolve_Leader CrimeInvolve_GoodAtIt CrimeInvolve_Gang CrimeInvolve_Status BY Late_SRO_4grp_LCA
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT COLUMN
  /COUNT ROUND CELL.

****************************************************************CHAPTER 7****************************************************************.
*See SAS Code/Output for Trajectory Models. 
*Note that trajectory model for ages 12-35 was produced in Chapter 5 - see SAS files for Chapter 5.

*Table 7.1 & In-Text Descriptives.

*PCLYV Total Score Reliability.

RELIABILITY
  /VARIABLES= I1 I2 I3 I4 Aff5 Aff6 Aff7 Aff8 L9 L10 L11 L12 L13 Ant14 Ant15 Ant16 Ant17 Ant18 Unc19 Unc20
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


RELIABILITY
  /VARIABLES= I1 I2 I3 I4 
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


RELIABILITY
  /VARIABLES=Aff5 Aff6 Aff7 Aff8
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


RELIABILITY
  /VARIABLES= L9 L10 L11 L12 L13
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


RELIABILITY
  /VARIABLES= Ant14 Ant15 Ant16 Ant17 Ant18 
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


*PCL_ProRated = total score. 
DESCRIPTIVES VARIABLES= PCL_ProRated Interpersonal_Facet_Prorated Affective_Facet_Prorated 
    Lifestyle_Facet_Prorated Antisocial_Facet_Prorated I1 I2 I3 I4 Aff5 Aff6 Aff7 Aff8 L9 L10 L11 L12
L13 Ant14 Ant15 Ant16 Ant17 Ant18 Unc19 Unc20
  /STATISTICS=MEAN STDDEV RANGE MIN MAX.


FREQUENCIES VARIABLES= MA_Chronic_Offending Chronic_Offending_12to35
 MA_5Grp_Traj MALtd_traj
  /ORDER=ANALYSIS.


*Table 7.2.
*Chronic offending as conviction probabilities.

*Chronic 12-35.
T-TEST GROUPS=Chronic_Offending_12to35(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=PCL_ProRated Interpersonal_Facet_Prorated Affective_Facet_Prorated 
    Lifestyle_Facet_Prorated Antisocial_Facet_Prorated 
  /CRITERIA=CI(.95).

*Chronic 30-35.
T-TEST GROUPS=MA_Chronic_Offending(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=PCL_ProRated Interpersonal_Facet_Prorated Affective_Facet_Prorated 
    Lifestyle_Facet_Prorated Antisocial_Facet_Prorated 
  /CRITERIA=CI(.95).


*Table 7.3.
*Logistic Regression - Chronic offending as conviction probabilities.

*Chronic 12-35.
*TOTAL SCORE (Model 1). 
LOGISTIC REGRESSION VARIABLES Chronic_Offending_12to35.V2
  /METHOD=ENTER  PCL_ProRated Ethnicity_RC Gender_RC
  /CONTRAST (Gender_RC)=Indicator
    /CONTRAST (Ethnicity_RC)=Indicator (1)
  /SAVE=PRED
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

*FACETS (Model 2).
LOGISTIC REGRESSION VARIABLES Chronic_Offending_12to35.V2
  /METHOD=ENTER  Interpersonal_Facet_Prorated Affective_Facet_Prorated 
    Lifestyle_Facet_Prorated Antisocial_Facet_Prorated Ethnicity_RC Gender_RC
  /CONTRAST (Gender_RC)=Indicator
    /CONTRAST (Ethnicity_RC)=Indicator (1)
  /SAVE=PRED
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


*Chronic 30-35.
*TOTAL SCORE (Model 1).  
LOGISTIC REGRESSION VARIABLES MA_Chronic_Offending
  /METHOD=ENTER  PCL_ProRated Ethnicity_RC Total_FA_Convictions
    /CONTRAST (Ethnicity_RC)=Indicator (1)
  /SAVE=PRED
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

*FACETS.
LOGISTIC REGRESSION VARIABLES MA_Chronic_Offending
  /METHOD=ENTER  Ethnicity_RC Total_FA_Convictions  Interpersonal_Facet_Prorated Affective_Facet_Prorated 
    Lifestyle_Facet_Prorated Antisocial_Facet_Prorated
    /CONTRAST (Ethnicity_RC)=Indicator (1)
  /SAVE=PRED
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


*Table 7.4.
*Chronic offending as conviction trajectory.
*Trajectory 12-35.
ONEWAY PCL_ProRated Interpersonal_Facet_Prorated Affective_Facet_Prorated 
    Lifestyle_Facet_Prorated Antisocial_Facet_Prorated  BY MA_5Grp_Traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=TUKEY T2 ALPHA(0.05).

*Table 7.5.
*Chronic offending as conviction trajectory.
*Trajectory 30-35.
ONEWAY PCL_ProRated Interpersonal_Facet_Prorated Affective_Facet_Prorated 
    Lifestyle_Facet_Prorated Antisocial_Facet_Prorated  BY MALtd_traj
  /STATISTICS DESCRIPTIVES HOMOGENEITY BROWNFORSYTHE 
  /MISSING ANALYSIS
  /POSTHOC=TUKEY T2 ALPHA(0.05).


*Table 7.6.
*MLR: Chronic offending as conviction trajectory.
*Trajectory 12-35.

*TOTAL SCORE (Model 1). 
NOMREG MA_5Grp_Traj (BASE=LAST ORDER=ASCENDING) BY Gender_RC Ethnicity_RC_RC WITH PCL_ProRated
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=PARAMETER SUMMARY LRT CPS STEP MFI.


*FACETS (Model 2).
NOMREG MA_5Grp_Traj (BASE=LAST ORDER=ASCENDING) BY Gender_RC Ethnicity_RC_RC WITH Interpersonal_Facet_Prorated Affective_Facet_Prorated 
    Lifestyle_Facet_Prorated Antisocial_Facet_Prorated
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=PARAMETER SUMMARY LRT CPS STEP MFI.


*Table 7.7.
*MLR: Chronic offending as conviction trajectory.
*Trajectory 30-35.

*TOTAL SCORE (Model 1). 
NOMREG MALtd_traj (BASE=LAST ORDER=ASCENDING) BY Ethnicity_RC_RC WITH PCL_ProRated Total_FA_Convictions
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=PARAMETER SUMMARY LRT CPS STEP MFI.

*FACETS (Model 2).
NOMREG MALtd_traj (BASE=LAST ORDER=ASCENDING) BY Ethnicity_RC_RC WITH Interpersonal_Facet_Prorated Affective_Facet_Prorated 
    Lifestyle_Facet_Prorated Antisocial_Facet_Prorated Total_FA_Convictions
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=PARAMETER SUMMARY LRT CPS STEP MFI.


*Table 7.8.
*Descriptive statistics for individual participants, data not available to public. 








****************************************************************CHAPTER 8****************************************************************.
*Table 8.1.

CROSSTABS
  /TABLES=EAAdultAx_Family_Relationships_RC BY EAAdultAx_Living_Arrangements_RC 
    EAAdultAx_Companion_Significant_Others_RC EAAdultAx_Academic_Vocational_Skills_RC 
    EAAdultAx_Employment_Pattern_RC
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES= EAAdultAx_Living_Arrangements_RC BY  EAAdultAx_Family_Relationships_RC
    EAAdultAx_Companion_Significant_Others_RC EAAdultAx_Academic_Vocational_Skills_RC 
    EAAdultAx_Employment_Pattern_RC
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=  EAAdultAx_Companion_Significant_Others_RC BY  EAAdultAx_Family_Relationships_RC EAAdultAx_Living_Arrangements_RC
     EAAdultAx_Academic_Vocational_Skills_RC 
    EAAdultAx_Employment_Pattern_RC
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=  EAAdultAx_Academic_Vocational_Skills_RC BY EAAdultAx_Employment_Pattern_RC
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW COLUMN 
  /COUNT ROUND CELL.

*Table 8.2.

*Verifying that there is no issue with multicollinearity in the logistic regression analyses.
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT EAAdultAx_Employment_Pattern_RC
  /METHOD=ENTER Gender_RC FirstYouthAxYouth.Age_of_Form Ethnicity_RC Youth_Custody_Months ISC_FirstYouth Youth_Individual_Risk Youth_Family_Risk.

*Predicting Emerging Adult ISC Outcomes.

LOGISTIC REGRESSION VARIABLES EAAdultAx_Family_Relationships_RC
  /METHOD=ENTER Gender_RC Ethnicity_RC Youth_Custody_Months ISC_FirstYouth Youth_Individual_Risk Youth_Family_Risk  
  /CONTRAST (Gender_RC)=Indicator
  /CONTRAST (Ethnicity_RC)=Indicator(1)
  /CLASSPLOT
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


LOGISTIC REGRESSION VARIABLES EAAdultAx_Living_Arrangements_RC
  /METHOD=ENTER Gender_RC Ethnicity_RC Youth_Custody_Months ISC_FirstYouth Youth_Individual_Risk Youth_Family_Risk  
      /CONTRAST (Gender_RC)=Indicator
  /CONTRAST (Ethnicity_RC)=Indicator(1)
  /CLASSPLOT
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


LOGISTIC REGRESSION VARIABLES EAAdultAx_Companion_Significant_Others_RC
  /METHOD=ENTER Gender_RC Ethnicity_RC Youth_Custody_Months ISC_FirstYouth Youth_Individual_Risk Youth_Family_Risk  
  /CONTRAST (Gender_RC)=Indicator
  /CONTRAST (Ethnicity_RC)=Indicator(1)
  /CLASSPLOT
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


LOGISTIC REGRESSION VARIABLES EAAdultAx_Academic_Vocational_Skills_RC
  /METHOD=ENTER Gender_RC Ethnicity_RC Youth_Custody_Months ISC_FirstYouth Youth_Individual_Risk Youth_Family_Risk  
  /CONTRAST (Gender_RC)=Indicator
  /CONTRAST (Ethnicity_RC)=Indicator(1)
  /CLASSPLOT
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


LOGISTIC REGRESSION VARIABLES EAAdultAx_Employment_Pattern_RC
  /METHOD=ENTER Gender_RC Ethnicity_RC Youth_Custody_Months ISC_FirstYouth Youth_Individual_Risk Youth_Family_Risk  
  /CONTRAST (Gender_RC)=Indicator
  /CONTRAST (Ethnicity_RC)=Indicator(1)
  /CLASSPLOT
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

*Table 8.3.
*To check for multicollinearity in the neg bin regression analysis.
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Convictions_Age39FU
  /METHOD=ENTER Gender_RC EAAdultAx_Family_Relationships_RC EAAdultAx_Companion_Significant_Others_RC EAAdultAx_Academic_Vocational_Skills_RC 
    EAAdultAx_Employment_Pattern_RC EAAdultAx_Living_Arrangements_RC.

*Remaining tables from Chapter 8 produced in Stata.


*Figure 8.1 was based on the Chapter 5 trajectory model for the full adulthood period (see Stata code from Chapter 5). 

*Figure 8.2.

FREQUENCIES VARIABLES= EAAdultAx_Family_Relationships EAAdultAx_Living_Arrangements EAAdultAx_Companion_Significant_Others EAAdultAx_Academic_Vocational_Skills
  EAAdultAx_Employment_Pattern
  /ORDER=ANALYSIS.

*Figure 8.3 created in Stata - see code/output. 





****************************************************************CHAPTER 9****************************************************************.

*Table 9.2.


CROSSTABS
  /TABLES=Cohort BY Gender_RC Ethnicity_RC Street_Drug_User_RC RaisedBy_MCFD LeftHome_Early KickedHome_Early Phys_Abuse Sex_Abuse
   Cons_OppSex_Early Attend_School SkipDay_Early 
   CO_BREACH Youth_Violence_RC Offence_UseWeapon_RC
   CO_MinorProp CO_BREACH_ONLY CO_BREACH_ONLY_RC 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS= COUNT ROW  
  /COUNT ROUND CELL.


T-TEST GROUPS=Cohort(1 2)
  /MISSING=ANALYSIS
  /VARIABLES= Age_.D1 Age SubstanceUse_Versatility.SCALE 
  BioFam_Dysfunction.SCALE Positive_Self_Identity.SCALE Positive_Other_Identity.SCALE
  Mental_HealthTotal SchoolChange 
  Earliest_Onset Youth_Convictions Youth_Custody SelfReport_OffendingVersatility.SCALE
  /CRITERIA=CI(.95).




*Table 9.3.

CROSSTABS
  /TABLES=  Cohort BY FA_4Grp_Traj
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT ROW COLUMN 
  /COUNT ROUND CELL.


T-TEST GROUPS=Cohort(1 2)
  /MISSING=ANALYSIS
  /VARIABLES= TotalConvictions_FA TotalCustody_FA TotalViolence_FA
  /CRITERIA=CI(.95).




*Table 9.4.
*Separated by Cohort. Must use the filter.
*Just need to read the top row of the correlation matrix.


USE ALL.
COMPUTE filter_$=(Cohort_RC = 0).
VARIABLE LABELS filter_$ 'Cohort_RC = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


CORRELATIONS
  /VARIABLES= Custody_Days_12 
  C_12to13_Change C_13to14_Change C_14to15_Change C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES= Inc_12to13_Change
  C_12to13_Change C_13to14_Change C_14to15_Change C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES=  Inc_13to14_Change
C_13to14_Change C_14to15_Change C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES=   Inc_14to15_Change
 C_14to15_Change C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=   Inc_15to16_Change
C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES=   Inc_16to17_Change 
 C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


*Filter Off. 
FILTER OFF.
USE ALL.
EXECUTE.

USE ALL.
COMPUTE filter_$=(Cohort_RC = 1).
VARIABLE LABELS filter_$ 'Cohort_RC = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


CORRELATIONS
  /VARIABLES= Custody_Days_12 
  C_12to13_Change C_13to14_Change C_14to15_Change C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES= Inc_12to13_Change
  C_12to13_Change C_13to14_Change C_14to15_Change C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES=  Inc_13to14_Change
C_13to14_Change C_14to15_Change C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES=   Inc_14to15_Change
 C_14to15_Change C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=   Inc_15to16_Change
C_15to16_Change C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES=   Inc_16to17_Change 
 C_16to17_Change C_17to18_Change 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


*Filter Off. 
FILTER OFF.
USE ALL.
EXECUTE.


