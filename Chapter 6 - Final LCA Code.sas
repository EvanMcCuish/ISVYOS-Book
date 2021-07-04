


%INCLUDE "C:\Users\ecm2\Desktop\LCAMacros\LcaGraphicsV2.sas";
PROC LCA data = sasuser.ASB OUTPARAM = out2 OUTPOST = out1;
TITLE 'TEST';
NCLASS 4;
ID Code_;
ITEMS DisturbClass Cheated Impolite SkipSchool Bully Fighting HitStudent HitTeacher Drunk High UseAlcohol UseDrugs
Weapon Late DestProp Stealing SexInapp SellIllegal;
Categories 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2;
SEED 861551;
Rho Prior = 1 ;
NSTARTS 20 ;
%ItemResponsePlot(ParamDataset = out2) ;
RUN ; 



%INCLUDE "C:\Users\ecm2\Desktop\LCAMacros\LcaGraphicsV2.sas";
PROC LCA data = sasuser.ASB OUTPOST=out1
OUTPARAM = out2 ;
TITLE 'TEST';
NCLASS 3;
ID Code_;
ITEMS Alcohol Marijuana Ecstasy Hallucin Prescription_Pills Cocaine Crack_Cocaine Crystal_Meth
 Heroin;
Categories 2 2 2 2 2 2 2 2 2 ;
SEED 861551;
Rho Prior = 1 ;
NSTARTS 20 ;
%ItemResponsePlot(ParamDataset = out2) ;
RUN ; 




%INCLUDE "C:\Users\ecm2\Desktop\LCAMacros\LcaGraphicsV2.sas";
PROC LCA data = sasuser.ASB OUTPOST=out1 OUTPARAM = out2 ;
NCLASS 3;
ID Code_;
ITEMS Trouble_Partying Trouble_Lying Trouble_Weapon Trouble_People Trouble_Law Trouble_Curfew Trouble_Stealing Trouble_HouseRules Trouble_Drugs
Trouble_Drinking Trouble_FightingSiblings Trouble_GirlBoy Trouble_Smoking Trouble_StealCar;
Categories 2 2 2 2 2 2 2 2 2 2 2 2 2 2;
SEED 861551;
Rho Prior = 1 ;
NSTARTS 20 ;
%ItemResponsePlot(ParamDataset = out2) ;
RUN ; 




%INCLUDE "C:\Users\ecm2\Desktop\LCAMacros\LcaGraphicsV2.sas";
PROC LCA data = sasuser.ASB OUTPOST=out1 OUTPARAM = out2 ;
NCLASS 3;
ID Code_;
ITEMS AngryFight TeaseHit Enc_Hassle Throw_Obj Carry_Weap FistFight Threat_Beat Abuse_Want Beat_Nothing
Force_Dominate Weap_Fight Gang_Fight;
Categories 2 2 2 2 2 2 2 2 2 2 2 2;
SEED 861551;
Rho Prior = 1 ;
NSTARTS 20 ;
%ItemResponsePlot(ParamDataset = out2) ;
RUN ; 






%INCLUDE "C:\Users\ecm2\Desktop\LCAMacros\LcaGraphicsV2.sas";
PROC LCA data = sasuser.ASB OUTPOST=out1 OUTPARAM = out2 ;
NCLASS 2;
ID Code_;
ITEMS PropDamage_Early FakeID_Early NoCover_Early DriveNoLis_Early TakeVehicle_Early
SellAuto_Early MinorTheft_Early Keep_More100_Early Used_Stolen_Early Ent_Plce_Early Broke_Ent_Early;
Categories 2 2 2 2 2 2 2 2 2 2 2;
SEED 861551;
Rho Prior = 1 ;
NSTARTS 20 ;
%ItemResponsePlot(ParamDataset = out2) ;
RUN ; 





%INCLUDE "C:\Users\ecm2\Desktop\LCAMacros\LcaGraphicsV2.sas";
PROC LCA data = sasuser.ASB OUTPOST=out1 OUTPARAM = out2 ;
NCLASS 4;
ID Code_;
ITEMS PropDamage_12up FakeID_12up NoCover_12up MinorTheft_Early_12up DriveNoLis_12up TakeVehicle_12up
SellAuto_12up Keep_More100_12up Used_Stolen_12up Ent_Plce_12up Broke_Ent_12up;
Categories 2 2 2 2 2 2 2 2 2 2 2;
SEED 861551;
Rho Prior = 1 ;
NSTARTS 20 ;
%ItemResponsePlot(ParamDataset = out2) ;
RUN ; 




%INCLUDE "C:\Users\ecm2\Desktop\LCAMacros\LcaGraphicsV2.sas";
PROC LCA data = sasuser.ASB OUTPOST=out1 OUTPARAM = out2 ;
NCLASS 3;
ID Code_;
ITEMS PorT_Drugs_Early Attemp_MVTheft_Early Harass_Early Threaten_Early TheftHouse_Early TheftPerson_Early BE_Early
Rob_Early Assault_Early Assault_Weap_Early;
Categories 2 2 2 2 2 2 2 2 2 2;
SEED 861551;
Rho Prior = 1 ;
NSTARTS 20 ;
%ItemResponsePlot(ParamDataset = out2) ;
RUN ; 



%INCLUDE "C:\Users\ecm2\Desktop\LCAMacros\LcaGraphicsV2.sas";
PROC LCA data = sasuser.ASB OUTPOST=out1 OUTPARAM = out2 ;
NCLASS 4;
ID Code_;
ITEMS Breach_12up PorT_Drugs_12up Attemp_MVTheft_12up Harass_12up Threaten_12up TheftHouse_12up
TheftPerson_12up BE_12up Rob_12up Assault_12up Assault_Weap_12up SexAssault_12up Homicide_12up;
Categories 2 2 2 2 2 2 2 2 2 2 2 2 2;
SEED 861551;
Rho Prior = 1 ;
NSTARTS 20 ;
%ItemResponsePlot(ParamDataset = out2) ;
RUN ; 





%INCLUDE "C:\Users\ecm2\Desktop\LCAMacros\LcaGraphicsV2.sas";
PROC LCA data = sasuser.ASB OUTPOST=out1 OUTPARAM = out2 ;
NCLASS 4;
ID Code_;
ITEMS Youth_Violent_Conviction Youth_Property_Convction Youth_Violation_Conviction Youth_Weapon_Conviction
Youth_Miscellaneous_Conviction Youth_Drug_Conviction Youth_Sexual_Conviction;
Categories 2 2 2 2 2 2 2;
SEED 861551;
Rho Prior = 1 ;
NSTARTS 20 ;
%ItemResponsePlot(ParamDataset = out2) ;
RUN ; 
