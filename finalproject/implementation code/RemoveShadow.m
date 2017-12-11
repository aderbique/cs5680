function [outputIm] = RemoveShadow(Im,shadowMask)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    % Step One. Find average Intensity of shadow and nonshadow areas
    [rows,cols] = size(Im);
    shadowSum = 0;
    shadowCount = 0;
    backgroundSum = 0;
    backgroundCount = 0;
    
    B = [];
    S = [];
    %Determining average of background B and shadow area S
    for i=1:rows
        for j = 1:cols
           if shadowMask(i,j) == 1
               shadowSum = shadowSum + uint32(Im(i,j));
               shadowCount = shadowCount + 1;
               S(shadowCount) = Im(i,j);
           else
               backgroundSum = backgroundSum + uint32(Im(i,j));
               backgroundCount = backgroundCount + 1;
               B(backgroundCount) = Im(i,j);
           end
        end
    end
    avgShadow = shadowSum / shadowCount;
    avgBG = backgroundSum / backgroundCount;
    disp("The average intensity of the shadow region is: " + avgShadow);
    disp("The average intensity of the background region is: " + avgBG);
    
    %This alpha value is specified in the paper
    alpha = std(B)/ std(S);
    disp(alpha);
    
    diff = avgBG - (alpha * avgShadow);
    
    %Performing adjustment operations to lighten the shadow areas
      for i=1:rows
        for j = 1:cols
           if shadowMask(i,j) == 1
               Im(i,j) = (alpha *Im(i,j)) + uint8(diff);
           end
        end
      end
      
      outputIm = Im;
end

