function [labelIm, num] = FindComponentLabels(Im,se)
    labelIm = zeros(size(Im));
    %     [rows,cols] = size(Im)
    num = 0;
        %for i=1:rows
            %for j = 1:rows
        while sum(sum(Im))
            % [row, col] = find(Im,0)
            [row, col] = find(Im,1);
            %bin_Im(row, col) = 0;
            bin_image = zeros(size(Im));
            bin_image(row, col) = 1;


    %          bin_image(row, col) = 0;
            bin_dilate = imdilate(bin_image, se) & Im;

            %         while bin_Im = double(bin_dilate)
            %            bin_Im = bin_dilate + 1;
            %            bin_dilate = imdilate(bin_Im, se) & Im;
            %         end


            %while bin_image ~= double(bin_dilate)
            while ~isequal(bin_image, double(bin_dilate)) 
                %bin_dilate = imdilate(bin_image, se) & Im;
                bin_image = bin_dilate;
                bin_dilate = imdilate(bin_image, se) & Im;
            end
                        %Im = bin_dilate;
            num = num+1;
                
            %labelIm = labelIm + bin_dilate * num + 1;
            labelIm = bin_dilate * num + labelIm;
            Im = Im - bin_dilate;
        %end
       %end
        end

end

