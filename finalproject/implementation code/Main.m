%Austin Derbique
%A01967241
%Final Project

%read in images
Im = imread('shadow2.png');

%Calculate the shadow mask
shadowMask = FindShadow(Im);

%Grayscale the image
grayIm = rgb2gray(Im);

%Scaling grayscale image to [0:255]
enhancedGrayIm = imadjust(grayIm);

%Removing Shadow from Image
noShadowIm = RemoveShadow(enhancedGrayIm,shadowMask);

%Performing Gaussian Smoothing operation on shadow removed image
noShadowIm = imgaussfilt(noShadowIm,2);

noShadowIm = medfilt2(noShadowIm);

%Generating the crack seed map from noshadowed image
CrackMap = GenerateCrackMap(noShadowIm);

%Create stick tensorfield from Crack Map
sigma = 9;
T = find_features(CrackMap,sigma);

%Perform tensor voting operations
    [e1,e2,l1,l2] = convert_tensor_ev(T);
    z = l1-l2;
    l1(z<0.3) = 0;
    l2(z<0.3) = 0;
    T = convert_tensor_ev(e1,e2,l1,l2);


% Curve extraction from tensor field
re = calc_ortho_extreme(T,15,pi/32);

figure;
subplot(2,2,1);
imshow(Im);
title('Original Image');

subplot(2,2,2);
imshow(grayIm);
title('GrayScaled Image');

subplot(2,2,3);
imshow(enhancedGrayIm);
title('Enhanced Im');

subplot(2,2,4);
imshow(noShadowIm);
title('Removed Shadow');


%Image Overlay
[rows,cols] = size(grayIm);
for i=1:rows
    for j=1:cols
        if re(i,j) == 1
            Im(i, j, 1) = 255;
            Im(i, j, 2) = 255;
            Im(i, j, 3) = 0;
        end
    end
end

figure;
subplot(2,2,1)
imshow(CrackMap);
title('Crack Seed Map');

subplot(2,2,2)
imshow(l1);
title('Tensor Voting');

subplot(2,2,3)
imshow(re);
title('Pruned Crack Field');

subplot(2,2,4)
imshow(Im);
title('Crack Im Overlay');
