%CS5680 Assignment 2
%Austin Derbique
%A01967241
%9/20/17


disp("%%%%%%%%% Problem 1 %%%%%%%%%");

Food = imread('Food.jpg');

[scaledFood, transFunc] = Scaling(Food,0:240);
%Intentionally scaling to 240 because assignment says to scale so image has
%a "good quality"

X = transFunc(1,:);
Y = transFunc(2,:);
figure;
plot(X,Y);
title('Linear Intensity Transformation of food.jpg');
xlabel('Original Image (intensity of pixels)');
ylabel('Transformed Image (intensity of pixels)');

disp('-----Finish Solving Problem 1-----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 2 %%%%%%%%%");


matScaledFood = imadjust(Food,[.35,.54],[0,1]);
figure;

subplot(2,2,1);
imshow(Food);
title('Original Food');

subplot(2,2,2);
imshow(scaledFood);
title('Scaled Food');

subplot(2,2,3);
imshow(matScaledFood);
title('Matlab Scaled Food');

disp('-----Finish Solving Problem 2-----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 3 %%%%%%%%%");

[normHist, hist] = CalHist(scaledFood);
matNormHist = CalHist(matScaledFood);

figure;
subplot(2,2,1);
bar(normHist(1,:),normHist(2,:));
title('Normalized Histogram');
xlabel('Pixel Intensity)');
ylabel('Normalized Value');
xlim([0 255])

subplot(2,2,2);
bar(matNormHist(1,:),matNormHist(2,:));
title('Matlab Normalized Histogram');
xlabel('Pixel Intensity');
ylabel('Normalized Value');
xlim([0 255])

disp('-----Finish Solving Problem 3-----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 4 %%%%%%%%%");

t = cputime;
[equalizedFood, equalTransFunc] = HistEqualization(Food);
equalizedTime = cputime - t;
disp("The running time used to perform HistEqualization(Food) is: " + equalizedTime + " seconds.");

disp('-----Finish Solving Problem 4-----');
disp('Press any key to continue');
pause;


disp("%%%%%%%%% Problem 5 %%%%%%%%%");

t = cputime;
[matEqualizedFood,matEqualizedTransFunc] = histeq(Food);
matEqualizedTime = cputime - t;
disp("The running time used to perform histeq(Food) is: " + matEqualizedTime + " seconds.");
disp("The matlab equalization function took " + (equalizedTime - matEqualizedTime) + " fewer seconds.");

figure;
subplot(2,2,1);
imshow(equalizedFood);
title('Equalized Food');

subplot(2,2,2);
imshow(matEqualizedFood);
title('Matlab Equalized Food');


figure;
subplot(2,2,1);
plot(equalTransFunc(1,:),equalTransFunc(2,:));
title('histogram equalization transform function');
xlabel('Pixel Intensity)');
ylabel('Equalized number of pixels');
xlim([0 255])

subplot(2,2,2);
plot(matEqualizedTransFunc);
title('Matlab histogram equalization transform function');
xlabel('Pixel Intensity');
ylabel('Equalized number of pixels');
xlim([0 255])

disp("Comparison of the histogram equalization transform functions: I used the 4 step method described in the notes. Although the time performance is not great, the image quality is on par with the matlab implementation."); 
disp('-----Finish Solving Problem 5-----');
disp('Press any key to continue. This will close all figures and exit');
pause;
close all;