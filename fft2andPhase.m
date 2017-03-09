function [sOrig, sPhase] = fft2andPhase(I, phaseArray)
%FFT2ANDPHASE - apply phase in Fourier domain and calculate sharpness
% The imput image, I, is Fourier transformed, convering power, and a phase
% is applied in the Fourier domain. The image is then Fourier transformed
% back to real space. A calculation of the image sharpness is done before
% and after the application of of the phase. 
%
% Syntax:  [so, sp, sm, J] = fft2andPhase(I, phaseArray);
%
% Inputs:
%    I - input image
%    phaseArray - 2D array to be applied in the Fourier domain of I
%
% Outputs:
%    sOrig - sharpness of the original image, I
%    sPhase - sharpness after the application of the phaseArray
%
% Example: 
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: SHARPENIMAGE

% Author: Dennis F. Gardner
% Work address
% email: dennis.gardner@colorado.edu
% Website: http://www.dennisfgardner.com
% March 2017; Last revision: 09-March-2017

[M, N] = size(I);




end