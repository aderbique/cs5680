%CS5680 Assignment 2
%Austin Derbique
%A01967241
%9/20/17


%%%%%%%%% Problem 1 %%%%%%%%%

A = imread('Food.jpg');
figure;
imshow(A);

[scaledIm, transFunc] = Scaling(A,0:240);
%Intentionally scaling to 240 because assignment says to scale so image has
%a "good quality"

figure;
imshow(scaledIm);

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
close all;

%%%%%%%%% Problem 2 %%%%%%%%%
