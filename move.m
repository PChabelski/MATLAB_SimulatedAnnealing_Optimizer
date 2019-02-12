function [z] = move(x, lb, ub, epsilon)
% ===========================================================================
% This matlab function randomly perturbs the design variable
% vector x such that the perturbed vector satisfies the bound 
% constraints. 
% x :      Design variable vector
% lb:      Vector containing lower bounds on the design variables
% ub:      Vector containing upper bounds on the design variables
% epsilon: A parameter controlling the magnitude of perturbation.
% z:  perturbed design variable vector satisfying the bound constraints 
% ===========================================================================

  n = length(x);  % Extract the number of design variables
  flag = 0;
  while flag == 0
        ind = ceil(rand*n); % randomly generate an integer between 1 and n
                            % to select the design variable that will be 
                            % perturbed to generate the move
        z = x;

        z(ind) = x(ind) + epsilon*(-1 + rand*2);   % Perturb the randomly chosen 
                                                   % design variable by epsilon*U[-1,1]

        if (z(ind) < lb(ind) | z(ind) > ub(ind))   % If bound constraints are violated
           flag = 0;                               % generate a new perturbation
        else
           flag = 1;
        end
  end
