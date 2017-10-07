%Austin Derbique
%A01967241
%Assignment 3 Main Function


disp("%%%%%%%%% Problem 1.1 %%%%%%%%%");
Circuit = imread('Circuit.jpg');

mask1 = [1 1 1;1 10 1;1 1 1];
mask2 = ones(5);
AvgFilter_Circuit1 = AverageFiltering(Circuit,mask1);
AvgFilter_Circuit2 = AverageFiltering(Circuit,mask2);

figure;
title('Average Filtering');
subplot(2,2,1);
imshow(Circuit);
title('Orginal Image');

subplot(2,2,2);
imshow(AvgFilter_Circuit1);
title('3x3 Weighted Filter');

subplot(2,2,3);
imshow(AvgFilter_Circuit2);
title('5x5  Standard Filter');

disp('-----Finish Solving Problem 1.1-----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 1.2 %%%%%%%%%");

mask3 = [1 2 1;2 4 2;1 2 1];
mask4 = ones(5);

MedianFilter_Circuit1 = MedianFiltering(Circuit,mask3);
MedianFilter_Circuit2 = MedianFiltering(Circuit,mask4);

figure;
title('Median Filtering');
subplot(2,2,1);
imshow(Circuit);
title('Orginal Image');

subplot(2,2,2);
imshow(MedianFilter_Circuit1);
title('3x3 Weighted Filter');

subplot(2,2,3);
imshow(MedianFilter_Circuit2);
title('5x5  Standard Filter');

disp('-----Finish Solving Problem 1.2-----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 1.3 %%%%%%%%%");














