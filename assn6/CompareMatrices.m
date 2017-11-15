function [percentage] = CompareMatrices(b,BP)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
BP_count = 0;
[unused,sizeIm] = size(BP);
for i = 1:sizeIm
    if BP(1,i) == b(1,i)
        BP_count = BP_count + 1;
    end
end
percentage = BP_count * 100 ./ (sizeIm);
end

