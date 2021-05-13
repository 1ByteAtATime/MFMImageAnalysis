function cmap = saginaw(d,N)

if nargin < 1 
    d = 1.0;
end

if nargin < 2
   N = size(get(gcf,'colormap'),1);
end

b = manitou(d,N);
cmap =b(:,[2,1,3]);
