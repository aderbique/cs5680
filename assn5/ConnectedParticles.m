function [a]= ConnectedParticles(Im)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% 
%     [A, B] = FindComponentLabels(Im,strel('disk',1));
% 
%     A = [A(1,:),A(:,1).',A(end,:),A(:,end).'];
%     unique_array = unique(A);
% 
%     if(unique_array(1)==0)
%         unique_array = unique_array(2:end);
%     end
% 
%     for i = unique_array
%         A(A == i) = -1;
%     end
% 
%     A(A ~= -1) = 0;
% 
%     A = -A;
Im = imread('Ball.tif');
se = strel('disk', 1);

[A, B] = FindComponentLabels(Im, se);

list = [A(1,:),A(:,1).',A(end,:),A(:,end).'];
ulist = unique(list);

if(ulist(1)==0)
    ulist = ulist(2:end);
end

for i = ulist
    A(A==i)=-1;
end
A(A~=-1) = 0;
A = -A;

end

