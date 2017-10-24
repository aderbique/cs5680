function [filteredIm] = remove_cosine_noise(Im)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
FBoy = fft2(double(Im));

% Problem 4.2
CFBoy = fftshift(FBoy);

magCFBoy = abs(CFBoy);

histogram(magCFBoy);


DFT_transform_Im = magCFBoy;

filteredIm = ifft2(DFT_transform_Im);
% filteredIm = uint8(((filteredIm + min(min(filteredIm)))/max(max(filteredIm)))*255);
end

