# MATLAB_SimulatedAnnealing_Optimizer
Sample Code:Implementation of simulated annealing algorithm to optimize bump-function parameters
This code was developed for an AER501 (Advanced Mechanics of Structures) assignment, at UTIAS, in December 2015.

The code consists of 5 scripts that determine the minima of a 2D bump function, using the simulated annealing algorithm.
Simulated annealing effectively imitates the cooling of metal as it's convergence behavior, therefore controllable parameters include 
the model "temperature", equivalent cooling rate (c), and perturbation magnitude (epsilon).

The user provides an estimation for the design variable (x), and modifies the various temperature-related variables to determine the 
most efficient combination for the optimization scheme.

main.m: this function is where all the variables are intialized and functions are called from.
SA.m: this function has the simulated annealing algorithm, where the design variable guess is passed into, modified, and analyzed.
move.m: this function perturbs the design variable by a small amount (controllable by the user)
objfcn.m: this function contains the parameterization of the 2d bump function, to be minimized by the design vector
schedule.m: this function controls the rate at which the algorithm progresses, mimicking a metal cooling

Note: I made this for the AER501 assignment, and later repurposed it for my project work at P&WC (essentially an optimizer to determine
parameters to fit weibull distributions). I replaced the objective function with a weibull curve (from data), and the design variable with 
weibull parameters to be optimized.
