# figClines_afs.R
#
# Author: Ben Phillips (phillipsb@unimelb.edu.au)
#
# This file produces a figure that shows trait clines for a tradeoff in a_fs.


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

nr<-3 # for plotting, only do the first three rows
xaxs.mat<-matrix(rep(c(rep("n", nr-1), "s"), nc), ncol=nc)
yaxs.mat<-matrix(rep(c("s", "n", "n"), each=nr), ncol=nc)
muvec<-1-c(1.0, 0.99, 0.95, 0.5)

r.plot<-function(toff.no, toff.yes, dens, ...){
	plot(NULL,NULL,xlim=range(Distance),ylim=c(0,1),las=1, ...)
	lines(Distance,rep(.5,length(Distance)),col=rgb(0,0,0,.4),lty=2)
	ltps = c(rep(1, length(times.plot)-1), 1)
	als = c(rep(0.3, length(times.plot)-1), 1)
	lwds = 	seq(3, 1, length.out=length(times.plot))
	for(tt in times.plot){
	  cc = which(times.plot==tt)
	  lines(
		Distance,
		rev(dens[tt,]),col=rgb(179,179,179,als[cc]*255, max=255), lty=ltps[cc], lwd=lwds[cc])
	  lines(
		Distance,
		rev(toff.yes[tt,]),col=rgb(1,0,0,als[cc]),lty=ltps[cc], lwd=lwds[cc])
	  lines(
		Distance,
		rev(toff.no[tt,]),col=rgb(0,0,1,als[cc]), lty=ltps[cc], lwd=lwds[cc])
	}
}


#plot it
pdf('../output/clines_afs.pdf',width = 6.5,height=5.5)

layout(matrix(1:(nc*nr),nr,nc))

par(mar=rep(0,4),oma=c(5,5,3,3))

for(cc in 1:nc){
	for(rr in 1:nr){
		#print(cbind(pnames[rr, cc], pnames[rr+4, cc], xaxs.mat[rr, cc], yaxs.mat[rr, cc] ))
		r.plot(get(pnames.nto[rr]), get(pnames[rr, cc]), get(pnames.nt[rr, cc]), 
			xaxt=xaxs.mat[rr, cc],
			yaxt=yaxs.mat[rr, cc])
		
		if (cc==1 & rr==nr) legend('bottomleft',c(expression(paste('No tradeoff (', a[fs], ' = ', a[sf], ' = 1.0)')),
			expression(paste('Tradeoff (', a[fs], ' = 0.9)')), 'Scaled density'),
			col=c(4,2,'grey70'),lwd=2,lty=1,bty='n')
  		
  		if (cc==1 & rr==1) mtext(expression(paste(a[sf],' = 0.95')),3,line=1)
		if (cc==2 & rr==1) mtext(expression(paste(a[sf],' = 1.0')),3,line=1)
		if (cc==3 & rr==1) mtext(expression(paste(a[sf],' = 1.05')),3,line=1)
		
		if (cc==nc) mtext(bquote(mu==.(muvec[rr])),4,line=1)
		if (cc==1 & rr==2) mtext('Proportion Fast Type / Scaled Density',2,at = 0.5,line=3)
		if (cc==2 & rr==nr) mtext('Distance from the invasion origin',1,line = 3)
	}
}

dev.off()
