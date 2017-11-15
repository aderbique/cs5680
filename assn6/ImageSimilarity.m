function [Similarities] = ImageSimilarity(Im, ImageDB)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
   
    Im2Compare = CalNormalizedHSVHist(Im,4,4,4);
    Similarities = ImageDB;
    
    [numfields, numImages] = size(ImageDB);
    disp("Number  of images in ImageDB is: " + numImages);
    
    
    for i=1:numImages
        %Here is where I start comparing

%      disp(ImageDB{1,1});
%      figure;
%      imshow(ImageDB{2,1});
%      title(ImageDB{1,1});
     
     

end

