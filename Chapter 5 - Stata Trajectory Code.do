

*IMPORTANT - READ BEFORE RUNNING.


*TO RERUN ALL ANALYSES BELOW, YOU WILL NEED TO CHANGE "E" TO "EX"; YOU HAD TO CHANGE IN DATASETS BECAUSE CAPP EMOTION DOMAIN STARTED W. "E".



*EA trajectory model.


traj, var(C12-C23) indep(T12-T23) model(zip) order(2) expos (E12-E23)

traj, var(C12-C23) indep(T12-T23) model(zip) order(2 2) expos (E12-E23)

traj, var(C12-C23) indep(T12-T23) model(zip) order(2 2 2) expos (E12-E23)

traj, var(C12-C23) indep(T12-T23) model(zip) order(2 2 2 2) expos (E12-E23)


*SELECTED 5GRP MODEL.
traj, var(C12-C23) indep(T12-T23) model(zip) order(2 2 2 2 2) expos (E12-E23)

traj, var(C12-C23) indep(T12-T23) model(zip) order(2 2 2 2 2 2) expos (E12-E23)

traj, var(C12-C23) indep(T12-T23) model(zip) order(2 2 2 2 2 2 2) expos (E12-E23)

traj, var(C12-C23) indep(T12-T23) model(zip) order(2 2 2 2 2 2 2 2) expos (E12-E23)

trajplot,xtitle(Age) ytitle(Convictions)



*FA trajectory model.


traj, var(C12-C29) indep(T12-T29) model(zip) order(2) expos (E12-E29)

traj, var(C12-C29) indep(T12-T29) model(zip) order(2 2) expos (E12-E29)

traj, var(C12-C29) indep(T12-T29) model(zip) order(2 2 2) expos (E12-E29)


*SELECTED 4GRP MODEL.
traj, var(C12-C29) indep(T12-T29) model(zip) order(2 2 2 2) expos (E12-E29)

traj, var(C12-C29) indep(T12-T29) model(zip) order(2 2 2 2 2) expos (E12-E29)

traj, var(C12-C29) indep(T12-T29) model(zip) order(2 2 2 2 2 2) expos (E12-E29)

traj, var(C12-C29) indep(T12-T29) model(zip) order(2 2 2 2 2 2 2) expos (E12-E29)

traj, var(C12-C29) indep(T12-T29) model(zip) order(2 2 2 2 2 2 2 2) expos (E12-E29)

traj, var(C12-C29) indep(T12-T29) model(zip) order(2 2 2 2 2 2 2 2 2) expos (E12-E29)


trajplot,xtitle(Age) ytitle(Convictions)



*MA trajectory model.


traj, var(C12-C35) indep(T12-T35) model(zip) order(2) expos (E12-E35)

traj, var(C12-C35) indep(T12-T35) model(zip) order(2 2) expos (E12-E35)

traj, var(C12-C35) indep(T12-T35) model(zip) order(2 2 2) expos (E12-E35)

traj, var(C12-C35) indep(T12-T35) model(zip) order(2 2 2 2) expos (E12-E35)

*SELECTED 5GRP MODEL.
traj, var(C12-C35) indep(T12-T35) model(zip) order(2 2 2 2 2) expos (E12-E35)

traj, var(C12-C35) indep(T12-T35) model(zip) order(2 2 2 2 2 2) expos (E12-E35)

traj, var(C12-C35) indep(T12-T35) model(zip) order(2 2 2 2 2 2 2) expos (E12-E35)

traj, var(C12-C35) indep(T12-T35) model(zip) order(2 2 2 2 2 2 2 2) expos (E12-E35)


trajplot,xtitle(Age) ytitle(Convictions)


*Youth Only Trajectory MNodel.


traj, var(C12-C17) indep(T12-T17) model(zip) order(2) expos (E12-E17)

traj, var(C12-C17) indep(T12-T17) model(zip) order(1 1) expos (E12-E17)

traj, var(C12-C17) indep(T12-T17) model(zip) order(1 1 1) expos (E12-E17)

traj, var(C12-C17) indep(T12-T17) model(zip) order(0 0 0 0) expos (E12-E17)

traj, var(C12-C17) indep(T12-T17) model(zip) order(1 1 1 1 1) expos (E12-E17)

traj, var(C12-C17) indep(T12-T17) model(zip) order(2 2 2 2 2 2) expos (E12-E17)

traj, var(C12-C17) indep(T12-T17) model(zip) order(2 2 2 2 2 2 2) expos (E12-E17)

traj, var(C12-C17) indep(T12-T17) model(zip) order(2 2 2 2 2 2 2 2) expos (E12-E17)


trajplot,xtitle(Age) ytitle(Convictions)





*Andrew Wheeler's Code.

*I made a function to print out summary stats
program summary_table_procTraj
    preserve
    *now lets look at the average posterior probability
	gen Mp = 0
	foreach i of varlist _traj_ProbG* {
	    replace Mp = `i' if `i' > Mp 
	}
    sort _traj_Group
    *and the odds of correct classification
    by _traj_Group: gen countG = _N
    by _traj_Group: egen groupAPP = mean(Mp)
    by _traj_Group: gen counter = _n
    gen n = groupAPP/(1 - groupAPP)
    gen p = countG/ _N
    gen d = p/(1-p)
    gen occ = n/d
    *Estimated proportion for each group
    scalar c = 0
    gen TotProb = 0
    foreach i of varlist _traj_ProbG* {
       scalar c = c + 1
       quietly summarize `i'
       replace TotProb = r(sum)/ _N if _traj_Group == c 
    }
	gen d_pp = TotProb/(1 - TotProb)
	gen occ_pp = n/d_pp
    *This displays the group number [_traj_~p], 
    *the count per group (based on the max post prob), [countG]
    *the average posterior probability for each group, [groupAPP]
    *the odds of correct classification (based on the max post prob group assignment), [occ] 
    *the odds of correct classification (based on the weighted post. prob), [occ_pp]
    *and the observed probability of groups versus the probability [p]
    *based on the posterior probabilities [TotProb]
    list _traj_Group countG groupAPP occ occ_pp p TotProb if counter == 1
    restore
end

summary_table_procTraj




