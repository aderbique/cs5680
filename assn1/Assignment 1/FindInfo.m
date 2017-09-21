function [p_maxValue, p_minValue, p_meanValue, p_medianValue] = FindInfo(B)
p_maxValue = 0;
p_minValue = 255;


intensityTotal = 0;


[row,col] = size(B);
%medianArray = 1:row*col;
count = 0;
for i=1:row
    for j=1:col
        %medianArray(1:count) = B(i,j);
        count = count + 1;
        if B(i,j) < p_minValue
            p_minValue = B(i,j);
        end
        if B(i,j) > p_maxValue
            p_maxValue = B(i,j);
        end
        intensityTotal = intensityTotal + int32(B(i,j));
    end
end

%sortedArray = sort(medianArray);
%p_medianValue = sortedArray(1:size(B)/2);
p_meanValue = intensityTotal / (row*col);
p_medianValue = 0;
%return p_maxValue, p_minValue, p_meanValue, p_medianValue;
end
