function pyr = gaussian_pyramid(I,nlev)

r = size(I,1);
c = size(I,2);

if ~exist('nlev')
    %computing the highest possible pyramid
    nlev = floor(log(min(r,c)) / log(2));
end

pyr = cell(nlev,1);
pyr{1} = I;

filter = pyramid_filter;
for l = 2:nlev
    I = downsample(I,filter);
    pyr{l} = I;
end
end