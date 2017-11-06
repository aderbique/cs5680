%Austin Derbique
%A01967241
%Assignment 5 Main Function

disp("%%%%%%%%% Problem 1.1 %%%%%%%%%");
City = imread('City.jpg');
morph_grad = strel('square',3);

morph_city = imdilate(City, morph_grad) - imerode(City, morph_grad);
disp("Explanation 1");

figure;
imshow(morph_city);
title("1.1 Morphed City");

disp("%%%%%%%%% Problem 1.2 %%%%%%%%%");
SmallSquares = imread('SmallSquares.tif');
morph_operation = [-1,1,0;-1,1,1;-1,-1,-1];
morph_squares = bwhitmiss(SmallSquares, morph_operation);
disp("Number of foreground pixels: " + sum(sum(morph_squares)));

figure; 
imshow(morph_squares);
title("1.2 Morphed Small Squares");

disp("%%%%%%%%% Problem 1.3 %%%%%%%%%");
Wirebond = imread('Wirebond.tif');
b_wire = Wirebond;
c_wire = Wirebond;
d_wire = Wirebond;
for i = 1:16
    if i <=3
        c_wire = imerode(c_wire, morph_grad);
    end
    if i <= 6
        b_wire = imerode(b_wire, morph_grad);
    end
    d_wire = imerode(d_wire,morph_grad);
end

figure;
subplot(2,2,1);
imshow(Wirebond);
title("(a) Original Image");

subplot(2,2,2);
imshow(b_wire);
title("(b) Desired Image 1");

subplot(2,2,3);
imshow(c_wire);
title("(c) Desired Image 2");

subplot(2,2,4);
imshow(d_wire);
title("(d) Desired Image 3");

disp("%%%%%%%%% Problem 1.4 %%%%%%%%%");
Shapes = imread('Shapes.tif');
b_shapes = Shapes;
c_shapes = Shapes;
d_shapes = Shapes;

%Desired Im 1
for i = 1:10
    b_shapes = imerode(b_shapes,morph_grad);
end

for i = 1:7
    b_shapes = imdilate(b_shapes,morph_grad);
end

%Desired Im 2
for i=1:8
    c_shapes = imdilate(c_shapes, morph_grad);
end
for i = 1:9
    c_shapes = imerode(c_shapes, morph_grad);
end

%Desired Im 3
for i = 1:8
    d_shapes = imdilate(d_shapes, morph_grad);
end
for i = 1:18
    d_shapes = imerode(d_shapes, morph_grad);
end


figure;
subplot(2,2,1);
imshow(Shapes);
title("(a) Original Image");

subplot(2,2,2);
imshow(b_shapes);
title("(b) Desired Image 1");

subplot(2,2,3);
imshow(c_shapes);
title("(c) Desired Image 2");

subplot(2,2,4);
imshow(d_shapes);
title("(d) Desired Image 3");


disp("%%%%%%%%% Problem 1.5 %%%%%%%%%");
Dowels = imread('Dowels.tif');
disk_morph = strel('disk',5);

oc_dowel = imopen(imclose(Dowels, disk_morph),disk_morph);

co_dowel = imclose(imopen(Dowels, disk_morph),disk_morph);

figure;
subplot(2,2,1);
imshow(oc_dowel);
title("Open Close Dowel");

subplot(2,2,2);
imshow(co_dowel);
title("Close Open Dowel");

disp("Explanation");

Dowels_A = imopen(imclose(Dowels, strel('disk',2)),strel('disk',2));
Dowels_B = imopen(imclose(Dowels, strel('disk',3)),strel('disk',3));
Dowels_C = imopen(imclose(Dowels, strel('disk',4)),strel('disk',4));

Dowels_D = imclose(imopen(Dowels, strel('disk',2)),strel('disk',2));
Dowels_E = imclose(imopen(Dowels, strel('disk',3)),strel('disk',3));
Dowels_F = imclose(imopen(Dowels, strel('disk',4)),strel('disk',4));


