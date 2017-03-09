function quadPhase = GenQuadraticPhase(A, maxPhase)
%GENQUADRATICPHASE - generate a quadratic phase array
% An 2D quadratic function is generated. The number of rows and columns of
% the array is given by the size of the input variable A. The maximum
% absolute value of the quadratic function is given by the input variable
% MAXPHASE. The concavity of the quadratic function is given by the sign of
% MAXPHASE.
%
% Syntax:  [quadPhase] = GenQuadraticPhase(A, maxPhase);
%
% Inputs:
%    A - input array to determine size of generated array 
%    maxPhase - the abolute value maximum of the phase, the sign determines
%               the concavity of the function input3 - Description
%
% Outputs:
%    quadPhase - generated 2D quadratic phase array (unwrapped)
%
% Example: 
%    A = ones(64,64);
%    quadPhase = GenQuadraticPhase(I, 4*pi);
%    or
%    A = ones(128,64);
%    quadPhase = GenQuadraticPhase(I, -pi);
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

% use A to define the number of rows and cols
[M,N] = size(A); 

% generate a gird
x = -N/2:1:N/2-1;
y = -M/2:1:M/2-1;
[X, Y] = meshgrid(x,y);

% generat the quadratic function
quadPhase = X.*X + Y.*Y;

% normalize the function
quadPhase = quadPhase./max(quadPhase(:));

% apply the maximum value and concavity
quadPhase = quadPhase.*maxPhase;

% % % % plot the results (optional) 
% % % figure('color','w');
% % % % wrapped
% % % subplot(121);
% % % imagesc(angle(exp(1i*quadPhase)));
% % % axis image;
% % % title('wrapped');
% % % % unwrapped
% % % subplot(122);
% % % imagesc(quadPhase);
% % % axis image
% % % title('unwrapped')
% % % 



end