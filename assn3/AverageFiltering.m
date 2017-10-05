function [filteredIm] = AverageFiltering (im, mask)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

isMask = "FALSE";
%Check to make sure mask is correct
[rmask,cmask] = size(mask);
if rmask == cmask
    if mod(cmask,2) == 1
        if isequal(sum(sum(mask)),0) || isequal(sum(sum(mask)),(rmask * cmask))
            isMask = "TRUE";
        else
            disp("ERROR: Mask's weights do not add up correctly");
        end
    else
        disp("ERROR: Mask's dimension is not an odd number");
        
    end
else
    disp("ERROR: Masks's dimension not square");
end

if isMask == "TRUE" %Mask is true, carry on with average filtering
   [r,c] = size(im);
   padR = r + rmask -1 ;
   padC = c + cmask -1;   
   fx = floor(rmask/2);
   fy = floor(cmask/2);
   padIm = zeros(padR,padC);
   for p=1:size(im,1)
       for q=1:size(im,2)
           padIm(fx+p,fy+q)=im(p,q);
           %padIm(p,q)=im(p,q);
       end
   end
    %padIm(fx:r+fx,fy:fy+c) = im;
   
   filteredIm = uint8(padIm);
   
end 

end

