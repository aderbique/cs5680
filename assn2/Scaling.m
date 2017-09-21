function [scaledIm, transFunc] = Scaling(inputIm, range)
%SCALING Summary of this function goes here
%   Detailed explanation goes here

A = inputIm;

minOutput = (min(range));
maxOutput = (max(range));

minInput = min(min(A));
maxInput = max(max(A));
%disp("The min of original image is: " + minInput);
%disp("The max of original image is: " + maxInput);

n = maxInput - minInput + 1;

B = A - minInput;
C = B * (maxOutput / (maxInput - minInput));

A_map = [];
C_map = [];

[rows,cols] = size(A);
for col = 1:cols
    for row = 1:rows
        if ~ismember(A(rows,cols),A_map)
            A_map(end+1) = A(rows,cols);
        end
        if ~ismember(C(rows,cols),C_map)
            C_map(end+1) = C(rows,cols);
        end
    end
end  

A_map = sorted(A_map);
C_map = sorted(C_map);
return A_map, C_map;


end

