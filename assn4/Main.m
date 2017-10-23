%Austin Derbique
%A01967241
%Assignment 4 Main Function

disp("%%%%%%%%% Problem 1 %%%%%%%%%");

% Problem 1.1
Sample = imread('Sample.jpg');
[Gaussian_Filter, Gaussian_Sample] = gaussian_low_pass(Sample);

figure;
subplot(2,2,1);
imshow(Sample);
title('Original Image');

subplot(2,2,2);
imshow(Gaussian_Filter);
title('Gaussian LP Filter');

subplot(2,2,3);
imshow(Gaussian_Sample);
title('Filtered Image');

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1.2
[Butterworth_Filter, Butterworth_Sample] = butterworth_high_pass(Sample);
figure;
subplot(2,2,1);
imshow(Sample);
title('Original Image');

subplot(2,2,2);
imshow(Butterworth_Filter);
title('Butterworth HP Filter');
subplot(2,2,3);
imshow(Butterworth_Sample);
title('Filtered Image');

disp('-----Finish Solving Problem 1----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 2 %%%%%%%%%");

% Problem 2.1
City = imread('City.jpg');
[Filter_City, BlurCity] = turbulizeIm(City);
imwrite(BlurCity,'BlurCity.bmp');

figure;
subplot(2,2,1);
imshow(Filter_City);
title('Filter H');

subplot(2,2,2);
imshow(BlurCity); 
title('Turbulent Image, BlurCity');

%%%%%%%%%%%%%%%%%%%%%
% Problem 2.2
BlurCity = imread('BlurCity.bmp');
restored_BlurCity = Wiener(BlurCity);

figure;
imshow(restored_BlurCity);
title('Restored BlurCity Image');

