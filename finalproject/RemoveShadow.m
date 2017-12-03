function [outputIm] = RemoveShadow(Im)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
grayIm = rgb2gray(Im);
enhancedIm = imadjust(grayIm);

%Step One mmClose
h = ones(3) / 9;
blurredIm = imfilter(enhancedIm,h);

%Step Two gauSmooth
gaussIm = imgaussfilt(blurredIm,3);

%Step Three geoLevel

%Step Four illumCompensate

outputIm = gaussIm;
end

