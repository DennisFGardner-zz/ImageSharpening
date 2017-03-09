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
% BLUR THE IMAGE
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% generate a quadratic phase
maxPhase = pi;
quadPhase = GenQuadraticPhase(I, maxPhase);

% phase distortion to be added in the Fourier plane
phaseArray = quadPhase; 

% apply the phase in the Fourier plane
[sOrig, sPhase, J] = fft2andPhase(I, phaseArray);

sPhase/sOrig

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% ORIGINAL AND BLURRED PLOTS 
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% MAIN figure
Hmain = figure('color','w');

% original image
ho = subplot(121);
imagesc(abs(I));
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



for ii = 1:2
        phaseFixPlus = GenQuadraticPhase(J, maxPhase);
        phaseFixNeg = GenQuadraticPhase(J, -maxPhase);
        
        [sBefore, sPlus, JPlus] = fft2andPhase(J, phaseFixPlus);
        [sBefore, sNeg, JNeg] = fft2andPhase(J, phaseFixNeg);
        
end

sPlus
sNeg

% Supporting figure
Hsupp = figure('color','w');

% original image
hp = subplot(121);
imagesc(abs(JPlus));
axis off; axis image;
colormap('gray');
title('plus');

% sharpened image
figure(Hsupp)
hn = subplot(122);
imagesc(abs(JNeg));
axis off; axis image;
title('neg');

linkaxes([hp,hn]);


end

