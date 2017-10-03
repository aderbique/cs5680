%Austin Derbique
%A01967241
%Assignment 3 Main Function


disp("%%%%%%%%% Problem 1 %%%%%%%%%");
Circuit = imread('Circuit.jpg');
mask = {1,1,1;1,1,1;1,1,1};
AvgFilter_Circuit = AverageFiltering(Circuit,mask);