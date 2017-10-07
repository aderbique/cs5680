function [ normHist, hist ] = CalHist(inputImage)
%CALHIST Summary of this function goes here
%   Detailed explanation goes here
%CS5680 Assignment 2
%Austin Derbique
%A01967241
%9/20/17


    A = inputImage;
    dict = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
    
    [rows,cols] = size(A);
    for col = 1:cols
        for row = 1:rows
            if ~isKey(dict, A(row,col)) %if does not exist
                dict(int32(A(row,col))) = int32(1);
                %disp(A(row,col));
            else
                dict(int32(A(row,col))) = int32(dict(int32(A(row,col))) + 1); %increment 1 occurrence
                
            end
        end
    end 

    hist = [keys(dict);values(dict)];
    hist = cell2mat(hist);
    
    normHist = [keys(dict);values(dict)];
    normHist = cell2mat(normHist);
    normHist = double(normHist);
    normHist(2,:) = normHist(2,:)./double(rows*cols);
    

end

