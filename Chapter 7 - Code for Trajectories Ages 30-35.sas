*Youth only analysis;

PROC TRAJ DATA = sasuser.YOUTHTRAJONLY OUTPLOT=OP OUTSTAT = OS OUT= OF OUTEST = OE ITDETAIL ;
  ID Code_ ; VAR C12-C17; INDEP T12-T17 ; EXPOS EX12-EX17; 
        MODEL ZIP; NGROUPS 3; ORDER 1 1 1; 
        RUN;

        %TRAJPLOT (OP, OS, 'Offense vs. Time', 'Zero Inflated Poisson' , 'Offenses', 'Scaled Age') ;


*EA ONLY ANALYSIS;


PROC TRAJ DATA = sasuser.EATRAJONLY OUTPLOT=OP OUTSTAT = OS OUT= OF OUTEST = OE ITDETAIL ;
  ID Code_ ; VAR C18-C23; INDEP T18-T23 ; EXPOS EX18-EX23; 
        MODEL ZIP; NGROUPS 5; ORDER 2 2 2 2 2; 
        RUN;

        %TRAJPLOT (OP, OS, 'Offense vs. Time', 'Zero Inflated Poisson' , 'Offenses', 'Scaled Age') ;


*FA ONLY ANALYSIS;


PROC TRAJ DATA = sasuser.FATRAJONLY OUTPLOT=OP OUTSTAT = OS OUT= OF OUTEST = OE ITDETAIL ;
  ID Code_ ; VAR C24-C29; INDEP T24-T29 ; EXPOS EX24-EX29; 
        MODEL ZIP; NGROUPS 4; ORDER 2 2 2 2; 
        RUN;

        %TRAJPLOT (OP, OS, 'Offense vs. Time', 'Zero Inflated Poisson' , 'Offenses', 'Scaled Age') ;



*MA ONLY ANALYSIS;


PROC TRAJ DATA = sasuser.MATRAJONLY OUTPLOT=OP OUTSTAT = OS OUT= OF OUTEST = OE ITDETAIL ;
  ID Code_ ; VAR C30-C35; INDEP T30-T35 ; EXPOS EX30-EX35; 
        MODEL ZIP; NGROUPS 4; ORDER 2 2 2 2; 
        RUN;

        %TRAJPLOT (OP, OS, 'Offense vs. Time', 'Zero Inflated Poisson' , 'Offenses', 'Scaled Age') ;

