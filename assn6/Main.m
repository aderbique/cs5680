%Austin Derbique
%A01967241
%Assignment 6 Main Function

disp("----------- Problem 1 Color Image Processing -----------");
%Problem 1.1
rgb = imread('ball.bmp');
hsv = rgb2hsv(rgb);
huespace = hsv(:,:,1);
saturationspace = hsv(:,:,2);
valuespace = hsv(:,:,3);


threshIm = imbinarize(huespace,.1); %converts to binary image with threshold of .1 to isolate ball

isolatedIm = medfilt2(threshIm,[15,15]); %gets rid of salt and pepper
isolatedIm(375:end,:) = true; %gets rid of bottom lines
isolatedIm(1:15,:) = true; %gets rid of top lines
isolatedIm(:,1:15) = true; %gets rid of left lines
isolatedIm(:,575:600) = true; %gets rid of right lines
isolatedIm = imcomplement(isolatedIm); %flips color of image
    
centroid  = regionprops(isolatedIm,'centroid'); %gets center coords of ball

%disp(length(centroid))

for i=1:length(centroid)
    centroidx = uint16(centroid(i).Centroid(1));
    centroidy = uint16(centroid(i).Centroid(2));
end

%disp(centroidx + " " + centroidy)

ballWithCentroid = insertMarker(rgb,[centroidx centroidy],'color','blue','size',15);


figure;
subplot(2,2,1);
imshow(rgb);
title("Original");

subplot(2,2,2);
imshow(huespace);
title("Huespace");

subplot(2,2,3);
imshow(threshIm);
title("Thresh Image");

subplot(2,2,4)
imshow(isolatedIm);
title("Isolated Im");

figure;
imshow(ballWithCentroid);
title("Original Image with Centroid Cross");


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1.2 

redChannel = rgb(:,:,1); % Red channel
greenChannel = rgb(:,:,2); % Green channel
blueChannel = rgb(:,:,3); % Blue channel

greenThresh = greenChannel > 20 & greenChannel < 95;
shadow = medfilt2(greenThresh,[11,11]); %gets rid of salt and pepper
shadow(375:end,:) = false; %gets rid of bottom lines
shadow(1:100,:) = false; %gets rid of top lines
shadow(:,1:100) = false; %gets rid of left lines
shadow(:,575:600) = false; %gets rid of right lines
%shadow = imcomplement(shadow); %flips color of image

[rows,cols] = size(shadow);
ballWithShadow = rgb;
for i=1:rows
    for j = 1:cols
        if shadow(i,j) == 1
            ballWithShadow(i,j,:)  = [0,0,255];
        end
    end
end

figure;
subplot(2,2,1);
imshow(rgb);
title("Original Image");

subplot(2,2,2);
imshow(greenChannel);
title("Green Channel");

subplot(2,2,3);
imshow(greenThresh);
title("Green Thresh");

subplot(2,2,4);
imshow(shadow);
title("Shadow");

figure;
imshow(ballWithShadow);
title("Ball with Shadow");

disp('-----Finish Solving Problem 1----');
disp('Press any key to continue');
pause; 
disp("----------- Problem 2 Simple Color Image Retrieval -----------");
% Problem 2.1
Horse1 = imread('Horse1.jpg');
histHorse1 = CalNormalizedHSVHist(Horse1,4,4,4);

% figure;
% subplot(2,2,1);
% imshow(Horse1);
% title("Horse1.jpg");
% 
% subplot(2,2,2);
% bar(histHorse1);
% axis([0,64 0 50000]);
% xtickformat(1);
% title("Histogram of Horse1.jpg")

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 2.2

Elephant1 = imread('Elephant1.jpg');
Elephant2 = imread('Elephant2.jpg');

Horse1 = imread('Horse1.jpg');
Horse2 = imread('Horse2.jpg');

H1 = CalNormalizedHSVHist(Horse1,4,4,4);
H2 = CalNormalizedHSVHist(Horse2,4,4,4);
E1 = CalNormalizedHSVHist(Elephant1,4,4,4);
E2 = CalNormalizedHSVHist(Elephant2,4,4,4);

figure;
subplot(2,2,1);
bar(H1);
axis([0,64 0 0.4])
title("Horse 1");

subplot(2,2,2);
bar(H2);
axis([0,64 0 0.4])
title("Horse 2");

subplot(2,2,3);
bar(E1);
axis([0,64 0 0.4])
title("Elephant 1");

subplot(2,2,4);
bar(E2);
axis([0,64 0 0.4])
title("Elephant 2");

%ImageDB = [Horse1,Horse2,Elephant1,Elephant2];
ImageDB = {'Horse1','Horse2','Elephant1','Elephant2';Horse1,Horse2,Elephant1,Elephant2;H1,H2,E1,E2;0,0,0,0};
%%%%%%%%
%Query 1

h1_sim = ImageSimilarity(Horse1,ImageDB);

figure;
subplot(2,2,1);
%%%%%%%%
%Query 2


%%%%%%%%
%Query 3


%%%%%%%%
%Query 4

disp('-----Finish Solving Problem 2----');
disp('Press any key to continue');
pause; 
disp("----------- Problem 3 A Simple Watermarking Technique in Wavelet Domain -----------");
%% Problem 3.1

Lena = imread('Lena.jpg');

[decompLena, S] = wavedec2(Lena,3,'db9');
[rows,cols] = size(decompLena);
s = rng(1,'twister');
b = randi(0:1,rows,cols);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3.2


disp('-----Finish Solving Problem 3----');