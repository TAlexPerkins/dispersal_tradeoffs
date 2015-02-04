# functions.R
#
# Author: Alex Perkins (taperkins@nd.edu)
#
# This file contains two functions that specify the model for use
# in the differential equation solver.



# model with density-dependent population dynamics
func.model.densdep = function(t, n, parameters){
  n.s = n[1 : numboxes]
  n.f = n[(numboxes + 1) : (2 * numboxes)]

  deltax = c(1, rep(1, numboxes - 1), 1)
  Flux.s = -diff(c(n.s[1], n.s, n.s[length(n.s)])) / deltax
  Flux.f = -D * diff(c(n.f[1], n.f, n.f[length(n.f)])) / deltax
#   deltax = c(0.5, rep(1, numboxes - 1), 0.5)
#   Flux.s = -diff(c(0, n.s, 0)) / deltax
#   Flux.f = -D * diff(c(0, n.f, 0)) / deltax
  dn.s = -diff(Flux.s) / delx + (1-h) * r * n.f + n.s * (h - (n.s + a_fs * n.f))
  dn.f = -diff(Flux.f) / delx + (1-h) * n.s + n.f * r * (h - (a_sf * n.s + n.f))

  list(c(dn.s, dn.f))
}



# model with density-independent population dynamics
func.model.densindep = function(t, n, parameters){
  n.s = n[1 : numboxes]
  n.f = n[(numboxes + 1) : (2 * numboxes)]
  
  deltax = c(1, rep(1, numboxes - 1), 1)
  Flux.s = -diff(c(n.s[1], n.s, n.s[length(n.s)])) / deltax
  Flux.f = -D * diff(c(n.f[1], n.f, n.f[length(n.f)])) / deltax
  #   deltax = c(0.5, rep(1, numboxes - 1), 0.5)
  #   Flux.s = -diff(c(0, n.s, 0)) / deltax
  #   Flux.f = -D * diff(c(0, n.f, 0)) / deltax
  dn.s = -diff(Flux.s) / delx + (1-h) * r * n.f + n.s * h
  dn.f = -diff(Flux.f) / delx + (1-h) * n.s + n.f * r * h
  
  list(c(dn.s, dn.f))
}
