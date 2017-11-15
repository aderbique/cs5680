function [reconstructedLena] = EmbedIm(Lena,b,beta)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    dwtmode('per');
    [decompLena, S] = wavedec2(Lena,3,'db9');
    modifiedLena = decompLena;
    [rows,cols] = size(decompLena);
    for i = 1:1
        for j = 1:rows*cols
            if b(i,j) == 1 && mod(decompLena(i,j),beta) >= (.25*beta)
                modifiedLena(i,j) = decompLena(i,j) - mod(decompLena(i,j),beta) + (.75*beta);
            elseif b(i,j) == 1 && mod(decompLena(i,j),beta) < (.25*beta)
                modifiedLena(i,j) = (decompLena(i,j) - .25*beta) - (mod((decompLena(i,j) - .25*beta), beta)) + .75*beta;
            elseif b(i,j) == 0 && mod(decompLena(i,j),beta) <= (.75*beta)
                modifiedLena(i,j) = decompLena(i,j) - (mod(decompLena(i,j),beta)) + .25*beta;
            elseif b(i,j) == 0 && mod(decompLena(i,j),beta) > (.75*beta)
                modifiedLena(i,j) = (decompLena(i,j) + .5*beta) - mod((decompLena(i,j) - .5*beta),beta) + .25*beta;
            end
        end
    end
    reconstructedLena = uint8(waverec2(modifiedLena,S,'db9'));
end

