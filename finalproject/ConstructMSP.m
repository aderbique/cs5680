function [MSP] = ConstructMSP(Im)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
MSP = Im;
 procedure EDGEPRUNING
 input: T: an MST
 Lp: path-length threshold
 output: R: final crack curves
 // get all leaf nodes from V
 Vleaf
 GetLeafnodes(V);
 // search a longest path Pmax between tree leaves
 Wmax
 0;
 for each vi 2 Vleaf do
 P
 LongestPathFrom(vi);
 W
 PathLengthOf(P);
 if W > Wmax then Wmax
 W, P max
 P;
 end if
 end for
  if Wmax < Lp then go to Line 20;
  end if
  R
 Add Pmax to R;
  // recursive pruning
  T
 (T À Pmax), go to Line 6;
  end procedure



end

