function [filteredIm] = Wiener1(Im)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
DFT = fft2(Im);
DFT = fftshift(DFT);
[P, Q] =size(Im);

H = zeros(P,Q);
center_u = floor(P/2+1);
center_v = floor(Q/2+1);

for i = 1:P
    for j = 1:Q
        H(i,j) = exp((-.0025*sqrt(((i-center_u)^2)+((j-center_v)^2))^(5/3)));
    end
end

%GP = fft2(ifftshift(Im));
GP = ifftshift(fft2(Im));
%GP = DFT;
g = 1.5;
F = (GP./H).*((abs(H)^2)./((abs(H)^2) + g));


filteredIm = ifft2(ifftshift(F));
filteredIm = uint8(real(filteredIm));
end

