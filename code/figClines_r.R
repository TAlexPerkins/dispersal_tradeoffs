# figClines_r.R
#
# Author: Alex Perkins (taperkins@nd.edu), Ben Phillips (phillipsb@unimelb.edu.au)
#
# This file produces a figure that shows the effect of a tradeoff in r.

# express matrices as proportion fast, and total N
fmats<-ls()[grepl("fast.", ls())]
smats<-ls()[grepl("slow.", ls())]

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

# arrange in a matrix for plotting
pnames<-matrix(pnames, nrow=8, ncol=2)[,2:1]
pnames.nt<-matrix(pnames.nt, nrow=8, ncol=2)[,2:1]
xaxs.mat<-matrix(rep(c(rep("n", 2), "s"), 2), ncol=2)
yaxs.mat<-matrix(rep(c("s", "n"), each=3), ncol=2)
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



pdf('../output/clines_r.pdf',width = 4.68,height=5.5)

layout(matrix(1:6,3,2))

par(mar=rep(0,4),oma=c(5,5,3,3))

times.plot = seq(1,5001,by=1000)

for(cc in 1:2){
	for(rr in 1:3){
		#print(cbind(pnames[rr, cc], pnames[rr+4, cc], xaxs.mat[rr, cc], yaxs.mat[rr, cc] ))
		r.plot(get(pnames[rr, cc]), get(pnames[rr+4, cc]), get(pnames.nt[rr, cc]), 
			xaxt=xaxs.mat[rr, cc],
			yaxt=yaxs.mat[rr, cc])
		if (cc==1 & rr==3) legend('bottomleft',c('No tradeoff (r = 1.0)', 'Tradeoff (r = 0.9)', 'Scaled density'),col=c(4,2,"grey70"),lwd=2,lty=1,bty='n')
		if (cc==1 & rr==1) mtext('Density independent',3,line=1)
		if (cc==2 & rr==1) mtext('Density dependent',3,line=1)
		if (cc==2) mtext(bquote(mu==.(muvec[rr])),4,line=1)
		if (cc==1 & rr==2) mtext('Proportion Fast Type / Scaled Density',2,at = 0.5,line=3)
		if (cc==2 & rr==3) mtext('Time',1,line = 3,at=-1)
	}
}

dev.off()