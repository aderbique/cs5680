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

disp('Finished Gaussian Filter, Press Key to continue');
pause;

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
%imwrite(BlurCity,'BlurCity.bmp');

figure;
subplot(2,2,1);
imshow(Filter_City);
title('Filter H');

subplot(2,2,2);
imshow(BlurCity); 
title('Turbulent Image, BlurCity');

disp('Finished Blur City figure. Press any key to continue');
pause;

%%%%%%%%%%%%%%%%%%%%%
% Problem 2.2
BlurCity = imread('BlurCity.bmp');
restored_BlurCity = Wiener1(BlurCity);

figure, imshow(restored_BlurCity); 
title('Restored BlurCity Image');

disp('Press any key to continue');
pause;

disp('-----Finish Solving Problem 2----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 3 %%%%%%%%%");

% Problem 3.1
FFT_Sample = fft2(double(Sample));
mag_Sample = abs(FFT_Sample);
mag_Sample = log(1+fftshift(FFT_Sample));
phase_Sample = angle(FFT_Sample);

Capitol = imread('Capitol.jpg');
FFT_Capitol = fft2(double(Capitol));
mag_Capitol = abs(FFT_Capitol);
mag_Capitol = log(1+fftshift(FFT_Capitol));
phase_Capitol =angle(FFT_Capitol);

figure;
subplot(2,2,1);
imshow(mag_Sample,[]);
title('Magnitude of Sample');

subplot(2,2,2);
imshow(phase_Sample, []);
title('Phase of Sample');

subplot(2,2,3);
imshow(mag_Capitol,[]);
title('Magnitude of Capitol');

subplot(2,2,4);
imshow(phase_Capitol, []);
title('Phase of Capitol');

disp('Finished Magnitude and Phase figure. Press any key to continue');
pause;

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

%subplot(2,2,1);
%imshow(abs(new_Capitol));%subplot(2,2,1);
figure;
subplot(2,2,1);
imshow(abs(new_Capitol), [min(min(abs(new_Capitol))) max(max(abs(new_Capitol)))]), colormap gray;
title('Reconstructed Capitol');
subplot(2,2,2);
imshow(abs(new_Sample), [min(min(abs(new_Sample))) max(max(abs(new_Sample)))]), colormap gray;
title('Reconstructed Sample');

disp('-----Finish Solving Problem 3----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 4 %%%%%%%%%");

% Problem 4.1
boy_noisy = imread('boy_noisy.gif');
boy_clean = remove_cosine_noise(boy_noisy);

figure;
subplot(2,2,1);
imshow(boy_noisy);
title('Noisy Boy');

subplot(2,2,2);
imshow(boy_clean);
title('Clean Boy');

disp('Explanation goes here.');

disp('-----Finish Solving Problem 4---- Next Problem takes a while. Please give 10-20 seconds and do not click until finishes');

disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 5 %%%%%%%%%");

Lena = imread('Lena.jpg');
[rows,cols] = size(Lena);
L = wmaxlev([rows cols],'db2');
t = wpdec2(Lena,L,'db2');
Reconstructed_Lena = uint8(wprec2(t));

if isequal(Lena,Reconstructed_Lena)
    disp("Successful decomposition and reconstruction of Lena");
else
    disp("Lena and Reconstructed Lena are not equal");
end

%%%%%%%%%%%%
% Problem 5.2 
X = floor(L/2);
X_Level_Lena = wpdec2(Lena,X,'db2');
%plot(X_Level_Lena);

disp('-----Finish Solving Problem 5----');
%disp('Press any key to continue');
%pause;
disp("%%%%%%%%% Problem 6 %%%%%%%%%");

% Problem 6.1
noisy_Lena = imnoise(Lena,'gaussian',0,0.01);
imwrite(noisy_Lena,'noisy_Lena.jpg');

% Problem 6.2
decomp_Lena = wpdec2(Lena,3,'db2');

% Problem  6.3
modified_Lena = decomp_Lena;
%6.8
denoise_Lena = uint8(wprec2(modified_Lena));

%6.9
figure;
subplot(2,2,1);
imshow(noisy_Lena);
title('Noisy Lena');
subplot(2,2,2);
imshow(denoise_Lena);
title('Denoised Lena');


disp('-----Finish Solving Problem 6----');
disp('Press any key to close all figures');
pause;
close all;
