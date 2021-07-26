function i = unitimpulse(n)
    x = zeros(1,length(n));%make input matrix x with length equal to time scale,n
    xzero = n(1)* -1 + 1;%find which index of x is t=0
    x(xzero) = 1;
    i = x;
end