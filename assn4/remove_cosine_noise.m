function [filteredIm] = remove_cosine_noise(Im)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
FBoy = fft2(double(Im));

% Problem 4.2
CFBoy = fftshift(FBoy);

magCFBoy = abs(CFBoy);

% [sortedValues,sortIndex] = sort(magCFBoy(:),'descend');
% maxIndex = sortIndex(1:5);
% sortedValues = unique(magCFBoy(:));
% maxValues = sortedValues(end-4:end);
% maxIndex = ismember(magCFBoy,maxValues); 
% 
% disp(maxValues(1));
% disp(maxIndex);




[Out, Index] = sort(magCFBoy(:), 'descend');

[row1,col1] = ind2sub(size(magCFBoy), Index(1));
[row2,col2] = ind2sub(size(magCFBoy), Index(2));
[row3,col3] = ind2sub(size(magCFBoy), Index(3));
[row4,col4] = ind2sub(size(magCFBoy), Index(4));
[row5,col5] = ind2sub(size(magCFBoy), Index(5));
[row6,col6] = ind2sub(size(magCFBoy), Index(6));
[row7,col7] = ind2sub(size(magCFBoy), Index(7));
[row8,col8] = ind2sub(size(magCFBoy), Index(8));
[row9,col9] = ind2sub(size(magCFBoy), Index(9));
magCFBoy = modify_point(row2,col2,magCFBoy);
magCFBoy = modify_point(row3,col3,magCFBoy);
magCFBoy = modify_point(row4,col4,magCFBoy);
magCFBoy = modify_point(row5,col5,magCFBoy);
magCFBoy = modify_point(row6,col6,magCFBoy);
magCFBoy = modify_point(row7,col7,magCFBoy);
magCFBoy = modify_point(row8,col8,magCFBoy);
magCFBoy = modify_point(row9,col9,magCFBoy);

disp("I have found the largest magnitudes and found their indices. It can be noted they are complex conjugates of each other:");
disp("Point 1, The largest point (" + row1 + "," + col1 + ") with magnitude of:." + Out(1) + ".");
disp("Group 1: (" + row2 + "," + col2 + ") and  (" + row3 + "," + col3 + ") with magnitude of: " + Out(2) + ".");
disp("Group 2: (" + row4 + "," + col4 + ") and  (" + row5 + "," + col5 + ") with magnitude of: " + Out(4) + ".");
disp("Group 3: (" + row6 + "," + col6 + ") and  (" + row7 + "," + col7 + ") with magnitude of: " + Out(6) + ".");
disp("Group 4: (" + row8 + "," + col8 + ") and  (" + row9 + "," + col9 + ") with magnitude of: " + Out(8) + ".");

%histogram(magCFBoy);

%temp
%filteredIm = magCFBoy;
%filteredIm = ifft2(ifftshift(magCFBoy));

filteredIm = ifft2(ifftshift(magCFBoy + angle(CFBoy)));
%filteredIm = ifft2(filteredIm);
%filteredIm = ifft2(DFT_transform_Im);
filteredIm = uint8(((filteredIm + min(min(filteredIm)))/max(max(filteredIm)))*255);
filteredIm = histeq(filteredIm);
end

