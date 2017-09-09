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
% Problem 4
C = im2double(B);
figure;
imshow(C);
title('Normalized Grayscale Image');

n=fix(size(C,1)/4);
disp("The size of n is: " + n);
D = cat(2,cat(2,C(:,1:n,:).^1.25,C(:,n+1:2*n,:)),cat(2,C(:,2*n + 1:3*n,:),C(:,3*n + 1: 4*n,:).^.75));
figure;
imshow(D);
title("Processed Grayscale Image");
imwrite(D,'Austin_D.jpg');

disp('-----Finish Solving Problem 4-----');
disp('Press any key to continue');
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5
bw1 = C;
bw1(bw1<=.3)=0;
bw1(bw1>.3)=1;

bw2 = C > .3;
bw3 = imbinarize(C,0.3);

if isequal(bw1,bw3) && isequal(bw2,bw3)
    disp("Both of my methods worked");
elseif isequal(bw1,bw3)
    disp("My method 1 worked but not my method 2")
elseif isequal(bw2,bw3)
    disp("My method 2 worked but not my method 1");
else
    disp("Both of my two methods did not work");
end

figure;
subplot(2,2,1);
imshow(bw1);
title('bw1');

subplot(2,2,2);
imshow(bw2);
title('bw2');

subplot(2,2,3);
imshow(bw3);
title('bw3');

disp('-----Finish Solving Problem 5-----');
disp('Press any key to continue');
pause;


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 6

BA = BlurColorIm(A);
BB = BlurGrayIm(B);

figure;
subplot(2,2,1);
imshow(A);
title('A');

subplot(2,2,2);
imshow(B);
title('B');

subplot(2,2,3);
imshow(BA);
title('BA');

subplot(2,2,4);
imshow(BB);
title('BB');

disp('-----Finish Solving Problem 6-----');
disp('Press any key to continue');
pause;
close all;
clear;

function [blurredIm] = BlurGrayIm(oriIm)
 intImage = integralImage(oriIm);
 avgH = integralKernel([1 1 8 8], 1/64);
 J = integralFilter(intImage, avgH);
 blurredIm = uint8(J);
end

function [blurredIm] = BlurColorIm(oriIm)
I = oriIm;
[row,col] = size(I);
row = row/2;
col = col/4;

%blurredIm = zeros(row/2,col/4,uint8(3));
blurredIm = zeros(256,128,3);

for i = 0:255
    for j = 0:127
        tolR = 0;
        tolG = 0;
        tolB = 0;
        for x = 1:2
            for y = 1:4
                %disp(i + j + x + y)
                %pixelRGB = squeeze(I(uint8(i+x),uint8(j+y),:))
                %disp(I(444,444))
                %red = I(i+x,j+y,1)
                %grn = I(i+x,j+y,2)
                %blu = I(uint8(i+x),uint8(j+y),3)
                %disp("The red value is: " + I(5,5,1))
                if i == row-1
                    break;
                elseif j == col-1
                    break;
                end
                tolR = tolR + int32(I(2*i+x,4*j+y,1));
                tolG = tolG + int32(I(2*i+x,4*j+y,2));
                tolB = tolB + int32(I(2*i+x,4*j+y,3));
            end
        end
        blurredIm(i+1,j+1,1) = int32(tolR / 8);
        blurredIm(i+1,j+1,2) = int32(tolG / 8);
        blurredIm(i+1,j+1,3) = int32(tolB / 8);
    end
end
blurredIm = uint8(blurredIm);
blurredIm = imresize(blurredIm,[512 512]);

end

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
