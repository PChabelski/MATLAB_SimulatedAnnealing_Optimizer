% ===========================================================================
% Patrick Chabelski, AER501, 998242012, Dec 2015
% Simulated Annealing Algorithm to derive minimum of bump function
% initialize parameters and call functions here
% can modify algorith parameters here to gauge effectiveness
% ===========================================================================


% Set initial guess for design vector x: [x1, x2]
x0 = [1 1];
% lower bound and upper bound normalized to range [0,1]
lb = [0 0];
ub = [1.0 1.0];
% SA epsilon step size between 0.1 and 0.3
epsilon = 0.3;
maxiter = 5000;
Tstart = 1000;
% C is the value to investigate - set it as a range from 0.8-0.98
c = 0.9;
% Run the case for specified C value X times, take average
X = 50;
    
for i = 1:X
    %get X t-vectors (tmat) and f-value vectors (fmat)
    [xopt, tmat, fmat] = SA(x0, lb, ub, epsilon, maxiter, Tstart, c);
    favmat(i, :) = fmat;
end
n = length(tmat);

favg = zeros(1,n);
for j = 1:n
    for k = 1:X
        favg(1,j) = favg(1,j) + favmat(k,j);
    end
end

favg = favg/X;
c
fopt = favg(n)
xopt

plot(tmat, favg);
xlabel('Number of Iterations')
ylabel('f(x)')
grid on
grid minor
hold on
%end
