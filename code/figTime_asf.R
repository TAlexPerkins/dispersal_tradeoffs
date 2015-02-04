# figTime_asf.R
#
# Author: Ben Phillips (phillipsb@unimelb.edu.au)
#
# This file produces a figure that shows the temporal effect of a tradeoff in a_sf.


# express matrices as proportion fast
fmats<-ls()[grepl("fast.", ls())]
fmats<-fmats[grepl("h2_", fmats)]

smats<-ls()[grepl("slow.", ls())]
smats<-smats[grepl("h2_", smats)]

fmats.nto<-ls()[grepl("fast.", ls())]
fmats.nto<-fmats.nto[!(grepl("yes", fmats.nto) | grepl("h2_", fmats.nto) | grepl("indep", fmats.nto))]

smats.nto<-ls()[grepl("slow.", ls())]
smats.nto<-smats.nto[!(grepl("yes", smats.nto) | grepl("h2_", smats.nto) | grepl("indep", smats.nto))]

pnames<-c()
pnames.nt<-c()
for (ii in 1:length(fmats)){
	fast<-get(fmats[ii])
	slow<-get(smats[ii])
	mname<-gsub("fast.", "", fmats[ii])
	assign(mname, fast/(fast+slow))
	pnames<-c(pnames, mname)
	mname<-gsub("fast.", "NT", fmats[ii])
	assign(mname, fast+slow)
	pnames.nt<-c(pnames.nt, mname)
	
}

pnames.nto<-c()
for (ii in 1:length(fmats.nto)){
	fast<-get(fmats.nto[ii])
	slow<-get(smats.nto[ii])
	mname<-gsub("fast.", "", fmats.nto[ii])
	assign(mname, fast/(fast+slow))
	pnames.nto<-c(pnames.nto, mname)
}


# arrange in a matrix for plotting
nc<-3; nr<-4 #n rows and columns

ord<-c()
for (ii in 1:nc){
	ord<-c(ord, seq(ii, by=nr-1, length.out=nr))
}
pnames<-matrix(pnames[ord], nrow=nr, ncol=nc)[, c(3,1,2)]
pnames.nt<-matrix(pnames.nt[ord], nrow=nr, ncol=nc)[, c(3,1,2)]

nr<-3
xaxs.mat<-matrix(rep(c(rep("n", nr-1), "s"), nc), ncol=nc)
yaxs.mat<-matrix(rep(c("s", "n", "n"), each=nr), ncol=nc)
hvec<-c(1.0, 0.99, 0.95, 0.5)

#plot function
time.plot<-function(toff.no, toff.yes, dens, x, ...){
	plot(NULL,NULL,xlim=range(times),ylim=c(0,1),las=1, ...)
	lines(times,rep(.5,length(times)),col=rgb(0,0,0,.4),lty=2)
	dist.ind<-numboxes-x*10
	ts.dens<-dens[,dist.ind]
	ts.no<-toff.no[,dist.ind]
	ts.yes<-toff.yes[,dist.ind]
	lines(times, ts.dens/max(ts.dens, na.rm=TRUE), col="grey70", lwd=2)
	lines(times, ts.no, col=4, lwd=2)
	lines(times, ts.yes, col=2, lwd=2)
}

#plot it
pdf('../output/time_asf.pdf',width = 6.5,height=5.5)

layout(matrix(1:(nc*nr),nr,nc))

par(mar=rep(0,4),oma=c(5,5,3,3))

for(cc in 1:nc){
	for(rr in 1:nr){
		#print(cbind(pnames.nto[rr], pnames[rr, cc], xaxs.mat[rr, cc], yaxs.mat[rr, cc] ))
		time.plot(get(pnames.nto[rr]), get(pnames[rr, cc]), get(pnames.nt[rr, cc]), 10, 
			xaxt=xaxs.mat[rr, cc],
			yaxt=yaxs.mat[rr, cc])
		if (cc==1 & rr==nr) legend('bottomleft',c(expression(paste('No tradeoff (', a[fs], ' = ', a[sf], ' = 1.0)')),
			expression(paste('Tradeoff (', a[sf], ' = 1.1)')), 'Scaled density'),
			col=c(4,2,'grey70'),lwd=2,lty=1,bty='n')
  		
  		if (cc==1 & rr==1) mtext(expression(paste(a[fs],' = 0.95')),3,line=1)
		if (cc==2 & rr==1) mtext(expression(paste(a[fs],' = 1.0')),3,line=1)
		if (cc==3 & rr==1) mtext(expression(paste(a[fs],' = 1.05')),3,line=1)
		
		if (cc==nc) mtext(bquote(mu==.(muvec[rr])),4,line=1)
		if (cc==1 & rr==2) mtext('Proportion Fast Type / Scaled Density',2,at = 0.5,line=3)
		if (cc==2 & rr==nr) mtext('Time',1,line = 3)
	}
}

dev.off()
