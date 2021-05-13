% function cmap = manitou(d, N)
%{
SUMMARY:
creates a colormap with integer N colors and the intensity of the map goes 
from black to white with the sum of the channels equal to a linear ramp.  The 
real scalar d allows the user to adjust the color contrast. 

d is the order applied to the sinusoid varying the complementary colors, 
DEFAULT is 1.

N is the length of the colormap, DEFAULT is the size of the current
colormap.

USAGE:
[X,Y] = meshgrid(-2:0.2:2,-2:0.2:2);
Z = X.*exp(-X.^2 - Y.^2);
figure
surface(X,Y,Z)
view(3)
colormap manitou;

NOTE:
The mean intensity of this colormap is reflected in the green channel.  At
values of less than 1/2 the map is blue dominant, and greater than one-half
the map is red dominant.  
Other variations on this theme are available:
munising - reverses the role of red and blue
saginaw and saugatuck - use the blue channel as the mean intensity
beaver and belle - use the red channel.

author contact:  wtbuller@mtu.edu

%}

function cmap = manitou(d, N)

if nargin < 1 
    d = 1.0;
end

if nargin < 2
   N = size(get(gcf,'colormap'),1);
end

n = (1: N)';
r = sin( (0.5*N-n)*pi/N) - linspace( 0, -1, N )';
r = sign(r).*r.^d;
r(r>1)=1; r(r<0)=0;
g = ( linspace(1, 0, N )' );
b = 2*g - r;
b(b>1)=1; b(b<0)=0;
cmap = flipud( [ r, g, b ] );
