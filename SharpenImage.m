function [I, J] = SharpenImage( )
%SHARPENIMAGE - apply phase array in Fourier plane to maximize sharpness
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    input1 - Description
%    input2 - Description
%    input3 - Description
%
% Outputs:
%    output1 - Description
%    output2 - Description
%
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Dennis F. Gardner
% Work address
% email: dennis.gardner@colorado.edu
% Website: http://www.dennisfgardner.com
% March 2017; Last revision: 7-March-2017


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% READ IN IMAGE
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% name of the image
imageName = 'car-370695.jpg';

% read in the image
I = imread(imageName);

% convert image to gray scale
I = rgb2gray(I);

% convert image to double
I = double(I);

% re-zsize the image
M = 512;
N = 512;
I = imresize(I,[M,N]);

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% SHARPEN IMAGE
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% current image sharpness 
S1 = sum(I(:).^2)

% bin number 
bin = 8;
binM = M/bin;
binN = N/bin;

phaseArray = ones(M,N)*1.5;


Ifft = fftshift(fft2(ifftshift(I)));

Ifft = abs(Ifft).*exp(1i*angle(Ifft).*phaseArray);

figure('color','w');
subplot(121);
imagesc(log(abs(Ifft)));
axis off; axis image;
colormap('gray');

subplot(122);
imagesc(angle(Ifft));
axis off; axis image;
colormap('gray');


J = abs(ifftshift(ifft2(fftshift(Ifft))));

% current image sharpness 
S2 = J.*J;
S2 = sum(S2(:))
S2 = sum(J(:).^2)

S1/S2

isequal(cast(I,'uint8'), cast(J, 'uint8'))
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% PLOTS 
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% MAIN figure
Hmain = figure('color','w');

% original image
ho = subplot(121);
imagesc(I);
axis off; axis image;
colormap('gray');
title('original');

% sharpened image
figure(Hmain)
hs = subplot(122);
imagesc(abs(J));
axis off; axis image;
title('shapened');

linkaxes([ho,hs])
end

