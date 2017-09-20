%CS5680 Assignment 2
%Austin Derbique
%A01967241
%9/20/17


%%%%%%%%% Problem 1 %%%%%%%%%

A = imread('Food.jpg');
imshow(A);

[scaledIm, transFunc] = Scaling(A,0:255);

imshow(scaledIm);
disp('-----Finish Solving Problem 1-----');
disp('Press any key to continue');
pause;