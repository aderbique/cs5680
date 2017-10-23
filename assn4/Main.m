%Austin Derbique
%A01967241
%Assignment 4 Main Function

disp("%%%%%%%%% Problem 1.1 %%%%%%%%%");

Sample = imread('Sample.jpg');
Gaussian_Sample = gaussian_low_pass(Sample);

figure;
subplot(2,2,1);
imshow(Sample);
title('Sample');

subplot(2,2,2);
imshow(Gaussian_Sample);
title('Gaussian Low Pass of Sample');

disp('-----Finish Solving Problem 1.1-----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 1.2 %%%%%%%%%");

Butterworth_Sample = butterworth_high_pass(Sample);
figure;
subplot(2,2,1);
imshow(Sample);
title('Sample');
subplot(2,2,2);
imshow(Butterworth_Sample);
title('Butterworth High Pass of Sample');