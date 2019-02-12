function [ xopt, tmat, fmat ] = SA( x0, lb, ub, epsilon, maxiter, Tstart, c )
% ===========================================================================
% simulated annealing algorithm, as derived in AER501
% pass parameters to this function, which will run until maximum number of iterations is reached
% ===========================================================================

x = x0;  % design vector [x1,x2]
t = 1;
T = Tstart;
tmat = [0 0];
fmat = [0 0];
while t < maxiter
    
    if T < 10^-10       % if algorithm "temperature" reaches 0, break out
        xopt = x;
        fopt = fz;
        break
    end
    
    xn = x/10; %normalize the design vector to [0,1] space
    zn = move(xn,lb,ub,epsilon); %get perturbed normalized vector
    x = xn*10;  %"de"normalize the vector
    z = zn*10;
    fx = objfcn(x);  % pass perturbed vector to objective function 
    fz = objfcn(z);
    if ((z(1)*z(2)) < 0.75 | (z(1)+z(2)) > 15)  % if bump-function limits are passed
        fz = fz + 1000;     % update the guess to an erroneously high value, to try another interation
    end
    E = fx-fz; % find error
    if E > 0
        x = z;  
        fx = fz;
    elseif (exp(E/T)) >= rand()
        x = z;
        fx = objfcn(z);
    else
        x = x;
        fx = fx;
    end
    T = schedule(Tstart,c,t);   % update "temperature" timer for algorithm
    tmat(1,t) = t;
    fmat(1,t) = fx;
    t = t+1;
    
end
xopt = x;
end
