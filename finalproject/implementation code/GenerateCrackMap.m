function [CrackMap] = GenerateCrackMap(Im)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Detecting crack pixels
%Summation of 8 connected neighborhood

%calculating intensity difference
[rows,cols] = size(Im);

%adding mask around Image
maskValue = uint8(sum(sum(Im))/(rows*cols));
disp("Average pixel value in the image is: " + maskValue);


%Creating padded Image
paddedIm = uint8(zeros(rows + 4,cols + 4));
paddedIm(1:2,:) = maskValue;
paddedIm(end-2:end,:) = maskValue;
paddedIm(:,1:2) = maskValue;
paddedIm(:,end-2:end) = maskValue;

%placing pixels into padded image and then finding 8 connected neighborhood

CrackMap = zeros(rows,cols);
for i=1:rows
    for j=1:cols
        paddedIm(i+2,j+2) = Im(i,j);
        
        %8 connected neighborhood
        for u = 1:3
            for v = 1:3
                if u == 2 && v == 2
                    break;
                end
                CrackMap(i,j) = CrackMap(i,j) + double((paddedIm(i+u-1,j+v-1) - paddedIm(i+1,j+1)));
            end
        end
        %disp(CrackMap(i,j));              
        
    end
end
CrackMap = uint8(CrackMap);
CrackMap = imbinarize(CrackMap, 0.2); %thresholds values
%CrackMap = paddedIm;



end

