function [ f ] = objfcn( x )
%========================================================================
% take x vector with the n design variables
% apply function to them
% return f
% for bump function, minimize f in form: -abs(A - B)/C
%========================================================================

n = length(x); %determine how many design variables there are

A = (cos(x(1))^4) + (cos(x(2))^4);    % Parameter A of the bump function
B = 2*((cos(x(1))^2)*((cos(x(2))^2)));   % Parameter B of the bump function
C = sqrt((1*x(1)^2) + (2*x(2)^2));       % Parameter C of the bump function

f = -abs(A - B)/C;



end
