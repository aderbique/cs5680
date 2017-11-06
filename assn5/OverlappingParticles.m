function [A] = OverlappingParticles(Im)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[A, B] = bwlabel(Im);

a = [A(1,:),A(:,1).',A(end,:),A(:,end).'];
unique_array = unique(a);

if(unique_array(1)==0)
    unique_array = unique_array(2:end);
end

for i = unique_array
    A(A == i) = -1;
end

A(A ~= -1) = 0;

A = -A;
end

