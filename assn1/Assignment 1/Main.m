%Main Script
%Author @Austin Derbique
%Anumber: A01967241
%Date Created: 9/7/2017

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1
A = imread('peppers.bmp');
imshow(A);
title('RGB Original Image');
disp('-----Finish Solving Problem 1-----');
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
meanValue = int8(mean(B(:)));
medianValue = median(B(:));
[p_maxValue, p_minValue, p_meanValue, p_medianValue] = FindInfo(B);

if maxValue ~= p_maxValue
    disp("maxValue does not match!");
end
if minValue ~= p_minValue
    disp("minValue does not match!")
end
if meanValue ~= p_meanValue
    disp("meanValue does not match!");
end
if medianValue ~= p_medianValue
    disp("medianValue does not match!");
end
    
disp('-----Finish Solving Problem 3-----');
disp('Press any key to continue');
pause;


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3
C = im2double(B);
figure;
imshow(C);
title('Normalized Grayscale Image');

n=fix(size(C,1)/4);
disp("The size of n is: " + n);
%D = cat(1,B(n+1:end,:,:),B(1:n,:,:));
%imwrite(D,'Austin_D.jpg');

disp('-----Finish Solving Problem 4-----');
disp('Press any key to continue');
pause;


function [p_maxValue, p_minValue, p_meanValue, p_medianValue] = FindInfo(B)
p_maxValue = 0;
p_minValue = 255;


intensityTotal = 0;

[row,col] = size(B);
%medianArray = 1:row*col;
count = 0;
for i=1:row
    for j=1:col
        %medianArray(1:count) = B(i,j);
        count = count + 1;
        if B(i,j) < p_minValue
            p_minValue = B(i,j);
        end
        if B(i,j) > p_maxValue
            p_maxValue = B(i,j);
        end
        intensityTotal = intensityTotal + int32(B(i,j));
    end
end

%sortedArray = sort(medianArray);
%p_medianValue = sortedArray(1:size(B)/2);
p_meanValue = intensityTotal / (row*col);
p_medianValue = 0;
%return p_maxValue, p_minValue, p_meanValue, p_medianValue;
end





