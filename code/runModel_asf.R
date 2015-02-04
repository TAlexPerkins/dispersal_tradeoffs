# runModel_asf.R
#
# Author: Alex Perkins (taperkins@nd.edu)
#
# This file solves the density-dependent version of the model under
# different scenarios about a tradeoff in a_sf and values of the
# heritability parameter and a_fs.



# no tradeoff in r
r = 1



# density dependent

# no tradeoff in a_fs or a_sf
a_fs = a_sf = 1

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



# tradeoff in a_sf
a_sf = a_sf.highest

# low a_fs
a_fs = a_fs.low

# no h2
h = h.no
source('solve_densdep.R')
slow.densdep_yestradeoff_noh2_lt = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_noh2_lt = out[,ncol(out):((ncol(out)-1)/2+2)]

# high h2
h = h.high
source('solve_densdep.R')
slow.densdep_yestradeoff_highh2_lt = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_highh2_lt = out[,ncol(out):((ncol(out)-1)/2+2)]

# higher h2
h = h.higher
source('solve_densdep.R')
slow.densdep_yestradeoff_higherh2_lt = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_higherh2_lt = out[,ncol(out):((ncol(out)-1)/2+2)]

# complete h2
h = h.complete
source('solve_densdep.R')
slow.densdep_yestradeoff_completeh2_lt = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_completeh2_lt = out[,ncol(out):((ncol(out)-1)/2+2)]


# medium a_fs
a_fs = a_fs.med

# no h2
h = h.no
source('solve_densdep.R')
slow.densdep_yestradeoff_noh2_eq = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_noh2_eq = out[,ncol(out):((ncol(out)-1)/2+2)]

# high h2
h = h.high
source('solve_densdep.R')
slow.densdep_yestradeoff_highh2_eq = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_highh2_eq = out[,ncol(out):((ncol(out)-1)/2+2)]

# higher h2
h = h.higher
source('solve_densdep.R')
slow.densdep_yestradeoff_higherh2_eq = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_higherh2_eq = out[,ncol(out):((ncol(out)-1)/2+2)]

# complete h2
h = h.complete
source('solve_densdep.R')
slow.densdep_yestradeoff_completeh2_eq = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_completeh2_eq = out[,ncol(out):((ncol(out)-1)/2+2)]


# high a_fs
a_fs = a_fs.high

# no h2
h = h.no
source('solve_densdep.R')
slow.densdep_yestradeoff_noh2_gt = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_noh2_gt = out[,ncol(out):((ncol(out)-1)/2+2)]

# high h2
h = h.high
source('solve_densdep.R')
slow.densdep_yestradeoff_highh2_gt = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_highh2_gt = out[,ncol(out):((ncol(out)-1)/2+2)]

# higher h2
h = h.higher
source('solve_densdep.R')
slow.densdep_yestradeoff_higherh2_gt = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_higherh2_gt = out[,ncol(out):((ncol(out)-1)/2+2)]

# complete h2
h = h.complete
source('solve_densdep.R')
slow.densdep_yestradeoff_completeh2_gt = out[,((ncol(out)-1)/2+1):2]
fast.densdep_yestradeoff_completeh2_gt = out[,ncol(out):((ncol(out)-1)/2+2)]
