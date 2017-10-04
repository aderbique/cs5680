%Austin Derbique
%A01967241
%Assignment 3 Main Function


disp("%%%%%%%%% Problem 1 %%%%%%%%%");
Circuit = imread('Circuit.jpg');
imshow(Circuit);
figure;

%mask = ones(3);
mask = zeros(3);
AvgFilter_Circuit = AverageFiltering(Circuit,mask);
imshow(AvgFilter_Circuit);
pause();