function [blurredIm] = BlurImage(oriIm)
blurredIm = BlurGrayIm(oriIm); %if gray
%blurredIm = BlurColorIm(oriIm); %if color
end

function [blurredIm] = BlurGrayIm(oriIm)
 intImage = integralImage(oriIm);
 avgH = integralKernel([1 1 8 8], 1/64);
 J = integralFilter(intImage, avgH);
 blurredIm = uint8(J);
end

function [blurredIm] = BlurColorIm(oriIm)
I = oriIm;
[row,col] = size(I);
row = row/2;
col = col/4;

%blurredIm = zeros(row/2,col/4,uint8(3));
blurredIm = zeros(256,128,3);

for i = 0:255
    for j = 0:127
        tolR = 0;
        tolG = 0;
        tolB = 0;
        for x = 1:2
            for y = 1:4
                %disp(i + j + x + y)
                %pixelRGB = squeeze(I(uint8(i+x),uint8(j+y),:))
                %disp(I(444,444))
                %red = I(i+x,j+y,1)
                %grn = I(i+x,j+y,2)
                %blu = I(uint8(i+x),uint8(j+y),3)
                %disp("The red value is: " + I(5,5,1))
                if i == row-1
                    break;
                elseif j == col-1
                    break;
                end
                tolR = tolR + int32(I(2*i+x,4*j+y,1));
                tolG = tolG + int32(I(2*i+x,4*j+y,2));
                tolB = tolB + int32(I(2*i+x,4*j+y,3));
            end
        end
        blurredIm(i+1,j+1,1) = int32(tolR / 8);
        blurredIm(i+1,j+1,2) = int32(tolG / 8);
        blurredIm(i+1,j+1,3) = int32(tolB / 8);
    end
end
blurredIm = uint8(blurredIm);
blurredIm = imresize(blurredIm,[512 512]);

end