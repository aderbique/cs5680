function [normalizedHist] = CalNormalizedHSVHist(Im,HbinNum,SbinNum,VbinNum)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    arrSize = HbinNum * SbinNum * VbinNum;
    finalArr = zeros(1,arrSize);
    %disp("The size of the array is: " + arrSize);

    histArr = zeros(HbinNum,SbinNum,VbinNum);

    hsv = rgb2hsv(Im);
    huespace = hsv(:,:,1);
    saturationspace = hsv(:,:,2);
    valuespace = hsv(:,:,3);

    [rows,cols] = size(huespace);

    bin_h_inc_size = 1/HbinNum;
    bin_s_inc_size = 1/SbinNum;
    bin_v_inc_size = 1/VbinNum;

    for i=1:rows
        for j=1:cols
            h = huespace(i,j);
            s = saturationspace(i,j);
            v = valuespace(i,j);

            h_bin = ceil(h/bin_h_inc_size);
            s_bin = ceil(s/bin_s_inc_size);
            v_bin = ceil(v/bin_v_inc_size);
            
            h_bin(~h_bin) = 1;
            s_bin(~s_bin) = 1;
            v_bin(~v_bin) = 1;

            histArr(h_bin,s_bin,v_bin) = histArr(h_bin,s_bin,v_bin) + 1;
        end

    end

    count = 1;
    for i=1:HbinNum
        for j=1:SbinNum
            for k=1:VbinNum
                finalArr(1,count) = histArr(i,j,k);
                count = count + 1;
            end
        end
    end
    %normalizedHist = histArr;
    normalizedHist = finalArr;
end

