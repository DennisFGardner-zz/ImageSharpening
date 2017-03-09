function quadPhase = GenQuadraticPhase(A, maxPhase)
%GENQUADRATICPHASE - apply phase array in Fourier plane to maximize sharpness
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    A - input array to determine size of generated array
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
% See also: SHARPENIMAGE,  OTHER_FUNCTION_NAME2

% Author: Dennis F. Gardner
% Work address
% email: dennis.gardner@colorado.edu
% Website: http://www.dennisfgardner.com
% March 2017; Last revision: 09-March-2017

[M,N] = size(A); 

x = -N/2:1:N/2-1;
y = -M/2:1:M/2-1;

[X, Y] = meshgrid(x,y);


quadPhase = X.*X + Y.*Y;

quadPhase = quadPhase./max(quadPhase(:));

quadPhase = quadPhase.*maxPhase;

figure('color','w');
subplot(121);
imagesc(quadPhase);
axis image
title('unwrapped')

subplot(122);
imagesc(angle(exp(1i*quadPhase)));
axis image;
title('wrapped');




end