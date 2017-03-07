function [ ] = SharpenImage( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% name of the image
imageName = 'car-370695.jpg';

% read in the image
I = imread(imageName);

% convert image to gray scale
I = rgb2gray(I);

% re-zsize the image
I = imresize(I,[512,512]);

figure('color','w');
subplot(121);
imagesc(I);
axis off; axis image;
colormap('gray');

end

