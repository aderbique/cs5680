function [filteredIm] = modify_point(row, col, Im)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
total = 0;
total = total + Im(row-1,col-1);
total = total + Im(row-1,col);
total = total + Im(row-1,col+1);
total = total + Im(row,col-1);
total = total + Im(row,col+1);
total = total + Im(row+1,col-1);
total = total + Im(row+1,col);
total = total + Im(row+1,col+1);

total = total/8;

Im(row,col) = total;
%disp(total);
filteredIm = Im;

end

