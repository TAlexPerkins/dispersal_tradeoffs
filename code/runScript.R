# runScript.R
#
# Author: Alex Perkins (taperkins@nd.edu)
#
# This file contains a script that loads all necessary packages and
# functions, controls values of all parameters, runs the model under
# those different parameter sets, and produces all figures.



# load packages and functions
if(!require(deSolve)){install.packages('deSolve');library(deSolve)}
source('functions.R')



# declare parameter values for model runs

# spatial domain to solve the model on
delx = .1
numboxes = 350
Distance = seq(from = 0.5, by = delx, length.out = numboxes)

# time domain to solve the model on
time.max = 50
time.by = .01
times = seq(0, time.max, by = time.by)

# initial proportions of the two types
initial.ns = .1
initial.nf = .1

# dispersal of fast type relative to slow type
D = 1.2

# growth rate at low density of slow type relative to fast type
r.low = .9

# interference of fast type on slow type
a_fs.lowest = .9
a_fs.low = .95
a_fs.med = 1
a_fs.high = 1.05

# interference of slow type on fast type
a_sf.low = .95
a_sf.med = 1
a_sf.high = 1.05
a_sf.highest = 1.1

# heritability
h.no = .5
h.high = .95
h.higher = .99
h.complete = 1



# run model with tradeoff in r and make figure
source('runModel_r.R')
source('figClines_r.R')
source('figClines_r.R')
source('figTime_r.R')

# run model with tradeoff in a_fs and make figure
source('runModel_afs.R')
source('figClines_afs.R')
source('figClines_afs.R')
source('figTime_afs.R')

# run model with tradeoff in a_sf and make figure
source('runModel_asf.R')
source('figClines_asf.R')
source('figClines_asf.R')
source('figTime_asf.R')