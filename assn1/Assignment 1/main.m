%Main Script
%Author @Austin Derbique
%Anumber: A01967241
%Date Created: 9/7/2017

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1
A = imread('peppers.bmp');
imshow(A);
title('RGB Original Image');
disp('-----Finish Solving Problem X-----');
disp('Press any key to continue');
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2
B = rgb2gray(A);

TB = permute(B,[2 1 3]);

n=fix(size(B,1)/2);
HB = cat(1,B(n+1:end,:,:),B(1:n,:,:));

FB = flip(B,2);

figure;

subplot(2,2,1);
imshow(B);
title('B');

subplot(2,2,2);
imshow(TB);
title('TB');

subplot(2,2,3);
imshow(HB);
title('HB');

subplot(2,2,4);
imshow(FB);
title('FB');

disp('-----Finish Solving Problem 2-----');
disp('Press any key to continue');
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3

maxValue = max(B(:));
minValue = min(B(:));
meanValue = mean(B(:));
medianValue = median(B(:));

function [maxValue, minValue, meanValue, medianValue] = FindInfo(oriIm);



end
[maxValue2, minValue2, meanValue2, medianValue2] = FindInfo(B);






