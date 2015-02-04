# runModel_r.R
#
# Author: Alex Perkins (taperkins@nd.edu)
#
# This file solves density-dependent and independent versions of
# the model under different scenarios about a tradeoff in r and
# values of the heritability parameter.



# no tradeoff in a_fs or a_sf
a_fs = 1
a_sf = 1



# density dependent

# no tradeoff in r
r = 1

# no h2
h = h.no
source('solve_densdep.R')
slow.densdep_notradeoff_noh2 = out[,((ncol(out)-1)/2+1):2]
fast.densdep_notradeoff_noh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# high h2
h = h.high
source('solve_densdep.R')
slow.densdep_notradeoff_highh2 = out[,((ncol(out)-1)/2+1):2]
fast.densdep_notradeoff_highh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# higher h2
h = h.higher
source('solve_densdep.R')
slow.densdep_notradeoff_higherh2 = out[,((ncol(out)-1)/2+1):2]
fast.densdep_notradeoff_higherh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# complete h2
h = h.complete
source('solve_densdep.R')
slow.densdep_notradeoff_completeh2 = out[,((ncol(out)-1)/2+1):2]
fast.densdep_notradeoff_completeh2 = out[,ncol(out):((ncol(out)-1)/2+2)]


# tradeoff in r
r = r.low

# no h2
h = h.no
source('solve_densdep.R')
slow.densdep_yestradeoff_noh2 = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_noh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# high h2
h = h.high
source('solve_densdep.R')
slow.densdep_yestradeoff_highh2 = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_highh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# higher h2
h = h.higher
source('solve_densdep.R')
slow.densdep_yestradeoff_higherh2 = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_higherh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# complete h2
h = h.complete
source('solve_densdep.R')
slow.densdep_yestradeoff_completeh2 = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_completeh2 = out[,ncol(out):((ncol(out)-1)/2+2)]



# density independent

# no tradeoff in r
r = 1

# no h2
h = h.no
source('solve_densindep.R')
slow.densindep_notradeoff_noh2 = out[,((ncol(out)-1)/2+1):2]
fast.densindep_notradeoff_noh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# high h2
h = h.high
source('solve_densindep.R')
slow.densindep_notradeoff_highh2 = out[,((ncol(out)-1)/2+1):2]
fast.densindep_notradeoff_highh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# higher h2
h = h.higher
source('solve_densindep.R')
slow.densindep_notradeoff_higherh2 = out[,((ncol(out)-1)/2+1):2]
fast.densindep_notradeoff_higherh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# complete h2
h = h.complete
source('solve_densindep.R')
slow.densindep_notradeoff_completeh2 = out[,((ncol(out)-1)/2+1):2]
fast.densindep_notradeoff_completeh2 = out[,ncol(out):((ncol(out)-1)/2+2)]


# tradeoff in r
r = r.low

# no h2
h = h.no
source('solve_densindep.R')
slow.densindep_yestradeoff_noh2 = out[,((ncol(out)-1)/2+1):2]
fast.densindep_yestradeoff_noh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# high h2
h = h.high
source('solve_densindep.R')
slow.densindep_yestradeoff_highh2 = out[,((ncol(out)-1)/2+1):2]
fast.densindep_yestradeoff_highh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# higher h2
h = h.higher
source('solve_densindep.R')
slow.densindep_yestradeoff_higherh2 = out[,((ncol(out)-1)/2+1):2]
fast.densindep_yestradeoff_higherh2 = out[,ncol(out):((ncol(out)-1)/2+2)]

# complete h2
h = h.complete
source('solve_densindep.R')
slow.densindep_yestradeoff_completeh2 = out[,((ncol(out)-1)/2+1):2]
fast.densindep_yestradeoff_completeh2 = out[,ncol(out):((ncol(out)-1)/2+2)]
