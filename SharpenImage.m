function [ ] = SharpenImage( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% read in the image
I = imread('car-370695.jpg');

% convert image to gray scale
I = rgb2gray(I);

figure('color','w');
imagesc(I);
axis off;
colormap('gray');

end

