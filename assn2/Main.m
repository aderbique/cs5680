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


matScaledFood = imadjust(A,[.35,.54],[0,1]);
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


