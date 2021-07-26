%{
IBEHS 3A03 - Biomedical Signals and Systems
Tutorial 1

Sample Function File
%}

%{
This is an example of a function file.

Note:
- The first line of code is a declaration of the function
- The output(s), function name, and input arguments are stated immediately
- Very similar to functions in other programming languages
%}

function [maximum,index] = find_max(x)
maximum = x(1);
for i=2:length(x)
    if x(i) > maximum
        maximum = x(i);
        index = i;
    end
end
end
