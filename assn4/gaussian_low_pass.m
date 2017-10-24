function [H,filteredIm] = gaussian_low_pass(Im)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% %%%%%%%%%%%%%%%%%%%%%%%%%
% % Step 1
% Im = im2double(Im);
% [M,N] = size(Im);
% P = M*2;
% Q = N*2;
% padIm = zeros(P,Q);
% %%%%%%%%%%%%%%%%%%%%%%%%%
% % Step 2
% for i = 1:P
%     for j = 1:Q
%         if i <= M && j <= N
%             padIm(i,j) = Im(i,j);
%         else
%             padIm(i,j) = 0.0;
%         end
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%
% % Step 3
% PP = zeros(P,Q);
% for i = 1:P
%     for j = 1:Q
%         PP(i,j) = padIm(i,j).*(-1)^(i+j);
%         %disp(PP(i,j));
%     end
% end

%figure;
%imshow(PP);
%title('Preprocessed Image');
%figure;
%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 4
% DFT = fft2(PP);
DFT = fft2(Im);
DFT = fftshift(DFT);
[P, Q] =size(Im);
%figure;
%imshow(DFT)
%title('DFT');


%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 5
H = zeros(P,Q);
center_u = floor(P/2+1);
center_v = floor(Q/2+1);

for i = 1:P
    for j = 1:Q
        H(i,j) = exp((-(i-center_u)^2-(j-center_v)^2)/((2*25^2)+(2*50^2)));
    end
end



G = zeros(P,Q);
G = DFT .* H ;

filteredIm = ifft2(ifftshift(G));
filteredIm = uint8(real(filteredIm));
% for i = 1:P
%     for j = 1:Q
%         G(i,j) = DFT(i,j)*H(i,j);
%     end
% end

%  figure;
%  imshow(H);
%  title('Filter H');
%  
%  figure;
%  imshow(G);
%  title('Step 5 After Filter');
%  figure;
%%%%%%%%%%%%%%%%%%%%%%
% Step 6
% processedIm = zeros(P,Q);
% IDFT = ifft2(G);
% for i = 1:P
%     for j = 1:Q
%         processedIm(i,j) = IDFT(i,j).*(-1)^(i+j);
%     end
% end

% figure;
% imshow(IDFT);
% title('Inverse FFT');
% 
% figure;
% imshow(processedIm);
% title('processed Im');
% figure;

%%%%%%%%%%%%%%%%%%%%%%%
% % Step 7
% finalIm = zeros(M,N);
% HH = zeros(M,N);
% for i = 1:M
%     for j = 1:N
%         finalIm(i,j) = processedIm(i,j);
%         HH(i,j) = H(center_u-P/4 + i,center_v-Q/4 + j);
%     end
% end
% 
% filteredIm = finalIm*255;
% %filteredIm = imadjust(filteredIm);
% filteredIm = uint8(filteredIm);
% %filteredIm = ((filteredIm + min(min(filteredIm)))/max(max(filteredIm)))*255;
% H = uint8(HH*255);

end