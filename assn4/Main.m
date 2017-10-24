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

disp('-----Finish Solving Problem 2----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 3 %%%%%%%%%");

% Problem 3.1
FFT_Sample = fft2(double(Sample));
mag_Sample = abs(FFT_Sample);
mag_Sample = log(1+fftshift(FFT_Sample));
phase_Sample = uint8(ifftshift(ifft2(abs(FFT_Sample))));

Capitol = imread('Capitol.jpg');
FFT_Capitol = fft2(double(Capitol));
mag_Capitol = abs(FFT_Capitol);
mag_Capitol = log(1+fftshift(FFT_Capitol));
phase_Capitol = uint8(ifftshift(ifft2(abs(FFT_Capitol))));

figure;
subplot(2,2,1);
imshow(mag_Sample,[]);
title('Magnitude of Sample');

subplot(2,2,2);
imshow(phase_Sample);
title('Phase of Sample');

subplot(2,2,3);
imshow(mag_Capitol,[]);
title('Magnitude of Capitol');

subplot(2,2,4);
imshow(phase_Capitol);
title('Phase of Capitol');

%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3.2
% freqDomain_Sample = abs(FFT_Capitol).*exp(1i*angle(FFT_Sample));
% freqDomain_Capitol = abs(FFT_Sample).*(1i*angle(FFT_Capitol));
mag_Sample = abs(fftshift(FFT_Sample));
mag_Capitol = abs(fftshift(FFT_Capitol));
phase_Sample = angle(fftshift(FFT_Sample));
phase_Capitol = angle(fftshift(FFT_Capitol));


freqDomain_Sample = abs(FFT_Capitol).*exp(1i*angle(FFT_Sample));
new_Sample = ifft2(freqDomain_Sample);

freqDomain_Capitol = abs(FFT_Sample).*exp(1i*angle(FFT_Capitol));
new_Capitol = ifft2(freqDomain_Capitol);

figure;
subplot(2,2,1);
%imshow(abs(new_Capitol));
imshow(abs(new_Capitol), [min(min(abs(new_Capitol))) max(max(abs(new_Capitol)))]), colormap gray
title('Reconstructed Capitol');

subplot(2,2,2);
%imshow(abs(new_Sample));
imshow(abs(new_Sample), [min(min(abs(new_Sample))) max(max(abs(new_Sample)))]), colormap gray
title('Reconstructed Sample');

disp('-----Finish Solving Problem 3----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 4 %%%%%%%%%");

% Problem 4.1
boy_noisy = imread('boy_noisy.gif');
