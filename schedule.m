function [ T ] = schedule( Tstart, c, t )
% ===========================================================================
% Tstart should equal 1000, c should equal ~0.8-0.9, t should be 1 to maxiter
% This function updates the "temperature", effectively controlling optimizer time
% ===========================================================================

T = Tstart*c^t;

end
