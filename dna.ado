cap program drop dna
program define dna
	version 9.0
	token "`*'", parse(" ")
	if "`1'" == substr("length",1,length("`1'")) {
		confirm integer number `2'
		if `2' < 1 {
			 error 198
	  	}
		global DNALEN = `2'
		exit
	}
	if "`1'" == substr("population",1,length("`1'")) {
		confirm integer number `2'
		if `2' < 2 {
			error 198
		}
		global DNAPOP = `2'
		exit
	}
	if "`1'" == substr("offspring",1,length("`1'")) {
		confirm integer number `2'
		if `2' < 1 {
			error 198
		}
		global DNAOFF = `2'
		exit
	}
	if "`1'" == substr("selection",1,length("`1'")) {
		confirm number `2'
		if `2' > 1 | `2' < 0 {
			error 198
		}
		global DNASEL = `2'
		exit
	}
	if "`1'" == substr("mutation",1,length("`1'")) {
		confirm number `2'
		if `2' < 0 {
			error 198
		}
		global DNAMUT = `2'
		if "`3'" == "" {
			global DNAMHL = 0
			exit
		}
		confirm number `3'
		global DNAMHL = `3'
		exit
	}
	if "`1'" == substr("radiation",1,length("`1'")) {
		confirm number `2'
		if `2' < 0 {
			error 198
		}
		global DNARAD = `2'
		if "`3'" == "" {
			global DNARHL = 0
			exit
		}
		confirm number `3'
		global DNARHL = `3'
		exit
	}
	if "`1'" == substr("function",1,length("`1'")) {
		confirm name `2'
		global DNAFUN = "`2'"
		exit
	}
	if "`1'" == substr("generations",1,length("`1'")) {
		confirm integer number `2'
		if `2' < 0 {
			error 198
		}
		global DNAGEN = `2'
		exit
	}
	if "`1'" == substr("stagnation",1,length("`1'")) {
		confirm integer number `2'
		if `2' < 0 {
			error 198
		}
		global DNASTA = `2'
		exit
	}
	if "`1'" == substr("define",1,length("`1'")) {
		confirm integer number `2'
		confirm number `3'
		confirm number `4'
		if `2' <= 0 {
			error 198
		}
		global DNAL`2' = min(`3',`4')
		global DNAH`2' = max(`3',`4')
		exit
	}
	if "`1'" == substr("group",1,length("`1'")) {
		confirm integer number `2'
		confirm integer number `3'
		if `2' <= 0 {
			error 198
		}
		if `3' < 0 {
			error 198
		}
		global DNAG`2' = `3'
		exit
	}
	if "`1'" == substr("manual",1,length("`1'")) {
		global DNAMOD = "manual"
	}
	if "`1'" == substr("auto",1,length("`1'")) {
		global DNAMOD = "auto"
	}
	if "`1'" == substr("export",1,length("`1'")) {
		global DNADIS = "export"
	}
	if "`1'" == substr("display",1,length("`1'")) {
		global DNADIS = "display"
	}
	if "`1'" == substr("info",1,length("`1'")) {
		dnaprep ini
		di
		di "{text}{hline 22}{c TT}{hline 10}{c TT}{hline 35}
		di "{text}{ralign 21:Description} {c |} Macro {col 34}{c |} Value"
		di "{text}{hline 22}{c +}{hline 10}{c +}{hline 35}
		if "$DNAFUN" != "" {
			di "{text}{ralign 21:function} {c |} DNAFUN {col 34}{c |}{result} $DNAFUN"
		}
		if "$DNALEN" != "" {
			di "{text}{ralign 21:parameter} {c |} DNALEN {col 34}{c |}{result} $DNALEN"
		}
		if "$DNAPOP" != "" {
			di "{text}{ralign 21:population} {c |} DNAPOP {col 34}{c |}{result} $DNAPOP"
		}
		if "$DNAOFF" != "" {
			di "{text}{ralign 21:offspring} {c |} DNAOFF {col 34}{c |}{result} $DNAOFF"
		}
		if "$DNASEL" != "" {
			di "{text}{ralign 21:selection} {c |} DNASEL {col 34}{c |}{result} $DNASEL"
		}
		if "$DNAMUT" != "" {
			di "{text}{ralign 21:mutation} {c |} DNAMUT {col 34}{c |}{result} $DNAMUT"
		}
		if "$DNAMHL" != "" {
			di "{text}{ralign 21:half-life: mutation} {c |} DNAMHL {col 34}{c |}{result} $DNAMHL"
		}
		if "$DNARAD" != "" {
			di "{text}{ralign 21:radiation} {c |} DNARAD {col 34}{c |}{result} $DNARAD"
		}
		if "$DNARHL" != "" {
			di "{text}{ralign 21:half-life: radiation} {c |} DNARHL {col 34}{c |}{result} $DNARHL"
		}
		if "$DNAMOD" != "" {
			di "{text}{ralign 21:mutation mode} {c |} DNAMOD {col 34}{c |}{result} $DNAMOD"
		}
		if "$DNAGEN" != "" {
			di "{text}{ralign 21:max. generations} {c |} DNAGEN {col 34}{c |}{result} $DNAGEN"
		}
		if "$DNASTA" != "" {
			di "{text}{ralign 21:stagnation} {c |} DNASTA {col 34}{c |}{result} $DNASTA"
		}
		if "$DNADIS" != "" {
			di "{text}{ralign 21:display mode} {c |} DNADIS {col 34}{c |}{result} $DNADIS"
		}
		cap confirm integer number $DNALEN
		if _rc == 0 {
			local i = 1
			while `i' <= $DNALEN {
				local low = "DNAL`i'"
				local high = "DNAH`i'"
				local group = "DNAG`i'"
				local align = 21-length("Parameter `i'")
				di "{text}{hline 22}{c +}{hline 10}{c +}{hline 35}
				di "{text}Parameter `i'{ralign `align': low} {c |} `low' {col 34}{c |}{result} $`low'"
				di "{text}{ralign 21: high} {c |} `high'{col 34}{c |}{result} $`high'"
				di "{text}{ralign 21: group} {c |} `group'{col 34}{c |}{result} $`group'"
				local i = `i'+1
			}
		}
		di "{text}{hline 22}{c BT}{hline 10}{c BT}{hline 35}
		exit
	}
	if "`1'" == substr("clear",1,length("`1'")) {
		macro drop DNA*
		exit
	}
	if "`1'" == substr("go",1,length("`1'")) {
		dnago
	}
end

cap program drop dnago
program define dnago
	version 9.0
	tempname dnag tmp
	if "$DNALEN" == "" {
		di in red "dna length is required"
		error 999
	}
	if "$DNAFUN" == "" {
		di in red "function is required"
		error 999
	}
	dnaprep
	matrix pop = J($DNALEN,2,0)
	local i = 1
	while `i' <= $DNALEN {
		local group = "DNAG`i'"
		matrix pop[`i',1] = `i'
		if "$`group'" != "" {
			matrix pop[`i',2] = $`group'
		}
		local i = `i'+1
	}
	mata: dnasort(2,1)
	matrix `dnag' = pop
	matrix drop pop
	local complex = 0
	local oldg = 0
	local i = 1
	while `i' <= $DNALEN & `dnag'[`i',2] > 0 {
		if `dnag'[`i',2] == `oldg' {
			local complex = `complex'+1
		}
		else {
			local oldg = `dnag'[`i',2]
		}
		local i = `i'+1
	}
	global DNAITER = 0
	global DNAFIT = $DNALEN+1
	global DNAMUTX = $DNAMUT
	global DNARADX = $DNARAD
	local i = 1
	while `i' <= $DNAPOP {
		matrix dna = J(1,$DNAFIT,0)
		local j = 1
		while `j' <= $DNALEN {
			local low = "DNAL`j'"
			local high = "DNAH`j'"
			local val = $`low'+($`high'-$`low')*uniform()
			matrix dna[1,`j'] = `val'
			local j = `j'+1
		}
		$DNAFUN
		if `i' == 1 {
			matrix pop = dna[1,1...]
		}
		else {
			matrix pop = pop \ dna[1,1...]
		}
		local i = `i'+1
	}
	dnadisp
	local mht = 0
	if $DNAMHL > 0 {
		local mht = -ln(2)/$DNAMHL
	}
	local rht = 0
	if $DNARHL > 0 {
		local rht = -ln(2)/$DNARHL
	}
	global DNASTOP = ""
	global DNAITER = 1
	local stag = 0
	while ($DNAITER <= $DNAGEN | $DNAGEN <= 0) & "$DNASTOP" == "" {
		global DNAMUTX = $DNAMUT*exp(`mht'*($DNAITER-1))
		global DNARADX = $DNARAD*exp(`rht'*($DNAITER-1))
		mata: dnaoffspring("`dnag'", `complex')
		matrix `tmp' = J($DNAPOP,1,0) \ J($DNAOFF,1,1)
		matrix pop = pop, `tmp'
		mata: dnasort(-$DNAFIT,$DNAFIT+1)
		matrix pop = pop[1..$DNAPOP,1...]
		dnadisp
		if r(exc) == 0  {
			local stag = `stag'+1
			if `stag' >= $DNASTA & $DNASTA > 0 {
				global DNASTOP = "STAGNATION"
			}
		}
		else {
			local stag = 0
		}
		matrix pop = pop[1...,1..$DNAFIT]
		global DNAITER = $DNAITER+1
	}
	matrix drop `tmp'
	matrix drop `dnag'
	mata: dnasort(-$DNAFIT,0)
	matrix dna = pop[1,1...]
	if "$DNADIS" != "export" {
		local min = min(5,$DNAPOP)
		di "{text}{hline 11}{c TT}{hline 55}
		di "{text} Parameter {c |}" _continue
		local i = 1
		while `i' <= `min' {
			di "	 pop[`i']" _continue
			local i = `i'+1
		}
		di
		di "{text}{hline 11}{c +}{hline 55}
		local i = 1
		while `i' <= $DNALEN {
			di "{result}" %10.0f `i' " {text}{c |}{result}" _continue
			local j = 1
			while `j' <= `min' {
				di " " %10.6g pop[`j',`i'] _continue
				local j = `j'+1
			}
			local i = `i'+1
			di
		}
		di "{text}{hline 11}{c +}{hline 55}
		di "{text}   Fitness {c |}{result}" _continue
		local i = 1
		while `i' <= `min' {
			di " " %10.6g pop[`i',$DNAFIT] _continue
			local i = `i'+1
		}
		di
		di "{text}{hline 11}{c BT}{hline 55}
	}
end

cap program drop dnadisp
program define dnadisp, rclass
	version 9.0
	mata: dnascan()
	local exc = r(exc)
	local health = r(health)
	local fitness = r(fitness)
	if "$DNADIS" == "export" {
		if $DNAITER < 1 {
			di "{text}gen,ex,mut,rad,fitness,health"
		}
		di "{text}" string($DNAITER,"%18.0f") "," trim(string(r(exc),"%18.0f")) "," string($DNAMUTX,"%18.9g") "," string($DNARADX,"%18.9g") "," string(r(fitness),"%18.9g") "," string(r(health),"%18.9g")
	}
	else {
		di "{text}{hline 11}{c TT}{hline 55}
		di "{text}Generation {c |}{col 16}Exchange{col 27}Mutation{col 37}Radiation{col 50}Fitness{col 62}Health"
		di "{text}{hline 11}{c +}{hline 55}
		di "{result}" %10.0f $DNAITER "{text}{col 12}{c |}{result} " %10.0f r(exc) " " %10.6f $DNAMUTX " " %10.6g $DNARADX " " %10.6g r(fitness) " " %10.6g r(health)
		di "{text}{hline 11}{c BT}{hline 55}
	}
	return scalar exc = r(exc)
end

cap program drop dnaprep
program define dnaprep
	version 9.0
	cap confirm integer number $DNALEN
	if _rc == 0  {
		local i = 1
		while `i' <= $DNALEN {
			local low = "DNAL`i'"
			local high = "DNAH`i'"
			local group = "DNAG`i'"
			if "$`low'" == "" | "$`high'" == "" {
				global `low' = -1
				global `high' = 1
			}
			if "$`group'" == "" {
				global `group' = 0
			}
			local i = `i'+1
		}
	}
	if "$DNAPOP" == "" {
		 global DNAPOP = 100
	}
	if "$DNAOFF" == "" {
		 global DNAOFF = $DNAPOP
	}
	if "$DNASEL" == "" {
		 global DNASEL = 1.0
	}
	if "$DNAMUT" == "" {
		 global DNAMUT = 0.25
	}
	if "$DNARAD" == "" {
		 global DNARAD = 4
	}
	if "$DNAMHL" == "" {
		 global DNAMHL = 0
	}
	if "$DNARHL" == "" {
		 global DNARHL = 0
	}
	if "$DNAGEN" == "" {
		 global DNAGEN = 50
	}
	if "$DNASTA" == "" {
		 global DNASTA = 10
	}
	if "$DNAMOD" == "" {
		 global DNAMOD = "auto"
	}
	if "$DNADIS" == "" {
		 global DNADIS = "display"
	}
	if "`1'" == "ini" {
		exit
	}
	confirm integer number $DNALEN
	confirm integer number $DNAPOP
	confirm integer number $DNAOFF
	confirm integer number $DNAGEN
	confirm integer number $DNASTA
	confirm number $DNASEL
	confirm number $DNAMUT
	confirm number $DNARAD
	if $DNALEN < 1 {
		error 198
	}
	if $DNAPOP < 2 {
		error 198
	}
	if $DNAOFF < 1 {
		error 198
	}
	if $DNASEL < 0 | $DNASEL > 1 {
		error 198
	}
	if $DNAMUT < 0 {
		error 198
	}
	if $DNARAD < 0 {
		error 198
	}
	if $DNAGEN < 0 {
		error 198
	}
	if $DNASTA < 0 {
		error 198
	}
	local i = 1
	while `i' <= $DNALEN {
		local low = "DNAL`i'"
		local high = "DNAH`i'"
		local group = "DNAG`i'"
		confirm number $`low'
		confirm number $`high'
		confirm number $`group'
		if $`low' > $`high' {
			error 198
		}
		if $`group' < 0 {
			error 198
		}
		local i = `i'+1
	}
