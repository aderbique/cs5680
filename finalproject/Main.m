%Austin Derbique
%A01967241
%Final Project

Im = imread('image1.png'); %Reads in image

Im  = rgb2gray(Im); %Grayscales image

Im = imadjust(Im); %Scales image

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 1 Shadow Removal


% 1: procedure GEOLEVEL
% 2: input: imgs: a smoothed image from Step 2 with
% intensity in range [0,255]
% 3: N: the number of geodesic levels
% 4: output: {Giji = 1,2,...,N}: geodesic levels
% 5: // ng: the number of pixels in one geodesic level
% 6: ng ¼ Widthðimgs ÞHeightðimgs Þ
% N ;
% 7: i = 1, sum = 0;
% 8: for k 0 to 255 do
% 9: Pk Get all the pixels with intensity k;
% 10: Gi Add Pk to Gi;
% 11: sum = sum + number of pixels in Pk;
% 12: if sum P ng then i = i + 1, sum = 0;
% 13: end if
% 14: end for
% 15: N = i;
% 16: end procedure

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 2 Local Intensity Difference Analysis

% 1: procedure EDGEPRUNING
% 2: input: T: an MST
% 3: Lp: path-length threshold
% 4: output: R: final crack curves
% 5: // get all leaf nodes from V
% 6: Vleaf GetLeafnodes(V);
% 7: // search a longest path Pmax between tree leaves
% 8: Wmax 0;
% 9: for each vi 2 Vleaf do
% 10: P LongestPathFrom(vi);
% 11: W PathLengthOf(P);
% 12: if W > Wmax then Wmax W, Pmax P;
% 13: end if
% 14: end for
% 15: if Wmax < Lp then go to Line 20;
% 17: end if
% 18: R Add Pmax to R;
% 19: // recursive pruning
% 20: T (T Pmax), go to Line 6;
% 21: end procedure