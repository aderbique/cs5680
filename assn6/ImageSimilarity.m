function [matchResults] = ImageSimilarity(Im, ImageDB)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
   
    s1_hist = CalNormalizedHSVHist(Im,4,4,4);
    Similarities = ImageDB;
    
    [unused, numImages] = size(ImageDB);
    %disp("Number  of images in ImageDB is: " + numImages);
    
    [s1_rows,s1_cols] = size(Im);
    s1_pixels = double(s1_rows * s1_cols);
    
    disp("Starting Image Similarity Scoring");
    
    for k=1:numImages
        %Here is where I start comparing
        similarityCount = 0.0;
        
        s2_hist = ImageDB{3,k};
        [s2_rows,s2_cols] = size(ImageDB{2,k});
        s2_pixels = double(s2_rows * s2_cols);
        
        %disp("The sum of s1 is: " + sum(s1_hist(1,:)) + " and s2: " + sum(s2_hist(1,:)));
        
        [unused, bin_count] = size(s1_hist);
        %disp("There are " + bin_count + " bins for this image");
        
        for i=1:bin_count
           %disp("Bin " + i + " , s1: " + s1_hist(1,i)*s1_pixels + ", s2: " + s2_hist(1,i)*s2_pixels + ", min: " + min((s1_hist(1,i).*s1_pixels),(s2_hist(1,i).*s2_pixels)));
           similarityCount = similarityCount + min((s1_hist(1,i).*s1_pixels),(s2_hist(1,i).*s2_pixels));
        end
        similarityScore = similarityCount ./ (min(s1_pixels,s2_pixels));
        similarityScore = similarityScore * 100;
       % similarityScore = similarityCount;
        
        %disp("The similarity count is "  + similarityCount + " and min magnitude:  " + min(s1_pixels,s2_pixels));
        %disp("Size of s1_pixels: " + s1_pixels + " and s2_pixels: " + s2_pixels);
        disp("The Similarity Score for Image " + ImageDB{1,k} + " is " + similarityScore);
        
        Similarities{4,k} = similarityScore;
              
    end
    disp("");
    
    A = zeros(1,numImages);
    for i = 1:numImages
        A(1,i) = Similarities{4,i};
    end
    
    [B,I] = sort(A,'descend');
    
    matchResults = Similarities;
    
    for i = 1:numImages
        %disp("running");
        matchResults{1,i} = Similarities{1,I(i)};
        matchResults{2,i} = Similarities{2,I(i)};
        matchResults{3,i} = Similarities{3,I(i)};
        matchResults{4,i} = B(i);
        
    end
    

%      disp(ImageDB{1,1});
%      figure;
%      imshow(ImageDB{2,1});
%      title(ImageDB{1,1});
     
     

end

