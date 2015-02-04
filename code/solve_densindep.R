# solve_densindep.R
#
# Author: Alex Perkins (taperkins@nd.edu)
#
# This file solves the model with density-independent population dynamics.



n.s = n.f = rep(0, numboxes)
n.s[1] = initial.ns
n.f[1] = initial.nf
state = c(n.s, n.f)

out = ode.1D(
  state,
  times,
  func.model.densindep,
  parms = 0,
  nspec = 2,
  names = c('n.s', 'n.f'))
