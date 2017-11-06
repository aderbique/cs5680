%Austin Derbique
%A01967241
%Assignment 5 Main Function

disp("%%%%%%%%% Problem 1.1 %%%%%%%%%");
City = imread('City.jpg');
morph_grad = strel('square',3);

morph_city = imdilate(City, morph_grad) - imerode(City, morph_grad);
disp("This morpological gradient operation uses pixel restoration  and erosion to modify the image. In this case the colors are exxagerated where differences occur.");

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

disp("The open restores pixels and the close degrades pixels. Using them differently causes a difference in whether information about the image is lost.");

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

disp("The open restores pixels and the close degrades pixels. Using them differently causes a difference in whether information about the image is lost.");


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

Ball = imread('Ball.tif');
se = strel('disk', 1);
% [A, B] = FindComponentLabels(Ball, se);
% list = [A(1,:),A(:,1).',A(end,:),A(:,end).'];
% bin_array = unique(list);
[A, B] = FindComponentLabels(Ball, se);
list = [A(1,:),A(:,1).',A(end,:),A(:,end).'];
bin_array = unique(list);
if(bin_array(1)==0)
    bin_array = bin_array(2:end);
end

for i = bin_array
    A(A==i)=-1;
end
A(A~=-1) = 0;
A = -A;
figure;
subplot(2,2,1);
imshow((Ball));
title('Original Image');

subplot(2,2,2);
imshow(A);
title 'Border '

disp("Count of connected particles on border of image is: " );

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
% [A, B] = FindComponentLabels(Ball, se);
% list = [A(1,:),A(:,1).',A(start,:),A(:,end).'];
% bin_array = unique(list);

[A, B] = FindComponentLabels(Ball, se);
list = [A(1,:),A(:,1).',A(end,:),A(:,end).'];
bin_array = unique(list);
if(bin_array(1)==0)
    bin_array = bin_array(2:end);
end
for i = bin_array
    A(A==i)=-1;
end
A(A~=-1) = 0;
A = -A;
A = ~A;
modified_ball = A & Ball;
[A, B] = FindComponentLabels(modified_ball, se);
%[A, B] = dwb(modified_ball, se);
num_counts = histcounts(A(A~=0));
min(round(num_counts,-2));
%min(round(num_counts,-3));

solo_array = find(round(num_counts,-2) == min(round(num_counts,-2)));
Overlap_Ball = A;
for single = solo_array
    Overlap_Ball(A == single) = 0;
end


figure;
subplot(2,2,1);
imshow(Ball);
title('Original Image')
subplot(2,2,2);
imshow(Overlap_Ball)
title 'No Border'

% ball_array = unique(Overlap_Ball(:));
% if(ball_array(1)==1)
%     ball_array = ball_array(1:end);
% end
ball_array = unique(Overlap_Ball(:));
if(ball_array(1)==0)
    ball_array = ball_array(2:end);
end
disp("Overlapped connected particles not on border: " + size(ball_array(:),1));
disp('-----Finish Solving Problem 2----');

    