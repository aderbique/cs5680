function [enhancedIm, transFunc] = HistEqualization(inputIm)
%HISTEQUALIZATION Summary of this function goes here
%   Detailed explanation goes here
    [scaledFood, transFunc] = Scaling(inputIm,0:255);
    normHist = CalHist(scaledFood);
    
    cumNormHist = zeros(2,49,'double'); 
    for i=1:49
        cumNormHist(1,i) = normHist(1,i);
        if i > 1
            cumNormHist(2,i) = cumNormHist(2,i-1) + normHist(2,i);
        else
            cumNormHist(2,i) = normHist(2,i);
        end
    end
    
   cumNormHist(2,:) = cumNormHist(2,:) * double(255);
   %cumNormHist = uint8(cumNormHist);
   
   cumNormHist = uint8(cumNormHist);
   
   
   [rows,cols] = size(inputIm);
   
   for j =1:rows
       for k = 1:cols
           for s=1:49
               if eq(scaledFood(j,k),cumNormHist(1,s))
                   scaledFood(j,k) = cumNormHist(2,s);
                   disp("theres a match! Setting scaled food equal now");
                   break;
               end
           end
       end
   end
  enhancedIm = scaledFood;
  transFunc = cumNormHist;
   
end