end

version 9.0
mata:
void dnascan()
{	real scalar dnafit
	dnafit = strtoreal(st_global("DNAFIT"))
	pop = st_matrix("pop")
	if (cols(pop) > dnafit)
	{	st_numscalar("r(exc)",colsum(pop[.,dnafit+1])[1])
	}
	else
	{	st_numscalar("r(exc)",0)
	}
	st_numscalar("r(health)",colsum(pop[.,dnafit])[1]:/rows(pop))
	st_numscalar("r(fitness)",colmax(pop[.,dnafit])[1])
}

real scalar dnasel(pointer(real matrix) sel, real scalar pop)
{	real scalar i, ind, sum
	ind = uniform(1,1)[1,1]
	i = 1
	sum = (*sel)[1,1]
	while (i < pop & ind >= sum) {
		i = i+1
		sum = sum+(*sel)[i,1]
	}
	return(i)
}

void dnaoffspring(string groupname, real scalar grouped)
{	real matrix sel, pop, dna, grp, uni
	real scalar dnaoff, dnapop, dnalen, dnarad, dnamut, dnafit, dnasel
	real scalar boy, girl, old, p, i, j, k, min, max, sum, dnamod
	string scalar dnafun
	grp = st_matrix(groupname)
	pop = st_matrix("pop")
	dnaoff = strtoreal(st_global("DNAOFF"))
	dnapop = strtoreal(st_global("DNAPOP"))
	dnalen = strtoreal(st_global("DNALEN"))
	dnarad = strtoreal(st_global("DNARADX"))
	dnamut = strtoreal(st_global("DNAMUTX"))
	dnafit = strtoreal(st_global("DNAFIT"))
	dnasel = strtoreal(st_global("DNASEL"))
	dnamod = st_global("DNAMOD") == "auto"
	dnafun = st_global("DNAFUN")
	sel = pop[.,dnafit]
	min = colmin(sel)[1]
	max = colmax(sel)[1]
	min = min-(max-min)/dnapop
	sel = sel:-min
	sum = (colsum(sel))[1]
	if (sum > 0)
	{	sel = sel:/sum
		if (dnasel < 1)
		{	p = (1/dnapop)*(1-dnasel)
			sel = sel:*dnasel:+p
		}
	}
	else
	{	p = 1/dnapop
		sel = J(dnapop,1,p)
	}
	for (i = 1; i <= dnaoff; i++)
	{	girl = dnasel(&sel, dnapop)
		boy = dnasel(&sel, dnapop)
		p = 0
		while (boy == girl)
		{	p++
			if (p > 3)
			{	girl = trunc(uniform(1,1)[1,1]*dnapop)+1
				boy = trunc(uniform(1,1)[1,1]*dnapop)+1
			}
			else
			{	girl = dnasel(&sel, dnapop)
				boy = dnasel(&sel, dnapop)
			}
		}
		dna = pop[boy,.]
		if (grouped > 0)
		{	j = 1
			while (j <= dnalen)
			{	p = uniform(1,1)[1,1]
				old = grp[j,2]
				k = grp[j,1]
				dna[1,k] = pop[girl,k]*p+dna[1,k]*(1-p)
				j++
				if (old != 0)
				{	while (j <= dnalen)
					{	if (grp[j,2] == old)
						{	break;
						}
						k = grp[j,1]
						dna[1,k] = pop[girl,k]*p+dna[1,k]*(1-p)
						j++
					}
				}
			}
		}
		else
		{	uni = uniform(1,dnalen)[1,1]
			dna = pop[girl,.]:*uni+dna:*(1:-uni)
		}
		if (dnamod == 1)
		{	if (grouped > 0)
			{	j = 1
				while (j <= dnalen)
				{	old = grp[j,2]
					p = uniform(1,1)[1,1]
					if (p < dnamut)
					{	p = uniform(1,1)[1,1]
						k = grp[j,1]
						dna[1,k] = dna[1,k]+dna[1,k]*(p*dnarad*2-dnarad)
						j = j+1
						if (old != 0)
						{	while (j <= dnalen)
							{	if (grp[j,2] == old)
								{	break
								}
								k = grp[j,1]
								dna[1,k] = dna[1,k]+dna[1,k]*(p*dnarad*2-dnarad)
								j++
							}
						}
					}
					else
					{	if (old != 0)
						{	while (j <= dnalen)
							{	if (grp[j,2] == old)
								{	break
								}
								j++
							}
						}
					}
				}
			}
			else
			{	uni = uniform(1,dnalen):<dnamut
				uni = uni:*(uniform(1,dnalen):*(2*dnarad):-dnarad)
				uni = uni,0
				dna = dna:+dna:*uni
			}
		}
		st_matrix("dna",dna)
		stata(dnafun)
		dna = st_matrix("dna")
		pop = pop \ dna
	}
	st_matrix("pop",pop)
}

void dnasort(real scalar row1, real scalar row2)
{	real matrix pop
	pop = st_matrix("pop")
	if (row2 > 0)
	{	_sort(pop,(row1,row2))
	}
	else
	{	_sort(pop,(row1))
	}
	st_matrix("pop",pop)
}
end

