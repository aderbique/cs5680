function filteredIm = MedianFiltering(im, mask)
%MEDIANFILTERING Summary of this function goes here
%   Detailed explanation goes hereisMask = "FALSE";
%Check to make sure mask is correct
[rmask,cmask] = size(mask);
if rmask == cmask
    if mod(cmask,2) == 1
        isMask = "TRUE";
    else
        disp("ERROR: Mask's dimension is not an odd number");
        
    end
else
    disp("ERROR: Masks's dimension not square");
end

[row,col] = size(im);
padIm = zeros(row+rmask-1,col+cmask-1);
fx = floor(rmask/2);
fy = floor(cmask/2);
for p=1:size(im,1)
       for q=1:size(im,2)
           padIm(fx+p,fy+q)=im(p,q);
       end
end

%disp("fx="+fx+", fy="+fy);
filteredIm = zeros(row,col);

for i = fx+1:row+fx-1
    for j = fy+1:col+fy-1
        pixelArray = zeros(rmask,cmask);
        for n = i-fx:i+fx
            for m = j-fy:j+fy
                maskx = n-i+fx+1;
                masky = m-j+fy+1;
                %disp("The value for ("+i+","+j+"), pixelVal ("+n+","+m+").");
                %disp("mask value is: ("+ (n-i+fx+1) +","+ (m-j+fy+1) +").");
                %disp("pixelArray("+ maskx + "," + masky + ")");
                pixelArray(maskx,masky) = double(mask(maskx,masky)) * double(padIm(n,m));
            end
        end
        List = pixelArray(:);
        List = sort(List);
        %disp("Median Value is: " + median(List) + ".");
     
        filteredIm(i-fx,j-fy) = uint8(median(List));
    end
end

filteredIm = uint8(filteredIm);
end

