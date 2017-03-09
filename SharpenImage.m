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
% READ IN IMAGE, if the simely face, then covert to binary
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% name of the image
% imageName = 'car-370695.jpg';
% imageName = 'shrine-1696261_640.png';
imageName = 'comic-2026760_640.png';

% read in the image
I = imread(imageName);

% convert image to gray scale
I = rgb2gray(I);

% convert image to double
I = double(I);


% re-zsize the image
M = 64;
N = 64;
I = imresize(I,[M,N]);

% convert to a binary image
if strcmp(imageName, 'comic-2026760_640.png')
    
    fprintf('converting to binary \n');
    I = I-min(I(:));
    I = I/max(I(:));
    I = round(I); 
    
end

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% READ IN IMAGE, if the simely face, then covert to binary
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% the original sharpness of the image (this can be cleaned-up)
S0 = I.*I;
S0 = sum(sum(S0));

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% BLUR THE IMAGE
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% amplitude of original image
a0 = sqrt(I); 

% generate a quadratic phase
maxPhase = pi;
quadPhase = GenQuadraticPhase(I, maxPhase);

% phase distortion to be added in the Fourier plane
phaseArray = quadPhase; 

% Fourier transform
A0 = fftshift(fft2(ifftshift(a0)))/sqrt(M*N);

% apply distortion to the phase only
A1 = abs(A0).*exp(1i*angle(A0)).*exp(1i*phaseArray);

% Fourier back to real space
a1 = ifftshift(ifft2(fftshift(A1)))*sqrt(M*N);

% Intensity of distorted image
J = abs(a1.^2);

% image sharpness of distorted image
S1 = J.*J;
S1 = sum(sum(S1));

S1/S0

% sum(I(:))/sum(J(:)) % sanity check, conservation of power

% isequal(cast(I,'uint8'), cast(J, 'uint8'))
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% ORIGINAL AND BLURRED PLOTS 
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
title('blurred');

linkaxes([ho,hs]);

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% LOOP TO IMPROVE SHARPNESS
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

for ii = 1:M
    for jj = 1:N
        % blah
      
    end
end





end

