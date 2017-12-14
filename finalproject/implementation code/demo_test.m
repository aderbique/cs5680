%%%%This is an attempt to create tensor field from binary image.

Im = imread('CrackMap.png');
sigma = 9;
T = find_features(Im,sigma);

% [e1,e2,l1,l2] = convert_tensor_ev(T);
% subplot(2,2,1), imshow(l1);
% 
% % Run the tensor voting framework
% T = find_features(l1,9);

% Threshold un-important data that may create noise in the
% output.
[e1,e2,l1,l2] = convert_tensor_ev(T);
z = l1-l2;
l1(z<0.3) = 0;
l2(z<0.3) = 0;
T = convert_tensor_ev(e1,e2,l1,l2);
subplot(2,2,2), imshow(l1-l2,'DisplayRange',[min(z(:)),max(z(:))]);

% Run a local maxima algorithm on it to extract curves
re = calc_ortho_extreme(T,15,pi/64);
subplot(2,2,3), imshow(re);