function [ s, varargout ] = CalHist(inputImage)
%CALHIST Summary of this function goes here
%   Detailed explanation goes here
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

    nout = max(nargout,1) - 1;
    s = size(inputImage);

    for k = 1:nout
        varargout{k} = s(k);
    end
end

