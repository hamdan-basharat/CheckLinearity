function u = unit(n,inputMag,system)
    figure('Name',"Unit Functions",'NumberTitle','on');
    %output values after putting unit-- functions into system
    uniti = system(n,unitimpulse(n));
    units = system(n,unitstep(n));
    unitr = system(n,unitramp(n));
    
    %plot the unit inputs
    subplot(3,2,1),stem(n,unitimpulse(n)),title("Unit Impulse");
    subplot(3,2,3),stem(n,unitstep(n)),title("Unit Step");
    subplot(3,2,5),stem(n,unitramp(n)),title("Unit Ramp");
    
    %plot the resulting output through the system
    subplot(3,2,2),stem(n,uniti),title("Output");
    subplot(3,2,4),stem(n,units),title("Output");
    subplot(3,2,6),stem(n,unitr),title("Output");

end