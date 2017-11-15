function [BP] = ExtractInfo(reconstructedLena,beta)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dwtmode('per');
[H, S] = wavedec2(reconstructedLena,3,'db9');
[rows,sizeLena] = size(H);
BP = zeros(1,sizeLena);

for j = 1:sizeLena
    if mod(H(1,j),beta) > (beta/2)
            BP(1,j) = 1;
    end
end