figure;
subplot(2,4,1);
imshow(Dowels_A);
title("Open Close, d=2");

subplot(2,4,2);
imshow(Dowels_B);
title("Open Close, d=3");

subplot(2,4,3);
imshow(Dowels_C);
title("Open Close, d=4");

subplot(2,4,4);
imshow(oc_dowel);
title("Open Close, d=5");

subplot(2,4,5);
imshow(Dowels_D);
title("Close Open, d=2");

subplot(2,4,6);
imshow(Dowels_E);
title("Close Open, d=3");

subplot(2,4,7);
imshow(Dowels_F);
title("Close Open, d=4");

subplot(2,4,8);
imshow(co_dowel);
title("Close Open, d=5");

disp("Explanation");

disp('-----Finish Solving Problem 1----');
disp('Press any key to continue');
pause;
disp("%%%%%%%%% Problem 2.1 %%%%%%%%%");

Ball = imread('Ball.tif');
se = strel('disk', 1);
[labelIm, num] = FindComponentLabels(Ball, se);

figure;
imshow(label2rgb(labelIm));
title("Connected Objects");

disp("The total number of connected objects is: " + num);




disp("%%%%%%%%% Problem 2.2 %%%%%%%%%");
Ball = imread('Ball.tif');
[builtin_label,builtin_num] = bwlabel(Ball);
figure;
imshow(label2rgb(builtin_label));
title("Built In Connected Particles");

disp("The total number of connected objects is: " + builtin_num);

disp("%%%%%%%%% Problem 2.3 %%%%%%%%%");

imin = imread('Ball.tif');

se = strel('disk', 1);

[a, b] = FindComponentLabels(imin, se);

list = [a(1,:),a(:,1).',a(end,:),a(:,end).'];
ulist = unique(list);

if(ulist(1)==0)
    ulist = ulist(2:end);
end

for i = ulist
    a(a==i)=-1;
end

a(a~=-1) = 0;

a = -a;

figure(9);
subplot(1,2,1);
imshow((imin));
title 'Original Image'
subplot(1,2,2);
imshow((a));
title 'Connected Particles on border'

% A = ConnectedParticles(Ball);
% figure;
% subplot(2,2,1);
% imshow('Ball');
% title('Original Image');
% 
% subplot(2,2,2);
% imshow(A);
% title("Connected Particles");

disp("Number of connected particles residing on the border: " );

disp("%%%%%%%%% Problem 2.4 %%%%%%%%%");

% B = OverlappingParticles(Ball);
% figure;
% subplot(2,2,1);
% imshow('Ball');
% title('Original Image');
% 
% subplot(2,2,2);
% imshow(A);
% title("Overlapping Particles");
% 
% disp("Number of overlapping connected particles residing on the border: " );

Ball = imread('Ball.tif');
se = strel('disk', 1);
[A, B] = FindComponentLabels(Ball, se);
list = [a(1,:),a(:,1).',a(end,:),a(:,end).'];
ulist = unique(list);
if(ulist(1)==0)
    ulist = ulist(2:end);
end
for i = ulist
    A(A==i)=-1;
end
A(A~=-1) = 0;
A = -A;
A = ~A;
modified_ball = A & Ball;
[A, B] = FindComponentLabels(modified_ball, se);
vlas = histcounts(A(A~=0));
min(round(vlas,-2));
singles = find(round(vlas,-2) == min(round(vlas,-2)));
Overlap_Ball = A;
for s = singles
    Overlap_Ball(A == s) = 0;
end

figure(10)
subplot(1,2,1)
imshow(imin)
title 'Original Image'
subplot(1,2,2)
imshow(Overlap_Ball)
title 'Overlapping Connected Particles not on border'

ulist2 = unique(Overlap_Ball(:));
if(ulist2(1)==0)
    ulist2 = ulist2(2:end);
end

fprintf('Problem II.4: Overlapping Connected Particles not on border = %d\n', size(ulist2(:),1));




disp('-----Finish Solving Problem 2----');




    