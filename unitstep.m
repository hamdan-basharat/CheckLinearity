function y = unitstep(x)
%The unit step function, u(x), with u(0)=1

if (nargin ~= 1)
    error('unit step requires 1 argument!');
end

y = cast(x >= 0, class(x));
