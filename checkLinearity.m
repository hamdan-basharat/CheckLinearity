function lin = checkLinearity(n,scale,system)
    xzero = n(1)* -1 + 1;
    figure('Name',"CheckLinearity",'NumberTitle','on');
    
    linFlag = [0,0];
    

    x1 = unitramp(n);
    x2 = unitstep(n);
    
    %run with sytem 5 to see nonlinearity
    %{
    %Impulse at t=0 and t=1
    x1 = zeros(1,length(n));
    x1(xzero) = scale;
    x2 = zeros(1,length(n));
    x2(xzero+1) = scale;
%}
    
    
    y1 = system(n,x1);
    y2 = system(n,x2);
    
    xSuper = x1+x2;%xsuper is the output resulting from superposition of x
    ySuperx = system(n,xSuper);%superposition output because of x
    ySupery = y1+y2;%superposition output becauase of y
    
    yScalex = system(n,x1.*scale);%output because of scaling x
    yScaley = y1.*scale;%output by scaling yl
    
    subplot(4,2,1),stem(n,x1),title("Input;x1");
    subplot(4,2,2),stem(n,y1),title("Output");
    subplot(4,2,3),stem(n,x2),title("Input;x2");
    subplot(4,2,4),stem(n,y2),title("Output");
    subplot(4,2,5),stem(n,ySuperx),title("Output;y(x1+x2)");
    subplot(4,2,6),stem(n,ySupery),title("Output;y1+y2");
    subplot(4,2,7),stem(n,yScalex),title("Output;y(a*x1)");
    subplot(4,2,8),stem(n,yScaley),title("Output;a*y(x1)");
    
    for j = 1:length(n)
        if (round(ySuperx(j),4)~=round(ySupery(j),4)) %If the output at t somehow changed because of a future input
            linFlag(1) = 1;
        end
        if (round(yScalex(j),4) ~= round(yScaley(j),4))
            linFlag(2) = 1;
        end
    end
    
    if linFlag(1)==1
        disp("This system is non-linear:superpostion doesn't hold")
    end
    if linFlag(2)==1
        disp("This system is non-linear:scaling doesn't hold")
    end
    if linFlag(1) ==1|| linFlag(2)==1
        return
    end
    disp("This system is linear")
end
