function [scaledIm, transFunc] = Scaling(inputIm, range)
%SCALING Summary of this function goes here
%   Detailed explanation goes here

%CS5680 Assignment 2
%Austin Derbique
%A01967241
%9/20/17

A = inputIm;

minOutput = (min(range));
maxOutput = (max(range));

minInput = min(min(A));
maxInput = max(max(A));
%disp("The min of original image is: " + minInput);
%disp("The max of original image is: " + maxInput);

n = maxInput - minInput + 1;

B = A - minInput;
C = uint8((B * double((double(maxOutput) / double((maxInput - minInput)))))+ minOutput);
A_map = zeros(1,1,'uint8');
C_map = zeros(1,1,'uint8');

[rows,cols] = size(A);
%disp("There are " + rows + " rows and " + cols + "cols");
countA = 1;
countC = 1;
for col = 1:cols
    for row = 1:rows
        if ~ismember(A(row,col),A_map)
            A_map(countA) = A(row,col);
            countA = countA + 1;
            %disp(A(row,col));
        end
        if ~ismember(C(row,col),C_map)
            C_map(countC) = C(row,col);
            countC = countC + 1;
        end
    end
end 
%disp("size of A_map is: " + size(A_map) + ". Size of C_Map is: " + size(C_map));
A_map = sort(A_map);
C_map = sort(C_map);

scaledIm = C;
transFunc = [A_map;C_map];

end

